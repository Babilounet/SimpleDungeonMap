-- DungeonData.lua
-- Data tables for SimpleDungeonMap
-- Uses instanceMapID (numeric) to avoid locale issues

-- Map ID -> texture folder name
SDM_DungeonByMapID = {
    -- Vanilla
    [389] = "Ragefire",
    [43]  = "WailingCaverns",
    [36]  = "TheDeadmines",
    [33]  = "ShadowfangKeep",
    [48]  = "BlackfathomDeeps",
    [34]  = "TheStockade",
    [90]  = "Gnomeregan",
    [47]  = "RazorfenKraul",
    [189] = "ScarletMonastery",
    [129] = "RazorfenDowns",
    [70]  = "Uldaman",
    [209] = "ZulFarrak",
    [349] = "Maraudon",
    [109] = "TheTempleofAtalhakkar",
    [230] = "BlackrockDepths",
    [229] = "BlackrockSpire",
    [429] = "Diremaul",
    [329] = "Stratholme",
    [289] = "Scholomance",
    -- TBC
    [543] = "HellfireRampart",
    [542] = "TheBloodFurnace",
    [540] = "TheShatteredHalls",
    [547] = "TheSlavePens",
    [546] = "TheUnderbog",
    [545] = "TheSteamvault",
    [557] = "ManaTombs",
    [558] = "AuchenaiCrypts",
    [556] = "SethekkHalls",
    [555] = "ShadowLabyrinth",
    [554] = "TheMechanar",
    [553] = "TheBotanica",
    [552] = "TheArcatraz",
    [560] = "OldHillsbradFoothills",
    [269] = "TheBlackMorass",
    [585] = "MagistersTerrace",
}

-- Subzone name (no spaces) -> { dungeon folder, floor number }
SDM_SubzoneToFloor = {
    -- Gnomeregan (4 floors)
    ["TheClockwerkRun"]  = { "Gnomeregan", 1 },
    ["TheCleanZone"]     = { "Gnomeregan", 1 },
    ["TheHallofGears"]   = { "Gnomeregan", 2 },
    ["TheDormitory"]     = { "Gnomeregan", 2 },
    ["EngineeringLabs"]  = { "Gnomeregan", 3 },
    ["LaunchBay"]        = { "Gnomeregan", 3 },
    ["Tinkers'Court"]    = { "Gnomeregan", 4 },

    -- Blackfathom Deeps (3 floors)
    ["BlackfathomDeeps"]  = { "BlackfathomDeeps", 1 },
    ["MoonshrineRuins"]   = { "BlackfathomDeeps", 2 },
    ["TheForgottenPool"]  = { "BlackfathomDeeps", 3 },

    -- Maraudon
    ["EarthSongFalls"]  = { "Maraudon", 2 },
    ["Zaetar'sGrave"]   = { "Maraudon", 2 },

    -- Blackrock Depths (2 floors)
    ["DetentionBlock"]   = { "BlackrockDepths", 1 },
    ["HallofCrafting"]   = { "BlackrockDepths", 1 },
    ["DarkIronHighway"]  = { "BlackrockDepths", 1 },
    ["TheDomicile"]      = { "BlackrockDepths", 2 },
    ["EastGarrison"]     = { "BlackrockDepths", 2 },
    ["RingoftheLaw"]     = { "BlackrockDepths", 2 },
    ["TheManufactory"]   = { "BlackrockDepths", 2 },
    ["TheGrimGuzzler"]   = { "BlackrockDepths", 2 },
    ["TheLyceum"]        = { "BlackrockDepths", 2 },

    -- Blackrock Spire (LBRS floors)
    ["Tazz'Alaor"]         = { "BlackrockSpire", 1 },
    ["SkitterwebTunnels"]  = { "BlackrockSpire", 1 },
    ["HordemarCity"]       = { "BlackrockSpire", 3 },
    ["ChamberofBattle"]    = { "BlackrockSpire", 6 },
    ["HallofBlackhand"]    = { "BlackrockSpire", 7 },
    ["BlackrockStadium"]   = { "BlackrockSpire", 7 },
    ["SpireThrone"]        = { "BlackrockSpire", 7 },

    -- Upper Blackrock Spire
    ["HallofBinding"]  = { "BlackrockSpire", 2 },
    ["TheRookery"]     = { "BlackrockSpire", 2 },

    -- Diremaul
    ["WarpwoodQuarter"]     = { "Diremaul", 5 },
    ["TheConservatory"]     = { "Diremaul", 6 },
    ["CapitalGardens"]      = { "Diremaul", 2 },
    ["PrisonofImmol'thar"]  = { "Diremaul", 4 },

    -- Scholomance (4 floors)
    ["TheReliquary"]        = { "Scholomance", 1 },
    ["ChamberofSummoning"]  = { "Scholomance", 2 },
    ["TheGreatOssuary"]     = { "Scholomance", 2 },
    ["TheViewingRoom"]      = { "Scholomance", 2 },
    ["Headmaster'sStudy"]   = { "Scholomance", 4 },

    -- Stratholme
    ["Elders'Square"]    = { "Stratholme", 2 },
    ["TheGauntlet"]      = { "Stratholme", 2 },
    ["SlaughterSquare"]  = { "Stratholme", 2 },
}

-- Dungeons with special texture path handling
SDM_SpecialDungeons = {
    -- ZulFarrak: no floor prefix in texture name (ZulFarrak1.blp instead of ZulFarrak1_1.blp)
    ["ZulFarrak"] = "no_floor_prefix",
    -- ScarletMonastery: wing detected by player coordinates, not subzone
    ["ScarletMonastery"] = "coordinate_detection",
}

-- Default floor when entering a dungeon (if not floor 1)
SDM_DefaultFloor = {
    ["BlackrockSpire"] = 7,
}

-- Available floors for multi-floor dungeons (from /sdm probefloors)
SDM_DungeonFloors = {
    -- Vanilla
    ["TheDeadmines"]     = {1, 2},
    ["ShadowfangKeep"]   = {1, 2, 3, 4, 5, 6, 7},
    ["BlackfathomDeeps"] = {1, 2, 3},
    ["Gnomeregan"]       = {1, 2, 3, 4},
    ["Uldaman"]          = {1, 2},
    ["Maraudon"]         = {1, 2},
    ["BlackrockDepths"]  = {1, 2},
    ["BlackrockSpire"]   = {1, 2, 3, 4, 5, 6, 7},
    ["Diremaul"]         = {1, 2, 3, 4, 5, 6},
    ["Scholomance"]      = {1, 2, 3, 4},
    ["Stratholme"]       = {1, 2},
    ["ScarletMonastery"] = {1, 2, 3, 4},
    -- TBC
    ["AuchenaiCrypts"]   = {1, 2},
    ["SethekkHalls"]     = {1, 2},
    ["TheMechanar"]      = {1, 2},
    ["TheArcatraz"]      = {1, 2, 3},
    ["TheSteamvault"]    = {1, 2},
    ["MagistersTerrace"] = {1, 2},
}

-- Short labels for floor buttons (nil = use floor number)
SDM_FloorLabels = {
    ["ScarletMonastery"] = { "GY", "Lib", "Arm", "Cath" },
    ["Stratholme"]       = { "Liv", "UD" },
}

-- Tooltip names for floors
SDM_FloorNames = {
    -- Vanilla
    ["ScarletMonastery"] = { "Graveyard", "Library", "Armory", "Cathedral" },
    ["Diremaul"]         = { "North", "East (Gardens)", "Floor 3", "East (Prison)", "West (Warpwood)", "West (Conservatory)" },
    ["Stratholme"]       = { "Living Side", "Undead Side" },
    ["Gnomeregan"]       = { "Clockwerk Run", "Hall of Gears", "Engineering Labs", "Tinkers' Court" },
    ["BlackfathomDeeps"] = { "Deeps", "Moonshrine Ruins", "Forgotten Pool" },
    ["Scholomance"]      = { "Reliquary", "Chamber of Summoning", "Floor 3", "Headmaster's Study" },
    ["BlackrockDepths"]  = { "Detention Block", "Domicile" },
    ["BlackrockSpire"]   = { "Tazz'Alaor", "Rookery", "Hordemar City", "Floor 4", "Floor 5", "Chamber of Battle", "Hall of Blackhand" },
    -- TBC
    ["TheArcatraz"]      = { "Stasis Block", "Restraining Grounds", "Top" },
}

-- instanceMapID -> Questie areaID (for reading quest pins from Questie)
SDM_InstanceToQuestieArea = {
    -- Vanilla
    [389] = 2437,  -- Ragefire Chasm
    [43]  = 718,   -- Wailing Caverns
    [36]  = 1581,  -- The Deadmines
    [33]  = 209,   -- Shadowfang Keep
    [48]  = 719,   -- Blackfathom Deeps
    [34]  = 717,   -- The Stockade
    [90]  = 721,   -- Gnomeregan
    [47]  = 491,   -- Razorfen Kraul
    [189] = 796,   -- Scarlet Monastery
    [129] = 722,   -- Razorfen Downs
    [70]  = 1337,  -- Uldaman
    [209] = 1176,  -- Zul'Farrak
    [349] = 2100,  -- Maraudon
    [109] = 1477,  -- Temple of Atal'Hakkar
    [230] = 1584,  -- Blackrock Depths
    [229] = 1583,  -- Blackrock Spire
    [429] = 2557,  -- Dire Maul
    [329] = 2017,  -- Stratholme
    [289] = 2057,  -- Scholomance
    -- TBC
    [543] = 3562,  -- Hellfire Ramparts
    [542] = 3713,  -- The Blood Furnace
    [540] = 3714,  -- The Shattered Halls
    [547] = 3717,  -- The Slave Pens
    [546] = 3716,  -- The Underbog
    [545] = 3715,  -- The Steamvault
    [557] = 3792,  -- Mana-Tombs
    [558] = 3790,  -- Auchenai Crypts
    [556] = 3791,  -- Sethekk Halls
    [555] = 3789,  -- Shadow Labyrinth
    [554] = 3849,  -- The Mechanar
    [553] = 3847,  -- The Botanica
    [552] = 3848,  -- The Arcatraz
    [560] = 2367,  -- Old Hillsbrad Foothills
    [269] = 2366,  -- The Black Morass
    [585] = 4131,  -- Magisters' Terrace
}

-- World map zone -> dungeon portal positions (coordinates in percent, from Leatrix_Maps)
-- Used to hook blue portal pins on the world map for click-to-preview
SDM_DungeonPortals = {
    -- Eastern Kingdoms
    [1418] = {{ x=44.6, y=12.1, name="Uldaman", floor=1 }},
    [1420] = {{ x=82.6, y=33.8, name="ScarletMonastery", floor=1 }},
    [1421] = {{ x=44.8, y=67.8, name="ShadowfangKeep", floor=1 }},
    [1422] = {{ x=69.7, y=73.2, name="Scholomance", floor=1 }},
    [1423] = {  -- Eastern Plaguelands: 2 entrances Stratholme
        { x=31.3, y=15.7, name="Stratholme", floor=1 },
        { x=47.9, y=23.9, name="Stratholme", floor=2 },
    },
    [1426] = {{ x=24.3, y=39.8, name="Gnomeregan", floor=1 }},
    -- [1427] Searing Gorge: Blackrock = Dunraid, skip
    -- [1428] Burning Steppes: Blackrock = Dunraid, skip
    [1435] = {{ x=69.9, y=53.6, name="TheTempleofAtalhakkar", floor=1 }},
    [1436] = {{ x=42.5, y=71.7, name="TheDeadmines", floor=1 }},
    [1453] = {{ x=42.3, y=59.0, name="TheStockade", floor=1 }},
    [1957] = {{ x=61.2, y=30.9, name="MagistersTerrace", floor=1 }},

    -- Kalimdor
    [1413] = {  -- The Barrens: 3 dungeons
        { x=46.0, y=36.4, name="WailingCaverns", floor=1 },
        { x=42.9, y=90.2, name="RazorfenKraul", floor=1 },
        { x=49.0, y=93.9, name="RazorfenDowns", floor=1 },
    },
    [1440] = {{ x=14.5, y=14.2, name="BlackfathomDeeps", floor=1 }},
    [1443] = {{ x=29.1, y=62.5, name="Maraudon", floor=1 }},
    [1444] = {  -- Feralas: 3 entrances Dire Maul
        { x=62.5, y=24.9, name="Diremaul", floor=1 },  -- North
        { x=60.3, y=30.2, name="Diremaul", floor=5 },  -- West (Warpwood)
        { x=64.8, y=30.2, name="Diremaul", floor=2 },  -- East (Capital Gardens)
    },
    [1446] = {{ x=38.7, y=20.0, name="ZulFarrak", floor=1 }},
    -- [1446] also Caverns of Time = Dunraid, skip
    [1454] = {{ x=52.6, y=49.0, name="Ragefire", floor=1 }},

    -- Outland (TBC)
    [1944] = {  -- Hellfire Peninsula: 3 dungeons
        { x=47.7, y=53.6, name="HellfireRampart", floor=1 },
        { x=47.7, y=52.0, name="TheShatteredHalls", floor=1 },
        { x=46.0, y=51.8, name="TheBloodFurnace", floor=1 },
    },
    [1952] = {  -- Terokkar Forest: 4 dungeons
        { x=39.7, y=60.2, name="ManaTombs", floor=1 },
        { x=36.1, y=65.6, name="AuchenaiCrypts", floor=1 },
        { x=43.2, y=65.6, name="SethekkHalls", floor=1 },
        { x=39.6, y=71.0, name="ShadowLabyrinth", floor=1 },
    },
    [1953] = {  -- Netherstorm: 3 dungeons
        { x=71.7, y=55.0, name="TheBotanica", floor=1 },
        { x=74.4, y=57.7, name="TheArcatraz", floor=1 },
        { x=70.6, y=69.7, name="TheMechanar", floor=1 },
    },
    -- [1946] Zangarmarsh: Coilfang = Dunraid, skip
}

-- Fallback NPC/object positions inside dungeons (from Wowhead)
-- Used when Questie has (-1,-1) coordinates
-- questieAreaID -> { npcOrObjId -> { x, y } }
SDM_DungeonNPCPositions = {
    [3562] = { -- Hellfire Ramparts
        [17306] = { 72.5, 35.5 },  -- Watchkeeper Gargolmar
        [17537] = { 27.2, 84.8 },  -- Vazruden
        [17536] = { 27.2, 84.8 },  -- Nazan
    },
    [3713] = { -- The Blood Furnace
        [17377] = { 59.8, 35.5 },  -- Keli'dan the Breaker
    },
    [3714] = { -- The Shattered Halls
        [16807] = { 33.6, 63.6 },  -- Grand Warlock Nethekurse
    },
    [3717] = { -- The Slave Pens
        [17890] = { 46, 80 },      -- Weeder Greenthumb
        [17893] = { 94.4, 65.4 },  -- Naturalist Bite
        [17941] = { 48.7, 24.4 },  -- Mennu the Betrayer
    },
    [3716] = { -- The Underbog
        [17885] = { 67.5, 21.2 },  -- Earthbinder Rayge
        [17894] = { 41.5, 24.1 },  -- Windcaller Claw
        [17882] = { 24.7, 45.6 },  -- The Black Stalker
        [17770] = { 69.3, 89.9 },  -- Hungarfen
        [17826] = { 41.5, 24.1 },  -- Swamplord Musel'ek
    },
    [3715] = { -- The Steamvault
        [17798] = { 74, 37 },      -- Warlord Kalithresh
        [17797] = { 53.8, 8.7 },   -- Hydromancer Thespia
        [17796] = { 29.6, 86.2 },  -- Mekgineer Steamrigger
    },
    [3792] = { -- Mana-Tombs
        [18344] = { 32, 49 },      -- Nexus-Prince Shaffar
    },
    [3790] = { -- Auchenai Crypts
        [18373] = { 74, 51 },      -- Exarch Maladaar
        [19412] = { 74, 51 },      -- D'ore
    },
    [3791] = { -- Sethekk Halls
        [18472] = { 49, 68 },      -- Darkweaver Syth
        [18473] = { 33, 28 },      -- Talon King Ikiss
        [18956] = { 49, 68 },      -- Lakka
        [183050] = { 33, 28 },     -- The Saga of Terokk
    },
    [3789] = { -- Shadow Labyrinth (offset -2, -5 from Wowhead)
        [18731] = { 17, 20 },      -- Ambassador Hellmaw (manually calibrated)
        [18667] = { 25, 65 },      -- Blackheart the Inciter
        [18732] = { 51, 49 },      -- Grandmaster Vorpil
        [18708] = { 79, 34 },      -- Murmur
        [18891] = { 17, 20 },      -- Spy To'gun (same as Hellmaw)
        [22890] = { 79, 34 },      -- First Fragment Guardian
        [182947] = { 51, 49 },     -- The Codex of Blood
        [182196] = { 79, 34 },     -- Arcane Container
    },
    [3849] = { -- The Mechanar
        [19218] = { 47, 55 },      -- Gatewatcher Gyro-Kill
        [19710] = { 59.5, 50.5 },  -- Gatewatcher Iron-Hand
        [19219] = { 55.5, 36 },    -- Mechano-Lord Capacitus
        [19220] = { 27, 61 },      -- Pathaleon the Calculator
    },
    [3847] = { -- The Botanica
        [17976] = { 41.2, 31.6 },  -- Commander Sarannis
        [17975] = { 29.8, 34.6 },  -- High Botanist Freywinn
        [17978] = { 18.7, 46.4 },  -- Thorngrin the Tender
        [17980] = { 36.1, 69.3 },  -- Laj
        [17977] = { 36.3, 39.8 },  -- Warp Splinter
    },
    [3848] = { -- The Arcatraz
        [20870] = { 51.6, 49.3 },  -- Zereketh the Unbound
        [20886] = { 21.5, 64.1 },  -- Wrath-Scryer Soccothrates
        [20885] = { 29.9, 63.7 },  -- Dalliah the Doomsayer
        [20912] = { 57.8, 16.3 },  -- Harbinger Skyriss
    },
    [2367] = { -- Old Hillsbrad Foothills
        [17848] = { 69.4, 56.1 },  -- Lieutenant Drake
        [17862] = { 64.2, 58.8 },  -- Captain Skarloc
        [18096] = { 45.3, 24.6 },  -- Epoch Hunter
    },
    [4131] = { -- Magisters' Terrace
        [24723] = { 42, 30.5 },    -- Selin Fireheart
        [24744] = { 83, 26 },      -- Vexallus
        [24560] = { 40, 56 },      -- Priestess Delrissa
        [24664] = { 9, 50 },       -- Kael'thas Sunstrider
    },
}
