local Janna = MenuConfig("janna", "Master Janna")

Janna:Menu("Load", "On/Off")
	Janna.Load:Boolean("Combo", "Enable Combo", true)
	Janna.Load:Boolean("Harass", "Enable Harass", true)
	Janna.Load:Boolean("LastHit", "Enable Last Hit", true)
	Janna.Load:KeyBinding("Support", "Enable Support Mode", string.byte("T"))

Janna:Menu("Support", "Support logic")
	Janna.Support:Slider("HP", "Ally %HP for AutoShield", 20, 1, 95)
	Janna.Support:Info("s","")
	Janna.Support:Slider("sItems", "Cast Items on ally if %HP lower than ", 30, 1, 95)
	Janna.Support:DropDown("ulti", "Ultimate Casting", 2, {"OFF", "Only when dangerous", "Cast Always if ally's %HP < 10"})

Janna.Menu("cLogic", "Combo Logic")
	Janna.cLogic:DropDown("cOrder", "Combo order", 1, {"Q-E", "E-Q"})
	Janna.cLogic:Info("a","")
    Janna.cLogic:Boolean("allyComboYes", "Use Allies check for combo", true)
	Janna.cLogic:DropDown("allyCombo", "Minimum allies around for combo", 2, {"0", "1", "2", "3", "4"})
