-- Main.lua
-- Core module: subscribes to game events, prepares infrastructure for scanning

Debug:Log("Main.lua loading")

-- ====== Event Handlers ======

-- Called once on game session start (after loading save or starting new game)
Ext.Events.SessionLoaded:Subscribe(function()
    Debug:Log("Session loaded - QuestVision active")
    -- Future: Initialize scanners here
end)

-- Called when a level (map/area) is fully loaded
Ext.Events.LevelGameplayStarted:Subscribe(function(levelName, isEditor)
    Debug:Log("Level started: " .. tostring(levelName))
    -- Future: Scan NPCs on this level
end)

-- Called on every game tick (use sparingly for performance)
Ext.Events.Tick:Subscribe(function()
    -- Future: Update Quest Radar, check hotkey, etc.
end)

-- Called when key is pressed (F9 = 0x78)
Ext.Events.KeyPressed:Subscribe(function(key)
    if key == 0x78 then  -- F9
        Debug:Log("F9 pressed - QuestVision toggle")
        -- Future: Toggle highlight overlay
    end
end)

Debug:Log("Main.lua loaded successfully")
