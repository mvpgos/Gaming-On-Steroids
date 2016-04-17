local s = "Developed by Required"
local vr = "Current Version 0.2 . 17/04/2016"
local Champ = MyHeroName 
textTable = {s,vr} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(string.format("<font color=\"#984DD1\"><b>Thanks for using Required Utilities </b></font>"))



local ver = "0.2"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New Version Found " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/Required-Utilities/Required_Utilities.lua", SCRIPT_PATH .. "Requred Utilities.lua", function() PrintChat(string.format("<font color=\"#FC5743\"><b>Script Downloaded succesfully. please 2x f6</b></font>")) return end)
    end
end




local Required = MenuConfig("REQ", "RequiredUtility")

Required:Menu("Req", "Required Utility")
				Required.Req:Empty("Empty1", 0)
				Required.Req:Boolean("ReqYes", "Enable Required utilities", true)
					Required.Req:SubMenu("SubReq", "Auto Level")
									Required.Req.SubReq:Boolean("LevelUp", "Level Up Skills", true)
									Required.Req.SubReq:Slider("Start_Level", "Level to enable lvlUP", 1, 1, 17)
									Required.Req.SubReq:DropDown("autoLvl", "Skill order", 1, {"Q-W-E","Q-W-Q","Q-E-W",})
									Required.Req.SubReq:Boolean("Humanizer", "Enable Level Up Humanizer", true)
					Required.Req:SubMenu("SubReq2", "Personal information")
									Required.Req.SubReq2:Boolean("Self", "Enable Personal Info", true)
									Required.Req.SubReq2:Empty("Empty2", 0)
									Required.Req.SubReq2:Boolean("LFs", "Show LifeSteal", true)
									Required.Req.SubReq2:Boolean("SpellVamp", "Show Spell Vamp", true)
									Required.Req.SubReq2:Boolean("DmgPen", "Show Armor Penetration", true)
									Required.Req.SubReq2:Boolean("ApPen", "Show Magic Penetration", true)
									Required.Req.SubReq2:Boolean("Gold", "Show Gold", true)
									Required.Req.SubReq2:Boolean("TotalGold", "Show Gold earned since start", true)
									Required.Req.SubReq2:Boolean("MSpeed", "Show Movement Speed", true)
					Required.Req:SubMenu("SubReq3", "Skin Changer")
									Required.Req.SubReq3:Boolean("SkinEnabled", "Enable Skin Changer", true)
									Required.Req.SubReq3:Empty("Empty3", 0)
									Required.Req.SubReq3:Slider("SkinID", "Select Skin", 1, 1, 10)
					Required.Req:SubMenu("SubReq4", "Drawings")
									Required.Req.SubReq4:Boolean("DrawingsEnabled", "Enable Drawings", true)
									Required.Req.SubReq4:Empty("Empty4", 0)
									Required.Req.SubReq4:Boolean("DrawQ", "Enable Q Draw", true)
									Required.Req.SubReq4:Boolean("DrawW", "Enable W Draw", true)
									Required.Req.SubReq4:Boolean("DrawE", "Enable E Draw", true)
									Required.Req.SubReq4:Boolean("DrawR", "Enable R Draw", true)
					Required.Req:SubMenu("SubReq5", "Information")
									Required.Req.SubReq5:Info("c", "Developed by Required")
									Required.Req.SubReq5:Empty("Te", 0)
									Required.Req.SubReq5:Info("e", "Current Version ... " ..ver.. "")


		--[[Required.Req:SubMenu("Data", "Get Data")
		 Required.Req.Data:Boolean("Datas", "Show data", false) ]]

local LevelUpTable={
[1]={_Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W},

[2]={_Q,_W,_Q,_E,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W},

[3]={_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
}

OnDraw(function(myHero)

	if Required.Req.SubReq4.DrawingsEnabled:Value() then
		if Required.Req.SubReq4.DrawQ:Value() then  DrawCircle(myHero.pos, GetCastRange(myHero, 0), 1, 5, ARGB(255, 68, 219, 121)) end
		if Required.Req.SubReq4.DrawW:Value() then  DrawCircle(myHero.pos, GetCastRange(myHero, 1), 1, 5, ARGB(255, 213, 227, 84)) end
		if Required.Req.SubReq4.DrawE:Value() then  DrawCircle(myHero.pos, GetCastRange(myHero, 2), 1, 5, ARGB(255, 84, 146, 227)) end
		if Required.Req.SubReq4.DrawR:Value() then  DrawCircle(myHero.pos, GetCastRange(myHero, 3), 1, 5, ARGB(255, 227, 115, 84)) end
	end


	if Required.Req.ReqYes:Value() then
		if Required.Req.SubReq2.Self:Value() then
			PersonalInfo()
		end

	end
end)

OnTick(function(myHero)

	--if Required.Req.Data.Datas:Value() then PrintChat(""..GetCastName(myHero, SUMMONER_2).. "") end -- dev purposes

	if Required.Req.SubReq3.SkinEnabled:Value() ~= false then
		HeroSkinChanger(myHero, Required.Req.SubReq3.SkinID:Value() - 1)
	end

	if Required.Req.ReqYes:Value() then
		if Required.Req.SubReq.LevelUp:Value() then
			SkillsLevelUp()
		end

	end
end)




function SkillsLevelUp()

	if Required.Req.SubReq.LevelUp:Value() and GetLevelPoints(myHero) >= 1 and GetLevel(myHero) >= Required.Req.SubReq.Start_Level:Value() then
		if Required.Req.SubReq.Humanizer:Value() then
			DelayAction(function() LevelSpell(LevelUpTable[Required.Req.SubReq.autoLvl:Value()][GetLevel(myHero)-GetLevelPoints(myHero)+1]) end, math.random(0.3286,1.33250))
		else
			LevelSpell(LevelUpTable[Required.Req.SubReq.autoLvl:Value()][GetLevel(myHero)-GetLevelPoints(myHero)+1])
		end
	end
end

function PersonalInfo()
	if Required.Req.SubReq2.LFs:Value() then 
		DrawText("LifeSteal: "..math.ceil(GetLifeSteal(myHero) * 100).. "%", 15, GetResolution().x/2+400, GetResolution().y/2, ARGB(255, 247, 8, 64))
	end

	if Required.Req.SubReq2.SpellVamp:Value() then 
		DrawText("SpellVamp: "..math.ceil(GetSpellVamp(myHero) * 100).. "%", 15, GetResolution().x/2+400, GetResolution().y/2+15, ARGB(255, 69, 242, 63))
	end

	if Required.Req.SubReq2.DmgPen:Value() then 
		DrawText("Armor Penetration: "..math.ceil(GetArmorPenFlat(myHero)).. "", 15, GetResolution().x/2+400, GetResolution().y/2+30, ARGB(255, 236, 206, 58))
	end

	if Required.Req.SubReq2.ApPen:Value() then 
		DrawText("Magic Penetration: "..math.ceil(GetMagicPenFlat(myHero)).. "", 15, GetResolution().x/2+400, GetResolution().y/2+45, ARGB(255, 84, 229, 214))
	end


	if Required.Req.SubReq2.Gold:Value() then 
		DrawText("Gold: "..math.ceil(GetCurrentGold(myHero)).. "", 15, GetResolution().x/2+400, GetResolution().y/2+60, ARGB(255, 232, 226, 63))
	end

	if Required.Req.SubReq2.TotalGold:Value() then 
		DrawText("Gold: "..math.ceil(GetTotalEarnedGold(myHero)).. "", 15, GetResolution().x/2+400, GetResolution().y/2+75, ARGB(255, 245, 239, 83))
	end

	if Required.Req.SubReq2.MSpeed:Value() then 
		DrawText("Movement Speed: "..math.ceil(GetMoveSpeed(myHero)).. "", 15, GetResolution().x/2+400, GetResolution().y/2+90, ARGB(255, 75, 168, 202))
	end
end
