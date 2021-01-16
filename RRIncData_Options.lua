local RRIncData = LibStub("AceAddon-3.0"):NewAddon("RRIncData")
local AceGUI = LibStub("AceGUI-3.0")
local test = false
local range = 0

local dummy = ""

local RRIncDataOptionsTable = 
{
    type = "group",
    args = 
    {     
        optionSyncOptions = 
        {
            name = "Sync Data",
            order = 1,
            desc = "Sync through guild channel.",
            type = "execute",
            func = function() 
                print(RRIncData_MessagePrefix,"Not implemented yet! Sync would have been triggered.")
            end
        }
    }
}
local AceConfig = LibStub("AceConfig-3.0")
AceConfig:RegisterOptionsTable("RRInc Data", RRIncDataOptionsTable, {"RRIncDataconfig", "rrilcfg"})

LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RRInc Data", "RRInc Data", nil);