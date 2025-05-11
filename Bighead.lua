local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESPGui"
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 182, 193)
mainFrame.Parent = screenGui

-- Add Rounded Corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = mainFrame

-- Create ESP Button
local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(0, 80, 0, 40)
espButton.Position = UDim2.new(0.25, -40, 0.5, -20)
espButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
espButton.BackgroundTransparency = 0.5
espButton.BorderSizePixel = 2
espButton.BorderColor3 = Color3.fromRGB(255, 182, 193)
espButton.Text = "ESP"
espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espButton.Font = Enum.Font.SourceSansBold
espButton.TextSize = 20
espButton.Parent = mainFrame

-- Add Rounded Corners to ESP Button
local espButtonCorner = Instance.new("UICorner")
espButtonCorner.CornerRadius = UDim.new(0, 10)
espButtonCorner.Parent = espButton

-- Create AIM Button
local aimButton = Instance.new("TextButton")
aimButton.Size = UDim2.new(0, 80, 0, 40)
aimButton.Position = UDim2.new(0.75, -40, 0.5, -20)
aimButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
aimButton.BackgroundTransparency = 0.5
aimButton.BorderSizePixel = 2
aimButton.BorderColor3 = Color3.fromRGB(255, 182, 193)
aimButton.Text = "AIM"
aimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimButton.Font = Enum.Font.SourceSansBold
aimButton.TextSize = 20
aimButton.Parent = mainFrame

-- Add Rounded Corners to AIM Button
local aimButtonCorner = Instance.new("UICorner")
aimButtonCorner.CornerRadius = UDim.new(0, 10)
aimButtonCorner.Parent = aimButton

-- Create Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -40, 0, 10)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
minimizeButton.BackgroundTransparency = 0.5
minimizeButton.BorderSizePixel = 2
minimizeButton.BorderColor3 = Color3.fromRGB(255, 182, 193)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20
minimizeButton.Parent = mainFrame

-- Add Rounded Corners to Minimize Button
local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 15)
minimizeCorner.Parent = minimizeButton

-- Create Minimized Circle
local minimizedCircle = Instance.new("Frame")
minimizedCircle.Size = UDim2.new(0, 50, 0, 50)
minimizedCircle.Position = UDim2.new(0.5, -25, 0.5, -25)
minimizedCircle.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
minimizedCircle.BackgroundTransparency = 0.7
minimizedCircle.BorderSizePixel = 2
minimizedCircle.BorderColor3 = Color3.fromRGB(255, 182, 193)
minimizedCircle.Visible = false
minimizedCircle.Parent = screenGui

-- Add Rounded Corners to Circle
local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(0, 25)
circleCorner.Parent = minimizedCircle

-- Create Notification
local notification = Instance.new("TextLabel")
notification.Size = UDim2.new(0, 100, 0, 30)
notification.Position = UDim2.new(1, -110, 1, -40)
notification.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
notification.BackgroundTransparency = 0.5
notification.BorderSizePixel = 2
notification.BorderColor3 = Color3.fromRGB(255, 182, 193)
notification.Text = "By: Artem"
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.Font = Enum.Font.SourceSansBold
notification.TextSize = 16
notification.Parent = screenGui

-- Add Rounded Corners to Notification
local notificationCorner = Instance.new("UICorner")
notificationCorner.CornerRadius = UDim.new(0, 10)
notificationCorner.Parent = notification

-- Fade out notification after 5 seconds
spawn(function()
    wait(5)
    for i = 0.5, 1, 0.05 do
        notification.BackgroundTransparency = i
        notification.TextTransparency = i - 0.5
        wait(0.1)
    end
    notification:Destroy()
end)

-- ESP Functionality
local espEnabled = false
local highlights = {}

local function createESP(player)
    if player.Character and player ~= Players.LocalPlayer then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(138, 43, 226)
        highlight.FillTransparency = 0.7
        highlight.OutlineColor = Color3.fromRGB(138, 43, 226)
        highlight.OutlineTransparency = 0.3
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = player.Character
        highlights[player] = highlight
    end
end

local function removeESP(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            createESP(player)
        end
    else
        for player, _ in pairs(highlights) do
            removeESP(player)
        end
    end
end

-- Update ESP for new players
Players.PlayerAdded:Connect(function(player)
    if espEnabled then
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- Connect ESP Button
espButton.MouseButton1Click:Connect(toggleESP)

-- AIM Functionality
local aimEnabled = false
local headSize = 10
local originalHeads = {}

local function modifyHead(player)
    if player.Character and player ~= Players.LocalPlayer then
        local head = player.Character:FindFirstChild("Head")
        if head then
            if not originalHeads[player] then
                originalHeads[player] = {
                    Size = head.Size,
                    Transparency = head.Transparency,
                    BrickColor = head.BrickColor,
                    Material = head.Material,
                    CanCollide = head.CanCollide,
                    Massless = head.Massless
                }
            end
            pcall(function()
                head.Size = Vector3.new(headSize, headSize, headSize)
                head.Transparency = 1
                head.BrickColor = BrickColor.new("Red")
                head.Material = "Neon"
                head.CanCollide = false
                head.Massless = true
            end)
        end
    end
end

local function restoreHead(player)
    if player.Character and originalHeads[player] then
        local head = player.Character:FindFirstChild("Head")
        if head then
            pcall(function()
                head.Size = originalHeads[player].Size
                head.Transparency = originalHeads[player].Transparency
                head.BrickColor = originalHeads[player].BrickColor
                head.Material = originalHeads[player].Material
                head.CanCollide = originalHeads[player].CanCollide
                head.Massless = originalHeads[player].Massless
            end)
        end
        originalHeads[player] = nil
    end
end

local function toggleAIM()
    aimEnabled = not aimEnabled
    if aimEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            modifyHead(player)
        end
        RunService:BindToRenderStep("HeadModifier", Enum.RenderPriority.Character.Value, function()
            for _, player in pairs(Players:GetPlayers()) do
                modifyHead(player)
            end
        end)
    else
        for _, player in pairs(Players:GetPlayers()) do
            restoreHead(player)
        end
        RunService:UnbindFromRenderStep("HeadModifier")
    end
end

-- Update AIM for new players
Players.PlayerAdded:Connect(function(player)
    if aimEnabled then
        player.CharacterAdded:Connect(function()
            modifyHead(player)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    restoreHead(player)
end)

-- Connect AIM Button
aimButton.MouseButton1Click:Connect(toggleAIM)

-- Minimize Functionality
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    mainFrame.Visible = not minimized
    minimizedCircle.Visible = minimized
    minimizeButton.Text = minimized and "+" or "-"
end)

-- Dragging Functionality
local function makeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(mainFrame)
makeDraggable(minimizedCircle)

-- Reopen GUI when clicking minimized circle
minimizedCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        minimized = false
        mainFrame.Visible = true
        minimizedCircle.Visible = false
        minimizeButton.Text = "-"
    end
end)
