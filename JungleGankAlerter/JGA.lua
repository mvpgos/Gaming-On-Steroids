local JGA = MenuConfig("JGA", "JungleGankAlerter")

JGA:Menu("jungleGA", "Jungle Gank Alerter")
JGA.jungleGA:Boolean("Enabled", "Enable Jungle Gank Alerter", true)
JGA.jungleGA:Boolean("Sc", "Silent Check?", false)
JGA.jungleGA:Info("I1", "Silent Check = No drawing")
JGA.jungleGA:Slider("jCh", "Range to check jungler", 2690, 300, 7000)


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
