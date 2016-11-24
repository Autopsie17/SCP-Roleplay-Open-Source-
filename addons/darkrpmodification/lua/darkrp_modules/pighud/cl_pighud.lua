local hideHUDElements = {
		["DarkRP_HUD"] = false,

		["DarkRP_EntityDisplay"] = false,

		["DarkRP_LocalPlayerHUD"] = true,

		["DarkRP_Hungermod"] = true,

		["DarkRP_Agenda"] = true,
		
		["DarkRP_LockdownHUD"] = true
}

hook.Add("HUDShouldDraw", "hideHUDElements", function(name)
	if PIGS.enableHud == true then
		if hideHUDElements[name] then return false end
	end
end)

local blur = Material("pp/blurscreen")
local playerModelWidth = 20
local playerModelHeight = 140
local hpsmooth = 100
local armourSmooth = 100

local function drawBlur(x, y, w, h, amount, passes)
    amount = amount or 5
 
    surface.SetMaterial(blur)
    surface.SetDrawColor(255, 255, 255)
 
    local scrW, scrH = ScrW(), ScrH()
    local x2, y2 = x / scrW, y / scrH
    local w2, h2 = (x + w) / scrW, (y + h) / scrH
 
    for i = -(passes or 0.2), 1, 0.2 do
        blur:SetFloat("$blur", i * amount)
        blur:Recompute()
 
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRectUV(x, y, w, h, x2, y2, w2, h2)
    end
end

function PigHUD()
	local pl = LocalPlayer()
	
	-- DarkRP Variables
	local salary = DarkRP.formatMoney(pl:getDarkRPVar("salary"))
	local money = DarkRP.formatMoney(pl:getDarkRPVar("money"))
	local hunger = pl:getDarkRPVar("Energy")
	local teamColor = team.GetColor(pl:Team())
	local lockdown = GetGlobalBool("DarkRP_LockDown")
	local COLOR_RED = Color( 255, 0, 0, 255 )
	local COLOR_BACKGROUND = Color(55, 55, 55, 110)
	local TEXT_LOCKDOWN = "The mayor has initiated a lockdown."
	local TEXT_WANTED = "You are wanted by the police."
	local positionY = ScrH() - 127
	
	hpsmooth = Lerp(FrameTime() * 4, hpsmooth or pl:Health(), pl:Health())
	armourSmooth = Lerp(FrameTime() * 4, armourSmooth or pl:Armor(), pl:Armor())
	
	if PIGS.enableHud == true then
		if !pl:Alive() then return end
		
		drawBlur(120, ScrH() - 90, 250, 90)
		draw.RoundedBox(0, 120, ScrH() - 90, 250, 90, Color(55, 55, 55, 110))
		surface.SetDrawColor(0,0,0,255)
		surface.DrawOutlinedRect(120,ScrH() - 90, 250, 90)
		draw.SimpleTextOutlined("Health: "..pl:Health().."%", "DermaDefaultBold", 130, ScrH() - 80, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
		draw.RoundedBox(0, 130, ScrH() - 65, math.Clamp(hpsmooth, 0, 100) * 2.25, 15, Color(255,0,0,255))
		draw.RoundedBox(0, 130, ScrH() - 65, 225, 15, Color(255,0,0,95))
		surface.SetDrawColor(0,0,0,255)
		surface.DrawOutlinedRect(130, ScrH() - 65, 225, 15)
		if(pl:Armor() <= 0) then
			draw.SimpleTextOutlined("Occupation: "..pl:getDarkRPVar("job"), "DermaDefaultBold", 130, ScrH() - 48, teamColor, 0, 0, 1, Color(0,0,0,255))
			draw.SimpleTextOutlined("Wallet: "..money, "DermaDefaultBold", 130, ScrH() - 33, Color(0,255,0,255), 0, 0, 1, Color(0,0,0,255))
			draw.SimpleTextOutlined("Salary: "..salary, "DermaDefaultBold", 130, ScrH() - 18, Color(0,255,0,255), 0, 0, 1, Color(0,0,0,255))
		end
	
		if GetGlobalBool( "DarkRP_LockDown" ) then
			drawBlur(0, positionY, 250, 30)
			draw.RoundedBox( 4, 0, positionY, 250, 30, COLOR_BACKGROUND )
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(0, positionY, 250, 30)	
			draw.SimpleTextOutlined( TEXT_LOCKDOWN, "DermaDefaultBold", 10, positionY + 8, COLOR_RED, 0, 0, 0.5, color_black )

			positionY = positionY - 30 - 10
		end

		if pl:isWanted() then
			drawBlur(0, positionY, 250, 30)
			draw.RoundedBox( 4, 0, positionY, 250, 30, COLOR_BACKGROUND )
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(0, positionY, 250, 30)	
			draw.SimpleTextOutlined( TEXT_WANTED, "DermaDefaultBold", 10, positionY + 8, COLOR_RED, 0, 0, 0.5, color_black )
		end
		
		if pl:Armor() > 0 then
			draw.SimpleTextOutlined("Armor: "..pl:Armor().."%", "DermaDefaultBold", 130, ScrH() - 45, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
			draw.RoundedBox(0, 130, ScrH() - 30, math.Clamp(armourSmooth, 0, 100) * 2.25, 15, Color(0,0,255,255))
			draw.RoundedBox(0, 130, ScrH() - 30, 225, 15, Color(0,0,255,95))
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(130, ScrH() - 30, 225, 15)			
			drawBlur(375, ScrH() - 70, 215, 70)
			draw.RoundedBox(0, 375, ScrH() - 70, 215, 70, Color(55, 55, 55, 110))
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(375, ScrH() - 70, 215, 70)	
			draw.SimpleTextOutlined("Occupation: "..pl:getDarkRPVar("job"), "DermaDefaultBold", 387, ScrH() - 57, teamColor, 0, 0, 1, Color(0,0,0,255))
			draw.SimpleTextOutlined("Wallet: "..money, "DermaDefaultBold", 387, ScrH() - 42, Color(0,255,0,255), 0, 0, 1, Color(0,0,0,255))
			draw.SimpleTextOutlined("Salary: "..salary, "DermaDefaultBold", 387, ScrH() - 27, Color(0,255,0,255), 0, 0, 1, Color(0,0,0,255))
		end
		
		if PIGS.hungerMod == true then
			if PIGS.hungerPosition == "top" then
			if pl:isWanted() != true && !GetGlobalBool( "DarkRP_LockDown" ) then
				drawBlur(120, ScrH() - 145, 250, 50)
				draw.RoundedBox( 0, 120, ScrH() - 145, 250, 50, COLOR_BACKGROUND )
				surface.SetDrawColor(0,0,0,255)
				surface.DrawOutlinedRect(120, ScrH() - 145, 250, 50)	
				draw.SimpleTextOutlined("Hunger: "..hunger.."%", "DermaDefaultBold", 130, ScrH() - 135, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
				draw.RoundedBox( 0, 130, ScrH() - 120, math.Clamp(hunger, 0, 100) * 2.25, 15, Color(255,140,0,255))
				draw.RoundedBox( 0, 130, ScrH() - 120, 225, 15, Color(255,140,0,95))
				surface.SetDrawColor(0,0,0,255)
				surface.DrawOutlinedRect(130, ScrH() - 120, 225, 15)
			end

			if pl:isWanted() or GetGlobalBool( "DarkRP_LockDown" ) then
				if pl:Armor() >= 1 then
					drawBlur(595, ScrH() - 50, 250, 50)
					draw.RoundedBox( 0, 595, ScrH() - 50, 250, 50, COLOR_BACKGROUND )
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(595, ScrH() - 50, 250, 50)	
					draw.SimpleTextOutlined("Hunger: "..hunger.."%", "DermaDefaultBold", 605, ScrH() - 40, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
					draw.RoundedBox( 0, 605, ScrH() - 25, math.Clamp(hunger, 0, 100) * 2.25, 15, Color(255,140,0,255))
					draw.RoundedBox( 0, 605, ScrH() - 25, 225, 15, Color(255,140,0,95))
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(605, ScrH() - 25, 225, 15)	
				end
			
				if pl:Armor() <= 0 then
					drawBlur(375, ScrH() - 50, 250, 50)
					draw.RoundedBox( 0, 375, ScrH() - 50, 250, 50, COLOR_BACKGROUND )
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(375, ScrH() - 50, 250, 50)	
					draw.SimpleTextOutlined("Hunger: "..hunger.."%", "DermaDefaultBold", 385, ScrH() - 40, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
					draw.RoundedBox( 0, 385, ScrH() - 25, math.Clamp(hunger, 0, 100) * 2.25, 15, Color(255,140,0,255))
					draw.RoundedBox( 0, 385, ScrH() - 25, 225, 15, Color(255,140,0,95))
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(385, ScrH() - 25, 225, 15)	
				end
			end
			end
			
			if PIGS.hungerPosition == "bottom" then
				if pl:Armor() >= 1 then
					drawBlur(595, ScrH() - 50, 250, 50)
					draw.RoundedBox( 0, 595, ScrH() - 50, 250, 50, COLOR_BACKGROUND )
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(595, ScrH() - 50, 250, 50)	
					draw.SimpleTextOutlined("Hunger: "..hunger.."%", "DermaDefaultBold", 605, ScrH() - 40, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
					draw.RoundedBox( 0, 605, ScrH() - 25, math.Clamp(hunger, 0, 100) * 2.25, 15, Color(255,140,0,255))
					draw.RoundedBox( 0, 605, ScrH() - 25, 225, 15, Color(255,140,0,95))
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(605, ScrH() - 25, 225, 15)	
				end
			
				if pl:Armor() <= 0 then
					drawBlur(375, ScrH() - 50, 250, 50)
					draw.RoundedBox( 0, 375, ScrH() - 50, 250, 50, COLOR_BACKGROUND )
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(375, ScrH() - 50, 250, 50)	
					draw.SimpleTextOutlined("Hunger: "..hunger.."%", "DermaDefaultBold", 385, ScrH() - 40, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,255))
					draw.RoundedBox( 0, 385, ScrH() - 25, math.Clamp(hunger, 0, 100) * 2.25, 15, Color(255,140,0,255))
					draw.RoundedBox( 0, 385, ScrH() - 25, 225, 15, Color(255,140,0,95))
					surface.SetDrawColor(0,0,0,255)
					surface.DrawOutlinedRect(385, ScrH() - 25, 225, 15)
				end
			end
		end
		
		-- Ammunition
		if (pl:GetActiveWeapon():IsValid()) then
		local currentWeapon = pl:GetActiveWeapon():GetClass()
		
		if (currentWeapon != "weapon_physcannon" && currentWeapon != "weapon_physgun" && currentWeapon != "weapon_crowbar" && currentWeapon != "weapon_stunstick" && currentWeapon != "weapon_fists" && currentWeapon != "arrest_stick" && currentWeapon != "keys" && currentWeapon != "lockpick" && currentWeapon != "unarrest_stick" && currentWeapon != "pocket" && currentWeapon != "stunstick" && currentWeapon != "med_kit" && currentWeapon != "door_ram" && currentWeapon != "weaponchecker" && currentWeapon != "gmod_tool") then
			drawBlur(ScrW() - 165, ScrH() - 70, 155, 70)	
			draw.RoundedBox(0, ScrW() - 165, ScrH() - 70, 155, 70, Color(55,55,55,150))
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(ScrW() - 165, ScrH() - 70, 155, 70)

				if(pl:GetActiveWeapon():GetPrintName() != nil) then
					draw.SimpleText(pl:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", ScrW() - 155, ScrH() - 60, Color(255,255,255,255), 0, 0)
				end
			
				if(pl:GetActiveWeapon():Clip1() != -1) then
					draw.SimpleText("Ammunition: " .. pl:GetActiveWeapon():Clip1() .. " / " .. pl:GetAmmoCount(pl:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", ScrW() - 155, ScrH() - 40, Color(255,255,255,255), 0, 0)
				else 
					draw.SimpleText("Ammunition: " .. pl:GetAmmoCount(pl:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", ScrW() - 155, ScrH() - 40, Color(255,255,255,255), 0, 0)
				end
	
				if(pl:GetActiveWeapon():GetSecondaryAmmoType() >= 1) then
					draw.SimpleText("Alternate: " .. pl:GetAmmoCount(pl:GetActiveWeapon():GetSecondaryAmmoType()), "DermaDefaultBold", ScrW() - 155, ScrH() - 25, Color(255,255,255,255), 0, 0)
				end
			
			end
		end
		
		-- Agenda
		local agendaText
		local agenda = LocalPlayer():getAgendaTable()
		if not agenda then return end
		agendaText = agendaText or DarkRP.textWrap((LocalPlayer():getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)

		draw.RoundedBox(0, 10, 10, 460, 110, Color(100,100,100,150))
		draw.RoundedBox(0, 12, 12, 456, 106, Color(0,0,0,50))
		draw.RoundedBox(0, 12, 12, 456, 20, Color(0,0,0,75))

		draw.SimpleTextOutlined(agenda.Title, "DermaDefaultBold", 25, 15, Color(255,0,0,255), 0, 0, 1, Color(0,0,0,255))
		draw.DrawNonParsedText(agendaText, "DermaDefaultBold", 25, 35, Color(255,255,255,255), 0)
	end
end
hook.Add("HUDPaint", "PigHUD", PigHUD)

-- Player model function.
hook.Add("HUDPaint", "PlayerModel", function( )	
	if PIGS.enableHud == true then
	local _p = LocalPlayer( )

	if ( !IsValid( _p ) ) then return end

	local _model = _p:GetModel( )

	if ( !PlayerModel || !ispanel( PlayerModel ) ) then
		PlayerModel = vgui.Create( "DModelPanel" )
		PlayerModel:SetModel( _model )
		PlayerModel.__Model = _model
		PlayerModel:SetPos( playerModelWidth, ScrH() - playerModelHeight)
		PlayerModel:SetAnimated( false )
		PlayerModel.bAnimated = false
		PlayerModel:SetSize( 75, 150 )
		PlayerModel:SetCamPos( Vector( 16, 0, 65 ) )
		PlayerModel:SetLookAt( Vector( 0, 0, 65 ) )
		PlayerModel:ParentToHUD( )
	end

	if ( _p:GetModel( ) != PlayerModel.__Model ) then
		PlayerModel:SetModel( _model )
		PlayerModel.__Model = _model
	end
	end
end )

function HideDefaultHUD( name )
	if PIGS.enableHud == true then
		for k, v in pairs ({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
			if name == v then
				return false
			end
		end
	end
end
hook.Add("HUDShouldDraw", "HideDefaultHUD", HideDefaultHUD)