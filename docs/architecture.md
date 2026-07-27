# QuestVision Architecture

## Modules

- **BootstrapServer.lua** — Entry point, loads modules
- **Main.lua** — Event subscriptions, module coordination
- **Debug.lua** — Logging to file and Ext.Log
- **WorldScanner.lua** (planned) — Get all NPCs in current area
- **QuestScanner.lua** (planned) — Analyze NPC quest/dialog state via Osiris
- **Highlight.lua** (planned) — Apply visual highlights
- **Render.lua** (planned) — Quest Radar overlay
- **Config.lua** (planned) — Settings persistence

## Data Flow

1. Player presses F9 → Main.lua
2. Main.lua triggers WorldScanner → gets NPC list
3. WorldScanner passes NPCs to QuestScanner
4. QuestScanner queries Osiris for quest states
5. Results passed to Highlight + Render
6. Render draws colored circles/sprites on screen

## Key API
- Script Extender Lua API (Norbyte)
- Osiris queries for dialog/quest flags
- Ext.Entity for NPC components
