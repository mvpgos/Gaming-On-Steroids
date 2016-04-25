local ver = "1.05 "

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New Version Found " .. data)
        PrintChat("Downloading update, please wait...")
        OnDraw(function()
   local w, h1, h2, size = (res.x*0.70), (res.y*.15), (res.y*.9), res.y*.02
      DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(120,205,0,0))
      DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(120,50,0,0))
      DrawText(tostring("SkinChanger Changelog"), res.y * .028, (res.x/2.4), (res.y*.18), ARGB(255, 0 , 255, 255))
      DrawText(tostring("Ver 1.04:"), res.y*.015, (res.x/2.65), (res.y*.210), ARGB(225, 225, 175, 0))
      DrawText(tostring("               Minor Fixes"), res.y*.015, (res.x/2.65), (res.y*.225), ARGB(255, 255, 255, 255))
      DrawText(tostring("Ver 1.03"), res.y*.015, (res.x/2.65), (res.y*.240), ARGB(225, 225, 175, 0))
      DrawText(tostring("               Fixed Auto Level, Auto Smite."), res.y*.015, (res.x/2.65), (res.y*.255), ARGB(255, 255, 255, 255))
      DrawText(tostring(""), res.y*.015, (res.x/2.65), (res.y*.270), ARGB(255, 255, 255, 255))
      DrawText(tostring("              ())__CRAYON___)) >"), res.y*.015, (res.x/2.65), (res.y*.285), ARGB(255, 255, 255, 255))
      DrawText(tostring(""), res.y*.015, (res.x/2.65), (res.y*.300), ARGB(255, 255, 255, 255))
      DrawText(tostring("TODO:"), res.y*.015, (res.x/2.65), (res.y*.315), ARGB(225, 225, 175, 0))
      DrawText(tostring("             Add Model Changes."), res.y*.015, (res.x/2.65), (res.y*.330), ARGB(255, 255, 255, 255))
      DrawText(tostring("             Add Rest of the objects."), res.y*.015, (res.x/2.65), (res.y*.345), ARGB(255, 255, 255, 255))
      DrawText(tostring("             Particles."), res.y*.015, (res.x/2.65), (res.y*.360), ARGB(255, 255, 255, 255))
      DrawText(tostring("             Suggestions?"), res.y*.015, (res.x/2.65), (res.y*.375), ARGB(255, 255, 255, 255))
      local w1, w2, h1, h2 = (res.x/2)-50, (res.x/2)+50, (res.y*.70), (res.y*.75)
      DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(122, 255, 0, 255)) 
      --DrawLine(w*.98, h1*.98, w*.98, h2*.98, w*.1*.98, ARGB(205,255,255,255))
      FillRect(w1+10, (res.y/2)-103, 80, 30, ARGB(255,0,255,255))
      DrawText(tostring("2x F6"),size, (res.x/2)-size+10, (res.y/2)-100, ARGB(255,0, 0, 0)) 
      end)
	DownloadFileAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/Required-Utilities/Required_Utilities.lua", SCRIPT_PATH .. "RequiredUtilities.lua", function() PrintChat(string.format("<font color=\"#FC5743\"><b>Script Downloaded succesfully. please 2x f6</b></font>")) return end)
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/RequiredGoS/Gaming-On-Steroids/master/Required-Utilities/Required_Utilities.version", AutoUpdate)
