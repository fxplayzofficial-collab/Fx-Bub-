-- // SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- // CONFIG
local isMinimized = false
local originalSize = UDim2.new(0, 540, 0, 470)
local correctKey = "FxplayzOfficialisbest"

-- // UI HELPER
local function create(class, props, parent)
	local obj = Instance.new(class)
	for k, v in pairs(props) do obj[k] = v end
	if parent then obj.Parent = parent end
	return obj
end

-- // SCREENGUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FxplayzOfficial_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local ok = pcall(function() ScreenGui.Parent = CoreGui end)
if not ok then ScreenGui.Parent = PlayerGui end

-- // NOTIFICATION
local function createNotification(msg)
	local Note = create("Frame", {
		Size = UDim2.new(0, 240, 0, 50),
		Position = UDim2.new(1, -250, 1, -70),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
		BorderSizePixel = 0,
		ZIndex = 20
	}, ScreenGui)
	create("UICorner", {CornerRadius = UDim.new(0, 8)}, Note)
	create("UIStroke", {Color = Color3.fromRGB(0, 150, 255), Thickness = 1.5}, Note)
	create("TextLabel", {
		Text = msg,
		Size = UDim2.new(1, -14, 1, 0),
		Position = UDim2.new(0, 7, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextWrapped = true,
		ZIndex = 21
	}, Note)
	TweenService:Create(Note, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
		Position = UDim2.new(1, -250, 1, -130)
	}):Play()
	task.delay(2.5, function()
		TweenService:Create(Note, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
			Position = UDim2.new(1, -250, 1, -70)
		}):Play()
		task.delay(0.35, function() Note:Destroy() end)
	end)
end

-- // KEY FRAME
local KeyFrame = create("Frame", {
	Size = UDim2.new(0, 340, 0, 215),
	Position = UDim2.new(0.5, -170, 0.5, -107),
	BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	BorderSizePixel = 0,
	ZIndex = 10
}, ScreenGui)
create("UICorner", {CornerRadius = UDim.new(0, 14)}, KeyFrame)
create("UIStroke", {Color = Color3.fromRGB(0, 150, 255), Thickness = 1.5}, KeyFrame)

create("TextLabel", {
	Text = "🔐  AUTHENTICATION",
	Size = UDim2.new(1, 0, 0, 52),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 18,
	ZIndex = 11
}, KeyFrame)

create("TextLabel", {
	Text = "Enter the key to access FxplayzOfficial Hub",
	Size = UDim2.new(1, -20, 0, 22),
	Position = UDim2.new(0, 10, 0, 48),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(130, 130, 130),
	Font = Enum.Font.Gotham,
	TextSize = 12,
	ZIndex = 11
}, KeyFrame)

local KeyBox = create("TextBox", {
	PlaceholderText = "Enter key here...",
	Size = UDim2.new(0.86, 0, 0, 42),
	Position = UDim2.new(0.07, 0, 0, 78),
	BackgroundColor3 = Color3.fromRGB(16, 16, 16),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.Gotham,
	TextSize = 14,
	BorderSizePixel = 0,
	ZIndex = 11,
	ClearTextOnFocus = false
}, KeyFrame)
create("UICorner", {CornerRadius = UDim.new(0, 8)}, KeyBox)
create("UIStroke", {Color = Color3.fromRGB(55, 55, 55), Thickness = 1}, KeyBox)

local KeyBtn = create("TextButton", {
	Text = "SUBMIT",
	Size = UDim2.new(0.86, 0, 0, 42),
	Position = UDim2.new(0.07, 0, 0, 130),
	BackgroundColor3 = Color3.fromRGB(0, 140, 255),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 15,
	BorderSizePixel = 0,
	ZIndex = 11
}, KeyFrame)
create("UICorner", {CornerRadius = UDim.new(0, 8)}, KeyBtn)

create("TextLabel", {
	Text = "Key hint: FxplayzOfficialisbest",
	Size = UDim2.new(1, 0, 0, 26),
	Position = UDim2.new(0, 0, 0, 183),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(85, 85, 85),
	Font = Enum.Font.Gotham,
	TextSize = 11,
	ZIndex = 11
}, KeyFrame)

-- // MAIN FRAME
local MainFrame = create("Frame", {
	Size = originalSize,
	Position = UDim2.new(0.5, -270, 0.5, -235),
	BackgroundColor3 = Color3.fromRGB(18, 18, 18),
	Visible = false,
	Active = true,
	BorderSizePixel = 0
}, ScreenGui)
create("UICorner", {CornerRadius = UDim.new(0, 14)}, MainFrame)
create("UIStroke", {Color = Color3.fromRGB(0, 140, 255), Thickness = 1.5}, MainFrame)

-- // TOP BAR
local TopBar = create("Frame", {
	Size = UDim2.new(1, 0, 0, 48),
	BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	BorderSizePixel = 0
}, MainFrame)
create("UICorner", {CornerRadius = UDim.new(0, 14)}, TopBar)

-- Fix rounded corners showing at bottom of topbar
create("Frame", {
	Size = UDim2.new(1, 0, 0.5, 0),
	Position = UDim2.new(0, 0, 0.5, 0),
	BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	BorderSizePixel = 0
}, TopBar)

create("TextLabel", {
	Text = "⚡  FxplayzOfficial Hub",
	Size = UDim2.new(1, -115, 1, 0),
	Position = UDim2.new(0, 14, 0, 0),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextSize = 16,
	ZIndex = 2
}, TopBar)

local MinBtn = create("TextButton", {
	Text = "−",
	Size = UDim2.new(0, 36, 0, 34),
	Position = UDim2.new(1, -84, 0, 7),
	BackgroundColor3 = Color3.fromRGB(230, 170, 0),
	TextColor3 = Color3.fromRGB(0, 0, 0),
	Font = Enum.Font.GothamBold,
	TextSize = 22,
	BorderSizePixel = 0,
	ZIndex = 3
}, TopBar)
create("UICorner", {CornerRadius = UDim.new(0, 8)}, MinBtn)

local MaxBtn = create("TextButton", {
	Text = "+",
	Size = UDim2.new(0, 36, 0, 34),
	Position = UDim2.new(1, -44, 0, 7),
	BackgroundColor3 = Color3.fromRGB(0, 190, 90),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 22,
	BorderSizePixel = 0,
	ZIndex = 3
}, TopBar)
create("UICorner", {CornerRadius = UDim.new(0, 8)}, MaxBtn)

-- // TAB BAR
local TabBar = create("ScrollingFrame", {
	Size = UDim2.new(1, -20, 0, 38),
	Position = UDim2.new(0, 10, 0, 54),
	BackgroundTransparency = 1,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	ScrollBarThickness = 2,
	BorderSizePixel = 0
}, MainFrame)
create("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	Padding = UDim.new(0, 5),
	VerticalAlignment = Enum.VerticalAlignment.Center
}, TabBar)
create("UIPadding", {PaddingLeft = UDim.new(0, 2)}, TabBar)

-- // PAGES HOLDER
local PagesHolder = create("Frame", {
	Size = UDim2.new(1, -20, 1, -106),
	Position = UDim2.new(0, 10, 0, 98),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ClipsDescendants = true
}, MainFrame)

-- // TAB SYSTEM HELPERS
local activeTabBtn = nil

local function switchTab(page, tabBtn)
	for _, child in pairs(PagesHolder:GetChildren()) do
		child.Visible = false
	end
	page.Visible = true
	if activeTabBtn then
		TweenService:Create(activeTabBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(42, 42, 42)}):Play()
	end
	TweenService:Create(tabBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 140, 255)}):Play()
	activeTabBtn = tabBtn
end

local function makeTabButton(label)
	local btn = create("TextButton", {
		Text = label,
		Size = UDim2.new(0, 84, 1, -6),
		BackgroundColor3 = Color3.fromRGB(42, 42, 42),
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		BorderSizePixel = 0,
		AutoButtonColor = false
	}, TabBar)
	create("UICorner", {CornerRadius = UDim.new(0, 6)}, btn)
	btn.MouseEnter:Connect(function()
		if btn ~= activeTabBtn then
			TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(58, 58, 58)}):Play()
		end
	end)
	btn.MouseLeave:Connect(function()
		if btn ~= activeTabBtn then
			TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(42, 42, 42)}):Play()
		end
	end)
	return btn
end

local function makePage()
	local page = create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = Color3.fromRGB(0, 140, 255),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		Visible = false
	}, PagesHolder)
	create("UIListLayout", {Padding = UDim.new(0, 6)}, page)
	create("UIPadding", {
		PaddingTop = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 2),
		PaddingRight = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 8)
	}, page)
	return page
end

local function makeSection(label, page)
	create("TextLabel", {
		Text = "  " .. string.upper(label),
		Size = UDim2.new(1, -8, 0, 24),
		BackgroundColor3 = Color3.fromRGB(0, 100, 200),
		TextColor3 = Color3.fromRGB(200, 225, 255),
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	}, page)
	-- corner on section label via pcall since TextLabels support UICorner
	local last = page:FindFirstChildOfClass("TextLabel")
	if last then create("UICorner", {CornerRadius = UDim.new(0, 5)}, last) end
end

local function makeButton(label, page, callback)
	local btn = create("TextButton", {
		Text = "  " .. label,
		Size = UDim2.new(1, -8, 0, 36),
		BackgroundColor3 = Color3.fromRGB(32, 32, 32),
		TextColor3 = Color3.fromRGB(215, 215, 215),
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0,
		AutoButtonColor = false
	}, page)
	create("UICorner", {CornerRadius = UDim.new(0, 7)}, btn)
	create("UIStroke", {Color = Color3.fromRGB(50, 50, 50), Thickness = 1}, btn)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(48, 48, 48)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}):Play()
	end)
	btn.MouseButton1Click:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.08), {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}):Play()
		task.delay(0.15, function()
			TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}):Play()
		end)
		if callback then
			local s, e = pcall(callback)
			if not s then createNotification("⚠️ Error: " .. tostring(e):sub(1, 40)) end
		end
	end)
	return btn
end

-- // STATE
local flying = false
local flyBody = nil
local flyGyro = nil
local noclipping = false
local noclipConn = nil
local spinning = false
local spinConn = nil
local clickTPActive = false
local clickTPConn = nil
local fireInst = nil
local smokeInst = nil
local sparkleInst = nil

-- // UTILITY GETTERS
local function getChar() return LocalPlayer.Character end
local function getHRP() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end

-- // FLY
local function startFly()
	local hrp = getHRP()
	local hum = getHum()
	if not hrp or not hum then createNotification("❌ No character found") return end
	flying = true
	hum.PlatformStand = true
	flyBody = Instance.new("BodyVelocity")
	flyBody.Velocity = Vector3.zero
	flyBody.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	flyBody.Parent = hrp
	flyGyro = Instance.new("BodyGyro")
	flyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
	flyGyro.P = 1e4
	flyGyro.Parent = hrp
	RunService:BindToRenderStep("FxFly", 300, function()
		if not flying or not hrp or not hrp.Parent then
			RunService:UnbindFromRenderStep("FxFly")
			return
		end
		local cam = workspace.CurrentCamera
		local dir = Vector3.zero
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0,1,0) end
		flyBody.Velocity = dir.Magnitude > 0 and dir.Unit * 65 or Vector3.zero
		flyGyro.CFrame = cam.CFrame
	end)
	createNotification("🛫 Fly ON — WASD + Space/Shift")
end

local function stopFly()
	if not flying then createNotification("Not flying!") return end
	flying = false
	RunService:UnbindFromRenderStep("FxFly")
	local hum = getHum()
	local hrp = getHRP()
	if hum then hum.PlatformStand = false end
	if flyBody then flyBody:Destroy() flyBody = nil end
	if flyGyro then flyGyro:Destroy() flyGyro = nil end
	createNotification("🛬 Fly OFF")
end

-- // NOCLIP
local function startNoclip()
	noclipping = true
	noclipConn = RunService.Stepped:Connect(function()
		if not noclipping then noclipConn:Disconnect() noclipConn = nil return end
		local char = getChar()
		if char then
			for _, p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") then p.CanCollide = false end
			end
		end
	end)
	createNotification("👻 Noclip ON")
end

local function stopNoclip()
	noclipping = false
	if noclipConn then noclipConn:Disconnect() noclipConn = nil end
	createNotification("🧱 Clip ON (collision restored)")
end

-- // SPIN
local function startSpin()
	spinning = true
	spinConn = RunService.RenderStepped:Connect(function()
		if not spinning then spinConn:Disconnect() spinConn = nil return end
		local hrp = getHRP()
		if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(8), 0) end
	end)
	createNotification("🌀 Spin ON")
end

local function stopSpin()
	spinning = false
	if spinConn then spinConn:Disconnect() spinConn = nil end
	createNotification("🛑 Spin OFF")
end

-- // CLICK TP
local function toggleClickTP()
	clickTPActive = not clickTPActive
	if clickTPActive then
		clickTPConn = UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe or not clickTPActive then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local unit = workspace.CurrentCamera:ScreenPointToRay(input.Position.X, input.Position.Y)
				local result = workspace:Raycast(unit.Origin, unit.Direction * 600)
				if result then
					local hrp = getHRP()
					if hrp then hrp.CFrame = CFrame.new(result.Position + Vector3.new(0,3,0)) end
				end
			end
		end)
		createNotification("🖱️ ClickTP ON — click to teleport")
	else
		if clickTPConn then clickTPConn:Disconnect() clickTPConn = nil end
		createNotification("🖱️ ClickTP OFF")
	end
end

-- ======================================================
-- // BUILD ALL TABS
-- ======================================================

-- ============ MAIN TAB ============
local mainTabBtn = makeTabButton("Main")
local mainPage = makePage()
do
	makeSection("Navigation", mainPage)
	makeButton("🏠 Menu", mainPage, function() createNotification("Menu") end)
	makeButton("🏠 Home", mainPage, function() createNotification("Home") end)
	makeButton("👤 Profile", mainPage, function() createNotification("Profile") end)
	makeButton("📊 Stats", mainPage, function()
		local hum = getHum()
		createNotification("HP: "..(hum and math.floor(hum.Health) or "?").."/"
			..(hum and math.floor(hum.MaxHealth) or "?"))
	end)
	makeButton("❓ Help", mainPage, function()
		createNotification("Use the tabs above to find features!")
	end)
	makeSection("Movement", mainPage)
	makeButton("🛫 Fly", mainPage, startFly)
	makeButton("🛬 Unfly", mainPage, stopFly)
	makeButton("👻 Noclip", mainPage, startNoclip)
	makeButton("🧱 Clip", mainPage, stopNoclip)
	makeButton("🌀 Spin", mainPage, startSpin)
	makeButton("🛑 Unspin", mainPage, stopSpin)
	makeButton("🖱️ ClickTP (Toggle)", mainPage, toggleClickTP)
end
mainTabBtn.MouseButton1Click:Connect(function() switchTab(mainPage, mainTabBtn) end)

-- ============ PLAYER TAB ============
local playerTabBtn = makeTabButton("Player")
local playerPage = makePage()
do
	makeSection("Health", playerPage)
	makeButton("😇 God Mode", playerPage, function()
		local hum = getHum()
		if hum then hum.MaxHealth = math.huge hum.Health = math.huge
			createNotification("😇 God Mode ON") end
	end)
	makeButton("💀 UnGod", playerPage, function()
		local hum = getHum()
		if hum then hum.MaxHealth = 100 hum.Health = 100
			createNotification("💀 God Mode OFF") end
	end)
	makeButton("💊 Heal (Full)", playerPage, function()
		local hum = getHum()
		if hum then hum.Health = hum.MaxHealth createNotification("💊 Healed to full!") end
	end)
	makeButton("💥 Damage (25)", playerPage, function()
		local hum = getHum()
		if hum then hum.Health = math.max(0, hum.Health - 25)
			createNotification("💥 Took 25 damage") end
	end)
	makeButton("💀 Respawn", playerPage, function()
		local hum = getHum()
		if hum then hum.Health = 0 createNotification("💀 Respawning...") end
	end)
	makeSection("Appearance", playerPage)
	makeButton("👁️ Invisible", playerPage, function()
		local char = getChar()
		if char then
			for _, p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 1 end
			end
			createNotification("👁️ Invisible ON")
		end
	end)
	makeButton("👁️ Visible", playerPage, function()
		local char = getChar()
		if char then
			for _, p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 0 end
			end
			createNotification("👁️ Visible ON")
		end
	end)
	makeButton("📦 Size Big (x2)", playerPage, function()
		local char = getChar()
		if char then
			for _, p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") then p.Size = p.Size * 2 end
			end
			createNotification("📦 Size: Big")
		end
	end)
	makeButton("📦 Size Small (x0.5)", playerPage, function()
		local char = getChar()
		if char then
			for _, p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") then p.Size = p.Size * 0.5 end
			end
			createNotification("📦 Size: Small")
		end
	end)
	makeButton("📦 Normal Size (rejoin)", playerPage, function()
		createNotification("📦 Rejoin for full size reset")
	end)
	makeSection("Speed & Jump", playerPage)
	makeButton("⚡ Speed x2 (32)", playerPage, function()
		local hum = getHum()
		if hum then hum.WalkSpeed = 32 createNotification("⚡ Speed: 32") end
	end)
	makeButton("⚡ Speed x4 (64)", playerPage, function()
		local hum = getHum()
		if hum then hum.WalkSpeed = 64 createNotification("⚡ Speed: 64") end
	end)
	makeButton("⚡ Speed x8 (128)", playerPage, function()
		local hum = getHum()
		if hum then hum.WalkSpeed = 128 createNotification("⚡ Speed: 128") end
	end)
	makeButton("🐌 Speed Normal (16)", playerPage, function()
		local hum = getHum()
		if hum then hum.WalkSpeed = 16 createNotification("🐌 Speed: Normal") end
	end)
	makeButton("🦘 Jump x2 (100)", playerPage, function()
		local hum = getHum()
		if hum then hum.JumpPower = 100 createNotification("🦘 JumpPower: 100") end
	end)
	makeButton("🦘 Jump x4 (200)", playerPage, function()
		local hum = getHum()
		if hum then hum.JumpPower = 200 createNotification("🦘 JumpPower: 200") end
	end)
	makeButton("🦘 Jump Normal (50)", playerPage, function()
		local hum = getHum()
		if hum then hum.JumpPower = 50 createNotification("🦘 JumpPower: Normal") end
	end)
	makeSection("Pose", playerPage)
	makeButton("🧊 Freeze", playerPage, function()
		local hrp = getHRP()
		if hrp then hrp.Anchored = true createNotification("🧊 Frozen!") end
	end)
	makeButton("🔓 Unfreeze", playerPage, function()
		local hrp = getHRP()
		if hrp then hrp.Anchored = false createNotification("🔓 Unfrozen!") end
	end)
	makeButton("🪑 Sit", playerPage, function()
		local hum = getHum()
		if hum then hum.Sit = true createNotification("🪑 Sitting") end
	end)
	makeButton("🧍 Unsit", playerPage, function()
		local hum = getHum()
		if hum then hum.Sit = false createNotification("🧍 Unsit") end
	end)
end
playerTabBtn.MouseButton1Click:Connect(function() switchTab(playerPage, playerTabBtn) end)

-- ============ MISC TAB ============
local miscTabBtn = makeTabButton("Misc")
local miscPage = makePage()
do
	makeSection("Info", miscPage)
	makeButton("📡 Ping", miscPage, function()
		local ping = LocalPlayer:GetNetworkPing and math.floor(LocalPlayer:GetNetworkPing() * 1000) or "N/A"
		createNotification("📡 Ping: " .. tostring(ping) .. "ms")
	end)
	makeButton("🕒 Time", miscPage, function()
		createNotification("🕒 " .. os.date("%H:%M:%S"))
	end)
	makeButton("📊 Status", miscPage, function()
		local hum = getHum()
		local spd = hum and hum.WalkSpeed or "?"
		local hp = hum and math.floor(hum.Health) or "?"
		createNotification("HP: "..hp.."  Speed: "..tostring(spd))
	end)
	makeSection("Actions", miscPage)
	makeButton("🗑️ Clear", miscPage, function() createNotification("Cleared") end)
	makeButton("🔄 Reset", miscPage, function()
		local hum = getHum()
		if hum then hum.Health = 0 createNotification("🔄 Resetting...") end
	end)
	makeButton("⬅️ Back", miscPage, function() createNotification("Back") end)
	makeButton("🗳️ Vote", miscPage, function() createNotification("🗳️ Voted!") end)
	makeButton("🚨 Report", miscPage, function() createNotification("🚨 Reported.") end)
	makeButton("📨 Invite", miscPage, function() createNotification("📨 Invite sent!") end)
	makeButton("🔔 Notify", miscPage, function() createNotification("🔔 Test notification!") end)
end
miscTabBtn.MouseButton1Click:Connect(function() switchTab(miscPage, miscTabBtn) end)

-- ============ FUN TAB ============
local funTabBtn = makeTabButton("Fun")
local funPage = makePage()
do
	makeSection("Emotes", funPage)
	makeButton("💃 Dance", funPage, function() createNotification("💃 Dance!") end)
	makeButton("😂 Laugh", funPage, function() createNotification("😂 Ha ha ha!") end)
	makeButton("👋 Wave", funPage, function() createNotification("👋 Wave!") end)
	makeButton("👏 Clap", funPage, function() createNotification("👏 Clap!") end)
	makeButton("🌀 Spin", funPage, startSpin)
	makeButton("🛑 Unspin", funPage, stopSpin)
	makeButton("🦘 Jump", funPage, function()
		local hum = getHum()
		if hum then hum.Jump = true end
	end)
	makeButton("🎉 Cheer", funPage, function() createNotification("🎉 Cheer!") end)
	makeButton("🕺 Emote", funPage, function() createNotification("🕺 Emote played!") end)
end
funTabBtn.MouseButton1Click:Connect(function() switchTab(funPage, funTabBtn) end)

-- ============ UTILITY TAB ============
local utilTabBtn = makeTabButton("Utility")
local utilPage = makePage()
do
	makeSection("Teleport", utilPage)
	makeButton("🏠 Goto Spawn", utilPage, function()
		local sp = workspace:FindFirstChild("SpawnLocation")
		local hrp = getHRP()
		if sp and hrp then hrp.CFrame = sp.CFrame + Vector3.new(0,5,0)
			createNotification("🏠 Teleported to spawn")
		else createNotification("No SpawnLocation found") end
	end)
	makeButton("📍 Teleport (0,50,0)", utilPage, function()
		local hrp = getHRP()
		if hrp then hrp.CFrame = CFrame.new(0,50,0)
			createNotification("📍 Teleported to origin") end
	end)
	makeButton("🗺️ GoTo Player", utilPage, function()
		local hrp = getHRP()
		if not hrp then return end
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= LocalPlayer and p.Character then
				local tHRP = p.Character:FindFirstChild("HumanoidRootPart")
				if tHRP then
					hrp.CFrame = tHRP.CFrame + Vector3.new(4,0,0)
					createNotification("🗺️ GoTo: " .. p.Name)
					return
				end
			end
		end
		createNotification("No other players found")
	end)
	makeButton("🏠 Home", utilPage, function() createNotification("Home") end)
	makeButton("📌 Set Home", utilPage, function() createNotification("📌 Home set!") end)
	makeSection("Inventory", utilPage)
	makeButton("🎒 List Tools", utilPage, function()
		local bp = LocalPlayer:FindFirstChild("Backpack")
		if bp then
			local names = {}
			for _, t in pairs(bp:GetChildren()) do table.insert(names, t.Name) end
			createNotification(#names > 0 and "Tools: "..table.concat(names,", ") or "Backpack empty")
		end
	end)
	makeButton("🗑️ Remove Tools", utilPage, function()
		local bp = LocalPlayer:FindFirstChild("Backpack")
		if bp then bp:ClearAllChildren() end
		local char = getChar()
		if char then
			for _, t in pairs(char:GetChildren()) do
				if t:IsA("Tool") then t:Destroy() end
			end
		end
		createNotification("🗑️ All tools removed")
	end)
	makeButton("🛠️ Equip", utilPage, function() createNotification("Equip") end)
	makeButton("❎ Unequip", utilPage, function()
		local char = getChar()
		if char then
			for _, t in pairs(char:GetChildren()) do
				if t:IsA("Tool") then t.Parent = LocalPlayer.Backpack end
			end
			createNotification("❎ Unequipped")
		end
	end)
	makeButton("🗺️ Map", utilPage, function() createNotification("🗺️ Map opened") end)
	makeButton("📦 Inventory", utilPage, function() createNotification("📦 Inventory opened") end)
	makeButton("🔄 Spawn", utilPage, function()
		local hrp = getHRP()
		local sp = workspace:FindFirstChild("SpawnLocation")
		if hrp and sp then hrp.CFrame = sp.CFrame + Vector3.new(0,5,0) end
		createNotification("🔄 Spawned")
	end)
end
utilTabBtn.MouseButton1Click:Connect(function() switchTab(utilPage, utilTabBtn) end)

-- ============ WORLD TAB ============
local worldTabBtn = makeTabButton("World")
local worldPage = makePage()
do
	makeSection("Time", worldPage)
	makeButton("🌅 Day (12:00)", worldPage, function()
		game:GetService("Lighting").TimeOfDay = "12:00:00"
		createNotification("🌅 Time: Day")
	end)
	makeButton("🌙 Night (00:00)", worldPage, function()
		game:GetService("Lighting").TimeOfDay = "00:00:00"
		createNotification("🌙 Time: Night")
	end)
	makeButton("🌇 Sunset (18:00)", worldPage, function()
		game:GetService("Lighting").TimeOfDay = "18:00:00"
		createNotification("🌇 Time: Sunset")
	end)
	makeButton("🌄 Dawn (06:00)", worldPage, function()
		game:GetService("Lighting").TimeOfDay = "06:00:00"
		createNotification("🌄 Time: Dawn")
	end)
	makeSection("Gravity", worldPage)
	makeButton("🌍 Gravity Normal", worldPage, function()
		workspace.Gravity = 196.2
		createNotification("🌍 Gravity: Normal")
	end)
	makeButton("🌕 Low Gravity", worldPage, function()
		workspace.Gravity = 50
		createNotification("🌕 Gravity: Low")
	end)
	makeButton("🚀 Zero Gravity", worldPage, function()
		workspace.Gravity = 5
		createNotification("🚀 Gravity: Near-Zero")
	end)
	makeButton("🏋️ High Gravity", worldPage, function()
		workspace.Gravity = 500
		createNotification("🏋️ Gravity: High")
	end)
	makeSection("Camera", worldPage)
	makeButton("👁️ View 1st Person", worldPage, function()
		LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
		createNotification("👁️ 1st Person")
	end)
	makeButton("👁️ View 3rd Person", worldPage, function()
		LocalPlayer.CameraMode = Enum.CameraMode.Classic
		createNotification("👁️ 3rd Person")
	end)
end
worldTabBtn.MouseButton1Click:Connect(function() switchTab(worldPage, worldTabBtn) end)

-- ============ FX TAB ============
local fxTabBtn = makeTabButton("FX")
local fxPage = makePage()
do
	makeSection("Particle Effects", fxPage)
	makeButton("🔥 Fire ON", fxPage, function()
		local hrp = getHRP()
		if hrp then
			if fireInst then fireInst:Destroy() end
			fireInst = Instance.new("Fire")
			fireInst.Parent = hrp
			createNotification("🔥 Fire ON")
		end
	end)
	makeButton("🔥 Fire OFF", fxPage, function()
		if fireInst then fireInst:Destroy() fireInst = nil end
		local char = getChar()
		if char then
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("Fire") then v:Destroy() end
			end
		end
		createNotification("🔥 Fire OFF")
	end)
	makeButton("💨 Smoke ON", fxPage, function()
		local hrp = getHRP()
		if hrp then
			if smokeInst then smokeInst:Destroy() end
			smokeInst = Instance.new("Smoke")
			smokeInst.Parent = hrp
			createNotification("💨 Smoke ON")
		end
	end)
	makeButton("💨 Smoke OFF", fxPage, function()
		if smokeInst then smokeInst:Destroy() smokeInst = nil end
		local char = getChar()
		if char then
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("Smoke") then v:Destroy() end
			end
		end
		createNotification("💨 Smoke OFF")
	end)
	makeButton("✨ Sparkles ON", fxPage, function()
		local hrp = getHRP()
		if hrp then
			if sparkleInst then sparkleInst:Destroy() end
			sparkleInst = Instance.new("Sparkles")
			sparkleInst.Parent = hrp
			createNotification("✨ Sparkles ON")
		end
	end)
	makeButton("✨ Sparkles OFF", fxPage, function()
		if sparkleInst then sparkleInst:Destroy() sparkleInst = nil end
		local char = getChar()
		if char then
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("Sparkles") then v:Destroy() end
			end
		end
		createNotification("✨ Sparkles OFF")
	end)
	makeSection("Explosions", fxPage)
	makeButton("💣 Explode (No Damage)", fxPage, function()
		local hrp = getHRP()
		if hrp then
			local e = Instance.new("Explosion")
			e.Position = hrp.Position
			e.BlastRadius = 12
			e.BlastPressure = 0
			e.DestroyJointRadiusPercent = 0
			e.Parent = workspace
			createNotification("💣 Boom!")
		end
	end)
end
fxTabBtn.MouseButton1Click:Connect(function() switchTab(fxPage, fxTabBtn) end)

-- ============ INFO TAB ============
local infoTabBtn = makeTabButton("Info")
local infoPage = create("Frame", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Visible = false
}, PagesHolder)
create("UIListLayout", {Padding = UDim.new(0, 10)}, infoPage)
create("UIPadding", {
	PaddingTop = UDim.new(0, 10),
	PaddingLeft = UDim.new(0, 4),
	PaddingRight = UDim.new(0, 6)
}, infoPage)

local creditFrame = create("Frame", {
	Size = UDim2.new(1, -8, 0, 70),
	BackgroundColor3 = Color3.fromRGB(28, 28, 28),
	BorderSizePixel = 0
}, infoPage)
create("UICorner", {CornerRadius = UDim.new(0, 10)}, creditFrame)
create("UIStroke", {Color = Color3.fromRGB(0, 140, 255), Thickness = 1}, creditFrame)
create("TextLabel", {
	Text = "⚡ Made by FxplayzOfficial\n📺 YouTube & 🎮 Roblox",
	Size = UDim2.new(1, -20, 1, 0),
	Position = UDim2.new(0, 10, 0, 0),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left
}, creditFrame)

local discBtn = create("TextButton", {
	Text = "🎮  Join Our Discord Server",
	Size = UDim2.new(1, -8, 0, 48),
	BackgroundColor3 = Color3.fromRGB(88, 101, 242),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	BorderSizePixel = 0,
	AutoButtonColor = false
}, infoPage)
create("UICorner", {CornerRadius = UDim.new(0, 9)}, discBtn)
discBtn.MouseEnter:Connect(function()
	TweenService:Create(discBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(110, 130, 255)}):Play()
end)
discBtn.MouseLeave:Connect(function()
	TweenService:Create(discBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()
end)
discBtn.MouseButton1Click:Connect(function()
	local ok2, err = pcall(function() setclipboard("https://discord.com/invite/SMRh4y2ep") end)
	if ok2 then
		createNotification("✅ Discord link copied to clipboard!")
	else
		createNotification("discord.com/invite/SMRh4y2ep")
	end
end)

create("TextLabel", {
	Text = "v1.0.0  |  FxplayzOfficial Hub",
	Size = UDim2.new(1, -8, 0, 28),
	BackgroundTransparency = 1,
	TextColor3 = Color3.fromRGB(80, 80, 80),
	Font = Enum.Font.Gotham,
	TextSize = 11
}, infoPage)

infoTabBtn.MouseButton1Click:Connect(function() switchTab(infoPage, infoTabBtn) end)

-- ======================================================
-- // DRAGGING
-- ======================================================
local function makeDraggable(frame, handle)
	handle = handle or frame
	local dragging, dragStart, startPos = false, nil, nil
	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end
	end)
end
makeDraggable(MainFrame, TopBar)
makeDraggable(KeyFrame)

-- ======================================================
-- // KEY SYSTEM
-- ======================================================
KeyBtn.MouseButton1Click:Connect(function()
	if KeyBox.Text == correctKey then
		TweenService:Create(KeyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
			Size = UDim2.new(0, 340, 0, 0),
			Position = UDim2.new(0.5, -170, 0.5, 0)
		}):Play()
		task.delay(0.3, function() KeyFrame.Visible = false end)
		MainFrame.Visible = true
		TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
			Size = originalSize
		}):Play()
		switchTab(mainPage, mainTabBtn)
		createNotification("✅ Welcome, " .. LocalPlayer.Name .. "!")
	else
		KeyBox.Text = ""
		KeyBox.PlaceholderText = "❌ Wrong key! Try again..."
		TweenService:Create(KeyFrame, TweenInfo.new(0.05), {Position = UDim2.new(0.5, -160, 0.5, -107)}):Play()
		task.delay(0.05, function()
			TweenService:Create(KeyFrame, TweenInfo.new(0.05), {Position = UDim2.new(0.5, -180, 0.5, -107)}):Play()
			task.delay(0.05, function()
				TweenService:Create(KeyFrame, TweenInfo.new(0.05), {Position = UDim2.new(0.5, -170, 0.5, -107)}):Play()
			end)
		end)
		task.delay(2, function() KeyBox.PlaceholderText = "Enter key here..." end)
	end
end)

-- Also allow pressing Enter in the key box
KeyBox.FocusLost:Connect(function(enter)
	if enter then KeyBtn.MouseButton1Click:Fire() end
end)

-- ======================================================
-- // MINIMIZE / MAXIMIZE
-- ======================================================
MinBtn.MouseButton1Click:Connect(function()
	if isMinimized then return end
	isMinimized = true
	PagesHolder.Visible = false
	TabBar.Visible = false
	TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
		Size = UDim2.new(0, 540, 0, 48)
	}):Play()
end)

MaxBtn.MouseButton1Click:Connect(function()
	if not isMinimized then return end
	isMinimized = false
	TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
		Size = originalSize
	}):Play()
	task.delay(0.15, function()
		PagesHolder.Visible = true
		TabBar.Visible = true
	end)
end)

-- ======================================================
print("[FxplayzOfficial Hub] ✅ Loaded successfully!")
