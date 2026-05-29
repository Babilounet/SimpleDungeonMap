# Changelog

## v1.3.4

### Added
- Addon icon shown in the Escape > AddOns list (`## IconTexture`, bundled `icon.blp`) instead of the default question mark

## v1.3.3

### Added
- Calibrated boss positions baked in for the Vanilla dungeons (Shadowfang Keep, The Stockade, Wailing Caverns, Razorfen Kraul/Downs, Blackfathom Deeps, Uldaman, Gnomeregan, Temple of Atal'Hakkar, Scarlet Monastery, Zul'Farrak, Maraudon, Stratholme, Dire Maul, Zul'Gurub, Molten Core, …) — pins now sit on the right spot natively, no in-game calibration needed
- 264 boss positions placed across 38 instances; 12 non-relevant skull markers removed

### Changed
- `SDM_DungeonStairs` refreshed from the latest calibration (13 instances, 69 floor passages)

## v1.3.2

### Fixed
- Corrected Karazhan and Hellfire Ramparts boss positions

## v1.3.1

### Changed
- Baked calibrated floor-passage stairs into `SDM_DungeonStairs`

## v1.3.0

### Added
- AtlasLoot boss loot pins on dungeon maps (click a skull to open the boss loot page)
- Floor-passage stair markers with click-to-switch-floor navigation
- In-game calibration mode (`/sdm calib`) to drag pins into place, with `/sdm calib dump` / `/sdm calib reset`

## v1.2.0

### Added
- Options panel integrated into the native Interface menu (Escape → Interface → AddOns → SimpleDungeonMap)
- User-configurable overlay **size** (0.3 – 1.5) and **position** (X/Y offsets)
- **Left-click + drag** on the overlay to move it
- **Ctrl + mousewheel** on the overlay to resize it
- **Reset** button in the options panel to restore default layout
- Localization support (English, French, German, Spanish — English fallback for other locales)
- `/sdm options` slash command to open the options panel directly

### Changed
- `SDM_Settings` now persists `overlayScale`, `offsetX`, `offsetY`

## v1.1.0

### Added
- Raid map support for 16 Vanilla and TBC raids: Molten Core, Onyxia's Lair, Blackwing Lair, Zul'Gurub, Ruins of Ahn'Qiraj, Ahn'Qiraj, Naxxramas, Karazhan, Gruul's Lair, Magtheridon's Lair, Coilfang Reservoir, Tempest Keep, Mount Hyjal, Black Temple, Sunwell Plateau, Zul'Aman
- Floor data, labels and names for multi-floor raids (BWL 4 floors, AQ40 3, Naxx 6, Karazhan 10, Black Temple 7)
- Portal positions for all raid zones on the world map

### Changed
- Floor button count increased from 7 to 10 to support multi-floor raids

### Fixed
- TBC Caverns of Time dungeon texture folder names now match game data (CoTHillsbradFoothills, CoTTheBlackMorass) — previously silently broken

## v1.0.3

### Fixed
- TBC dungeon texture folder names corrected to match CASC game data

## v1.0.2

### Added
- CurseForge auto-release via GitHub Actions (tag push triggers packaging)
- Portal click preview, floor switching buttons, quest pin toggle (Questie integration)
- README, MIT license
