-- BootstrapServer.lua
-- Entry point for Script Extender.
-- Loads core modules in correct order.

local function OnModuleLoad()
    local modPath = Ext.Utils.getModDirectory("QuestVision") or ""
    if modPath == "" then
        Ext.Log.Warning("[QuestVision] Mod directory not found, using relative path fallback")
        modPath = ""
    end

    -- Load modules
    local debugLoaded = pcall(function() Ext.Require("Debug.lua") end)
    if not debugLoaded then
        Ext.Log.Error("[QuestVision] Failed to load Debug.lua")
        return
    end
    Debug:Log("QuestVision bootstrap started")

    local mainLoaded = pcall(function() Ext.Require("Main.lua") end)
    if not mainLoaded then
        Debug:Error("Failed to load Main.lua")
        return
    end

    Debug:Log("QuestVision bootstrap completed successfully")
end

Ext.Events.ModLoaded:Subscribe(function(mod)
    if mod.Name == "QuestVision" then
        OnModuleLoad()
    end
end)
