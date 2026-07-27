-- Debug.lua
-- Centralized logging for QuestVision

Debug = {
    PREFIX = "[QuestVision] ",
    LogFile = nil,
    Verbose = true  -- Set to false in release
}

function Debug:Init()
    local logDir = Ext.Utils.getPath("Script Extender") .. "/Logs"
    local f = io.open(logDir .. "/QuestVision.log", "w")
    if f then
        self.LogFile = f
        self:Log("Debug logging initialized")
    else
        Ext.Log.Warning(self.PREFIX .. "Cannot create log file, using Ext.Log only")
    end
end

function Debug:Log(message)
    local msg = self.PREFIX .. message
    Ext.Log.Info(msg)
    if self.LogFile and self.Verbose then
        self.LogFile:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. msg .. "\n")
        self.LogFile:flush()
    end
end

function Debug:Warning(message)
    local msg = self.PREFIX .. "[WARN] " .. message
    Ext.Log.Warning(msg)
    if self.LogFile then
        self.LogFile:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. msg .. "\n")
        self.LogFile:flush()
    end
end

function Debug:Error(message)
    local msg = self.PREFIX .. "[ERROR] " .. message
    Ext.Log.Error(msg)
    if self.LogFile then
        self.LogFile:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. msg .. "\n")
        self.LogFile:flush()
    end
end

-- Auto-init
Debug:Init()
