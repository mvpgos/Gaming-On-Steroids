local ver = "0.01"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New AnnieGod Script Version Found " .. data)
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
JGA.jungleGA:Boolean("Sc", "Silent Check?", false)
JGA.jungleGA:Info("I1", "Silent Check = No drawing")
JGA.jungleGA:Slider("jCh", "Range to check jungler", 2690, 300, 7000)

JGA:Menu("Inf", "Information")
JGA.Inf:Info("I2", "Current Version ... 0.01")
JGA.Inf:Info("I3", "Made By Required")
JGA.Inf:Info("I4", "Upove if you liked it")


local GotSmite = nil
 DelayAction(function()
  for _, enemies in pairs(GetEnemyHeroes()) do
    if GetCastName(enemies, SUMMONER_1) == "SummonerSmite" or GetCastName(enemies, SUMMONER_2) == "SummonerSmite" then
    GotSmite = enemies
    end
  end
 end)

OnDraw(function(myHero)

local RangeToCheck = JGA.jungleGA.jCh:Value()

 if JGA.jungleGA.Enabled:Value() and ValidTarget(GotSmite, RangeToCheck) then
   		DrawLine(WorldToScreen(0, GetOrigin(myHero)).x,WorldToScreen(0, GetOrigin(myHero)).y,WorldToScreen(0, GetOrigin(GotSmite)).x,WorldToScreen(0, GetOrigin(GotSmite)).y,10,GoS.Red)
 end
end)
