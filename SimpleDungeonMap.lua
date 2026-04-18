-- SimpleDungeonMap.lua
-- Dungeon map overlay for WoW Classic Anniversary Edition (Interface 20505)
-- Based on DungeonMaps 0.1c by Undeadguy, refactored for Anniversary Edition

-- State
local SDM_Frames = {}
local SDM_Textures = {}
local SDM_CurrentDungeon = nil
local SDM_CurrentFloor = 1
local SDM_Initialized = false
local SDM_Visible = false
local SDM_ClickFrame = nil
local SDM_Container = nil
local SDM_QuestiePins = {}
local SDM_MapScale = 0.99
local SDM_PreviewMode = false
local SDM_FloorButtons = {}

-- Dungeon map is 4x3 tiles of 256x256 = 1024x768
local TILE_SIZE = 256
local MAP_COLS = 4
local MAP_ROWS = 3
local MAP_W = TILE_SIZE * MAP_COLS  -- 1024
local MAP_H = TILE_SIZE * MAP_ROWS  -- 768

-- Safely hide/show dropdown frames (Anniversary Edition uses lowercase 'd')
local function SafeHide(frame)
    if frame then frame:Hide() end
end

local function SafeShow(frame)
    if frame then frame:Show() end
end

local function GetContinentDropdown()
    return WorldMapContinentDropdown or WorldMapContinentDropDown
end

local function GetZoneDropdown()
    return WorldMapZoneDropdown or WorldMapZoneDropDown
end

-- Find the map canvas frame
local function GetMapCanvas()
    if WorldMapDetailFrame then return WorldMapDetailFrame end
    if WorldMapButton then return WorldMapButton end
    if WorldMapFrame.ScrollContainer then return WorldMapFrame.ScrollContainer end
    return WorldMapFrame
end

-- Localization: English keys, per-locale overrides, fallback returns the key itself
local L = setmetatable({}, { __index = function(_, k) return k end })
local locale = GetLocale()
if locale == "frFR" then
    L["Dungeon overlay size and position."] = "Taille et position de la carte de donjon."
    L["Map size"] = "Taille de la carte"
    L["Offset X"] = "Décalage X"
    L["Offset Y"] = "Décalage Y"
    L["Quest pins (Questie, beta)"] = "Marqueurs de quête (Questie, bêta)"
    L["Tip: in the dungeon, left-click + drag to move, Ctrl+wheel to zoom."] = "Astuce : dans le donjon, clic gauche + glisser pour déplacer, Ctrl+molette pour zoomer."
    L["Reset"] = "Réinitialiser"
elseif locale == "deDE" then
    L["Dungeon overlay size and position."] = "Größe und Position der Dungeonkarte."
    L["Map size"] = "Kartengröße"
    L["Offset X"] = "Versatz X"
    L["Offset Y"] = "Versatz Y"
    L["Quest pins (Questie, beta)"] = "Questmarker (Questie, Beta)"
    L["Tip: in the dungeon, left-click + drag to move, Ctrl+wheel to zoom."] = "Tipp: im Dungeon, linke Maustaste + ziehen zum Verschieben, Strg+Mausrad zum Zoomen."
    L["Reset"] = "Zurücksetzen"
elseif locale == "esES" or locale == "esMX" then
    L["Dungeon overlay size and position."] = "Tamaño y posición del mapa de mazmorra."
    L["Map size"] = "Tamaño del mapa"
    L["Offset X"] = "Desplazamiento X"
    L["Offset Y"] = "Desplazamiento Y"
    L["Quest pins (Questie, beta)"] = "Marcas de misión (Questie, beta)"
    L["Tip: in the dungeon, left-click + drag to move, Ctrl+wheel to zoom."] = "Consejo: en la mazmorra, clic izquierdo + arrastrar para mover, Ctrl+rueda para ampliar."
    L["Reset"] = "Restablecer"
end

-- Layout bounds for user-configurable overlay
local SDM_SCALE_MIN, SDM_SCALE_MAX = 0.3, 1.5
local SDM_OFFSET_MIN, SDM_OFFSET_MAX = -600, 600

local function SDM_ClampScale(s)
    if s < SDM_SCALE_MIN then return SDM_SCALE_MIN end
    if s > SDM_SCALE_MAX then return SDM_SCALE_MAX end
    return s
end

local function SDM_ClampOffset(v)
    if v < SDM_OFFSET_MIN then return SDM_OFFSET_MIN end
    if v > SDM_OFFSET_MAX then return SDM_OFFSET_MAX end
    return v
end

-- Apply user-configured scale and position to the overlay container
function SDM_ApplyContainerLayout()
    if not SDM_Container then return end
    if not SDM_Settings then SDM_Settings = {} end
    local s = SDM_ClampScale(SDM_Settings.overlayScale or 1.0)
    local ox = SDM_ClampOffset(SDM_Settings.offsetX or 0)
    local oy = SDM_ClampOffset(SDM_Settings.offsetY or 0)
    SDM_Container:SetScale(s)
    SDM_Container:ClearAllPoints()
    local canvas = GetMapCanvas()
    SDM_Container:SetPoint("TOPLEFT", canvas, "TOPLEFT", ox, oy)
end

-- Generate texture path for a dungeon tile
function SDM_GetTexturePath(dungeonName, floor, tileIndex)
    if SDM_SpecialDungeons[dungeonName] == "no_floor_prefix" then
        return "Interface\\Worldmap\\" .. dungeonName .. "\\" .. dungeonName .. tileIndex
    else
        return "Interface\\Worldmap\\" .. dungeonName .. "\\" .. dungeonName .. floor .. "_" .. tileIndex
    end
end

-- Create the overlay frames
function SDM_CreateFrames()
    local canvas = GetMapCanvas()
    local baseLevel = canvas:GetFrameLevel()

    -- Scale factor (0.99 of native 1024x768)
    local scale = 0.99
    local tileW = TILE_SIZE * scale
    local tileH = TILE_SIZE * scale

    -- Container frame for overlay and click interception
    local container = CreateFrame("Frame", "SDM_Container", canvas)
    container:SetSize(MAP_W * scale, MAP_H * scale)
    container:SetPoint("TOPLEFT", canvas, "TOPLEFT", 0, 0)
    container:SetFrameLevel(baseLevel + 100)
    SDM_Container = container

    -- 12 tile frames inside container
    for i = 1, 12 do
        local col = (i - 1) % MAP_COLS
        local row = math.floor((i - 1) / MAP_COLS)

        local frame = CreateFrame("Frame", "SDM_Frame" .. i, container)
        frame:SetSize(tileW, tileH)
        frame:SetPoint("TOPLEFT", container, "TOPLEFT", col * tileW, -row * tileH)

        local tex = frame:CreateTexture(nil, "OVERLAY")
        tex:SetAllPoints(frame)

        SDM_Frames[i] = frame
        SDM_Textures[i] = tex
    end

    -- Click frame: intercepts right-click BEFORE it reaches the map,
    -- supports left-click drag to move overlay, and Ctrl+wheel to scale.
    local clickFrame = CreateFrame("Frame", "SDM_ClickFrame", container)
    clickFrame:SetAllPoints(container)
    clickFrame:SetFrameLevel(baseLevel + 110)
    clickFrame:EnableMouse(true)
    clickFrame:EnableMouseWheel(true)

    clickFrame:SetScript("OnMouseDown", function(self, button)
        if button == "RightButton" then
            SDM_HideFrames()
        elseif button == "LeftButton" then
            if not SDM_Settings then SDM_Settings = {} end
            local canvas = GetMapCanvas()
            local sc = canvas:GetEffectiveScale()
            local cx, cy = GetCursorPosition()
            self.dragStartX = cx / sc
            self.dragStartY = cy / sc
            self.origOffsetX = SDM_Settings.offsetX or 0
            self.origOffsetY = SDM_Settings.offsetY or 0
            self.isDragging = true
            self:SetScript("OnUpdate", function(s)
                local nx, ny = GetCursorPosition()
                local scNow = canvas:GetEffectiveScale()
                local dx = (nx / scNow) - s.dragStartX
                local dy = (ny / scNow) - s.dragStartY
                SDM_Settings.offsetX = SDM_ClampOffset(s.origOffsetX + dx)
                SDM_Settings.offsetY = SDM_ClampOffset(s.origOffsetY + dy)
                SDM_ApplyContainerLayout()
                if SDM_RefreshOptionsPanel then SDM_RefreshOptionsPanel() end
            end)
        end
    end)

    clickFrame:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" and self.isDragging then
            self.isDragging = false
            self:SetScript("OnUpdate", nil)
        end
    end)

    clickFrame:SetScript("OnMouseWheel", function(self, delta)
        if not IsControlKeyDown() then return end
        if not SDM_Settings then SDM_Settings = {} end
        local cur = SDM_Settings.overlayScale or 1.0
        local step = (delta > 0) and 0.05 or -0.05
        SDM_Settings.overlayScale = SDM_ClampScale(cur + step)
        SDM_ApplyContainerLayout()
        if SDM_RefreshOptionsPanel then SDM_RefreshOptionsPanel() end
    end)

    clickFrame:Hide()
    SDM_ClickFrame = clickFrame

    -- Floor switching buttons (max 10 for raids like Karazhan/BlackTemple)
    for i = 1, 10 do
        local btn = CreateFrame("Frame", "SDM_FloorBtn" .. i, container)
        btn:SetSize(30, 20)
        btn:SetPoint("TOPLEFT", container, "TOPLEFT", 2, -2 - (i - 1) * 22)
        btn:SetFrameLevel(baseLevel + 120)
        btn:EnableMouse(true)

        local bg = btn:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0, 0, 0, 0.7)
        btn.bg = bg

        local border = btn:CreateTexture(nil, "BORDER")
        border:SetPoint("TOPLEFT", -1, 1)
        border:SetPoint("BOTTOMRIGHT", 1, -1)
        border:SetColorTexture(1, 0.82, 0, 0.8)
        border:Hide()
        btn.border = border

        local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        text:SetPoint("CENTER")
        text:SetTextColor(1, 1, 1)
        btn.text = text

        btn:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" and self.floorNum and SDM_CurrentDungeon then
                SDM_SetTextures(SDM_CurrentDungeon, self.floorNum)
                SDM_UpdateFloorButtons()
            elseif button == "RightButton" then
                SDM_HideFrames()
            end
        end)

        btn:SetScript("OnEnter", function(self)
            if self.floorName then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:AddLine(self.floorName, 1, 1, 1)
                GameTooltip:Show()
            end
            if not self.active then
                self.bg:SetColorTexture(0.3, 0.3, 0.3, 0.8)
            end
        end)

        btn:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
            if not self.active then
                self.bg:SetColorTexture(0, 0, 0, 0.7)
            end
        end)

        btn:Hide()
        SDM_FloorButtons[i] = btn
    end

    -- Quest pins toggle button (top-right)
    local qpBtn = CreateFrame("Frame", "SDM_QuestPinToggle", container)
    qpBtn:SetSize(24, 24)
    qpBtn:SetPoint("TOPRIGHT", container, "TOPRIGHT", -4, -4)
    qpBtn:SetFrameLevel(baseLevel + 120)
    qpBtn:EnableMouse(true)

    local qpBg = qpBtn:CreateTexture(nil, "BACKGROUND")
    qpBg:SetAllPoints()
    qpBg:SetColorTexture(0, 0, 0, 0.6)
    qpBtn.bg = qpBg

    local qpIcon = qpBtn:CreateTexture(nil, "OVERLAY")
    qpIcon:SetPoint("TOPLEFT", 2, -2)
    qpIcon:SetPoint("BOTTOMRIGHT", -2, 2)
    qpIcon:SetTexture("Interface\\GossipFrame\\ActiveQuestIcon")
    qpBtn.icon = qpIcon

    qpBtn:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            if not SDM_Settings then SDM_Settings = {} end
            SDM_Settings.questPins = not SDM_Settings.questPins
            SDM_UpdateQuestPinToggle()
            -- Call global SDM_ShowFrames to refresh (local functions not visible here)
            if SDM_Visible then SDM_ShowFrames() end
        elseif button == "RightButton" then
            SDM_HideFrames()
        end
    end)

    qpBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        local state = (SDM_Settings and SDM_Settings.questPins) and "|cff00ff00ON|r" or "|cffff0000OFF|r"
        GameTooltip:AddLine("Quest Pins: " .. state, 1, 1, 1)
        GameTooltip:AddLine("Click to toggle", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)

    qpBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    qpBtn:Hide()
    SDM_QuestPinToggle = qpBtn

    SDM_Initialized = true
    SDM_ApplyContainerLayout()
end

-- Set textures for a given dungeon and floor
function SDM_SetTextures(dungeonName, floor)
    if not SDM_Initialized then
        SDM_CreateFrames()
    end

    for i = 1, 12 do
        local path = SDM_GetTexturePath(dungeonName, floor, i)
        SDM_Textures[i]:SetTexture(path)
    end

    SDM_CurrentDungeon = dungeonName
    SDM_CurrentFloor = floor
end

-- Floor button display
function SDM_UpdateFloorButtons()
    local floors = SDM_CurrentDungeon and SDM_DungeonFloors[SDM_CurrentDungeon]
    if not floors or #floors <= 1 then
        for _, btn in ipairs(SDM_FloorButtons) do btn:Hide() end
        return
    end

    local labels = SDM_FloorLabels[SDM_CurrentDungeon]
    local names = SDM_FloorNames[SDM_CurrentDungeon]

    for i, btn in ipairs(SDM_FloorButtons) do
        if i <= #floors then
            btn.floorNum = floors[i]
            btn.floorName = names and names[i] or ("Floor " .. floors[i])
            local label = (labels and labels[i]) or tostring(floors[i])
            btn.text:SetText(label)

            if floors[i] == SDM_CurrentFloor then
                btn.active = true
                btn.border:Show()
                btn.bg:SetColorTexture(0.15, 0.15, 0.35, 0.9)
            else
                btn.active = false
                btn.border:Hide()
                btn.bg:SetColorTexture(0, 0, 0, 0.7)
            end
            btn:Show()
        else
            btn:Hide()
        end
    end
end

-- Update quest pin toggle button visual
function SDM_UpdateQuestPinToggle()
    if not SDM_QuestPinToggle then return end
    if SDM_Settings and SDM_Settings.questPins then
        SDM_QuestPinToggle.icon:SetDesaturated(false)
        SDM_QuestPinToggle.icon:SetAlpha(1)
    else
        SDM_QuestPinToggle.icon:SetDesaturated(true)
        SDM_QuestPinToggle.icon:SetAlpha(0.4)
    end
end

-- Questie integration: show quest objective pins on dungeon overlay
local function SDM_HideQuestiePins()
    for _, pin in ipairs(SDM_QuestiePins) do
        pin:Hide()
    end
end

-- Pin icon textures by type
local SDM_PinIcons = {
    kill    = "Interface\\GossipFrame\\BattleMasterGossipIcon",  -- crossed swords
    object  = "Interface\\GossipFrame\\WorkOrderGossipIcon",     -- gear
    loot    = "Interface\\GossipFrame\\VendorGossipIcon",        -- bag
    turnin  = "Interface\\GossipFrame\\ActiveQuestIcon",         -- yellow ?
}

local function SDM_CreatePin(pinIndex)
    local pin = CreateFrame("Frame", "SDM_QPin" .. pinIndex, SDM_Container)
    pin:SetSize(20, 20)
    pin:SetFrameLevel(SDM_Container:GetFrameLevel() + 15)
    pin:EnableMouse(true)

    local icon = pin:CreateTexture(nil, "OVERLAY")
    icon:SetAllPoints(pin)
    pin.icon = icon

    pin.questName = ""
    pin.objText = ""
    pin.pinType = "kill"

    pin:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(self.questName, 1, 0.82, 0)
        if self.objText ~= "" then
            GameTooltip:AddLine(self.objText, 1, 1, 1)
        end
        GameTooltip:Show()
    end)
    pin:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    pin:SetScript("OnMouseDown", function(self, button)
        if button == "RightButton" then
            SDM_HideFrames()
        end
    end)

    SDM_QuestiePins[pinIndex] = pin
    return pin
end

local function SDM_ShowQuestiePins()
    if SDM_PreviewMode then return end
    if not SDM_Settings or not SDM_Settings.questPins then return end
    if not QuestieLoader then return end
    if not SDM_Container then return end

    -- Get the Questie areaID for our current dungeon
    local _, _, _, _, _, _, _, instanceMapID = GetInstanceInfo()
    local questieAreaID = SDM_InstanceToQuestieArea[instanceMapID]
    if not questieAreaID then return end

    local ok, QuestieDB = pcall(function() return QuestieLoader:ImportModule("QuestieDB") end)
    if not ok or not QuestieDB then return end

    local ok2, QuestiePlayer = pcall(function() return QuestieLoader:ImportModule("QuestiePlayer") end)
    if not ok2 or not QuestiePlayer or not QuestiePlayer.currentQuestlog then return end

    SDM_HideQuestiePins()

    local pinIndex = 0
    local seenPositions = {}

    -- Helper: place a pin at coordinates with quest/objective info
    local function PlacePin(x, y, questName, objText, pinType)
        if x < 0 or y < 0 or x > 100 or y > 100 then return false end
        local posKey = string.format("%.1f,%.1f", x, y)
        if seenPositions[posKey] then return true end
        seenPositions[posKey] = true
        pinIndex = pinIndex + 1
        local pin = SDM_QuestiePins[pinIndex] or SDM_CreatePin(pinIndex)
        local px = (x / 100) * MAP_W * SDM_MapScale
        local py = -(y / 100) * MAP_H * SDM_MapScale
        pin:ClearAllPoints()
        pin:SetPoint("CENTER", SDM_Container, "TOPLEFT", px, py)
        pin.questName = questName or ""
        pin.objText = objText or ""
        pin.pinType = pinType or "kill"
        local texPath = SDM_PinIcons[pin.pinType] or SDM_PinIcons["kill"]
        pin.icon:SetTexture(texPath)
        pin.icon:SetTexCoord(0, 1, 0, 1)
        pin:Show()
        return true
    end

    -- Helper: try spawns from Questie, fallback to SDM_DungeonNPCPositions
    local dungeonPositions = SDM_DungeonNPCPositions[questieAreaID]
    local function PlaceSpawns(spawns, npcOrObjId, questName, objText, pinType)
        local placed = false
        if spawns and spawns[questieAreaID] then
            for _, coords in ipairs(spawns[questieAreaID]) do
                if PlacePin(coords[1], coords[2], questName, objText, pinType) then placed = true end
            end
        end
        if not placed and npcOrObjId and dungeonPositions and dungeonPositions[npcOrObjId] then
            local fb = dungeonPositions[npcOrObjId]
            PlacePin(fb[1], fb[2], questName, objText, pinType)
        end
    end

    -- Helper: process a creature objective
    local function ProcessNPC(npcId, qName, text, pinType)
        local npc = QuestieDB.GetNPC and QuestieDB:GetNPC(npcId)
        local name = text or (npc and npc.name) or ""
        local spawns = npc and npc.spawns or nil
        PlaceSpawns(spawns, npcId, qName, name, pinType or "kill")
    end

    -- Helper: process an object objective
    local function ProcessObject(objId, qName, text)
        local obj = QuestieDB.GetObject and QuestieDB:GetObject(objId)
        local name = text or (obj and obj.name) or ""
        local spawns = obj and obj.spawns or nil
        PlaceSpawns(spawns, objId, qName, name, "object")
    end

    -- Helper: process an item objective (find which NPCs drop it)
    local function ProcessItem(itemId, qName, text)
        if QuestieDB.QueryItemSingle then
            local ok, npcDrops = pcall(function() return QuestieDB.QueryItemSingle(itemId, "npcDrops") end)
            if ok and npcDrops then
                for _, npcId in ipairs(npcDrops) do
                    local npc = QuestieDB.GetNPC and QuestieDB:GetNPC(npcId)
                    local npcName = npc and npc.name or ""
                    local label = text or ""
                    if npcName ~= "" then
                        label = label ~= "" and (label .. " - " .. npcName) or npcName
                    end
                    ProcessNPC(npcId, qName, label, "loot")
                end
                return
            end
        end
        if dungeonPositions and dungeonPositions[itemId] then
            local fb = dungeonPositions[itemId]
            PlacePin(fb[1], fb[2], qName, text, "loot")
        end
    end

    for questId, questData in pairs(QuestiePlayer.currentQuestlog) do
        local quest = QuestieDB.GetQuest and QuestieDB.GetQuest(questId)
        if not quest then break end
        local qName = quest.name or quest.Name or ("Quest " .. questId)

        -- Method 1: Use ObjectiveData (processed objectives)
        if quest.ObjectiveData then
            for _, objData in ipairs(quest.ObjectiveData) do
                local objText = objData.Text or objData.Name or ""
                if objData.Type == "monster" or objData.Type == "killcredit" then
                    ProcessNPC(objData.Id, qName, objText, "kill")
                elseif objData.Type == "object" then
                    ProcessObject(objData.Id, qName, objText)
                elseif objData.Type == "item" then
                    ProcessItem(objData.Id, qName, objText)
                end
            end
        end

        -- Method 2: Fallback to raw quest.objectives for quests with empty ObjectiveData
        if quest.objectives and (not quest.ObjectiveData or #quest.ObjectiveData == 0) then
            -- objectives[1] = creature objectives: {{npcId, text}, ...}
            if quest.objectives[1] then
                for _, obj in ipairs(quest.objectives[1]) do
                    if obj[1] then ProcessNPC(obj[1], qName, obj[2] or "", "kill") end
                end
            end
            -- objectives[2] = object objectives: {{objectId, text}, ...}
            if quest.objectives[2] then
                for _, obj in ipairs(quest.objectives[2]) do
                    if obj[1] then ProcessObject(obj[1], qName, obj[2] or "") end
                end
            end
            -- objectives[3] = item objectives: {{itemId, text}, ...}
            if quest.objectives[3] then
                for _, obj in ipairs(quest.objectives[3]) do
                    if obj[1] then ProcessItem(obj[1], qName, obj[2] or "") end
                end
            end
        end

        -- Method 3: triggerEnd objectives (event-type quests like "Find Spy To'gun")
        if quest.triggerEnd and quest.triggerEnd[2] then
            local triggerText = quest.triggerEnd[1] or qName
            for areaId, coords in pairs(quest.triggerEnd[2]) do
                if areaId == questieAreaID then
                    for _, c in ipairs(coords) do
                        PlacePin(c[1], c[2], qName, triggerText, "object")
                    end
                end
            end
        end

        -- Method 4: Quest turn-in NPC inside the dungeon
        if quest.finishedBy and quest.finishedBy[1] then
            for _, npcId in ipairs(quest.finishedBy[1]) do
                local npc = QuestieDB.GetNPC and QuestieDB:GetNPC(npcId)
                local npcName = npc and npc.name or ""
                local spawns = npc and npc.spawns or nil
                PlaceSpawns(spawns, npcId, qName, "Turn in: " .. npcName, "turnin")
            end
        end
    end
end

-- Show the dungeon map overlay
function SDM_ShowFrames()
    if not SDM_Initialized then return end

    SDM_ApplyContainerLayout()

    for i = 1, 12 do
        SDM_Frames[i]:Show()
    end
    if SDM_ClickFrame then SDM_ClickFrame:Show() end

    SafeHide(GetContinentDropdown())
    SafeHide(GetZoneDropdown())
    SDM_Visible = true
    SDM_UpdateFloorButtons()
    if SDM_QuestPinToggle then
        SDM_UpdateQuestPinToggle()
        SDM_QuestPinToggle:Show()
    end
    SDM_HideQuestiePins()
    SDM_ShowQuestiePins()
end

-- Hide the dungeon map overlay
function SDM_HideFrames()
    if not SDM_Initialized then return end

    for i = 1, 12 do
        SDM_Frames[i]:Hide()
    end
    if SDM_ClickFrame then SDM_ClickFrame:Hide() end
    SDM_HideQuestiePins()
    for _, btn in ipairs(SDM_FloorButtons) do btn:Hide() end
    if SDM_QuestPinToggle then SDM_QuestPinToggle:Hide() end

    SafeShow(GetContinentDropdown())
    SafeShow(GetZoneDropdown())
    SDM_Visible = false

    if SDM_PreviewMode then
        SDM_CurrentDungeon = nil
        SDM_PreviewMode = false
    end
end

-- ===== Options panel =====

SDM_OptionsPanel = nil

function SDM_RefreshOptionsPanel()
    local p = SDM_OptionsPanel
    if not p then return end
    if not SDM_Settings then SDM_Settings = {} end
    p.suppressChange = true
    p.scaleSlider:SetValue(SDM_ClampScale(SDM_Settings.overlayScale or 1.0))
    p.offsetXSlider:SetValue(SDM_ClampOffset(SDM_Settings.offsetX or 0))
    p.offsetYSlider:SetValue(SDM_ClampOffset(SDM_Settings.offsetY or 0))
    p.scaleSlider.valueText:SetText(string.format("%.2f", SDM_Settings.overlayScale or 1.0))
    p.offsetXSlider.valueText:SetText(tostring(math.floor((SDM_Settings.offsetX or 0) + 0.5)))
    p.offsetYSlider.valueText:SetText(tostring(math.floor((SDM_Settings.offsetY or 0) + 0.5)))
    p.questPinsCheck:SetChecked(SDM_Settings.questPins and true or false)
    p.suppressChange = false
end

local function SDM_MakeSlider(parent, name, labelText, lo, hi, step)
    local s = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
    s:SetWidth(260)
    s:SetHeight(16)
    s:SetMinMaxValues(lo, hi)
    s:SetValueStep(step)
    if s.SetObeyStepOnDrag then s:SetObeyStepOnDrag(true) end
    _G[name .. "Low"]:SetText(tostring(lo))
    _G[name .. "High"]:SetText(tostring(hi))
    _G[name .. "Text"]:SetText(labelText)
    s.valueText = s:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    s.valueText:SetPoint("TOP", s, "BOTTOM", 0, -2)
    return s
end

function SDM_CreateOptionsPanel()
    if SDM_OptionsPanel then return SDM_OptionsPanel end

    local f = CreateFrame("Frame", "SDM_OptionsPanel", UIParent)
    f.name = "SimpleDungeonMap"

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("SimpleDungeonMap")

    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    subtitle:SetPoint("RIGHT", f, "RIGHT", -16, 0)
    subtitle:SetJustifyH("LEFT")
    subtitle:SetText(L["Dungeon overlay size and position."])

    f.scaleSlider = SDM_MakeSlider(f, "SDM_ScaleSlider", L["Map size"], SDM_SCALE_MIN, SDM_SCALE_MAX, 0.05)
    f.scaleSlider:SetPoint("TOPLEFT", 24, -80)
    f.scaleSlider:SetScript("OnValueChanged", function(self, val)
        if f.suppressChange then return end
        val = math.floor(val * 20 + 0.5) / 20
        SDM_Settings.overlayScale = SDM_ClampScale(val)
        self.valueText:SetText(string.format("%.2f", SDM_Settings.overlayScale))
        SDM_ApplyContainerLayout()
    end)

    f.offsetXSlider = SDM_MakeSlider(f, "SDM_OffsetXSlider", L["Offset X"], SDM_OFFSET_MIN, SDM_OFFSET_MAX, 5)
    f.offsetXSlider:SetPoint("TOPLEFT", 24, -140)
    f.offsetXSlider:SetScript("OnValueChanged", function(self, val)
        if f.suppressChange then return end
        val = math.floor(val / 5 + 0.5) * 5
        SDM_Settings.offsetX = SDM_ClampOffset(val)
        self.valueText:SetText(tostring(SDM_Settings.offsetX))
        SDM_ApplyContainerLayout()
    end)

    f.offsetYSlider = SDM_MakeSlider(f, "SDM_OffsetYSlider", L["Offset Y"], SDM_OFFSET_MIN, SDM_OFFSET_MAX, 5)
    f.offsetYSlider:SetPoint("TOPLEFT", 24, -200)
    f.offsetYSlider:SetScript("OnValueChanged", function(self, val)
        if f.suppressChange then return end
        val = math.floor(val / 5 + 0.5) * 5
        SDM_Settings.offsetY = SDM_ClampOffset(val)
        self.valueText:SetText(tostring(SDM_Settings.offsetY))
        SDM_ApplyContainerLayout()
    end)

    local cb = CreateFrame("CheckButton", "SDM_QuestPinsCheck", f, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", 20, -240)
    _G[cb:GetName() .. "Text"]:SetText(L["Quest pins (Questie, beta)"])
    cb:SetScript("OnClick", function(self)
        if f.suppressChange then return end
        SDM_Settings.questPins = self:GetChecked() and true or false
        if SDM_UpdateQuestPinToggle then SDM_UpdateQuestPinToggle() end
        if SDM_Visible and SDM_ShowFrames then SDM_ShowFrames() end
    end)
    f.questPinsCheck = cb

    local hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    hint:SetPoint("TOPLEFT", 20, -282)
    hint:SetPoint("RIGHT", f, "RIGHT", -20, 0)
    hint:SetJustifyH("LEFT")
    hint:SetText(L["Tip: in the dungeon, left-click + drag to move, Ctrl+wheel to zoom."])

    local reset = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    reset:SetSize(140, 24)
    reset:SetPoint("TOPLEFT", 20, -320)
    reset:SetText(L["Reset"])
    reset:SetScript("OnClick", function()
        SDM_Settings.overlayScale = 1.0
        SDM_Settings.offsetX = 0
        SDM_Settings.offsetY = 0
        SDM_ApplyContainerLayout()
        SDM_RefreshOptionsPanel()
    end)

    -- Blizzard calls this when the panel becomes visible in Interface Options
    f.refresh = function() SDM_RefreshOptionsPanel() end
    f.okay = function() end
    f.cancel = function() end
    f.default = function()
        SDM_Settings.overlayScale = 1.0
        SDM_Settings.offsetX = 0
        SDM_Settings.offsetY = 0
        SDM_ApplyContainerLayout()
        SDM_RefreshOptionsPanel()
    end

    if InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(f)
    elseif Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(f, f.name)
        category.ID = f.name
        Settings.RegisterAddOnCategory(category)
        f.settingsCategoryID = category.ID
    end

    SDM_OptionsPanel = f
    return f
end

function SDM_ShowOptions()
    local f = SDM_OptionsPanel or SDM_CreateOptionsPanel()
    if Settings and Settings.OpenToCategory and f.settingsCategoryID then
        Settings.OpenToCategory(f.settingsCategoryID)
    elseif InterfaceOptionsFrame_OpenToCategory then
        -- Blizzard bug: call twice to ensure correct panel is selected
        InterfaceOptionsFrame_OpenToCategory(f)
        InterfaceOptionsFrame_OpenToCategory(f)
    else
        f:Show()
    end
    SDM_RefreshOptionsPanel()
end

-- Detect Scarlet Monastery wing by player coordinates
local function DetectScarletMonasteryWing()
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then return 1 end

    local pos = C_Map.GetPlayerMapPosition(mapID, "player")
    if not pos then return 1 end

    local x, y = pos:GetXY()
    if x < 0.4778 and y < 0.1950 then
        return 1 -- Graveyard
    elseif x >= 0.4778 and y >= 0.1959 then
        return 2 -- Library
    elseif x >= 0.4782 and y >= 0.1953 and y < 0.1959 then
        return 3 -- Armory
    else
        return 4 -- Cathedral
    end
end

-- Event handler: Player enters world or instance
function SDM_OnEnterWorld()
    SDM_PreviewMode = false
    local _, instanceType, _, _, _, _, _, instanceMapID = GetInstanceInfo()

    if instanceType == "party" or instanceType == "raid" then
        local dungeonName = SDM_DungeonByMapID[instanceMapID]
        if dungeonName then
            local floor = 1

            if SDM_SpecialDungeons[dungeonName] == "coordinate_detection" then
                floor = DetectScarletMonasteryWing()
            elseif SDM_DefaultFloor[dungeonName] then
                floor = SDM_DefaultFloor[dungeonName]
            end

            SDM_SetTextures(dungeonName, floor)
            if WorldMapFrame:IsVisible() then
                SDM_ShowFrames()
            end
        else
            SDM_CurrentDungeon = nil
            SDM_HideFrames()
        end
    else
        SDM_CurrentDungeon = nil
        SDM_HideFrames()
    end
end

-- Event handler: Zone changed indoors (floor switching)
function SDM_OnZoneChanged()
    if not SDM_CurrentDungeon then return end

    local subzone = GetMinimapZoneText()
    if not subzone then return end

    local key = subzone:gsub(" ", "")
    local data = SDM_SubzoneToFloor[key]

    if data then
        local dungeonName = data[1]
        local floor = data[2]

        if dungeonName == SDM_CurrentDungeon and floor ~= SDM_CurrentFloor then
            SDM_SetTextures(dungeonName, floor)
            if WorldMapFrame:IsVisible() then
                SDM_ShowFrames()
            end
        end
    end
end

-- Event handler: Loading screen (for Scarlet Monastery coordinate detection)
function SDM_OnLoadingScreen()
    C_Timer.After(0.5, function()
        local _, instanceType, _, _, _, _, _, instanceMapID = GetInstanceInfo()
        if instanceType ~= "party" and instanceType ~= "raid" then return end

        local dungeonName = SDM_DungeonByMapID[instanceMapID]
        if not dungeonName then return end

        if SDM_SpecialDungeons[dungeonName] == "coordinate_detection" then
            local floor = DetectScarletMonasteryWing()
            SDM_SetTextures(dungeonName, floor)
        end
    end)
end

-- Main event frame
local EventFrame = CreateFrame("Frame", "SDM_EventFrame", UIParent)

EventFrame:RegisterEvent("ADDON_LOADED")
EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
EventFrame:RegisterEvent("ZONE_CHANGED")
EventFrame:RegisterEvent("LOADING_SCREEN_ENABLED")

EventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "SimpleDungeonMap" then
        if not SDM_Settings then SDM_Settings = {} end
        if SDM_Settings.questPins == nil then SDM_Settings.questPins = false end
        if SDM_Settings.overlayScale == nil then SDM_Settings.overlayScale = 1.0 end
        if SDM_Settings.offsetX == nil then SDM_Settings.offsetX = 0 end
        if SDM_Settings.offsetY == nil then SDM_Settings.offsetY = 0 end
        SDM_CreateOptionsPanel()
    elseif event == "PLAYER_ENTERING_WORLD" then
        SDM_OnEnterWorld()
    elseif event == "ZONE_CHANGED_INDOORS" or event == "ZONE_CHANGED" then
        SDM_OnZoneChanged()
    elseif event == "LOADING_SCREEN_ENABLED" then
        SDM_OnLoadingScreen()
    end
end)

-- Hook WorldMapFrame: show overlay when map opens in a dungeon
WorldMapFrame:HookScript("OnShow", function()
    if SDM_CurrentDungeon then
        SDM_ShowFrames()
    end
end)

-- Hook WorldMapFrame: hide on close
WorldMapFrame:HookScript("OnHide", function()
    SDM_Visible = false
    if SDM_ClickFrame then SDM_ClickFrame:Hide() end
end)

-- Portal pin click: find dungeon by pin position on world map
local function SDM_FindDungeonForPin(mapID, pinX, pinY)
    local portals = SDM_DungeonPortals[mapID]
    if not portals then return nil end

    local best, bestDist = nil, 0.05  -- tolerance 5%
    for _, p in ipairs(portals) do
        local dx = pinX - p.x / 100
        local dy = pinY - p.y / 100
        local dist = math.sqrt(dx*dx + dy*dy)
        if dist < bestDist then
            best = p
            bestDist = dist
        end
    end
    return best
end

-- Hook dungeon portal pins on the world map for click-to-preview
-- Leatrix_Maps pins use pinFrameLevelType = PIN_FRAME_LEVEL_DUNGEON_ENTRANCE
if WorldMapFrame.EnumerateAllPins then
    hooksecurefunc(WorldMapFrame, "RefreshAllDataProviders", function(self)
        for pin in self:EnumerateAllPins() do
            if not pin._sdmHooked then
                local isDungeon = (pin.pinFrameLevelType == "PIN_FRAME_LEVEL_DUNGEON_ENTRANCE")
                    or (type(PIN_FRAME_LEVEL_DUNGEON_ENTRANCE) ~= "nil" and pin.pinFrameLevelType == PIN_FRAME_LEVEL_DUNGEON_ENTRANCE)

                if isDungeon then
                    pin:HookScript("OnMouseUp", function(pinSelf, btn)
                        if btn == "LeftButton" then
                            local px, py = pinSelf:GetPosition()
                            local mapID = WorldMapFrame:GetMapID() or WorldMapFrame.mapID
                            local dungeon = SDM_FindDungeonForPin(mapID, px, py)
                            if dungeon then
                                SDM_PreviewMode = true
                                SDM_SetTextures(dungeon.name, dungeon.floor)
                                SDM_ShowFrames()
                            end
                        end
                    end)
                    pin._sdmHooked = true
                end
            end
        end
    end)
end

-- Slash command: /sdm [debug|test|probe|reset]
SLASH_SDM1 = "/sdm"
SlashCmdList["SDM"] = function(msg)
    if msg == "options" or msg == "config" or msg == "opt" then
        SDM_ShowOptions()
    elseif msg == "questpins" then
        if not SDM_Settings then SDM_Settings = {} end
        SDM_Settings.questPins = not SDM_Settings.questPins
        if SDM_Settings.questPins then
            print("|cff00ff00SDM|r: Quest pins |cff00ff00ON|r (beta)")
            if SDM_CurrentDungeon and SDM_Visible then SDM_ShowQuestiePins() end
        else
            print("|cff00ff00SDM|r: Quest pins |cffff0000OFF|r")
            SDM_HideQuestiePins()
        end
    elseif msg == "debug" then
        local canvas = GetMapCanvas()
        local _, instanceType, _, _, _, _, _, mapID = GetInstanceInfo()
        print("|cff00ff00SDM Debug:|r")
        print("  CurrentDungeon: " .. tostring(SDM_CurrentDungeon))
        print("  CurrentFloor: " .. tostring(SDM_CurrentFloor))
        print("  Visible: " .. tostring(SDM_Visible))
        print("  Canvas: " .. string.format("%.0f", canvas:GetWidth()) .. "x" .. string.format("%.0f", canvas:GetHeight()))
        print("  InstanceType: " .. tostring(instanceType) .. "  MapID: " .. tostring(mapID))
        print("  Subzone: " .. tostring(GetMinimapZoneText()))
        if SDM_CurrentDungeon then
            print("  TexturePath: " .. SDM_GetTexturePath(SDM_CurrentDungeon, SDM_CurrentFloor, 1))
        end
        if SDM_Initialized and SDM_Frames[1] then
            print("  Frame1 size: " .. string.format("%.1f", SDM_Frames[1]:GetWidth()) .. "x" .. string.format("%.1f", SDM_Frames[1]:GetHeight()))
            print("  Texture1 loaded: " .. tostring(SDM_Textures[1]:GetTexture()))
        end
    elseif msg == "test" then
        if not SDM_Initialized then SDM_CreateFrames() end
        for i = 1, 12 do SDM_Textures[i]:SetColorTexture(1, 0, 0, 0.5) end
        SDM_Visible = true
        for i = 1, 12 do SDM_Frames[i]:Show() end
        if SDM_ClickFrame then SDM_ClickFrame:Show() end
        SafeHide(GetContinentDropdown())
        SafeHide(GetZoneDropdown())
        print("|cff00ff00SDM|r: Test mode. Right-click to dismiss.")
    elseif msg == "probe" then
        if not SDM_Initialized then SDM_CreateFrames() end
        if not SDM_CurrentDungeon then
            print("|cff00ff00SDM|r: Not in a dungeon.")
            return
        end
        local variants = { SDM_CurrentDungeon, SDM_CurrentDungeon:gsub("^The", "") }
        print("|cff00ff00SDM Probe|r:")
        for _, name in ipairs(variants) do
            local path = "Interface\\Worldmap\\" .. name .. "\\" .. name .. "1_1"
            SDM_Textures[1]:SetTexture(path)
            local loaded = SDM_Textures[1]:GetTexture()
            print("  " .. path .. " -> " .. (loaded and "|cff00ff00FOUND|r" or "|cffff0000nil|r"))
        end
        SDM_Textures[1]:SetTexture(SDM_GetTexturePath(SDM_CurrentDungeon, SDM_CurrentFloor, 1))
    elseif msg and msg:match("^questie") then
        local questArg = msg:match("questie%s+(%d+)")
        if not QuestieLoader then
            print("|cff00ff00SDM|r: Questie not installed.")
            return
        end
        local _, _, _, _, _, _, _, instMapID = GetInstanceInfo()
        local questieAreaID = SDM_InstanceToQuestieArea[instMapID]
        print("|cff00ff00SDM Questie|r: instanceMapID=" .. tostring(instMapID) .. " -> questieAreaID=" .. tostring(questieAreaID))

        local ok, QDB = pcall(function() return QuestieLoader:ImportModule("QuestieDB") end)
        local ok2, QPlayer = pcall(function() return QuestieLoader:ImportModule("QuestiePlayer") end)

        if not ok or not QDB then
            print("  QuestieDB: " .. tostring(ok) .. " / " .. tostring(QDB))
            return
        end
        print("  QuestieDB loaded: GetQuest=" .. tostring(QDB.GetQuest ~= nil) .. " GetNPC=" .. tostring(QDB.GetNPC ~= nil))
        print("  QuestiePlayer loaded: " .. tostring(ok2) .. " currentQuestlog=" .. tostring(QPlayer and QPlayer.currentQuestlog ~= nil))

        -- If a specific quest ID is given, trace that quest
        if questArg then
            local qid = tonumber(questArg)
            print("  --- Tracing quest " .. qid .. " ---")
            local quest
            if QDB.GetQuest then
                ok, quest = pcall(function() return QDB.GetQuest(qid) end)
                if not ok then print("  GetQuest error: " .. tostring(quest)); quest = nil end
            end
            if not quest then
                print("  Quest not found in QuestieDB")
                return
            end
            print("  Quest name: " .. tostring(quest.name or quest.Name or "?"))
            if quest.ObjectiveData then
                for i, obj in ipairs(quest.ObjectiveData) do
                    print("  Obj" .. i .. ": Type=" .. tostring(obj.Type) .. " Id=" .. tostring(obj.Id) .. " Name=" .. tostring(obj.Name))
                    if (obj.Type == "monster" or obj.Type == "killcredit") and obj.Id then
                        local npc
                        ok, npc = pcall(function() return QDB:GetNPC(obj.Id) end)
                        if ok and npc then
                            print("    NPC: " .. tostring(npc.name or npc.Name or "?"))
                            if npc.spawns then
                                for areaId, coords in pairs(npc.spawns) do
                                    local inDungeon = (areaId == questieAreaID) and " <-- MATCH" or ""
                                    print("    spawns[" .. areaId .. "]: " .. #coords .. " points" .. inDungeon)
                                    if areaId == questieAreaID then
                                        for _, c in ipairs(coords) do
                                            print("      (" .. c[1] .. ", " .. c[2] .. ")")
                                        end
                                    end
                                end
                            else
                                print("    No spawns table")
                            end
                        else
                            print("    NPC not found: " .. tostring(npc))
                        end
                    elseif obj.Type == "object" and obj.Id then
                        local gameObj
                        ok, gameObj = pcall(function() return QDB:GetObject(obj.Id) end)
                        if ok and gameObj and gameObj.spawns then
                            for areaId, coords in pairs(gameObj.spawns) do
                                local inDungeon = (areaId == questieAreaID) and " <-- MATCH" or ""
                                print("    spawns[" .. areaId .. "]: " .. #coords .. " points" .. inDungeon)
                            end
                        end
                    elseif obj.Type == "item" then
                        print("    Item objective - Sources: " .. tostring(obj.Sources and #obj.Sources or "nil"))
                        if obj.Sources then
                            for _, src in ipairs(obj.Sources) do
                                print("    Source: Type=" .. tostring(src.Type) .. " Id=" .. tostring(src.Id))
                                if src.Type == "monster" or src.Type == "npc" then
                                    local npc
                                    ok, npc = pcall(function() return QDB:GetNPC(src.Id) end)
                                    if ok and npc and npc.spawns then
                                        for areaId, coords in pairs(npc.spawns) do
                                            local inDungeon = (areaId == questieAreaID) and " <-- MATCH" or ""
                                            print("      NPC " .. tostring(src.Id) .. " spawns[" .. areaId .. "]: " .. #coords .. " points" .. inDungeon)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                print("  No ObjectiveData found")
                -- List available keys
                print("  Quest keys:")
                for k, v in pairs(quest) do
                    print("    " .. tostring(k) .. " = " .. tostring(type(v)))
                end
            end
        else
            -- List active quests in quest log
            if QPlayer and QPlayer.currentQuestlog then
                print("  Active quests:")
                for qid, _ in pairs(QPlayer.currentQuestlog) do
                    local quest
                    pcall(function() quest = QDB.GetQuest(qid) end)
                    local name = quest and (quest.name or quest.Name) or "?"
                    print("    Q" .. qid .. ": " .. tostring(name))
                end
            end
        end
    elseif msg == "pins" then
        print("|cff00ff00SDM Pins|r: Enumerating all map pins...")
        local mapID = WorldMapFrame:GetMapID() or WorldMapFrame.mapID
        print("  MapID: " .. tostring(mapID))
        if not WorldMapFrame.EnumerateAllPins then
            print("  |cffff0000EnumerateAllPins not available!|r")
            return
        end
        -- Known portal positions for this map
        local portals = SDM_DungeonPortals[mapID]
        local count = 0
        local dumpedFull = false
        for pin in WorldMapFrame:EnumerateAllPins() do
            count = count + 1
            local px, py = 0, 0
            if pin.GetPosition then
                local ok, x, y = pcall(pin.GetPosition, pin)
                if ok then px, py = x or 0, y or 0 end
            end
            -- Check if near a known portal position
            local nearPortal = false
            if portals then
                for _, p in ipairs(portals) do
                    local dx = px - p.x / 100
                    local dy = py - p.y / 100
                    if math.sqrt(dx*dx + dy*dy) < 0.05 then
                        nearPortal = true
                        break
                    end
                end
            end
            if nearPortal then
                print(string.format("  |cffff8800NEAR PORTAL|r #%d pos=%.3f,%.3f", count, px, py))
                print("    Keys:")
                for k, v in pairs(pin) do
                    print("      " .. tostring(k) .. " = " .. tostring(v))
                end
                -- Check children textures
                local regions = { pin:GetRegions() }
                for ri, r in ipairs(regions) do
                    local rtype = r:GetObjectType()
                    if rtype == "Texture" then
                        local a = r:GetAtlas()
                        local t = r:GetTexture()
                        print("      child_tex#" .. ri .. ": atlas=" .. tostring(a) .. " tex=" .. tostring(t))
                    end
                end
                dumpedFull = true
            end
        end
        if not dumpedFull then
            -- No pin matched portal positions: dump first 5 with children detail
            print("  No pins near portals. Dumping first 5:")
            local i = 0
            for pin in WorldMapFrame:EnumerateAllPins() do
                i = i + 1
                if i > 5 then break end
                local px, py = 0, 0
                if pin.GetPosition then
                    local ok, x, y = pcall(pin.GetPosition, pin)
                    if ok then px, py = x or 0, y or 0 end
                end
                print(string.format("  #%d pos=%.3f,%.3f", i, px, py))
                for k, v in pairs(pin) do
                    print("    " .. tostring(k) .. " = " .. tostring(v))
                end
                local regions = { pin:GetRegions() }
                for ri, r in ipairs(regions) do
                    print("    region#" .. ri .. ": " .. r:GetObjectType() .. " atlas=" .. tostring(r.GetAtlas and r:GetAtlas()) .. " tex=" .. tostring(r.GetTexture and r:GetTexture()))
                end
            end
        end
        print("  Total pins: " .. count)
    elseif msg and msg:match("^probefloors") then
        if not SDM_Initialized then SDM_CreateFrames() end
        -- Probe all dungeons or a specific one
        local arg = msg:match("probefloors%s+(.+)")
        local dungeons = {}
        if arg then
            dungeons[arg] = true
        else
            for _, name in pairs(SDM_DungeonByMapID) do
                dungeons[name] = true
            end
        end
        print("|cff00ff00SDM ProbeFloors|r:")
        for name in pairs(dungeons) do
            local floors = {}
            for f = 1, 10 do
                local path = SDM_GetTexturePath(name, f, 1)
                SDM_Textures[1]:SetTexture(path)
                if SDM_Textures[1]:GetTexture() then
                    table.insert(floors, f)
                end
            end
            if #floors > 1 then
                print("  |cff00ff00" .. name .. "|r: {" .. table.concat(floors, ", ") .. "}")
            elseif #floors == 1 then
                print("  " .. name .. ": {1}")
            else
                print("  |cffff0000" .. name .. "|r: no textures found")
            end
        end
        -- Restore current texture
        if SDM_CurrentDungeon then
            SDM_Textures[1]:SetTexture(SDM_GetTexturePath(SDM_CurrentDungeon, SDM_CurrentFloor, 1))
        end
    elseif msg == "reset" then
        SDM_HideFrames()
        SDM_CurrentDungeon = nil
        print("|cff00ff00SDM|r: Reset.")
    elseif SDM_CurrentDungeon then
        print("|cff00ff00SDM|r: " .. SDM_CurrentDungeon .. " floor " .. SDM_CurrentFloor)
    else
        print("|cff00ff00SDM|r: Not in a mapped dungeon.")
    end
end

print("|cff00ff00SimpleDungeonMap|r loaded. /sdm options | /sdm questpins | /sdm debug")
