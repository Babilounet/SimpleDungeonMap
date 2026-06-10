# SimpleDungeonMap

Dungeon and raid map overlay for WoW Classic Anniversary Edition — now with **boss loot pins (AtlasLoot)** and **floor-passage navigation**.

Open your World Map inside any Classic or TBC dungeon or raid and see the full instance layout as an overlay. Click a boss skull to jump straight to its loot in AtlasLoot, click a stair to change floor, and toggle Questie quest objectives. Supports 35 dungeons, 16 raids, automatic floor switching, and an in-game calibration mode.

Based on DungeonMaps 0.1c by Undeadguy, fully refactored for Anniversary Edition (Interface 20505).

### Quick Start

1.  Enter any supported dungeon or raid
2.  Open your World Map (M key)
3.  The dungeon layout appears as an overlay over the world map
4.  Click a **skull** to open that boss's loot in AtlasLoot; click a **stair arrow** to change floor
5.  Right-click the overlay to dismiss it

### Boss Loot Pins _(requires AtlasLootClassic)_

Every boss is marked with a **skull icon** on the map. **Left-click a skull** to open AtlasLoot directly on that boss's loot page — no searching, no scrolling. Works for ~50 instances with pre-calibrated boss positions (Classic + TBC dungeons and raids), including special cases like heroic-only encounters (e.g. Anzu).

Toggle with the **skull button** in the top-right corner, the options panel, or `/sdm bosspins`.

### Stair / Passage Pins

Multi-floor instances show **stair arrows** marking the passages between map pages. **Click a stair** to jump to the connected floor — handy for complex non-linear layouts like Karazhan (17 map pages). Each stair can lead to any other floor, not just the next one.

Toggle with the **arrow button** in the top-right corner, the options panel, or `/sdm stairpins`.

### Customizing Size and Position

**Three ways to adjust the overlay:**

| Method        | How                                                            |
| ------------- | -------------------------------------------------------------- |
| Drag          | Ctrl + left-click + drag on the overlay                        |
| Zoom          | Ctrl + mousewheel on the overlay                               |
| Options panel | Escape → Interface → AddOns → SimpleDungeonMap, or `/sdm options` |

The options panel has sliders for **Map size** (0.3 – 1.5), **Offset X / Y** (-600 to +600), toggles for **Quest pins**, **Boss pins** and **Stair pins**, and a **Reset** button. Settings persist between sessions.

### Floor Switching

Multi-floor instances (Scarlet Monastery, Blackrock Depths, Naxxramas, Karazhan, Black Temple, …) show numbered buttons in the top-left corner.

*   Click a button to switch floors
*   Current floor is highlighted
*   **Floors auto-switch based on your subzone** as you move through the instance
*   Click an in-map **stair pin** to follow a passage to its target floor
*   Scarlet Monastery wing is detected by player position on zone-in

### Calibration Mode

Want to fine-tune a marker or fix a passage? `/sdm calib` toggles calibration:

*   **Drag** any skull or stair to reposition it (saved automatically, per floor)
*   **Ctrl+click** a skull to remove a non-boss entry / a stair to disable it
*   **Shift+click** a skull to reset its position
*   Unplaced stairs appear in a palette next to the floor list — drag one onto the map to create a passage to that floor
*   `/sdm calib reset` clears your custom positions for the current instance; `/sdm calib dump` exports them

All customizations are saved locally and override the shipped defaults.

### Portal Click Preview _(requires Leatrix Maps)_

With Leatrix Maps installed, click any blue dungeon or raid portal icon on the World Map to preview that instance's layout — and calibrate boss/stair pins — **without entering**.

### Questie Quest Pins _(requires Questie)_

Click the **?** button in the top-right corner to toggle quest objective pins:

*   **Kill targets** (crossed swords icon)
*   **Objects to interact with** (gear icon)
*   **Loot sources** (bag icon)
*   **Turn-in NPCs** (yellow ? icon)

Pins are placed on the correct floor for multi-floor dungeons.

### Features

*   **Boss loot pins** — click a skull to open AtlasLoot on that boss (≈50 instances, pre-calibrated)
*   **Stair navigation** — click passages to move between floors, even on non-linear maps
*   **In-game calibration** — drag/disable/reset any marker, with portal-preview support
*   **Dungeon & raid overlay** — 35 dungeons + 16 raids, all Classic and TBC content
*   **Configurable size and position** — drag, Ctrl+wheel, or options panel
*   **Native options panel** — integrated into Escape → Interface → AddOns
*   **Floor switching** — buttons, subzone auto-switch, or stair pins (Karazhan = 17 pages)
*   **Portal click preview** — preview & calibrate without entering (with Leatrix Maps)
*   **Questie integration** — quest objective pins on the overlay
*   **Right-click to dismiss** — from anywhere on the overlay
*   **Localized** — English, French, German, Spanish (English fallback)
*   **Locale-independent detection** — numeric instance IDs, works with any client language

### Supported Instances

**Classic Dungeons (19):** Ragefire Chasm, Wailing Caverns, The Deadmines, Shadowfang Keep, Blackfathom Deeps, The Stockade, Gnomeregan, Razorfen Kraul, Scarlet Monastery, Razorfen Downs, Uldaman, Zul'Farrak, Maraudon, Temple of Atal'Hakkar, Blackrock Depths, Blackrock Spire, Dire Maul, Stratholme, Scholomance

**TBC Dungeons (16):** Hellfire Ramparts, The Blood Furnace, The Shattered Halls, The Slave Pens, The Underbog, The Steamvault, Mana-Tombs, Auchenai Crypts, Sethekk Halls, Shadow Labyrinth, The Mechanar, The Botanica, The Arcatraz, Old Hillsbrad Foothills, The Black Morass, Magisters' Terrace

**Classic Raids (7):** Molten Core, Onyxia's Lair, Blackwing Lair, Zul'Gurub, Ruins of Ahn'Qiraj, Ahn'Qiraj (AQ40), Naxxramas

**TBC Raids (9):** Karazhan, Gruul's Lair, Magtheridon's Lair, Serpentshrine Cavern, Tempest Keep, Mount Hyjal, Black Temple, Sunwell Plateau, Zul'Aman

### Optional Dependencies

*   **AtlasLootClassic** — enables boss loot pins (click a skull → open AtlasLoot on that boss)
*   **Leatrix Maps** — click dungeon/raid portal icons on the world map to preview instances
*   **Questie** — quest objective pins on the dungeon overlay

### Slash Commands

| Command              | Description                                   |
| -------------------- | --------------------------------------------- |
| `/sdm`               | Show current dungeon info                     |
| `/sdm options`       | Open the options panel                        |
| `/sdm bosspins`      | Toggle boss loot pins on/off                  |
| `/sdm stairpins`     | Toggle stair / passage pins on/off            |
| `/sdm questpins`     | Toggle Questie quest pins on/off              |
| `/sdm calib`         | Toggle calibration mode (drag markers)        |
| `/sdm calib dump`    | Export calibrated positions for this instance |
| `/sdm calib reset`   | Clear custom positions for this instance      |
| `/sdm probefloors`   | List detected map pages per dungeon           |
| `/sdm debug`         | Show debug info                               |
| `/sdm reset`         | Reset overlay state                           |

### Notes

*   Boss pins open AtlasLoot to the exact boss page; positions ship pre-calibrated and can be re-tuned with `/sdm calib`
*   Textures are loaded directly from the game client (CASC). No manual BLP extraction needed
*   Compatible with Leatrix Maps (uses `HookScript`, no conflicts on `WorldMapFrame`)
*   Settings persist in `SDM_Settings`
