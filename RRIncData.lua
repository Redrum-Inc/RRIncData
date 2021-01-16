RRIncData_MessagePrefix = ""
local addonChannel = "RRIncData"

local function LoadLootData()
    RRIncData_Loot = RRIncData_Imported_Loot
    RRIncData_LootTimestamp = RRIncData_Imported_LootTimestamp
	print(RRIncData_MessagePrefix,"Loaded loot ranking from import with timestamp \"|cFF00B200"..RRIncData_LootTimestamp.."|r\".")
end

local function EventEnterWorld(self, event, isLogin, isReload)
	-- Set default values. (This might need rework? Not sure how saved variables work in this regard.)
	RRIncData_LootTimestamp = RRIncData_LootTimestamp or "0000-00-00 00:00:00"

	local addonName = GetAddOnMetadata("RRIncData", "Title")	
	RRIncData_MessagePrefix = addonName..":"
	local version = GetAddOnMetadata("RRIncData", "Version")

	if isLogin then
		C_Timer.After(1, function() print(addonName.." v"..version.." loaded.") end)
	end

	if isLogin or isReload then
		if RRIncData_LootTimestamp ~= RRIncData_Imported_LootTimestamp then
				C_Timer.After(3, function() print(RRIncData_MessagePrefix,"|cFFFF0000Loot timestamp \""..RRIncData_LootTimestamp.."\" differs from imported timestamp \""..RRIncData_Imported_LootTimestamp.."\"!|r") end)
				C_Timer.After(4, function() LoadLootData() end)
		else
			C_Timer.After(3, function() print(RRIncData_MessagePrefix,"Using LootData with timestamp \""..RRIncData_LootTimestamp.."\".") end)
		end
	end

	local successfulRequest = C_ChatInfo.RegisterAddonMessagePrefix(addonChannel)
end

local FrameEnterWorld = CreateFrame("Frame")
FrameEnterWorld:RegisterEvent("PLAYER_ENTERING_WORLD")
FrameEnterWorld:SetScript("OnEvent", EventEnterWorld)