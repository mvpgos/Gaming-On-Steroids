    local ver = "0.1"
    function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New Version Found " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/Activator/Activator.lua", SCRIPT_PATH .. "Required_ItemSpellActivator.lua", function() PrintChat(string.format("<font color=\"#FC5743\"><b>Script Downloaded succesfully. please 2x f6</b></font>")) return end)
    end
    end
    GetWebResultAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/Activator/Activator.version", AutoUpdate)



if GetObjectName(myHero) ~= "Alistar" then return end
PrintChat(string.format("<font color='#80F5F5'>Required Alistar:</font> <font color='#EFF0F0'>Ported by Required</font>"))
PrintChat(string.format("<font color='#80F5F5'>Originally made by :</font> <font color='#EFF0F0'>Marciii</font>"))
   local MonTourMenu = Menu("Alistar", "Alistar")
    MonTourMenu:SubMenu("Combo", "Combo")
    MonTourMenu.Combo:Boolean("CQW", "Use QW Combo", false)
    MonTourMenu.Combo:Boolean("CWQ", "Use WQ Combo", true)    
    MonTourMenu.Combo:Boolean("R", "Use R", true)
    MonTourMenu.Combo:Slider("RHP", "Use R my HP < x%", 30, 5, 80, 1)
    MonTourMenu:SubMenu("Harass", "Harass")
    MonTourMenu.Harass:Boolean("HQW", "Use QW Combo", true)
    MonTourMenu.Harass:Boolean("HWQ", "Use WQ Combo", false)
    MonTourMenu.Harass:Boolean("R", "Use R", true)
    MonTourMenu.Harass:Slider("RHP", "Use R my HP < x%", 30, 5, 80, 1)    
    MonTourMenu:SubMenu("Healing", "Healing")    
    MonTourMenu.Healing:Boolean("Eally", "Use E Ally", true)
    MonTourMenu.Healing:Slider("EallyHP", "Use E if Ally HP < x%", 35, 5, 99, 1)
    MonTourMenu.Healing:Slider("EallyMana", "Use E if my Mana > x%", 40, 5, 80, 1)
    MonTourMenu.Healing:Boolean("Emy", "Use E Myself", true)
    MonTourMenu.Healing:Slider("EmyHP", "Use E if my HP < x%", 25, 5, 80, 1) 
    MonTourMenu.Healing:Slider("EmyMana", "Use E if my Mana > x%", 40, 5, 80, 1) 
    MonTourMenu:SubMenu("Interrupt", "Interrupt")
    MonTourMenu.Interrupt:Boolean("Interrupt", "Auto Interrupt Spells", true)

unit = GetCurrentTarget()

    function HealSlot1()
        if GetCastName(myHero, SUMMONER_1):lower():find("summonerheal") or GetCastName(myHero, SUMMONER_2):lower():find("summonerheal") then
            realheals = true
        end
        if GetCastName(myHero, SUMMONER_1):lower():find("summonerheal")  or GetCastName(myHero, SUMMONER_1):lower():find("summonerbarrier") then
            return SUMMONER_1
        elseif GetCastName(myHero, SUMMONER_2):lower():find("summonerheal")  or GetCastName(myHero, SUMMONER_2):lower():find("summonerbarrier") then
            return SUMMONER_2
        end
    end
    heal = HealSlot1()

            if heal then
            MonTourMenu:SubMenu("heal", "Summoner Heal / Barrier")
            MonTourMenu.heal:Boolean("enable", "Use Summoner", true)
            MonTourMenu.heal:Slider("health", "If My Health % is Less Than", 10, 0, 100)
            if realheals then
                MonTourMenu.heal:Boolean("ally", "Also use on ally", false)
            end
        end 
CHANELLING_SPELLS = {
    ["Caitlyn"]                     = {_R},
    ["Katarina"]                    = {_R},
    ["MasterYi"]                    = {_W},
    ["FiddleSticks"]                = {_W, _R},
    ["Galio"]                       = {_R},
    ["Lucian"]                      = {_R},
    ["MissFortune"]                 = {_R},
    ["VelKoz"]                      = {_R},
    ["Nunu"]                        = {_R},
    ["Shen"]                        = {_R},
    ["Karthus"]                     = {_R},
    ["Malzahar"]                    = {_R},
    ["Pantheon"]                    = {_R},
    ["Warwick"]                     = {_R},
    ["Xerath"]                      = {_Q, _R},
    ["Varus"]                       = {_Q},
    ["TahmKench"]                   = {_R},
    ["TwistedFate"]                 = {_R},
    ["Janna"]                       = {_R}
}

local callback = nil
 
OnProcessSpell(function(unit, spell)    
    if not callback or not unit or GetObjectType(unit) ~= Obj_AI_Hero  or GetTeam(unit) == GetTeam(GetMyHero()) then return end
    local unitChanellingSpells = CHANELLING_SPELLS[GetObjectName(unit)]
 
        if unitChanellingSpells then
            for _, spellSlot in pairs(unitChanellingSpells) do
                if spell.name == GetCastName(unit, spellSlot) then callback(unit, CHANELLING_SPELLS) end
            end
  end
end)
 local sAllies = GetAllyHeroes()
function addInterrupterCallback( callback0 )
callback = callback0
end
function findClosestAlly(obj)
    local closestAlly = nil
    local currentAlly = nil
  for i, currentAlly in pairs(sAllies) do
        if currentAlly and not currentAlly.dead then
            if closestAlly == nil then
                closestAlly = currentAlly
      end
            if GetDistanceSqr(currentAlly.pos, obj) < GetDistanceSqr(closestAlly.pos, obj) then
        closestAlly = currentAlly
            end
        end
    end
  return closestAlly
end


function Heal()
  local ally = findClosestAlly(myHero)

      if CanUseSpell(myHero, _E) then
            if MonTourMenu.Healing.Eally:Value() then
                if ally and not ally.dead and GetDistance(ally) < 575 then
                
                        CastSpell(_E)
          
                end
            end

          local unit = GetCurrentTarget()
            if MonTourMenu.Healing.Emy:Value() then
              if GetCurrentHP(myHero)/GetMaxHP(myHero) < MonTourMenu.Healing.EmyHP:Value()/100 and CanUseSpell(myHero, _E) == READY then
                    CastSpell(_E)
              end
            end
        end
end

addInterrupterCallback(function(unit, spellType)
    local unit = GetCurrentTarget()
        if spellType == CHANELLING_SPELLS and MonTourMenu.Interrupt.Interrupt:Value() then
            if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, 300) then
            CastTargetSpell(unit, _W)
            end    
            local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),1200,250,260,50,false,true)
            if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 365) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z) 
            end
        end
end)

function Harass()
  local unit = GetCurrentTarget()
  local target = GetCurrentTarget()
if unit == nil or GetOrigin(unit) == nil or IsImmune(unit,myHero) or IsDead(unit) or not IsVisible(unit) or GetTeam(unit) == GetTeam(myHero) then return false end
if IOW:Mode() == "Harass" then
if ValidTarget(unit, 1550) and IsObjectAlive(unit) and not IsImmune(unit,myHero) and IsTargetable(unit) then
            if MonTourMenu.Harass.HWQ:Value() then
                 if CanUseSpell(myHero, _W) == READY and CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 650) then
           CastTargetSpell(unit, _W)
            end
        end
            if MonTourMenu.Harass.HWQ:Value() then
        local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),1200,250,260,50,false,true)
            if CanUseSpell(myHero, _Q) == READY and CanUseSpell(myHero, _W) ~= READY and IsInDistance(unit, 365) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z) 
            end
        end
            if MonTourMenu.Harass.HQW:Value() then
        local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),1200,250,260,50,false,true)
            if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 365) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z) 
            end
        end
            if MonTourMenu.Harass.HQW:Value() then
                 if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, 300) then
           CastTargetSpell(unit, _W)
            end
        end
            if MonTourMenu.Harass.R:Value() then
                     if (GetCurrentHP(myHero)/GetMaxHP(myHero)) < (MonTourMenu.Harass.RHP:Value()/100) and
                    CanUseSpell(myHero, _R) == READY and IsObjectAlive(myHero) and IsInDistance(unit, 1000) then
            CastSpell(_R)
            end
        end
end
end
end 

function Combo()
  local unit = GetCurrentTarget()
  local target = GetCurrentTarget()
if unit == nil or GetOrigin(unit) == nil or IsImmune(unit,myHero) or IsDead(unit) or not IsVisible(unit) or GetTeam(unit) == GetTeam(myHero) then return false end
if IOW:Mode() == "Combo" then
if ValidTarget(unit, 1550) and IsObjectAlive(unit) and not IsImmune(unit,myHero) and IsTargetable(unit) then
            if MonTourMenu.Combo.CWQ:Value() then
                 if CanUseSpell(myHero, _W) == READY and CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 650) then
           CastTargetSpell(unit, _W)
            end
        end
            if MonTourMenu.Combo.CWQ:Value() then
        local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),1200,250,260,50,false,true)
            if CanUseSpell(myHero, _Q) == READY and CanUseSpell(myHero, _W) ~= READY and IsInDistance(unit, 365) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z) 
            end
        end
            if MonTourMenu.Combo.CQW:Value() then
        local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),1200,250,260,50,false,true)
            if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 365) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z) 
            end
        end
            if MonTourMenu.Combo.CQW:Value() then
                 if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, 300) then
           CastTargetSpell(unit, _W)
            end
        end
            if MonTourMenu.Combo.R:Value() then
                     if (GetCurrentHP(myHero)/GetMaxHP(myHero)) < (MonTourMenu.Combo.RHP:Value()/100) and
                    CanUseSpell(myHero, _R) == READY and IsInDistance(unit, 1000) then
            CastSpell(_R)
            end
        end
end
end
end

OnTick(function(myHero)
Combo()
Harass()
Heal()



    if heal then
        if ValidTarget(GetCurrentTarget(), 2000) then
            if MonTourMenu.heal.enable:Value() and CanUseSpell(myHero, heal) == READY then
                if GetLevel(myHero) > 5 and GetCurrentHP(myHero)/GetMaxHP(myHero) < MonTourMenu.heal.health:Value() /100 then
                    CastSpell(heal)
                elseif  GetLevel(myHero) < 6 and GetCurrentHP(myHero)/GetMaxHP(myHero) < (MonTourMenu.heal.health:Value()/100)*.75 then
                    CastSpell(heal)
                end
                
                if realheals and MonTourMenu.heal.ally:Value() then
                    local ally = findClosestAlly(myHero)
                    if ally and not ally.dead and GetDistance(ally) < 850 then
                        if  GetCurrentHP(ally)/GetMaxHP(ally) < MonTourMenu.heal.health:value()/100 then
                            CastSpell(heal)
                        end
                    end
                end
            end
        end
    end
end)

  


