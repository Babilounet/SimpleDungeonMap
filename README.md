# SimpleDungeonMap

Dungeon map overlay for WoW Classic Anniversary Edition (Interface 20505).

Opens the World Map inside a dungeon and see the dungeon layout as an overlay. Supports all Classic and TBC 5-man dungeons with automatic floor switching.

Based on [DungeonMaps 0.1c](https://www.curseforge.com/wow/addons/dungeonmaps) by Undeadguy, refactored for Anniversary Edition.

## Features

- **Dungeon map overlay** - Automatically displays the dungeon map when opening the World Map inside a supported dungeon
- **Floor switching** - Buttons in the top-left corner to switch between floors on multi-floor dungeons. Auto-switches based on subzone
- **Portal click preview** - Click on blue dungeon portal icons on the World Map (requires [Leatrix Maps](https://www.curseforge.com/wow/addons/leatrix-maps)) to preview the dungeon map without being inside
- **Questie integration** - Toggle quest objective pins on the dungeon overlay (requires [Questie](https://www.curseforge.com/wow/addons/questie)). Toggle with the ? button in the top-right corner
- **Right-click to dismiss** - Right-click anywhere on the overlay to close it and return to the normal map
- **Locale-independent** - Uses numeric instance map IDs, works with any client language

## Supported Dungeons

### Classic
Ragefire Chasm, Wailing Caverns, The Deadmines, Shadowfang Keep, Blackfathom Deeps, The Stockade, Gnomeregan, Razorfen Kraul, Scarlet Monastery, Razorfen Downs, Uldaman, Zul'Farrak, Maraudon, Temple of Atal'Hakkar, Blackrock Depths, Blackrock Spire, Dire Maul, Stratholme, Scholomance

### TBC
Hellfire Ramparts, The Blood Furnace, The Shattered Halls, The Slave Pens, The Underbog, The Steamvault, Mana-Tombs, Auchenai Crypts, Sethekk Halls, Shadow Labyrinth, The Mechanar, The Botanica, The Arcatraz, Old Hillsbrad Foothills, The Black Morass, Magisters' Terrace

## Requirements

**BLP texture files must be provided separately.** The addon expects tiled dungeon map textures at:
```
Interface\Worldmap\{DungeonName}\{DungeonName}{floor}_{tile}.blp
```
12 tiles per floor (4x3 grid, 256x256 each). Extract them from game data using CASCExplorer or similar tools.

## Optional Dependencies

- **Leatrix Maps** - Enables clicking dungeon portal icons on the world map to preview dungeon maps
- **Questie** - Enables quest objective pins on the dungeon overlay

## Slash Commands

| Command | Description |
|---------|-------------|
| `/sdm` | Show current dungeon info |
| `/sdm questpins` | Toggle quest pins on/off |
| `/sdm debug` | Show debug info |
| `/sdm test` | Show red test overlay |
| `/sdm probe` | Check if textures load for current dungeon |
| `/sdm probefloors` | Detect available floors for all dungeons |
| `/sdm probefloors Name` | Detect floors for a specific dungeon |
| `/sdm reset` | Reset overlay state |

## Installation

1. Extract `SimpleDungeonMap` folder into `Interface\AddOns\`
2. Place dungeon map BLP textures in `Interface\Worldmap\` (see Requirements)
3. Reload UI or restart the game
