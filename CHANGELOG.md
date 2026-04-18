# Changelog

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
