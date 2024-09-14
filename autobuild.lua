rRoot = getResourceRootElement(getThisResource())
sRoot = getRootElement()
sw, sh = guiGetScreenSize(), getThisResource()
csw, csh = sw - 130, sh - 130
lp = getLocalPlayer()
xAngle = 1
frame = 30
scale = sw / 1280
local l_0_0 = {}
l_0_0.on = false
l_0_0.w = 300
l_0_0.h = 300
l_0_0.s = 1
l_0_0.r = 1
l_0_0.x = 500
l_0_0.y = 500
crack = l_0_0
l_0_0 = {r = 255, g = 255}
l_0_0.b = 0
l_0_0.br = 255
l_0_0.spin = false
l_0_0.mph = false
l_0_0.crack = true
l_0_0.info = 1
l_0_0.a = 255
settings = l_0_0
l_0_0 = "img/speed_bg.png"
imgBG = l_0_0
l_0_0 = "img/speed_labels.png"
imgL = l_0_0
l_0_0 = "img/speed_hp.png"
imgHP = l_0_0
l_0_0 = "img/speed_bg_glow.png"
imgBGG = l_0_0
l_0_0 = "img/speed_innerring.png"
imgIR = l_0_0
l_0_0 = "img/speed_outerring.png"
imgOR = l_0_0
l_0_0 = "img/speed_needle.png"
imgN = l_0_0
l_0_0 = "img/speed_needle_s.png"
imgNS = l_0_0
l_0_0 = "img/speed_cover.png"
imgCV = l_0_0
l_0_0 = "img/speed_crack.png"
imgCR = l_0_0
l_0_0 = tocolor
l_0_0 = l_0_0(255, 222, 0, 255)
labelColor = l_0_0
l_0_0 = tocolor
l_0_0 = l_0_0(255, 255, 255, 255)
brightness = l_0_0
l_0_0 = tocolor
l_0_0 = l_0_0(255, 255, 255, 198)
white = l_0_0
l_0_0 = tocolor
l_0_0 = l_0_0(0, 0, 0, 222)
black = l_0_0
l_0_0 = false
ddcSW = l_0_0
l_0_0 = false
drag = l_0_0
l_0_0 = true
spinner = l_0_0
l_0_0 = false
xml = l_0_0
l_0_0 = function()
  local vSpeed = getSpeed()
  local vHp = getHealth()
  if vHp < 0 then
    vHp = 0
  end
  if frame > 0 then
    frame = frame - 1
  end
  local glowR = 490 - vHp * 7
  local glowG = vHp * 7
  vHp = vHp * scale
  local speedText = math.floor(vSpeed)
  if speedText < 10 then
    speedText = "00" .. speedText
  elseif speedText < 100 then
    speedText = "0" .. speedText
  elseif speedText > 300 then
    speedText = "OMG"
  else
    speedText = tostring(speedText)
  end
  if xAngle > 360 then
    xAngle = xAngle - 360
  end
  xAngle = xAngle + vSpeed / 10
  if vSpeed > 260 then
    vSpeed = 260
  end
  if isConsoleActive() or isChatBoxInputActive() then
    dxDrawText("Right click: move, Scroll: resize", csw - 128 * scale, csh - 148 * scale, csw + 128 * scale, csh - 100 * scale, white, 1 * scale, "default-bold", "center")
    if isConsoleActive() then
      dxDrawText("Double click: options", csw - 128 * scale, csh - 133 * scale, csw + 128 * scale, csh - 100 * scale, white, 1 * scale, "default-bold", "center")
    else
      if settings.info == 1 then
        dxDrawText("Press ~ or F8 and double-click\nspeedometer to change settings", csw - 128 * scale, csh - 148 * scale, csw + 128 * scale, csh - 100 * scale, white, 1 * scale, "default-bold", "center")
      end
    end
  end
  if settings.spin then
    if vSpeed >= 255 or not vSpeed + frame * 8 then
      dxDrawImage(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgBGG, 0, 0, 0, tocolor(settings.r, settings.g, settings.b, 255 + frame * 8))
    end
  else
    if vSpeed >= 255 or not vSpeed + frame * 8 then
      dxDrawImage(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgBGG, 0, 0, 0, tocolor(glowR > 255 and 255 or glowR, glowG > 255 and 255 or glowG, 0, 255 + frame * 8))
    end
  end
  if spinner then
    if frame > 0 then
      dxDrawImage(csw - frame - 128 * scale, csh - frame - 128 * scale, (256 + frame * 2) * scale, (256 + frame * 2) * scale, imgOR, xAngle + frame, 0, 0, brightness)
    else
      dxDrawImage(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgOR, xAngle, 0, 0, brightness)
    end
  end
  dxDrawImage(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgBG, 0, 0, 0, brightness)
  dxDrawImage(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgL, 0, 0, 0, labelColor)
  dxDrawImage(csw - 35 * scale, csh - 37 * scale, vHp - frame, 13 * scale, imgHP, 0, 0, 0, tocolor(((vHp - frame >= 0 or not 0) and glowR <= 255 or 255) or glowR, glowG > 255 and 255 or glowG, 0, 255))
  dxDrawImage(csw - 127 * scale, csh - 124 * scale, 256 * scale, 256 * scale, imgNS, vSpeed, 0, 0)
  dxDrawImage(csw - 127 * scale, csh - 128 * scale, 256 * scale, 256 * scale, imgN, vSpeed, 0, 0, labelColor)
  dxDrawImage(csw - 128 * scale, frame / 3 + csh - 128 * scale, 256 * scale, 256 * scale, imgCV, 0, 0, 0, brightness)
  dxDrawText(speedText, csw - 20 * scale, csh + 60 * scale, csw + 20 * scale, csh + 70 * scale, black, 0.5 * scale, "bankgothic", "center")
  dxDrawText(speedText, csw - 20 * scale, csh + 59 * scale, csw + 20 * scale, csh + 70 * scale, labelColor, 0.5 * scale, "bankgothic", "center")
  dxDrawImage(csw - 64 * scale, csh + 2 * scale, 128 * scale, 128 * scale, imgIR, 720 - xAngle * 2, 0, 0, tocolor(settings.r, settings.g, settings.b, vSpeed))
  if vHp < 13 * scale and vHp > 0 and not crack.on then
    crack.on = true
    crack.r = math.random(360)
    crack.s = math.random(500)
    crack.w = 400 + crack.s
    crack.h = 400 + crack.s
    crack.x = math.random(csw) - crack.w / 2
    crack.y = math.random(csh) - crack.h / 2
  else
    if 13 * scale <= vHp then
      crack.on = false
    end
  end
  if crack.on then
    dxDrawImage(crack.x, crack.y, crack.w, crack.w, imgCR, crack.r, 0, 0, white, false)
  end
end

renderSpeed = l_0_0
l_0_0 = function(l_2_0)
  if isPedInVehicle(lp) then
    local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(lp))
    if l_2_0 then
      return math.sqrt(vx ^ 2 + vy ^ 2 + vz ^ 2) * 100
    else
      return math.sqrt(vx ^ 2 + vy ^ 2 + vz ^ 2) * 160.9
    end
  end
  return 0
end

getSpeed = l_0_0
l_0_0 = function()
  if isPedInVehicle(lp) then
    local car = getPedOccupiedVehicle(lp)
     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  return math.ceil(((not car or 0) - 250) / 750 * 70)
  do return end
  return 0
end
return 0
end

getHealth = l_0_0
l_0_0 = addEventHandler
l_0_0("onClientVehicleEnter", sRoot, function(l_4_0)
  if l_4_0 == lp then
    ddcSpeed(true)
  end
end
)
l_0_0 = addEventHandler
l_0_0("onClientVehicleExit", sRoot, function(l_5_0)
  if l_5_0 == lp then
    ddcSpeed(false)
  end
end
)
l_0_0 = addEventHandler
l_0_0("onClientPlayerWasted", sRoot, function()
  if source == lp then
    ddcSpeed(false)
  end
end
)
l_0_0 = addEventHandler
l_0_0("onClientResourceStart", rRoot, function()
  if scale > 1 then
    scale = 1
  end
  loadSettings()
  if sw < csw or csw < 0 then
    csw = sw - 130
  end
  if sh < csh or csh < 0 then
    csh = sh - 130
  end
  if isPedInVehicle(lp) then
    ddcSpeed(true)
  end
  ddcSW = guiCreateWindow(csw - 128 * scale, csh - 128 * scale, 256 * scale, 256 * scale, "DDC Speedometer", false)
  guiWindowSetSizable(ddcSW, false)
  guiWindowSetMovable(ddcSW, false)
  ddcSO = guiCreateWindow(sw - 220, sh - 270, 200, 250, "DDC Speedometer: Options", false)
  guiWindowSetSizable(ddcSO, false)
  guiSetFont(guiCreateLabel(0.05, 0.12, 0.9, 0.06, "Speedometer labels RGB color:", true, ddcSO), "default-small")
  ddcSOR = guiCreateScrollBar(0.05, 0.18, 0.9, 0.08, true, true, ddcSO)
  ddcSOG = guiCreateScrollBar(0.05, 0.26, 0.9, 0.08, true, true, ddcSO)
  ddcSOB = guiCreateScrollBar(0.05, 0.34, 0.9, 0.08, true, true, ddcSO)
  guiSetFont(guiCreateLabel(0.05, 0.43, 0.9, 0.06, "Speedometer brightness/opacity:", true, ddcSO), "default-small")
  ddcSOBR = guiCreateScrollBar(0.05, 0.49, 0.9, 0.08, true, true, ddcSO)
  ddcSOA = guiCreateScrollBar(0.05, 0.57, 0.9, 0.08, true, true, ddcSO)
  ddcSOID = guiCreateCheckBox(0.05, 0.67, 0.9, 0.06, "Display 'Press ~ or F8 and...' text", false, true, ddcSO)
  ddcSOCS = guiCreateCheckBox(0.05, 0.73, 0.9, 0.06, "Use labels color for outer glow", false, true, ddcSO)
  ddcSOSE = guiCreateCheckBox(0.05, 0.79, 0.9, 0.06, "Display outer spinning part", false, true, ddcSO)
  guiSetFont(ddcSOCS, "default-small")
  guiSetFont(ddcSOSE, "default-small")
  guiSetFont(ddcSOID, "default-small")
  ddcSOX = guiCreateButton(0.81, 0.85, 0.14, 0.15, "X", true, ddcSO)
  ddcSORP = guiCreateButton(0.05, 0.87, 0.38, 0.1, "Reset Position", true, ddcSO)
  ddcSORS = guiCreateButton(0.43, 0.87, 0.38, 0.1, "Reset Scale", true, ddcSO)
  guiSetFont(ddcSORP, "default-small")
  guiSetFont(ddcSORS, "default-small")
  guiSetAlpha(ddcSW, 0)
  guiSetVisible(ddcSO, false)
  addEventHandler("onClientGUIDoubleClick", source, function()
    if source == ddcSW and not guiGetVisible(ddcSO) then
      openSettings(true)
    else
      if source == ddcSW then
        openSettings()
      end
    end
   end)
  addEventHandler("onClientGUIClick", source, function(l_2_0, l_2_1)
    if source == ddcSW then
      if l_2_0 == "left" then
        drag = false
      elseif l_2_0 == "right" then
        drag = not drag
      else
        if source == ddcSORS then
          scale = 1
          guiSetPosition(ddcSW, csw - 128 * scale, csh - 128 * scale, false)
          guiSetSize(ddcSW, 256 * scale, 256 * scale, false)
        else
          if source == ddcSORP then
            csw, csh = sw - 130, sh - 130
            guiSetPosition(ddcSW, csw - 128 * scale, csh - 128 * scale, false)
          else
            if source == ddcSOSE then
              if guiCheckBoxGetSelected(ddcSOSE) then
                spinner = true
              else
                spinner = false
              end
            else
              if source == ddcSOCS then
                if guiCheckBoxGetSelected(ddcSOCS) then
                  settings.spin = true
                else
                  settings.spin = false
                end
              else
                if source == ddcSOID then
                  if guiCheckBoxGetSelected(ddcSOID) then
                    settings.info = 1
                  else
                    settings.info = 0
                  end
                else
                  if source == ddcSOX then
                    guiSetVisible(ddcSO, false)
                  end
                end
              end
            end
          end
        end
      end
    end
   end)
  addEventHandler("onClientGUIScroll", source, function(l_3_0)
    if l_3_0 == ddcSOR then
      settings.r = math.ceil(guiScrollBarGetScrollPosition(ddcSOR) * 2.55)
      labelColor = tocolor(settings.r, settings.g, settings.b, 255)
    elseif l_3_0 == ddcSOG then
      settings.g = math.ceil(guiScrollBarGetScrollPosition(ddcSOG) * 2.55)
      labelColor = tocolor(settings.r, settings.g, settings.b, 255)
    elseif l_3_0 == ddcSOB then
      settings.b = math.ceil(guiScrollBarGetScrollPosition(ddcSOB) * 2.55)
      labelColor = tocolor(settings.r, settings.g, settings.b, 255)
    elseif l_3_0 == ddcSOBR then
      settings.br = math.ceil(guiScrollBarGetScrollPosition(ddcSOBR) * 2.55)
      brightness = tocolor(settings.br, settings.br, settings.br, settings.a)
    elseif l_3_0 == ddcSOA then
      settings.a = math.ceil(guiScrollBarGetScrollPosition(ddcSOA) * 2.55)
      brightness = tocolor(settings.br, settings.br, settings.br, settings.a)
    end
   end)
  addEventHandler("onClientMouseWheel", source, function(l_4_0)
    scale = scale + l_4_0 / 50
    if scale > 2 then
      scale = 2
    end
    guiSetPosition(ddcSW, csw - 128 * scale, csh - 128 * scale, false)
    guiSetSize(ddcSW, 256 * scale, 256 * scale, false)
   end)
  addEventHandler("onClientMouseMove", sRoot, function(l_5_0, l_5_1)
    if drag then
      csw = l_5_0
      csh = l_5_1
      guiSetPosition(ddcSW, csw - 128 * scale, csh - 128 * scale, false)
      guiSetSize(ddcSW, 256 * scale, 256 * scale, false)
    end
   end)
  outputChatBox("DDC Speedometer: Type /spds to open settings!", 255, 155, 0, true)
end
)
l_0_0 = function()
  xml = xmlLoadFile("speed.xml")
  if xml then
    scale = tonumber(xmlNodeGetValue(xmlFindChild(xml, "scale", 0)))
    csw = tonumber(xmlNodeGetValue(xmlFindChild(xml, "posX", 0)))
    csh = tonumber(xmlNodeGetValue(xmlFindChild(xml, "posY", 0)))
    settings.r = tonumber(xmlNodeGetValue(xmlFindChild(xml, "red", 0)))
    settings.g = tonumber(xmlNodeGetValue(xmlFindChild(xml, "green", 0)))
    settings.b = tonumber(xmlNodeGetValue(xmlFindChild(xml, "blue", 0)))
    if xmlFindChild(xml, "brightness", 0) then
      settings.br = tonumber(xmlNodeGetValue(xmlFindChild(xml, "brightness", 0)))
    else
      xmlNodeSetValue(xmlCreateChild(xml, "brightness"), tostring(settings.br))
    end
    if xmlFindChild(xml, "info", 0) then
      settings.info = tonumber(xmlNodeGetValue(xmlFindChild(xml, "info", 0)))
    else
      xmlNodeSetValue(xmlCreateChild(xml, "info"), tostring(settings.info))
    end
    if xmlFindChild(xml, "alpha", 0) then
      settings.a = tonumber(xmlNodeGetValue(xmlFindChild(xml, "alpha", 0)))
    else
      xmlNodeSetValue(xmlCreateChild(xml, "alpha"), tostring(settings.a))
    end
    if tostring(xmlNodeGetValue(xmlFindChild(xml, "spincolor", 0))) == "true" then
      settings.spin = true
    else
      settings.spin = false
    end
    if tostring(xmlNodeGetValue(xmlFindChild(xml, "spinner", 0))) == "true" then
      spinner = true
    else
      spinner = false
    end
    labelColor = tocolor(settings.r, settings.g, settings.b, 255)
    brightness = tocolor(settings.br, settings.br, settings.br, settings.a)
  else
    xml = xmlCreateFile("speed.xml", "settings")
    xmlNodeSetValue(xmlCreateChild(xml, "scale"), tostring(scale))
    xmlNodeSetValue(xmlCreateChild(xml, "posX"), tostring(csw))
    xmlNodeSetValue(xmlCreateChild(xml, "posY"), tostring(csh))
    xmlNodeSetValue(xmlCreateChild(xml, "red"), tostring(settings.r))
    xmlNodeSetValue(xmlCreateChild(xml, "green"), tostring(settings.g))
    xmlNodeSetValue(xmlCreateChild(xml, "blue"), tostring(settings.b))
    xmlNodeSetValue(xmlCreateChild(xml, "spincolor"), tostring(settings.spin))
    xmlNodeSetValue(xmlCreateChild(xml, "spinner"), tostring(spinner))
    xmlNodeSetValue(xmlCreateChild(xml, "brightness"), tostring(settings.br))
    xmlNodeSetValue(xmlCreateChild(xml, "info"), tostring(settings.info))
    xmlNodeSetValue(xmlCreateChild(xml, "alpha"), tostring(settings.a))
  end
end

loadSettings = l_0_0
l_0_0 = function()
  xmlNodeSetValue(xmlFindChild(xml, "scale", 0), tostring(scale))
  xmlNodeSetValue(xmlFindChild(xml, "posX", 0), tostring(csw))
  xmlNodeSetValue(xmlFindChild(xml, "posY", 0), tostring(csh))
  xmlNodeSetValue(xmlFindChild(xml, "red", 0), tostring(settings.r))
  xmlNodeSetValue(xmlFindChild(xml, "green", 0), tostring(settings.g))
  xmlNodeSetValue(xmlFindChild(xml, "green", 0), tostring(settings.g))
  xmlNodeSetValue(xmlFindChild(xml, "blue", 0), tostring(settings.b))
  xmlNodeSetValue(xmlFindChild(xml, "spincolor", 0), tostring(settings.spin))
  xmlNodeSetValue(xmlFindChild(xml, "spinner", 0), tostring(spinner))
  xmlNodeSetValue(xmlFindChild(xml, "brightness", 0), tostring(settings.br))
  xmlNodeSetValue(xmlFindChild(xml, "info", 0), tostring(settings.info))
  xmlNodeSetValue(xmlFindChild(xml, "alpha", 0), tostring(settings.a))
end

saveSettings = l_0_0
l_0_0 = addEventHandler
l_0_0("onClientResourceStop", rRoot, function()
  saveSettings()
  xmlSaveFile(xml)
  xmlUnloadFile(xml)
end
)
l_0_0 = function(l_11_0)
  if l_11_0 then
    guiSetVisible(ddcSO, true)
    guiScrollBarSetScrollPosition(ddcSOR, math.ceil(settings.r / 2.55))
    guiScrollBarSetScrollPosition(ddcSOG, math.ceil(settings.g / 2.55))
    guiScrollBarSetScrollPosition(ddcSOB, math.ceil(settings.b / 2.55))
    guiScrollBarSetScrollPosition(ddcSOBR, math.ceil(settings.br / 2.55))
    guiScrollBarSetScrollPosition(ddcSOA, math.ceil(settings.a / 2.55))
    if spinner then
      guiCheckBoxSetSelected(ddcSOSE, true)
    else
      guiCheckBoxSetSelected(ddcSOSE, false)
    end
    if settings.spin then
      guiCheckBoxSetSelected(ddcSOCS, true)
    else
      guiCheckBoxSetSelected(ddcSOCS, false)
    end
    if settings.info == 1 then
      guiCheckBoxSetSelected(ddcSOID, true)
    else
      guiCheckBoxSetSelected(ddcSOID, false)
    end
    guiBringToFront(ddcSO)
  else
    guiSetVisible(ddcSO, false)
  end
end

openSettings = l_0_0
l_0_0 = function(l_12_0)
  if l_12_0 then
    addEventHandler("onClientRender", sRoot, renderSpeed)
    frame = 30
  else
    removeEventHandler("onClientRender", sRoot, renderSpeed)
    frame = 0
  end
end

ddcSpeed = l_0_0
l_0_0 = addCommandHandler
l_0_0("spds", function()
  openSettings(not guiGetVisible(ddcSO))
end
)

