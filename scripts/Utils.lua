--> [[ Load Game ]] <--

if not game:IsLoaded() then
	game.Loaded:Wait()
end

--> [[ Load Services ]] <--

local Services                    = {
	Players                       = game:GetService("Players"),
	ReplicatedStorage             = game:GetService("ReplicatedStorage"),
	RunService                    = game:GetService("RunService"),
	UserInputService              = game:GetService("UserInputService")
}

local Players                     = Services.Players
local ReplicatedStorage           = Services.ReplicatedStorage
local RunService                  = Services.RunService
local UserInputService            = Services.UserInputService

--> [[ Load Modules ]] <--

local Modules                     = {
   VehicleUtils                   = require(ReplicatedStorage.Vehicle.VehicleUtils),
   TagUtils                       = require(ReplicatedStorage.Tag.TagUtils),
   GunShopUI                      = require(ReplicatedStorage.Game.GunShop.GunShopUI),
   RayCast                        = require(ReplicatedStorage.Module.RayCast)
}

local VehicleUtils                = Modules.VehicleUtils
local TagUtils                    = Modules.TagUtils
local GunShopUI                   = Modules.GunShopUI
local RayCast                     = Modules.RayCast

--> [[ Load Settings ]] <--

local Settings                    = {
	Alwayskey                     = false,
	Antitaze                      = false,
	Fastpunch                     = false,
	Fastcrouch                    = false,
	Fastroll                      = false,
	Funnyroll                     = false,
	NoRagDoll                     = false,
	NoFallDamage                  = false,
	NoParachute                   = false,
	InfJump                       = false,
	WalkSpeed                     = false,
	JumpPower                     = false,
	Gravity                       = false,
	WalkSpeedHealth               = false,
	WalkSpeedShield               = false,
	WalkSpeedSpotlight            = false,
	VehicleSpeed                  = false,
	VehicleTurn                   = false,
	VehicleHeight                 = false,
	Aimbot                        = false,
	WalkSpeedInt                  = 16,
	JumpPowerInt                  = 50,
	GravityInt                    = 196.2,
	VehicleSpeedInt               = 0,
	VehicleTurnInt                = 1.4,
	VehicleHeightInt              = 3,
	AimbotDistanceInt             = 100
}

--> [[ Load Library ]] <--

local Fluent = loadstring(game:HttpGet("https://jailhax.lol/misc/GuiUtil.lua"))()

do
	local Window                        = Fluent:CreateWindow({
		Title                           = "Jailhax",
		SubTitle                        = "Jailbreak utility script.",
		TabWidth                        = 160,
		Size                            = UDim2.fromOffset(580, 460),
		Acrylic                         = true, 
		Theme                           = "Amethyst",
		MinimizeKey                     = Enum.KeyCode.RightControl 
	})

	local Tabs                          = {
		Main                            = Window:AddTab({ Title = "Player", Icon = "" }),
		Speeds                          = Window:AddTab({ Title = "Speeds", Icon = "" }),
		Vehicles                        = Window:AddTab({ Title = "Vehicles", Icon = ""}),
		Robberies                       = Window:AddTab({ Title = "Robberies", Icon = "" }),
		Teleports                       = Window:AddTab({ Title = "Teleports", Icon = "" }),
		Weapons                         = Window:AddTab({ Title = "Weapons", Icon = ""})
	}

	local Options = Fluent.Options

	do
		local AlwaysKeycardToggle       = Tabs.Main:AddToggle("Alwayskey", { Title = "Always Key", Default = false })
		local AntiTazeToggle            = Tabs.Main:AddToggle("Antitaze", { Title = "Anti Taze", Default = false })
		local FastPunchToggle           = Tabs.Main:AddToggle("Fastpunch", { Title = "Fast Punch", Default = false })
		local FastCrouchToggle          = Tabs.Main:AddToggle("Fastcrouch", { Title = "Fast Crouch", Default = false })
		local FastRollToggle            = Tabs.Main:AddToggle("Fastroll", { Title = "Fast Roll", Default = false})
		local FunnyRollToggle           = Tabs.Main:AddToggle("Funnyroll", { Title = "Funny Roll", Default = false })
		local NoRagDollToggle           = Tabs.Main:AddToggle("Noragdoll", { Title = "No Rag Doll", Default = false })
		local NoFallDamageToggle        = Tabs.Main:AddToggle("Nofalldamage", { Title = "No Fall Damage", Default = false })
		local NoParachuteToggle         = Tabs.Main:AddToggle("Noparachute", { Title = "No Parachute", Default = false })
		local InfJumpToggle             = Tabs.Main:AddToggle("Infjump", { Title = "Infinite Jump", Default = false })

		AlwaysKeycardToggle:OnChanged(function()
			Settings.Alwayskey = Options.Alwayskey.Value
		end)

		AntiTazeToggle:OnChanged(function()
			Settings.Antitaze = Options.Antitaze.Value
		end)

		FastPunchToggle:OnChanged(function()
			Settings.Fastpunch = Options.Fastpunch.Value
		end)

		FastCrouchToggle:OnChanged(function()
			Settings.Fastcrouch = Options.Fastcrouch.Value
		end)

		FastRollToggle:OnChanged(function()
			Settings.Fastroll = Options.Fastroll.Value
		end)

		FunnyRollToggle:OnChanged(function()
			Settings.Funnyroll = Options.Funnyroll.Value
		end)

		NoRagDollToggle:OnChanged(function()
			Settings.NoRagDoll = Options.Noragdoll.Value
		end)

		NoFallDamageToggle:OnChanged(function()
			Settings.NoFallDamage = Options.Nofalldamage.Value
		end)

		NoParachuteToggle:OnChanged(function()
			Settings.NoParachute = Options.Noparachute.Value
		end)

		InfJumpToggle:OnChanged(function()
			Settings.InfJump = Options.Infjump.Value
		end)

		local WalkSpeedToggle           = Tabs.Speeds:AddToggle("Walkspeed", { Title = "Walk Speed", Default = false })
		local JumpPowerToggle           = Tabs.Speeds:AddToggle("Jumppower", { Title = "Jump Power", Default = false })
		local GravityToggle             = Tabs.Speeds:AddToggle("Spacegravity", { Title = "Space Gravity", Default = false })
		local WalkSpeedHealthToggle     = Tabs.Speeds:AddToggle("Healthspeed", { Title = "Health Speed", Default = false })
		local WalkSpeedShieldToggle     = Tabs.Speeds:AddToggle("Shieldspeed", { Title = "Shield Speed", Default = false })
		local WalkSpeedSpotlightToggle  = Tabs.Speeds:AddToggle("Spotlightspeed", { Title = "Spotlight Speed", Default = false })

		WalkSpeedToggle:OnChanged(function()
			Settings.WalkSpeed = Options.Walkspeed.Value
		end)

		JumpPowerToggle:OnChanged(function()
			Settings.JumpPower = Options.Jumppower.Value
		end)

		GravityToggle:OnChanged(function()
			Settings.Gravity = Options.Spacegravity.Value
		end)

		WalkSpeedHealthToggle:OnChanged(function()
			Settings.WalkSpeedHealth = Options.Healthspeed.Value
		end)

		WalkSpeedShieldToggle:OnChanged(function()
			Settings.WalkSpeedShield = Options.Shieldspeed.Value
		end)

		WalkSpeedSpotlightToggle:OnChanged(function()
			Settings.WalkSpeedSpotlight = Options.Spotlightspeed.Value
		end)

		Tabs.Speeds:AddSlider("Speed", {
			Title = "Walk Speed",
			Description = "Sets your walkspeed.",
			Default = 16,
			Min = 16,
			Max = 200,
			Rounding = 1,
			Callback = function(Value)
                Settings.WalkSpeedInt = Value
			end
		})

		Tabs.Speeds:AddSlider("Speed", {
			Title = "Jump Power",
			Description = "Sets your jumppower.",
			Default = 50,
			Min = 50,
			Max = 350,
			Rounding = 1,
			Callback = function(Value)
				Settings.JumpPowerInt = Value
			end
		})

		Tabs.Speeds:AddSlider("Gravity", {
			Title = "Gravity",
			Description = "Sets your gravity.",
			Default = 196.2,
			Min = 0,
			Max = 250,
			Rounding = 1,
			Callback = function(Value)
                Settings.GravityInt = Value
			end
		})

		local VehicleSpeedToggle = Tabs.Vehicles:AddToggle("Vehiclespeed", { Title = "Vehicle Speed", Default = false })
		local VehicleTurnSpeedToggle = Tabs.Vehicles:AddToggle("Turnspeed", { Title = "Vehicle Turn Speed", Default = false })
		local VehicleHeightToggle = Tabs.Vehicles:AddToggle("Vehicleheight", { Title = "Vehicle Height", Default = false })

		VehicleSpeedToggle:OnChanged(function()
			Settings.VehicleSpeed = Options.Vehiclespeed.Value
		end)

		VehicleTurnSpeedToggle:OnChanged(function()
			Settings.VehicleTurn = Options.Turnspeed.Value
		end)

		VehicleHeightToggle:OnChanged(function()
			Settings.VehicleHeight = Options.Vehicleheight.Value
		end)

		Tabs.Vehicles:AddSlider("VSpeed", {
			Title = "Vehicle Speed",
			Description = "Sets your Vehicle Speed.",
			Default = 0,
			Min = 0,
			Max = 50,
			Rounding = 1,
			Callback = function(Value)
				Settings.VehicleSpeedInt = Value
			end
		})

		Tabs.Vehicles:AddSlider("TSpeed", {
			Title = "Turn Speed",
			Description = "Sets your Vehicle Turnspeed.",
			Default = 1.4,
			Min = 1.4,
			Max = 15,
			Rounding = 1,
			Callback = function(Value)
                Settings.VehicleTurnInt = Value
			end
		})

		Tabs.Vehicles:AddSlider("Height", {
			Title = "Vehicle Height",
			Description = "Sets your Vehicle Height.",
			Default = 3,
			Min = 3,
			Max = 500,
			Rounding = 1,
			Callback = function(Value)
				Settings.VehicleHeightInt = Value
			end
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Bank Lasers",
			Description = "Disables the Bank Lasers.",
			Callback = function()
				for i, v in pairs(workspace.Banks:GetDescendants()) do
					if v.Name == "Lasers" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "BankDoor" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end
				end
			end
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Casino Lasers",
			Description = "Disables the Casino Lasers.",
			Callback = function()
				for i, v in pairs(workspace.Casino:GetChildren()) do
					if v.Name == "Lasers" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "LasersMoving" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "VaultLaserControl" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "CamerasMoving" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end
				end
			end
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Oilrig Lasers",
			Description = "Disables the Oilrig Lasers.",
			Callback = function()
				for i, v in pairs(workspace.OilRig:GetDescendants()) do
					if v:IsA("Model") and v.Name == "Turrets" then
						pcall(function() v:Destroy() end)
					end

					if v:IsA("Model") and v.Name == "MovingLasers" then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end
				end
			end,
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Jewlery Lasers",
			Description = "Disables Jewlery Lasers.",
			Callback = function()
				for i, v in pairs(workspace.Jewelrys:GetChildren()[1]:GetDescendants()) do
					if v.Name == "Lasers" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "Cameras" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v:FindFirstChild("TouchInterest") then
						v:Destroy()
					end			
				end
			end,
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Mansion Lasers",
			Description = "Disables Mansion Lasers.",
			Callback = function()
				for i, v in pairs(workspace.Mansion:GetDescendants()) do
					if v.Name == "LaserTraps" and v:IsA("Model") then
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end

					if v.Name == "Lasers" and v:IsA("Model") then 
						for i2, v2 in pairs(v:GetDescendants()) do
							if v2:FindFirstChild("TouchInterest") then
								v2:Destroy()
							end
						end
					end
				end
			end,
		})

		Tabs.Robberies:AddButton({
			Title = "Disable Barbed Wires",
			Description = "Disables Barbed Wires.",
			Callback = function()
				for i, v in pairs(workspace:GetDescendants()) do
					if v.Name == "BarbedWire" and v:IsA("Part") and v:FindFirstChild("TouchInterest") then
						v.CanCollide = false
						v.CanTouch = false
						v.Transparency = 0.25
					end
				end
			end,
		})

		local TeleportingToLocation = false

		Tabs.Teleports:AddButton({
			Title = "Airport #1",
			Description = "Teleports you to Airport #1.", 
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-1426, 41, 2822))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Airport #2",
			Description = "Teleports you to Airport #2.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-804, 19, -5051))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Bank #1",
			Description = "Teleports you to Bank #1.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(42, 19, 926))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Bank #2",
			Description = "Teleports you to Bank #2.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-645, 20, -5990))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Casino",
			Description = "Teleports you to Casino.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-115, 73, -4725))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Jewlery",
			Description = "Teleports you to Jewlery.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(121, 20, 1317))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Powerplant",
			Description = "Teleports you to Powerplant.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(137, 23, 2302))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		Tabs.Teleports:AddButton({
			Title = "Mansion",
			Description = "Teleports you to Mansion.",
			Callback = function()
				if TeleportingToLocation then return end

				TeleportingToLocation = true

				local Timeout = os.clock()
				repeat
					game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(3147, -202, -4516))
					task.wait()
				until os.clock() - Timeout > 7.5

				TeleportingToLocation = false
			end
		})

		local AimbotToggle = Tabs.Weapons:AddToggle("Aimbot", { Title = "Aim Bot", Default = false })

		AimbotToggle:OnChanged(function()
			Settings.Aimbot = Fluent.Options.Aimbot.Value
		end)
		
		Tabs.Weapons:AddSlider("Aimbotdistance", {
			Title = "Aimbot Distance",
			Description = "Sets your Aimbot Distance.",
			Default = 100,
			Min = 100,
			Max = 1000,
			Rounding = 1,
			Callback = function(Value)
				Settings.AimbotDistanceInt = Value
			end
		})

		Tabs.Weapons:AddButton({
			Title = "Weapon Gui",
			Description = "Gives you the Weapon Gui.",
			Callback = function()
				pcall(function()
					setidentity(2)

					GunShopUI.open()

					repeat
						wait()
					until Players.LocalPlayer.PlayerGui.PlayerGui.GunShopGui.Container.Visible == false

					setidentity(8)
				end)
			end
		})
		Window:SelectTab(1)
	end
end

--> [[ Load Enviornment ]] <--

local HasKeyFunction                = {}
local StunnedFunction               = {}
local PunchFunction                 = {}
local RollTimeFunction              = {}
local CrawlFunction                 = {}
local CrawlTickTable                = {}
local WalkSpeedFunction             = {}

local function UpvalueFix(func)
	return function(...)
		return func(...)
	end
end

for i, v in getgc() do
	if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
		if getfenv(v).script == game:GetService("ReplicatedStorage").Game.PlayerUtils then
			if debug.info(v, "n") == "hasKey" then
                HasKeyFunction = v
            end
		end

		if getfenv(v).script == Players.LocalPlayer.PlayerScripts.LocalScript then
			if debug.info(v, "n") == "CheatCheck" then
				hookfunction(v, function() end)
			end

            if table.find(debug.getconstants(v), "Stunned") then
				StunnedFunction = v
            end

			if debug.info(v, "n") == "attemptPunch" then
				PunchFunction = v
			end

			if debug.info(v, "n") == "attemptToggleCrawling" then   
				CrawlFunction = v            
				CrawlTickTable = getupvalue(v, 9)
			end

            if debug.info(v, "n") == "WalkSpeedFun" then
                WalkSpeedFunction = v
            end
		end

		if getfenv(v).script == ReplicatedStorage.MovementRoll.MovementRollService then 
            if table.find(debug.getconstants(v), "mapLastRollTime") then
                RollTimeFunction = v
            end
        end
	end
end

--> [[ Load Main ]] <--

local OldHasKeyFunction             = {}
local OldStunnedFunction            = {}
local OldCrawlFunction              = {}
local OldPointTagFunction           = {}
local OldRayIgnoreFunction          = {}
local OldRayIgnoreTable             = RayCast.RayIgnoreNonCollideWithIgnoreList
local ProgressTracker               = Players.LocalPlayer.PlayerGui.AppUI.Controls.outer_5.Button:FindFirstChild("Progress")

OldHasKeyFunction = hookfunction(HasKeyFunction, function(...)
    if Settings.Alwayskey then
        return true
    end

    return OldHasKeyFunction(...)
end)

OldStunnedFunction = hookfunction(StunnedFunction, function(...) 
    if Settings.Antitaze then
        return
    end

    return OldStunnedFunction(...)
end)

OldCrawlFunction = hookfunction(CrawlFunction, function(...)
    if Settings.Fastcrouch then
       CrawlTickTable[#CrawlTickTable] = 0
    end

    return OldCrawlFunction(...)
end)

OldPointTagFunction = hookfunction(TagUtils.isPointInTag, UpvalueFix(function(pos, tag)
	if tag == "NoRagdoll" and Settings.NoRagDoll then
		return true
	elseif tag == "NoFallDamage" and Settings.NoFallDamage then
		return true
    elseif tag == "NoParachute" and Settings.NoParachute then
        return true
	end 

	return OldPointTagFunction(pos, tag)
end))

RayCast.RayIgnoreNonCollideWithIgnoreList = function(...)
	local nearestEnemy = nil
	local nearestDistance = tonumber(Settings.AimbotDistanceInt)

	local TargetFromTeam = {
		["Prisoner"] = "Police",
		["Criminal"] = "Police",
		["Police"] = "Criminal"
	}

    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Team.Name == TargetFromTeam[(Players.LocalPlayer.Team.Name)] and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < nearestDistance then
                nearestDistance, nearestEnemy = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude, v
            end
        end
    end

	local Arg = {OldRayIgnoreTable(...)}

	if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestEnemy then
        Arg[1] = nearestEnemy.Character.HumanoidRootPart
		Arg[2] = nearestEnemy.Character.HumanoidRootPart.Position
		Arg[3] = nearestEnemy.Character.HumanoidRootPart.Position
	end

	return unpack(Arg)
end

task.spawn(function()
	while task.wait(0.1) do
		if Settings.Fastpunch then
			debug.setconstant(PunchFunction, 3, 0)
		else
            debug.setconstant(PunchFunction, 3, 0.5)
		end

		if Settings.Funnyroll then
			debug.setconstant(RollTimeFunction, 71, 1)
		else
			debug.setconstant(RollTimeFunction, 71, 0.3)
		end

		if Settings.WalkSpeedHealth then
			debug.setconstant(WalkSpeedFunction, 8, 1)
		else
			debug.setconstant(WalkSpeedFunction, 8, 0.5)
		end

		if Settings.WalkSpeedShield then
			debug.setconstant(WalkSpeedFunction, 14, 1)
		else
			debug.setconstant(WalkSpeedFunction, 14, 0.75)
		end

		if Settings.WalkSpeedSpotlight then
			debug.setconstant(WalkSpeedFunction, 35, 1)
		else
			debug.setconstant(WalkSpeedFunction, 35, 0.8)
		end

		if Settings.VehicleSpeed and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().GarageEngineSpeed = Settings.VehicleSpeedInt
		elseif not Settings.VehicleSpeed and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().GarageEngineSpeed = 0
		end

		if Settings.VehicleTurn and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().TurnSpeed = Settings.VehicleTurnInt
		elseif not Settings.VehicleTurn and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().TurnSpeed = 1.4
		end

		if Settings.VehicleHeight and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().Height = Settings.VehicleHeightInt
		elseif not Settings.VehicleHeight and VehicleUtils.GetLocalVehiclePacket() then
			VehicleUtils.GetLocalVehiclePacket().Height = 3
		end
	end
end)

UserInputService.JumpRequest:Connect(function()
    if Settings.InfJump then
        Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Players.LocalPlayer.PlayerGui.AppUI.Controls.outer_5.Button.MouseButton1Click:Connect(function()
    if Settings.Fastroll then
		ProgressTracker.Parent = nil
    else
		ProgressTracker.Parent = Players.LocalPlayer.PlayerGui.AppUI.Controls.outer_5.Button
    end

    RollTimeFunction()
end)

UserInputService.InputBegan:Connect(function(input, event)
    if event or not Settings.Fastroll then
        return
    end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
            RollTimeFunction()
        end
    end
end)

RunService.RenderStepped:Connect(function()
	if Settings.WalkSpeed then
		Players.LocalPlayer.Character.Humanoid.WalkSpeed = Settings.WalkSpeedInt
	end

	if Settings.JumpPower then
		Players.LocalPlayer.Character.Humanoid.JumpPower = Settings.JumpPowerInt
	end

	if Settings.Gravity then
		workspace.Gravity = Settings.GravityInt
	end
end)
