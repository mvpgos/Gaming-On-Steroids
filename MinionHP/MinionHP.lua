local ver = "0.1"


function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New Version Found " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/MinionHP/MinionHP.lua", SCRIPT_PATH .. "MinionHP.lua", function() PrintChat(string.format("<font color=\"#FC5743\"><b>Script Downloaded succesfully. please 2x f6</b></font>")) return end)
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/MinionHP/MinionHP.version", AutoUpdate)

local HpMenu = MenuConfig("Minion HP: Version: "..ver.."", "Requireds Minion HP Drawing")

HpMenu:SubMenu("sel", "Drawings")
	HpMenu.sel:Boolean("Enabled", "Enable HP Drawings", true)
		HpMenu.sel:SubMenu("select", "Select Minions")
			HpMenu.sel.select:Boolean("mcr", "Draw on Ranged Minions", true)
			HpMenu.sel.select:Boolean("mcm", "Draw on Melee Minions", true)
			HpMenu.sel.select:Boolean("mcs", "Draw on Siege Minions", true)

OnDraw(function()
	if HpMenu.sel.Enabled:Value() then
		for i,minion in pairs(minionManager.objects) do
			if GetTeam(minion) ~= myHero.team then
				if HpMenu.sel.select.mcr:Value() then
					if GetObjectName(minion) == "SRU_ChaosMinionRanged" then
						mcr = minion
						DrawText(""..math.ceil(GetCurrentHP(mcr)).."", 16, WorldToScreen(0, GetOrigin(mcr)).x-15, WorldToScreen(0, GetOrigin(mcr)).y-55, ARGB(255,33,184,184))
					elseif GetObjectName(minion) == "SRU_OrderMinionRanged" then
						mcr = minion
						DrawText(""..math.ceil(GetCurrentHP(mcr)).."", 16, WorldToScreen(0, GetOrigin(mcr)).x-15, WorldToScreen(0, GetOrigin(mcr)).y-55, ARGB(255,227,52,75))
					end
				end
				if HpMenu.sel.select.mcm:Value() then
					if GetObjectName(minion) == "SRU_ChaosMinionMelee" then
						mcm = minion
						DrawText(""..math.ceil(GetCurrentHP(mcm)).."", 16, WorldToScreen(0, GetOrigin(mcm)).x-15, WorldToScreen(0, GetOrigin(mcm)).y-55, ARGB(255,33,184,184))
					elseif GetObjectName(minion) == "SRU_OrderMinionMelee" then
						mcm = minion
						DrawText(""..math.ceil(GetCurrentHP(mcm)).."", 16, WorldToScreen(0, GetOrigin(mcm)).x-15, WorldToScreen(0, GetOrigin(mcm)).y-55, ARGB(255,227,52,75))
					end
				end
				if HpMenu.sel.select.mcs:Value() then
					if GetObjectName(minion) == "SRU_ChaosMinionSiege" then
						mcs = minion
						DrawText(""..math.ceil(GetCurrentHP(mcs)).."", 16, WorldToScreen(0, GetOrigin(mcs)).x-15, WorldToScreen(0, GetOrigin(mcs)).y-55, ARGB(255,33,184,184))
					elseif GetObjectName(minion) == "SRU_OrderMinionSiege" then
						mcs = minion
						DrawText(""..math.ceil(GetCurrentHP(mcs)).."", 16, WorldToScreen(0, GetOrigin(mcs)).x-15, WorldToScreen(0, GetOrigin(mcs)).y-55, ARGB(255,227,52,75))
					end
				end
			end
		end
	end
end)

PrintChat(string.format("<font color=\"#85EDD7\"><b>Welcome " ..GetUser().. " to Required's Minion HP Drawings .</b></font>"))
