local ver = "0.2"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New Version Found " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/JungleGankAlerter/JGA.lua", SCRIPT_PATH .. "JungleGankAlerter.lua", function() PrintChat(string.format("<font color=\"#FC5743\"><b>Script Downloaded succesfully. please 2x f6</b></font>")) return end)
    else
        PrintChat(string.format("<font color=\"#fa87b4\"><b>Script Up to date.</b></font>"))
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/JungleGankAlerter/JGA.version", AutoUpdate)



local JGA = MenuConfig("JGA", "JungleGankAlerter")

JGA:Menu("jungleGA", "Jungle Gank Alerter")
JGA.jungleGA:Boolean("Enabled", "Enable Jungle Gank Alerter", true)

JGA.jungleGA:SubMenu("Line", "JGA with Line")
	JGA.jungleGA.Line:Boolean("Yes", "Enable JGA with line", false)
	JGA.jungleGA.Line:Boolean("Sc", "Silent Check?", false)
	JGA.jungleGA.Line:Info("I1", "Silent Check = No drawing")
	JGA.jungleGA.Line:Slider("jCh", "Range to check jungler", 2690, 300, 7000)
	JGA.jungleGA.Line:Empty("Empty1", 0)
	JGA.jungleGA.Line:Slider("width", "Width of the line", 8, 1, 16)

JGA.jungleGA:SubMenu("Text", "JGA with text")
	JGA.jungleGA.Text:Boolean("Yes", "Enable JGA with text", false)
	JGA.jungleGA.Text:Boolean("Sc", "Silent Check?", false)
	JGA.jungleGA.Text:Info("I1", "Silent Check = No drawing")
	JGA.jungleGA.Text:Slider("jCh", "Range to check jungler", 2690, 300, 7000)
	JGA.jungleGA.Text:Empty("Empty1", 0)


JGA:Menu("Inf", "Information")
JGA.Inf:Info("I2", "Current Version ..." ..ver.."")
JGA.Inf:Info("I3", "Made By Required")
JGA.Inf:Info("I4", "Upove if you liked it")


local GotSmite = nil
 DelayAction(function()
  for _, enemies in pairs(GetEnemyHeroes()) do
    if GetCastName(enemies, SUMMONER_1) == "SummonerSmite" or GetCastName(enemies, SUMMONER_1) == "S5_SummonerSmitePlayerGanker" or GetCastName(enemies, SUMMONER_1) == "S5_SummonerSmiteDuel"  or GetCastName(enemies, SUMMONER_2) == "SummonerSmite" or GetCastName(enemies, SUMMONER_2) == "S5_SummonerSmitePlayerGanker" or GetCastName(enemies, SUMMONER_2) == "S5_SummonerSmiteDuel" then
    GotSmite = enemies
    end
  end
 end)

OnDraw(function(myHero)

local RangeToCheck = JGA.jungleGA.Line.jCh:Value()
local width = JGA.jungleGA.Line.width:Value()

		if JGA.jungleGA.Line.Sc:Value() ~= true or JGA.jungleGA.Text.Sc:Value() ~= true then	
			DrawCircle(myHero.pos, RangeToCheck, 2, 3, GoS.Yellow)
		end

		if JGA.jungleGA.Enabled:Value() and ValidTarget(GotSmite, RangeToCheck) then
		   	DrawLine(WorldToScreen(0, GetOrigin(myHero)).x,WorldToScreen(0, GetOrigin(myHero)).y,WorldToScreen(0, GetOrigin(GotSmite)).x,WorldToScreen(0, GetOrigin(GotSmite)).y,width,GoS.Red)
		end

		if JGA.jungleGA.Enabled:Value() and ValidTarget(GotSmite, RangeToCheck) then
		   DrawText("Jungler in range", 15, GetResolution().x/2+400, GetResolution().y/2+60, ARGB(255, 75, 168, 202))
		end

end)


PrintChat(string.format("<font color=\"#984DD1\"><b>Thanks for using Jungle Gank Alerter</b></font>"))
