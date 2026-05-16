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
    -- Vanilla Raids
    [409] = "MoltenCore",
    [249] = "OnyxiasLair",
    [469] = "BlackwingLair",
    [309] = "ZulGurub",
    [509] = "RuinsofAhnQiraj",
    [531] = "AhnQiraj",
    [533] = "Naxxramas",
    -- TBC Raids
    [532] = "Karazhan",
    [565] = "GruulsLair",
    [544] = "MagtheridonsLair",
    [548] = "CoilfangReservoir",
    [550] = "TempestKeep",
    [534] = "CoTMountHyjal",
    [564] = "BlackTemple",
    [580] = "SunwellPlateau",
    [568] = "ZulAman",
    -- TBC
    [543] = "HellfireRamparts",
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
    [560] = "CoTHillsbradFoothills",
    [269] = "CoTTheBlackMorass",
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
    -- No floor prefix in texture name (e.g. ZulFarrak1.blp instead of ZulFarrak1_1.blp)
    ["ZulFarrak"] = "no_floor_prefix",
    ["ZulGurub"] = "no_floor_prefix",
    ["RuinsofAhnQiraj"] = "no_floor_prefix",
    ["CoTHillsbradFoothills"] = "no_floor_prefix",
    ["CoTTheBlackMorass"] = "no_floor_prefix",
    ["CoTMountHyjal"] = "no_floor_prefix",
    ["ZulAman"] = "no_floor_prefix",
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
    ["Uldaman"]          = {1, 2, 18}, -- page 18 = texture séparée (entrée ?), à identifier in-game
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
    -- Vanilla Raids
    ["BlackwingLair"]    = {1, 2, 3, 4},
    ["AhnQiraj"]         = {1, 2, 3},
    ["Naxxramas"]        = {1, 2, 3, 4, 5, 6},
    -- TBC Raids
    ["Karazhan"]         = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17},
    ["BlackTemple"]      = {1, 2, 3, 4, 5, 6, 7},
}

-- Short labels for floor buttons (nil = use floor number)
SDM_FloorLabels = {
    ["ScarletMonastery"] = { "GY", "Lib", "Arm", "Cath" },
    ["Stratholme"]       = { "Liv", "UD" },
    -- Vanilla Raids
    ["Naxxramas"]        = { "Arach", "Plag", "Mil", "Cons", "Frost", "KT" },
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
    -- Vanilla Raids
    ["BlackwingLair"]    = { "Razorgore", "Vaelastrasz", "Chromaggus", "Nefarian" },
    ["AhnQiraj"]         = { "Temple Entrance", "Twin Emperors", "C'Thun" },
    ["Naxxramas"]        = { "Arachnid Quarter", "Plague Quarter", "Military Quarter", "Construct Quarter", "Frostwyrm Lair", "Kel'Thuzad" },
    -- TBC Raids
    ["Karazhan"]         = { "Servant Quarters", "Upper Livery", "The Guest Chambers", "The Opera House", "The Menagerie", "Gamesman's Hall", "Guardian's Library", "Netherspace", "Floor 9", "Floor 10", "Floor 11", "Floor 12", "Floor 13", "Floor 14", "Floor 15", "Floor 16", "Floor 17" },
    ["BlackTemple"]      = { "Karabor Sewers", "Sanctuary of Shadows", "Halls of Anguish", "Gorefiend's Vigil", "Den of Mortal Delights", "Chamber of Command", "Temple Summit" },
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
    -- Vanilla Raids
    [409] = 2717,  -- Molten Core
    [249] = 2159,  -- Onyxia's Lair
    [469] = 2677,  -- Blackwing Lair
    [309] = 1977,  -- Zul'Gurub
    [509] = 3429,  -- Ruins of Ahn'Qiraj
    [531] = 3428,  -- Temple of Ahn'Qiraj
    [533] = 3456,  -- Naxxramas
    -- TBC Raids
    [532] = 3457,  -- Karazhan
    [565] = 3923,  -- Gruul's Lair
    [544] = 3836,  -- Magtheridon's Lair
    [548] = 3607,  -- Serpentshrine Cavern
    [550] = 3845,  -- Tempest Keep (The Eye)
    [534] = 3606,  -- Hyjal Summit
    [564] = 3959,  -- Black Temple
    [580] = 4075,  -- Sunwell Plateau
    [568] = 3805,  -- Zul'Aman
}

-- World map zone -> dungeon portal positions (coordinates in percent, from Leatrix_Maps)
-- Used to hook blue portal pins on the world map for click-to-preview
SDM_DungeonPortals = {
    -- Eastern Kingdoms
    [1418] = {{ x=44.6, y=12.1, name="Uldaman", floor=1 }},
    [1420] = {{ x=82.6, y=33.8, name="ScarletMonastery", floor=1 }},
    [1421] = {{ x=44.8, y=67.8, name="ShadowfangKeep", floor=1 }},
    [1422] = {{ x=69.7, y=73.2, name="Scholomance", floor=1 }},
    [1423] = {  -- Eastern Plaguelands: Stratholme + Naxxramas
        { x=31.3, y=15.7, name="Stratholme", floor=1 },
        { x=47.9, y=23.9, name="Stratholme", floor=2 },
        { x=39.3, y=25.6, name="Naxxramas", floor=1 },
    },
    [1426] = {{ x=24.3, y=39.8, name="Gnomeregan", floor=1 }},
    [1427] = {  -- Searing Gorge: Blackrock Mountain raids + dungeons
        { x=34.8, y=85.3, name="MoltenCore", floor=1 },
        { x=34.8, y=85.3, name="BlackwingLair", floor=1 },
        { x=34.8, y=85.3, name="BlackrockDepths", floor=1 },
        { x=34.8, y=85.3, name="BlackrockSpire", floor=7 },
    },
    [1428] = {  -- Burning Steppes: Blackrock Mountain raids + dungeons
        { x=29.4, y=38.3, name="MoltenCore", floor=1 },
        { x=29.4, y=38.3, name="BlackwingLair", floor=1 },
        { x=29.4, y=38.3, name="BlackrockDepths", floor=1 },
        { x=29.4, y=38.3, name="BlackrockSpire", floor=7 },
    },
    [1435] = {{ x=69.9, y=53.6, name="TheTempleofAtalhakkar", floor=1 }},
    [1436] = {{ x=42.5, y=71.7, name="TheDeadmines", floor=1 }},
    [1453] = {{ x=42.3, y=59.0, name="TheStockade", floor=1 }},
    [1957] = {  -- Isle of Quel'Danas: Magisters' Terrace + Sunwell Plateau
        { x=61.2, y=30.9, name="MagistersTerrace", floor=1 },
        { x=44.3, y=45.6, name="SunwellPlateau", floor=1 },
    },
    [1434] = {{ x=52.2, y=17.4, name="ZulGurub", floor=1 }},           -- Stranglethorn Vale
    [1445] = {{ x=52.6, y=76.8, name="OnyxiasLair", floor=1 }},        -- Dustwallow Marsh
    [1430] = {{ x=46.9, y=74.4, name="Karazhan", floor=1 }},           -- Deadwind Pass
    [1942] = {{ x=35.8, y=37.1, name="ZulAman", floor=1 }},            -- Ghostlands

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
    [1451] = {  -- Silithus: AQ20 + AQ40
        { x=36.4, y=93.6, name="RuinsofAhnQiraj", floor=1 },
        { x=29.1, y=92.4, name="AhnQiraj", floor=1 },
    },
    [1446] = {  -- Tanaris: Zul'Farrak + Caverns of Time
        { x=38.7, y=20.0, name="ZulFarrak", floor=1 },
        { x=65.4, y=49.3, name="CoTHillsbradFoothills", floor=1 },
        { x=66.2, y=49.3, name="CoTTheBlackMorass", floor=1 },
        { x=67.0, y=49.3, name="CoTMountHyjal", floor=1 },
    },
    [1454] = {{ x=52.6, y=49.0, name="Ragefire", floor=1 }},

    -- Outland (TBC)
    [1944] = {  -- Hellfire Peninsula: 3 dungeons + Magtheridon's Lair
        { x=47.7, y=53.6, name="HellfireRamparts", floor=1 },
        { x=47.7, y=52.0, name="TheShatteredHalls", floor=1 },
        { x=46.0, y=51.8, name="TheBloodFurnace", floor=1 },
        { x=46.8, y=52.8, name="MagtheridonsLair", floor=1 },
    },
    [1952] = {  -- Terokkar Forest: 4 dungeons
        { x=39.7, y=60.2, name="ManaTombs", floor=1 },
        { x=36.1, y=65.6, name="AuchenaiCrypts", floor=1 },
        { x=43.2, y=65.6, name="SethekkHalls", floor=1 },
        { x=39.6, y=71.0, name="ShadowLabyrinth", floor=1 },
    },
    [1953] = {  -- Netherstorm: 3 dungeons + The Eye
        { x=71.7, y=55.0, name="TheBotanica", floor=1 },
        { x=74.4, y=57.7, name="TheArcatraz", floor=1 },
        { x=70.6, y=69.7, name="TheMechanar", floor=1 },
        { x=73.7, y=63.7, name="TempestKeep", floor=1 },
    },
    [1946] = {  -- Zangarmarsh: Coilfang dungeons + SSC
        { x=49.5, y=40.2, name="TheSlavePens", floor=1 },
        { x=50.3, y=40.9, name="TheUnderbog", floor=1 },
        { x=51.1, y=40.2, name="TheSteamvault", floor=1 },
        { x=50.3, y=41.7, name="CoilfangReservoir", floor=1 },
    },
    [1948] = {{ x=71.0, y=46.4, name="BlackTemple", floor=1 }},        -- Shadowmoon Valley
    [1949] = {{ x=68.7, y=24.0, name="GruulsLair", floor=1 }},         -- Blade's Edge Mountains
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

-- Boss markers that open AtlasLoot at the boss loot page.
-- Indexed by instanceMapID (same key as SDM_DungeonByMapID, from
-- select(8, GetInstanceInfo())).
--   atlasModule = AtlasLoot module name (= addon folder name)
--   bosses      = { { name, x, y, floor, atlasKey, atlasBossIndex }, ... }
--   atlasKey is per-boss (one instanceMapID can span several AtlasLoot
--   keys, e.g. Scarlet Monastery / Dire Maul wings).
-- Coords are placeholder grid positions; fine-tune in-game via /sdm calib
-- (drag a skull; the override is saved to SDM_Settings.bossPinOverrides).
SDM_DungeonBosses = {
    [33] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Rethilgore", 12.0, 10.0, 1, "ShadowfangKeep", 1 },
            { "Fel Steed / Shadow Charger", 37.3, 10.0, 1, "ShadowfangKeep", 2 },
            { "Razorclaw the Butcher", 62.7, 10.0, 1, "ShadowfangKeep", 3 },
            { "Baron Silverlaine", 88.0, 10.0, 1, "ShadowfangKeep", 4 },
            { "Commander Springvale", 12.0, 36.7, 1, "ShadowfangKeep", 5 },
            { "Odo the Blindwatcher", 37.3, 36.7, 1, "ShadowfangKeep", 6 },
            { "Deathsworn Captain", 62.7, 36.7, 1, "ShadowfangKeep", 7 },
            { "Arugal's Voidwalker", 88.0, 36.7, 1, "ShadowfangKeep", 8 },
            { "Fenrus the Devourer", 12.0, 63.3, 1, "ShadowfangKeep", 9 },
            { "Wolf Master Nandos", 37.3, 63.3, 1, "ShadowfangKeep", 10 },
            { "Archmage Arugal", 62.7, 63.3, 1, "ShadowfangKeep", 11 },
            { "Sever", 88.0, 63.3, 1, "ShadowfangKeep", 13 },
            { "Apothecary Hummel <Crown Chemical Co.>", 12.0, 90.0, 1, "ShadowfangKeep", 15 },
            { "Jordan's Smithing Hammer", 37.3, 90.0, 1, "ShadowfangKeep", 16 },
            { "The Book of Ur", 62.7, 90.0, 1, "ShadowfangKeep", 17 },
        },
    },
    [34] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Kam Deepfury", 12.0, 50, 1, "TheStockade", 1 },
            { "Bruegal Ironknuckle", 88.0, 50, 1, "TheStockade", 2 },
        },
    },
    [36] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Rhahk'Zor", 35.5, 53.5, 1, "TheDeadmines", 1 },
            { "Miner Johnson", 49.2, 75.4, 1, "TheDeadmines", 2 },
            { "Sneed", 12.3, 65.6, 2, "TheDeadmines", 3 },
            { "Sneed's Shredder", 14.2, 67.8, 2, "TheDeadmines", 4 },
            { "Gilnid", 55, 39.3, 2, "TheDeadmines", 5 },
            { "Mr. Smite", 59.2, 32.6, 2, "TheDeadmines", 6 },
            { "Captain Greenskin", 59.3, 39, 2, "TheDeadmines", 7 },
            { "Edwin VanCleef", 62.7, 38.8, 2, "TheDeadmines", 8 },
        },
    },
    [43] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Lord Cobrahn", 12.0, 10.0, 1, "WailingCaverns", 1 },
            { "Lady Anacondra", 50.0, 10.0, 1, "WailingCaverns", 2 },
            { "Kresh", 88.0, 10.0, 1, "WailingCaverns", 3 },
            { "Lord Pythas", 12.0, 50.0, 1, "WailingCaverns", 4 },
            { "Skum", 50.0, 50.0, 1, "WailingCaverns", 5 },
            { "Lord Serpentis", 88.0, 50.0, 1, "WailingCaverns", 6 },
            { "Verdan the Everliving", 12.0, 90.0, 1, "WailingCaverns", 7 },
            { "Mutanus the Devourer", 50.0, 90.0, 1, "WailingCaverns", 8 },
            { "Deviate Faerie Dragon", 88.0, 90.0, 1, "WailingCaverns", 9 },
        },
    },
    [47] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Aggem Thorncurse", 12.0, 10.0, 1, "RazorfenKraul", 1 },
            { "Death Speaker Jargba", 50.0, 10.0, 1, "RazorfenKraul", 2 },
            { "Overlord Ramtusk", 88.0, 10.0, 1, "RazorfenKraul", 3 },
            { "Razorfen Spearhide", 12.0, 50.0, 1, "RazorfenKraul", 4 },
            { "Agathelos the Raging", 50.0, 50.0, 1, "RazorfenKraul", 5 },
            { "Blind Hunter", 88.0, 50.0, 1, "RazorfenKraul", 6 },
            { "Charlga Razorflank", 12.0, 90.0, 1, "RazorfenKraul", 7 },
            { "Earthcaller Halmgar", 50.0, 90.0, 1, "RazorfenKraul", 8 },
        },
    },
    [48] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Ghamoo-ra", 12.0, 10.0, 1, "BlackfathomDeeps", 1 },
            { "Lady Sarevess", 50.0, 10.0, 1, "BlackfathomDeeps", 2 },
            { "Gelihast", 88.0, 10.0, 1, "BlackfathomDeeps", 3 },
            { "Baron Aquanis", 12.0, 50.0, 1, "BlackfathomDeeps", 4 },
            { "Twilight Lord Kelris", 50.0, 50.0, 1, "BlackfathomDeeps", 5 },
            { "Old Serra'kis", 88.0, 50.0, 1, "BlackfathomDeeps", 6 },
            { "Aku'mai", 12.0, 90.0, 1, "BlackfathomDeeps", 7 },
        },
    },
    [70] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Eric \\\"The Swift\\\"", 12.0, 10.0, 1, "Uldaman", 1 },
            { "Baelog", 37.3, 10.0, 1, "Uldaman", 2 },
            { "Olaf", 62.7, 10.0, 1, "Uldaman", 3 },
            { "Revelosh", 88.0, 10.0, 1, "Uldaman", 4 },
            { "Ironaya", 12.0, 36.7, 1, "Uldaman", 5 },
            { "Obsidian Sentinel", 37.3, 36.7, 1, "Uldaman", 6 },
            { "Ancient Stone Keeper", 62.7, 36.7, 1, "Uldaman", 7 },
            { "Galgann Firehammer", 88.0, 36.7, 1, "Uldaman", 8 },
            { "Grimlok", 12.0, 63.3, 1, "Uldaman", 9 },
            { "Archaedas", 37.3, 63.3, 1, "Uldaman", 10 },
            { "Baelog's Chest", 62.7, 63.3, 1, "Uldaman", 12 },
            { "Conspicuous Urn", 88.0, 63.3, 1, "Uldaman", 13 },
            { "Shadowforge Cache", 12.0, 90.0, 1, "Uldaman", 14 },
            { "Tablet of Will", 37.3, 90.0, 1, "Uldaman", 15 },
        },
    },
    [90] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Techbot", 12.0, 10.0, 1, "Gnomeregan", 1 },
            { "Grubbis", 50.0, 10.0, 1, "Gnomeregan", 2 },
            { "Viscous Fallout", 88.0, 10.0, 1, "Gnomeregan", 3 },
            { "Electrocutioner 6000", 12.0, 50.0, 1, "Gnomeregan", 4 },
            { "Crowd Pummeler 9-60", 50.0, 50.0, 1, "Gnomeregan", 5 },
            { "Dark Iron Ambassador", 88.0, 50.0, 1, "Gnomeregan", 6 },
            { "Mekgineer Thermaplugg", 12.0, 90.0, 1, "Gnomeregan", 7 },
        },
    },
    [109] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Balcony Minibosses", 12.0, 10.0, 1, "TheTempleOfAtal'Hakkar", 1 },
            { "Atal'alarion", 37.3, 10.0, 1, "TheTempleOfAtal'Hakkar", 2 },
            { "Spawn of Hakkar", 62.7, 10.0, 1, "TheTempleOfAtal'Hakkar", 3 },
            { "Avatar of Hakkar", 88.0, 10.0, 1, "TheTempleOfAtal'Hakkar", 4 },
            { "Jammal'an the Prophet", 12.0, 50.0, 1, "TheTempleOfAtal'Hakkar", 5 },
            { "Ogom the Wretched", 37.3, 50.0, 1, "TheTempleOfAtal'Hakkar", 6 },
            { "Dreamscythe", 62.7, 50.0, 1, "TheTempleOfAtal'Hakkar", 7 },
            { "Weaver", 88.0, 50.0, 1, "TheTempleOfAtal'Hakkar", 8 },
            { "Hazzas", 12.0, 90.0, 1, "TheTempleOfAtal'Hakkar", 9 },
            { "Morphaz", 37.3, 90.0, 1, "TheTempleOfAtal'Hakkar", 10 },
            { "Shade of Eranikus", 62.7, 90.0, 1, "TheTempleOfAtal'Hakkar", 11 },
        },
    },
    [129] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Tuten'kash", 12.0, 10.0, 1, "RazorfenDowns", 1 },
            { "Mordresh Fire Eye", 50.0, 10.0, 1, "RazorfenDowns", 2 },
            { "Glutton", 88.0, 10.0, 1, "RazorfenDowns", 3 },
            { "Ragglesnout", 12.0, 50.0, 1, "RazorfenDowns", 4 },
            { "Amnennar the Coldbringer", 50.0, 50.0, 1, "RazorfenDowns", 5 },
            { "Plaguemaw the Rotting", 88.0, 50.0, 1, "RazorfenDowns", 6 },
            { "Lady Falther'ess", 12.0, 90.0, 1, "RazorfenDowns", 8 },
            { "Henry Stern", 50.0, 90.0, 1, "RazorfenDowns", 9 },
        },
    },
    [189] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Azshir the Sleepless", 12.0, 10.0, 1, "ScarletMonasteryGraveyard", 2 },
            { "Fallen Champion", 37.3, 10.0, 1, "ScarletMonasteryGraveyard", 3 },
            { "Ironspine", 62.7, 10.0, 1, "ScarletMonasteryGraveyard", 4 },
            { "Bloodmage Thalnos", 88.0, 10.0, 1, "ScarletMonasteryGraveyard", 5 },
            { "Scorn", 12.0, 50.0, 1, "ScarletMonasteryGraveyard", 7 },
            { "Headless Horseman", 37.3, 50.0, 1, "ScarletMonasteryGraveyard", 9 },
            { "Arcanist Doan", 62.7, 50.0, 1, "ScarletMonasteryLibrary", 2 },
            { "Doan's Strongbox", 88.0, 50.0, 1, "ScarletMonasteryLibrary", 4 },
            { "Scarlet Commander Mograine", 12.0, 90.0, 1, "ScarletMonasteryCathedral", 2 },
            { "High Inquisitor Whitemane", 37.3, 90.0, 1, "ScarletMonasteryCathedral", 3 },
        },
    },
    [209] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Antu'sul", 12.0, 10.0, 1, "Zul'Farrak", 1 },
            { "Theka the Martyr", 37.3, 10.0, 1, "Zul'Farrak", 2 },
            { "Sandarr Dunereaver", 62.7, 10.0, 1, "Zul'Farrak", 3 },
            { "Witch Doctor Zum'rah", 88.0, 10.0, 1, "Zul'Farrak", 4 },
            { "Nekrum Gutchewer", 12.0, 36.7, 1, "Zul'Farrak", 5 },
            { "Shadowpriest Sezz'ziz", 37.3, 36.7, 1, "Zul'Farrak", 6 },
            { "Dustwraith", 62.7, 36.7, 1, "Zul'Farrak", 7 },
            { "Sandfury Executioner", 88.0, 36.7, 1, "Zul'Farrak", 8 },
            { "Sergeant Bly", 12.0, 63.3, 1, "Zul'Farrak", 9 },
            { "Hydromancer Velratha", 37.3, 63.3, 1, "Zul'Farrak", 10 },
            { "Gahz'rilla", 62.7, 63.3, 1, "Zul'Farrak", 11 },
            { "Chief Ukorz Sandscalp", 88.0, 63.3, 1, "Zul'Farrak", 12 },
            { "Zerillis", 12.0, 90.0, 1, "Zul'Farrak", 13 },
        },
    },
    [229] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Burning Felguard", 12.0, 10.0, 1, "LowerBlackrockSpire", 1 },
            { "Spirestone Butcher", 27.2, 10.0, 1, "LowerBlackrockSpire", 2 },
            { "Highlord Omokk", 42.4, 10.0, 1, "LowerBlackrockSpire", 3 },
            { "Spirestone Battle Lord", 57.6, 10.0, 1, "LowerBlackrockSpire", 4 },
            { "Spirestone Lord Magus", 72.8, 10.0, 1, "LowerBlackrockSpire", 5 },
            { "Shadow Hunter Vosh'gajin", 88.0, 10.0, 1, "LowerBlackrockSpire", 6 },
            { "War Master Voone", 12.0, 30.0, 1, "LowerBlackrockSpire", 7 },
            { "Bannok Grimaxe", 27.2, 30.0, 1, "LowerBlackrockSpire", 8 },
            { "Mother Smolderweb", 42.4, 30.0, 1, "LowerBlackrockSpire", 9 },
            { "Crystal Fang", 57.6, 30.0, 1, "LowerBlackrockSpire", 10 },
            { "Urok Doomhowl", 72.8, 30.0, 1, "LowerBlackrockSpire", 11 },
            { "Quartermaster Zigris", 88.0, 30.0, 1, "LowerBlackrockSpire", 12 },
            { "Halycon", 12.0, 50.0, 1, "LowerBlackrockSpire", 13 },
            { "Gizrul the Slavener", 27.2, 50.0, 1, "LowerBlackrockSpire", 14 },
            { "Ghok Bashguud", 42.4, 50.0, 1, "LowerBlackrockSpire", 15 },
            { "Overlord Wyrmthalak", 57.6, 50.0, 1, "LowerBlackrockSpire", 16 },
            { "Mor Grayhoof", 72.8, 50.0, 1, "LowerBlackrockSpire", 18 },
            { "Pyroguard Emberseer", 88.0, 50.0, 1, "UpperBlackrockSpire", 1 },
            { "Solakar Flamewreath", 12.0, 70.0, 1, "UpperBlackrockSpire", 2 },
            { "Jed Runewatcher", 27.2, 70.0, 1, "UpperBlackrockSpire", 3 },
            { "Goraluk Anvilcrack ", 42.4, 70.0, 1, "UpperBlackrockSpire", 4 },
            { "Gyth", 57.6, 70.0, 1, "UpperBlackrockSpire", 5 },
            { "Warchief Rend Blackhand", 72.8, 70.0, 1, "UpperBlackrockSpire", 6 },
            { "The Beast", 88.0, 70.0, 1, "UpperBlackrockSpire", 7 },
            { "General Drakkisath", 12.0, 90.0, 1, "UpperBlackrockSpire", 8 },
            { "Darkstone Tablet", 27.2, 90.0, 1, "UpperBlackrockSpire", 10 },
            { "Lord Valthalak", 42.4, 90.0, 1, "UpperBlackrockSpire", 11 },
        },
    },
    [230] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Lord Roccor", 12.0, 10.0, 1, "BlackrockDepths", 1 },
            { "High Interrogator Gerstahn ", 27.2, 10.0, 1, "BlackrockDepths", 2 },
            { "Houndmaster Grebmar", 42.4, 10.0, 1, "BlackrockDepths", 3 },
            { "Grizzle", 57.6, 10.0, 1, "BlackrockDepths", 5 },
            { "Eviscerator", 72.8, 10.0, 1, "BlackrockDepths", 6 },
            { "Ok'thor the Breaker", 88.0, 10.0, 1, "BlackrockDepths", 7 },
            { "Anub'shiah", 12.0, 30.0, 1, "BlackrockDepths", 8 },
            { "Hedrum the Creeper", 27.2, 30.0, 1, "BlackrockDepths", 9 },
            { "Dark Coffer", 42.4, 30.0, 1, "BlackrockDepths", 11 },
            { "Warder Stilgiss", 57.6, 30.0, 1, "BlackrockDepths", 12 },
            { "Verek", 72.8, 30.0, 1, "BlackrockDepths", 13 },
            { "Watchman Doomgrip", 88.0, 30.0, 1, "BlackrockDepths", 14 },
            { "Fineous Darkvire", 12.0, 50.0, 1, "BlackrockDepths", 15 },
            { "Lord Incendius", 27.2, 50.0, 1, "BlackrockDepths", 16 },
            { "Bael'Gar", 42.4, 50.0, 1, "BlackrockDepths", 17 },
            { "General Angerforge", 57.6, 50.0, 1, "BlackrockDepths", 18 },
            { "Golem Lord Argelmach", 72.8, 50.0, 1, "BlackrockDepths", 19 },
            { "Guzzler", 88.0, 50.0, 1, "BlackrockDepths", 20 },
            { "Phalanx", 12.0, 70.0, 1, "BlackrockDepths", 21 },
            { "Ambassador Flamelash", 27.2, 70.0, 1, "BlackrockDepths", 22 },
            { "Panzor the Invincible", 42.4, 70.0, 1, "BlackrockDepths", 23 },
            { "Chest of The Seven", 57.6, 70.0, 1, "BlackrockDepths", 24 },
            { "Magmus", 72.8, 70.0, 1, "BlackrockDepths", 25 },
            { "Princess Moira Bronzebeard ", 88.0, 70.0, 1, "BlackrockDepths", 26 },
            { "Emperor Dagran Thaurissan", 12.0, 90.0, 1, "BlackrockDepths", 27 },
            { "Plans", 27.2, 90.0, 1, "BlackrockDepths", 29 },
            { "Theldren", 42.4, 90.0, 1, "BlackrockDepths", 30 },
            { "Coren Direbrew", 57.6, 90.0, 1, "BlackrockDepths", 32 },
        },
    },
    [249] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Onyxia", 50, 50, 1, "Onyxia", 1 },
        },
    },
    [269] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Chrono Lord Deja", 12.0, 10.0, 1, "TheBlackMorass", 1 },
            { "Temporus", 88.0, 10.0, 1, "TheBlackMorass", 2 },
            { "Aeonus", 12.0, 90.0, 1, "TheBlackMorass", 3 },
        },
    },
    [289] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Blood Steward of Kirtonos", 12.0, 10.0, 1, "Scholomance", 1 },
            { "Kirtonos the Herald", 31.0, 10.0, 1, "Scholomance", 2 },
            { "Jandice Barov", 50.0, 10.0, 1, "Scholomance", 3 },
            { "Rattlegore", 69.0, 10.0, 1, "Scholomance", 4 },
            { "Death Knight Darkreaver", 88.0, 10.0, 1, "Scholomance", 5 },
            { "Marduk Blackpool", 12.0, 36.7, 1, "Scholomance", 6 },
            { "Vectus", 31.0, 36.7, 1, "Scholomance", 7 },
            { "Ras Frostwhisper", 50.0, 36.7, 1, "Scholomance", 8 },
            { "Instructor Malicia", 69.0, 36.7, 1, "Scholomance", 9 },
            { "Doctor Theolen Krastinov", 88.0, 36.7, 1, "Scholomance", 10 },
            { "Lorekeeper Polkelt", 12.0, 63.3, 1, "Scholomance", 11 },
            { "The Ravenian", 31.0, 63.3, 1, "Scholomance", 12 },
            { "Lord Alexei Barov", 50.0, 63.3, 1, "Scholomance", 13 },
            { "Lady Illucia Barov", 69.0, 63.3, 1, "Scholomance", 14 },
            { "Darkmaster Gandling", 88.0, 63.3, 1, "Scholomance", 15 },
            { "Lord Blackwood", 12.0, 90.0, 1, "Scholomance", 17 },
            { "Kormok", 31.0, 90.0, 1, "Scholomance", 18 },
        },
    },
    [309] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "High Priestess Jeklik", 12.0, 10.0, 1, "Zul'Gurub", 1 },
            { "High Priest Venoxis", 31.0, 10.0, 1, "Zul'Gurub", 2 },
            { "High Priestess Mar'li", 50.0, 10.0, 1, "Zul'Gurub", 3 },
            { "Bloodlord Mandokir", 69.0, 10.0, 1, "Zul'Gurub", 4 },
            { "Gri'lek", 88.0, 10.0, 1, "Zul'Gurub", 5 },
            { "Hazza'rah", 12.0, 36.7, 1, "Zul'Gurub", 6 },
            { "Renataki", 31.0, 36.7, 1, "Zul'Gurub", 7 },
            { "Wushoolay", 50.0, 36.7, 1, "Zul'Gurub", 8 },
            { "Gahz'ranka", 69.0, 36.7, 1, "Zul'Gurub", 9 },
            { "High Priest Thekal", 88.0, 36.7, 1, "Zul'Gurub", 10 },
            { "High Priestess Arlokk", 12.0, 63.3, 1, "Zul'Gurub", 11 },
            { "Jin'do the Hexxer", 31.0, 63.3, 1, "Zul'Gurub", 12 },
            { "Hakkar", 50.0, 63.3, 1, "Zul'Gurub", 13 },
            { "High Priest Shared loot", 69.0, 63.3, 1, "Zul'Gurub", 14 },
            { "Enchants", 88.0, 63.3, 1, "Zul'Gurub", 16 },
            { "Muddy Churning Waters", 12.0, 90.0, 1, "Zul'Gurub", 17 },
            { "Jinxed Hoodoo Pile", 31.0, 90.0, 1, "Zul'Gurub", 18 },
        },
    },
    [329] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Skul", 12.0, 10.0, 1, "Stratholme", 1 },
            { "Stratholme Courier", 31.0, 10.0, 1, "Stratholme", 2 },
            { "Hearthsinger Forresten", 50.0, 10.0, 1, "Stratholme", 3 },
            { "The Unforgiven", 69.0, 10.0, 1, "Stratholme", 4 },
            { "Postmaster Malown", 88.0, 10.0, 1, "Stratholme", 5 },
            { "Timmy the Cruel", 12.0, 30.0, 1, "Stratholme", 6 },
            { "Malor the Zealous", 31.0, 30.0, 1, "Stratholme", 7 },
            { "Crimson Hammersmith", 50.0, 30.0, 1, "Stratholme", 8 },
            { "Cannon Master Willey", 69.0, 30.0, 1, "Stratholme", 9 },
            { "Archivist Galford", 88.0, 30.0, 1, "Stratholme", 10 },
            { "Balnazzar", 12.0, 50.0, 1, "Stratholme", 11 },
            { "Magistrate Barthilas", 31.0, 50.0, 1, "Stratholme", 12 },
            { "Stonespine", 50.0, 50.0, 1, "Stratholme", 13 },
            { "Baroness Anastari", 69.0, 50.0, 1, "Stratholme", 14 },
            { "Black Guard Swordsmith", 88.0, 50.0, 1, "Stratholme", 15 },
            { "Nerub'enkan", 12.0, 70.0, 1, "Stratholme", 16 },
            { "Maleki the Pallid", 31.0, 70.0, 1, "Stratholme", 17 },
            { "Ramstein the Gorger", 50.0, 70.0, 1, "Stratholme", 18 },
            { "Baron Rivendare", 69.0, 70.0, 1, "Stratholme", 19 },
            { "Plans", 88.0, 70.0, 1, "Stratholme", 21 },
            { "Atiesh", 12.0, 90.0, 1, "Stratholme", 22 },
            { "Balzaphon", 31.0, 90.0, 1, "Stratholme", 23 },
            { "Sothos and Jarien's Heirlooms", 50.0, 90.0, 1, "Stratholme", 24 },
        },
    },
    [349] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Veng", 12.0, 10.0, 1, "Maraudon", 1 },
            { "Noxxion", 37.3, 10.0, 1, "Maraudon", 2 },
            { "Razorlash", 62.7, 10.0, 1, "Maraudon", 3 },
            { "Maraudos", 88.0, 10.0, 1, "Maraudon", 4 },
            { "Lord Vyletongue", 12.0, 36.7, 1, "Maraudon", 5 },
            { "Meshlok the Harvester", 37.3, 36.7, 1, "Maraudon", 6 },
            { "Celebras the Cursed", 62.7, 36.7, 1, "Maraudon", 7 },
            { "Landslide", 88.0, 36.7, 1, "Maraudon", 8 },
            { "Tinkerer Gizlock", 12.0, 63.3, 1, "Maraudon", 9 },
            { "Rotgrip", 37.3, 63.3, 1, "Maraudon", 10 },
            { "Princess Theradras", 62.7, 63.3, 1, "Maraudon", 11 },
            { "The Nameless Prophet", 88.0, 63.3, 1, "Maraudon", 12 },
            { "Kolk", 12.0, 90.0, 1, "Maraudon", 13 },
            { "Gelk", 37.3, 90.0, 1, "Maraudon", 14 },
            { "Magra", 62.7, 90.0, 1, "Maraudon", 15 },
        },
    },
    [389] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Taragaman the Hungerer", 68, 56.4, 1, "Ragefire", 1 },
            { "Jergosh the Invoker", 52.8, 25.4, 1, "Ragefire", 2 },
        },
    },
    [409] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Lucifron", 12.0, 10.0, 1, "MoltenCore", 1 },
            { "Magmadar", 37.3, 10.0, 1, "MoltenCore", 2 },
            { "Gehennas", 62.7, 10.0, 1, "MoltenCore", 3 },
            { "Garr", 88.0, 10.0, 1, "MoltenCore", 4 },
            { "Shazzrah", 12.0, 50.0, 1, "MoltenCore", 5 },
            { "Baron Geddon", 37.3, 50.0, 1, "MoltenCore", 6 },
            { "Golemagg the Incinerator", 62.7, 50.0, 1, "MoltenCore", 7 },
            { "Sulfuron Harbinger", 88.0, 50.0, 1, "MoltenCore", 8 },
            { "Majordomo Executus", 12.0, 90.0, 1, "MoltenCore", 9 },
            { "Ragnaros", 37.3, 90.0, 1, "MoltenCore", 10 },
            { "All bosses", 62.7, 90.0, 1, "MoltenCore", 11 },
        },
    },
    [429] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Pusillin", 12.0, 10.0, 1, "DireMaulEast", 1 },
            { "Zevrim Thornhoof", 31.0, 10.0, 1, "DireMaulEast", 2 },
            { "Hydrospawn", 50.0, 10.0, 1, "DireMaulEast", 3 },
            { "Lethtendris", 69.0, 10.0, 1, "DireMaulEast", 4 },
            { "Alzzin the Wildshaper", 88.0, 10.0, 1, "DireMaulEast", 5 },
            { "Isalien", 12.0, 30.0, 1, "DireMaulEast", 7 },
            { "Tendris Warpwood", 31.0, 30.0, 1, "DireMaulWest", 1 },
            { "Illyanna Ravenoak", 50.0, 30.0, 1, "DireMaulWest", 2 },
            { "Magister Kalendris", 69.0, 30.0, 1, "DireMaulWest", 3 },
            { "Tsu'zee", 88.0, 30.0, 1, "DireMaulWest", 4 },
            { "Immol'thar", 12.0, 50.0, 1, "DireMaulWest", 5 },
            { "Prince Tortheldrin", 31.0, 50.0, 1, "DireMaulWest", 6 },
            { "Revanchion", 50.0, 50.0, 1, "DireMaulWest", 8 },
            { "Shen'dralar Provisioner", 69.0, 50.0, 1, "DireMaulWest", 9 },
            { "Lord Hel'nurath", 88.0, 50.0, 1, "DireMaulWest", 10 },
            { "Guard Mol'dar", 12.0, 70.0, 1, "DireMaulNorth", 1 },
            { "Stomper Kreeg", 31.0, 70.0, 1, "DireMaulNorth", 2 },
            { "Guard Fengus", 50.0, 70.0, 1, "DireMaulNorth", 3 },
            { "Guard Slip'kik", 69.0, 70.0, 1, "DireMaulNorth", 4 },
            { "Knot Thimblejack's Cache", 88.0, 70.0, 1, "DireMaulNorth", 5 },
            { "Captain Kromcrush", 12.0, 90.0, 1, "DireMaulNorth", 6 },
            { "Cho'Rush the Observer", 31.0, 90.0, 1, "DireMaulNorth", 7 },
            { "King Gordok", 50.0, 90.0, 1, "DireMaulNorth", 8 },
            { "Tribute", 69.0, 90.0, 1, "DireMaulNorth", 9 },
        },
    },
    [469] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Razorgore the Untamed", 12.0, 10.0, 1, "BlackwingLair", 1 },
            { "Vaelastrasz the Corrupt", 50.0, 10.0, 1, "BlackwingLair", 2 },
            { "Broodlord Lashlayer", 88.0, 10.0, 1, "BlackwingLair", 3 },
            { "Firemaw", 12.0, 50.0, 1, "BlackwingLair", 4 },
            { "Ebonroc", 50.0, 50.0, 1, "BlackwingLair", 5 },
            { "Flamegor", 88.0, 50.0, 1, "BlackwingLair", 6 },
            { "Chromaggus", 12.0, 90.0, 1, "BlackwingLair", 7 },
            { "Nefarian", 50.0, 90.0, 1, "BlackwingLair", 8 },
        },
    },
    [509] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Kurinnaxx", 12.0, 10.0, 1, "TheRuinsofAhnQiraj", 1 },
            { "General Rajaxx", 50.0, 10.0, 1, "TheRuinsofAhnQiraj", 2 },
            { "Moam", 88.0, 10.0, 1, "TheRuinsofAhnQiraj", 3 },
            { "Buru the Gorger", 12.0, 50.0, 1, "TheRuinsofAhnQiraj", 4 },
            { "Ayamiss the Hunter", 50.0, 50.0, 1, "TheRuinsofAhnQiraj", 5 },
            { "Ossirian the Unscarred", 88.0, 50.0, 1, "TheRuinsofAhnQiraj", 6 },
            { "Class books", 12.0, 90.0, 1, "TheRuinsofAhnQiraj", 8 },
        },
    },
    [531] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "The Prophet Skeram", 12.0, 10.0, 1, "TheTempleofAhnQiraj", 1 },
            { "Bug Trio", 50.0, 10.0, 1, "TheTempleofAhnQiraj", 2 },
            { "Battleguard Sartura", 88.0, 10.0, 1, "TheTempleofAhnQiraj", 3 },
            { "Fankriss the Unyielding", 12.0, 50.0, 1, "TheTempleofAhnQiraj", 4 },
            { "Viscidus", 50.0, 50.0, 1, "TheTempleofAhnQiraj", 5 },
            { "Princess Huhuran", 88.0, 50.0, 1, "TheTempleofAhnQiraj", 6 },
            { "Twin Emperors", 12.0, 90.0, 1, "TheTempleofAhnQiraj", 7 },
            { "Ouro", 50.0, 90.0, 1, "TheTempleofAhnQiraj", 8 },
            { "C'Thun", 88.0, 90.0, 1, "TheTempleofAhnQiraj", 9 },
        },
    },
    [532] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Attumen the Huntsman", 44.4, 71.6, 1, "Karazhan", 1 },
            { "Moroes", 26.4, 55.2, 3, "Karazhan", 5 },
            { "Maiden of Virtue", 81.6, 43.2, 4, "Karazhan", 6 },
            { "The Wizard of Oz", 16, 28, 4, "Karazhan", 7 },
            { "The Big Bad Wolf", 18.8, 28, 4, "Karazhan", 8 },
            { "Romulo and Julianne", 17.5, 32.6, 4, "Karazhan", 9 },
            { "The Curator", 48.4, 31.7, 9, "Karazhan", 10 },
            { "Terestian Illhoof", 51.4, 60.5, 11, "Karazhan", 11 },
            { "Shade of Aran", 70, 22.8, 10, "Karazhan", 12 },
            { "Netherspite", 35.4, 36.3, 13, "Karazhan", 13 },
            { "Chess Event", 35.4, 53.9, 14, "Karazhan", 14 },
            { "Prince Malchezaar", 50.4, 27.2, 17, "Karazhan", 15 },
            { "Nightbane", 46, 79.7, 6, "Karazhan", 16 },
        },
    },
    [534] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Rage Winterchill", 12.0, 10.0, 1, "HyjalSummit", 1 },
            { "Anetheron", 50.0, 10.0, 1, "HyjalSummit", 2 },
            { "Kaz'rogal", 88.0, 10.0, 1, "HyjalSummit", 3 },
            { "Azgalor", 12.0, 90.0, 1, "HyjalSummit", 4 },
            { "Archimonde", 50.0, 90.0, 1, "HyjalSummit", 5 },
        },
    },
    [540] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Grand Warlock Nethekurse", 32.5, 53.9, 1, "TheShatteredHalls", 1 },
            { "Blood Guard Porung", 29, 13.1, 1, "TheShatteredHalls", 2 },
            { "Warbringer O'mrogg", 52.6, 29.7, 1, "TheShatteredHalls", 3 },
            { "Warchief Kargath Bladefist", 65.9, 47.5, 1, "TheShatteredHalls", 4 },
        },
    },
    [542] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "The Maker", 37.6, 36.2, 1, "TheBloodFurnace", 1 },
            { "Broggok", 42.1, 18.6, 1, "TheBloodFurnace", 2 },
            { "Keli'dan the Breaker", 57.2, 35.8, 1, "TheBloodFurnace", 3 },
        },
    },
    [543] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            -- coords calibrated in-game via /sdm calib
            { "Watchkeeper Gargolmar", 34.7, 72,   1, "HellfireRamparts", 1 },
            { "Omor the Unscarred",    38.1, 17.9, 1, "HellfireRamparts", 2 },
            { "Nazan & Vazruden",      71.6, 27.4, 1, "HellfireRamparts", 3 },
        },
    },
    [544] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Magtheridon", 67.4, 64.6, 1, "MagtheridonsLair", 1 },
        },
    },
    [545] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Hydromancer Thespia", 53.1, 11.7, 1, "TheSteamvault", 1 },
            { "Mekgineer Steamrigger", 33.2, 71.5, 1, "TheSteamvault", 2 },
            { "Warlord Kalithresh", 74.6, 38.1, 1, "TheSteamvault", 3 },
        },
    },
    [546] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Hungarfen", 67.7, 78.4, 1, "TheUnderbog", 1 },
            { "Ghaz'an", 76.8, 24.7, 1, "TheUnderbog", 2 },
            { "Swamplord Musel'ek", 40.6, 21.5, 1, "TheUnderbog", 3 },
            { "The Black Stalker", 24.2, 39.7, 1, "TheUnderbog", 4 },
        },
    },
    [547] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Mennu the Betrayer", 47.8, 23.2, 1, "TheSlavePens", 1 },
            { "Rokmar the Crackler", 56.4, 35.2, 1, "TheSlavePens", 2 },
            { "Quagmirran", 80.1, 66.8, 1, "TheSlavePens", 3 },
            { "Ahune <The Frost Lord>", 66.7, 50.2, 1, "TheSlavePens", 5 },
        },
    },
    [548] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Hydross the Unstable", 35.6, 73.5, 1, "SerpentshrineCavern", 1 },
            { "The Lurker Below", 39, 50.8, 1, "SerpentshrineCavern", 2 },
            { "Leotheras the Blind", 40.9, 22.4, 1, "SerpentshrineCavern", 3 },
            { "Fathom-Lord Karathress", 49.2, 15.1, 1, "SerpentshrineCavern", 4 },
            { "Morogrim Tidewalker", 58.4, 22.8, 1, "SerpentshrineCavern", 5 },
            { "Lady Vashj", 70.7, 51.4, 1, "SerpentshrineCavern", 6 },
        },
    },
    [550] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Al'ar", 49, 51.1, 1, "TempestKeep", 1 },
            { "Void Reaver", 25.6, 42.7, 1, "TempestKeep", 2 },
            { "High Astromancer Solarian", 72.3, 42.6, 1, "TempestKeep", 3 },
            { "Kael'thas Sunstrider", 48.9, 12.7, 1, "TempestKeep", 4 },
        },
    },
    [552] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Zereketh the Unbound", 57.8, 20.7, 1, "TheArcatraz", 1 },
            { "Dalliah the Doomsayer", 35.4, 67.8, 2, "TheArcatraz", 2 },
            { "Wrath-Scryer Soccothrates", 19.6, 68.1, 2, "TheArcatraz", 3 },
            { "Harbinger Skyriss", 60.3, 26.4, 3, "TheArcatraz", 4 },
        },
    },
    [553] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Commander Sarannis", 43.6, 19.7, 1, "TheBotanica", 1 },
            { "High Botanist Freywinn", 23.6, 19.7, 1, "TheBotanica", 2 },
            { "Thorngrin the Tender", 6.7, 41.6, 1, "TheBotanica", 3 },
            { "Laj", 33.5, 75.4, 1, "TheBotanica", 4 },
            { "Warp Splinter", 33.4, 31.8, 1, "TheBotanica", 5 },
        },
    },
    [554] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Mechano-Lord Capacitus", 50, 27.2, 1, "TheMechanar", 1 },
            { "Nethermancer Sepethrea", 46.6, 17.1, 2, "TheMechanar", 2 },
            { "Pathaleon the Calculator", 26.6, 53.2, 2, "TheMechanar", 3 },
            { "Cache of the Legion", 37.7, 24.6, 1, "TheMechanar", 4 },
            { "Gatewatcher Gyro-Kill", 44.8, 49.8, 1, "TheMechanar", 5 },
            { "Gatewatcher Iron-Hand", 59.2, 33.5, 1, "TheMechanar", 6 },
        },
    },
    [555] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Ambassador Hellmaw", 21.4, 34.2, 1, "ShadowLabyrinth", 1 },
            { "Blackheart the Inciter", 26.3, 61.3, 1, "ShadowLabyrinth", 2 },
            { "Grandmaster Vorpil", 52.4, 46.6, 1, "ShadowLabyrinth", 3 },
            { "Murmur", 79.4, 33.9, 1, "ShadowLabyrinth", 4 },
        },
    },
    [556] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Darkweaver Syth", 47.7, 58.8, 1, "SethekkHalls", 1 },
            { "Talon King Ikiss", 31.9, 24, 2, "SethekkHalls", 2 },
            { "Anzu", 31.7, 47.4, 2, "SethekkHalls", 3 },
        },
    },
    [557] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Pandemonius", 47.1, 25.4, 1, "Mana-Tombs", 1 },
            { "Tavarok", 59.2, 64.1, 1, "Mana-Tombs", 2 },
            { "Nexus-Prince Shaffar", 31.9, 42.6, 1, "Mana-Tombs", 3 },
        },
    },
    [558] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Shirrak the Dead Watcher", 45.3, 58.3, 2, "AuchenaiCrypts", 1 },
            { "Exarch Maladaar", 72.3, 43.2, 2, "AuchenaiCrypts", 2 },
        },
    },
    [560] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Lieutenant Drake", 73.7, 57.3, 1, "OldHillsbradFoothills", 1 },
            { "Captain Skarloc", 67.8, 60, 1, "OldHillsbradFoothills", 2 },
            { "Epoch Hunter", 49.5, 27.7, 1, "OldHillsbradFoothills", 3 },
            { "Don Carlos", 48.1, 51.5, 1, "OldHillsbradFoothills", 4 },
        },
    },
    [564] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "High Warlord Naj'entus", 43, 16.3, 1, "BlackTemple", 1 },
            { "Supremus", 40.1, 77.2, 2, "BlackTemple", 2 },
            { "Shade of Akama", 52.7, 40.9, 3, "BlackTemple", 3 },
            { "Gurtogg Bloodboil", 88.0, 10.0, 1, "BlackTemple", 4 },
            { "Reliquary of the Lost", 12.0, 50.0, 1, "BlackTemple", 5 },
            { "Teron Gorefiend", 37.3, 50.0, 1, "BlackTemple", 6 },
            { "Mother Shahraz", 62.7, 50.0, 1, "BlackTemple", 7 },
            { "The Illidari Council", 88.0, 50.0, 1, "BlackTemple", 8 },
            { "Illidan Stormrage", 12.0, 90.0, 1, "BlackTemple", 9 },
            { "Patterns", 37.3, 90.0, 1, "BlackTemple", 11 },
        },
    },
    [565] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "High King Maulgar", 53.9, 50.3, 1, "GruulsLair", 1 },
            { "Gruul the Dragonkiller", 19.8, 25, 1, "GruulsLair", 2 },
        },
    },
    [568] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Akil'zon", 12.0, 10.0, 1, "ZulAman", 1 },
            { "Nalorakk", 50.0, 10.0, 1, "ZulAman", 2 },
            { "Jan'alai", 88.0, 10.0, 1, "ZulAman", 3 },
            { "Halazzi", 12.0, 50.0, 1, "ZulAman", 4 },
            { "Hex Lord Malacrass", 50.0, 50.0, 1, "ZulAman", 5 },
            { "Zul'jin", 88.0, 50.0, 1, "ZulAman", 6 },
            { "Timed Chest", 12.0, 90.0, 1, "ZulAman", 7 },
        },
    },
    [580] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Kalecgos", 12.0, 10.0, 1, "SunwellPlateau", 1 },
            { "Brutallus", 50.0, 10.0, 1, "SunwellPlateau", 2 },
            { "Felmyst", 88.0, 10.0, 1, "SunwellPlateau", 3 },
            { "Eredar Twins", 12.0, 50.0, 1, "SunwellPlateau", 4 },
            { "M'uru", 50.0, 50.0, 1, "SunwellPlateau", 5 },
            { "Kil'jaeden", 88.0, 50.0, 1, "SunwellPlateau", 6 },
            { "Patterns", 12.0, 90.0, 1, "SunwellPlateau", 7 },
        },
    },
    [585] = {
        atlasModule = "AtlasLootClassic_DungeonsAndRaids",
        bosses = {
            { "Selin Fireheart", 12.0, 10.0, 1, "MagistersTerrace", 1 },
            { "Vexallus", 88.0, 10.0, 1, "MagistersTerrace", 2 },
            { "Priestess Delrissa", 12.0, 90.0, 1, "MagistersTerrace", 3 },
            { "Kael'thas Sunstrider", 88.0, 90.0, 1, "MagistersTerrace", 4 },
        },
    },
}

-- Stair/passage markers (calibrated in-game; see /sdm stairpins + calib).
-- SDM_DungeonStairs[instanceMapID][floor][slot] = { x, y }  (slot 1=down, 2=up)
-- Empty for now; positions live in SavedVariables until baked here.
SDM_DungeonStairs = {
    [532] = {
        [1] = { [3] = { 52, 55 } },
        [3] = { [1] = { 51.6, 80.7 }, [4] = { 69.7, 32.1 } },
        [4] = { [3] = { 70.3, 38.5 }, [5] = { 23.1, 42.6 } },
        [5] = { [4] = { 41.8, 73 }, [6] = { 61.6, 17.7 } },
        [6] = { [5] = { 40, 11.8 }, [7] = { 65.5, 57.9 } },
        [7] = { [6] = { 67.1, 57.3 }, [8] = { 53.2, 52.5 } },
        [8] = { [7] = { 57.6, 48.7 }, [9] = { 52.8, 43.9 } },
        [9] = { [8] = { 61.1, 19.5 }, [10] = { 30.1, 56 } },
        [10] = { [9] = { 31.4, 53.8 }, [11] = { 35.3, 17.3 }, [12] = { 59.8, 51.2 } },
        [11] = { [10] = { 63.9, 22.9 } },
        [12] = { [10] = { 45.1, 46.7 }, [13] = { 40.3, 13.7 }, [14] = { 38.1, 21.7 } },
        [13] = { [12] = { 53.3, 69.7 } },
        [14] = { [12] = { 19.6, 71.8 }, [16] = { 81.1, 47.8 } },
        [16] = { [14] = { 67.7, 68.6 }, [17] = { 59.9, 63.6 } },
        [17] = { [16] = { 50.5, 76.1 } },
    },
    [552] = {
        [1] = { [2] = { 67, 23.6 } },
        [2] = { [1] = { 87.4, 37.8 }, [3] = { 43.9, 49.3 } },
    },
    [554] = {
        [1] = { [2] = { 41.1, 17.1 } },
        [2] = { [1] = { 41.1, 30.7 } },
    },
    [556] = {
        [1] = { [2] = { 52.4, 81.8 } },
        [2] = { [1] = { 52.2, 83 } },
    },
    [558] = {
        [1] = { [2] = { 49.5, 19.7 } },
        [2] = { [1] = { 23.9, 11.2 } },
    },
}
