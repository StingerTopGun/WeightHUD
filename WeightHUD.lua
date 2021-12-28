-- Weight HUD for FS22
--
-- Simple mod that shows the current weight of the vehicle and attachments in HUD
--
-- Author: StingerTopGun

WeightHUD = {}
WeightHUD.eventName = {}
WeightHUD.ModName = g_currentModName
WeightHUD.ModDirectory = g_currentModDirectory
WeightHUD.Version = "1.0.0.0"			

function WeightHUD:draw()
	if g_client ~= nil and g_currentMission.hud.isVisible and g_currentMission.controlledVehicle ~= nil then

        -- calculate position and size
        local posX = g_currentMission.inGameMenu.hud.speedMeter.gaugeCenterX
        local posY = g_currentMission.inGameMenu.hud.speedMeter.gaugeCenterY - (g_currentMission.inGameMenu.hud.speedMeter.speedIndicatorRadiusY * 2.0)
        local size = 0.013 * g_gameSettings.uiScale

        -- format weight string
        local weight_text = string.format("%.1f", g_currentMission.controlledVehicle:getTotalMass(true)) .. "t (total: " .. string.format("%.1f", g_currentMission.controlledVehicle:getTotalMass()) .. "t)"

        -- render
        setTextColor(1,1,1,1)
        setTextAlignment(RenderText.ALIGN_CENTER)
        setTextVerticalAlignment(RenderText.VERTICAL_ALIGN_TOP)
        setTextBold(false)
        renderText(posX, posY, size, weight_text)
        
        -- Back to defaults
        setTextColor(1,1,1,1)
        setTextAlignment(RenderText.ALIGN_LEFT)
        setTextVerticalAlignment(RenderText.VERTICAL_ALIGN_BASELINE)
        setTextBold(false)

	end
end

addModEventListener(WeightHUD)