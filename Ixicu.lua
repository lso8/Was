local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Создаем основной GUI
local ExecutorGui = Instance.new("ScreenGui")
ExecutorGui.Name = "xAI_Executor"
ExecutorGui.Parent = CoreGui
ExecutorGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ExecutorGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Градиент
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 40, 80))
})
Gradient.Rotation = 45
Gradient.Parent = MainFrame

-- Скругленные углы
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "xAI Executor v1"
Title.TextColor3 = Color3.fromRGB(200, 150, 255)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.6

-- Поле ввода кода
local CodeInput = Instance.new("TextBox")
CodeInput.Name = "CodeInput"
CodeInput.Parent = MainFrame
CodeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
CodeInput.Position = UDim2.new(0.1, 0, 0.2, 0)
CodeInput.Size = UDim2.new(0.8, 0, 0.4, 0)
CodeInput.Font = Enum.Font.Gotham
CodeInput.PlaceholderText = "Enter your script here..."
CodeInput.Text = ""
CodeInput.TextColor3 = Color3.fromRGB(200, 200, 200)
CodeInput.TextSize = 14
CodeInput.TextWrapped = true
CodeInput.MultiLine = true
local CodeCorner = Instance.new("UICorner")
CodeCorner.CornerRadius = UDim.new(0, 8)
CodeCorner.Parent = CodeInput

-- Кнопка Run
local RunButton = Instance.new("TextButton")
RunButton.Name = "RunButton"
RunButton.Parent = MainFrame
RunButton.Position = UDim2.new(0.1, 0, 0.65, 0)
RunButton.Size = UDim2.new(0.25, 0, 0, 35)
RunButton.Font = Enum.Font.GothamBold
RunButton.Text = "Run"
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.TextSize = 18
local RunGradient = Instance.new("UIGradient")
RunGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 180, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 80))
})
RunGradient.Parent = RunButton
local RunCorner = Instance.new("UICorner")
RunCorner.CornerRadius = UDim.new(0, 10)
RunCorner.Parent = RunButton

-- Кнопка Scripts
local ScriptsButton = Instance.new("TextButton")
ScriptsButton.Name = "ScriptsButton"
ScriptsButton.Parent = MainFrame
ScriptsButton.Position = UDim2.new(0.375, 0, 0.65, 0)
ScriptsButton.Size = UDim2.new(0.25, 0, 0, 35)
ScriptsButton.Font = Enum.Font.GothamBold
ScriptsButton.Text = "Scripts"
ScriptsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptsButton.TextSize = 18
local ScriptsGradient = Instance.new("UIGradient")
ScriptsGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 60, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 40, 120))
})
ScriptsGradient.Parent = ScriptsButton
local ScriptsCorner = Instance.new("UICorner")
ScriptsCorner.CornerRadius = UDim.new(0, 10)
ScriptsCorner.Parent = ScriptsButton

-- Кнопка Chat
local ChatButton = Instance.new("TextButton")
ChatButton.Name = "ChatButton"
ChatButton.Parent = MainFrame
ChatButton.Position = UDim2.new(0.65, 0, 0.65, 0)
ChatButton.Size = UDim2.new(0.25, 0, 0, 35)
ChatButton.Font = Enum.Font.GothamBold
ChatButton.Text = "Chat"
ChatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatButton.TextSize = 18
local ChatGradient = Instance.new("UIGradient")
ChatGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 120, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 80, 120))
})
ChatGradient.Parent = ChatButton
local ChatCorner = Instance.new("UICorner")
ChatCorner.CornerRadius = UDim.new(0, 10)
ChatCorner.Parent = ChatButton

-- Кнопка Fly v3
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Parent = MainFrame
FlyButton.Position = UDim2.new(0.1, 0, 0.8, 0)
FlyButton.Size = UDim2.new(0.25, 0, 0, 35)
FlyButton.Font = Enum.Font.GothamBold
FlyButton.Text = "Fly v3"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextSize = 18
local FlyGradient = Instance.new("UIGradient")
FlyGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 150))
})
FlyGradient.Parent = FlyButton
local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 10)
FlyCorner.Parent = FlyButton

-- Кнопка Crash - Bolz Prison Life
local CrashButton = Instance.new("TextButton")
CrashButton.Name = "CrashButton"
CrashButton.Parent = MainFrame
CrashButton.Position = UDim2.new(0.375, 0, 0.8, 0)
CrashButton.Size = UDim2.new(0.25, 0, 0, 35)
CrashButton.Font = Enum.Font.GothamBold
CrashButton.Text = "Crash - Bolz Prison Life"
CrashButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CrashButton.TextSize = 14
local CrashGradient = Instance.new("UIGradient")
CrashGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 30, 30))
})
CrashGradient.Parent = CrashButton
local CrashCorner = Instance.new("UICorner")
CrashCorner.CornerRadius = UDim.new(0, 10)
CrashCorner.Parent = CrashButton

-- Кнопка Themes
local ThemesButton = Instance.new("TextButton")
ThemesButton.Name = "ThemesButton"
ThemesButton.Parent = MainFrame
ThemesButton.Position = UDim2.new(0.65, 0, 0.8, 0)
ThemesButton.Size = UDim2.new(0.25, 0, 0, 35)
ThemesButton.Font = Enum.Font.GothamBold
ThemesButton.Text = "Themes"
ThemesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemesButton.TextSize = 18
local ThemesGradient = Instance.new("UIGradient")
ThemesGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 60, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 40, 80))
})
ThemesGradient.Parent = ThemesButton
local ThemesCorner = Instance.new("UICorner")
ThemesCorner.CornerRadius = UDim.new(0, 10)
ThemesCorner.Parent = ThemesButton

-- Индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (ошибка)
StatusCircle.Position = UDim2.new(0.9, -20, 0.65, 0)
StatusCircle.Size = UDim2.new(0, 35, 0, 35)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- GUI для чата
local ChatGui = Instance.new("Frame")
ChatGui.Name = "ChatGui"
ChatGui.Parent = ExecutorGui
ChatGui.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
ChatGui.BorderSizePixel = 0
ChatGui.Position = UDim2.new(0.5, -175, 0.5, -125)
ChatGui.Size = UDim2.new(0, 350, 0, 250)
ChatGui.Visible = false
ChatGui.Active = true
ChatGui.Draggable = true
local ChatGradient = Instance.new("UIGradient")
ChatGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 35, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 65, 85))
})
ChatGradient.Rotation = 90
ChatGradient.Parent = ChatGui
local ChatCorner = Instance.new("UICorner")
ChatCorner.CornerRadius = UDim.new(0, 15)
ChatCorner.Parent = ChatGui

local ChatTitle = Instance.new("TextLabel")
ChatTitle.Name = "ChatTitle"
ChatTitle.Parent = ChatGui
ChatTitle.BackgroundTransparency = 1
ChatTitle.Size = UDim2.new(1, 0, 0, 35)
ChatTitle.Font = Enum.Font.GothamBold
ChatTitle.Text = "Custom Chat"
ChatTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
ChatTitle.TextSize = 22
ChatTitle.TextStrokeTransparency = 0.6

-- Поле для отображения сообщений
local ChatDisplay = Instance.new("ScrollingFrame")
ChatDisplay.Name = "ChatDisplay"
ChatDisplay.Parent = ChatGui
ChatDisplay.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
ChatDisplay.Position = UDim2.new(0.1, 0, 0.2, 0)
ChatDisplay.Size = UDim2.new(0.8, 0, 0.4, 0)
ChatDisplay.CanvasSize = UDim2.new(0, 0, 0, 0)
ChatDisplay.ScrollBarThickness = 5
local ChatDisplayCorner = Instance.new("UICorner")
ChatDisplayCorner.CornerRadius = UDim.new(0, 8)
ChatDisplayCorner.Parent = ChatDisplay
local ChatDisplayLayout = Instance.new("UIListLayout")
ChatDisplayLayout.Parent = ChatDisplay
ChatDisplayLayout.SortOrder = Enum.SortOrder.LayoutOrder
ChatDisplayLayout.Padding = UDim.new(0, 5)

local ChatInput = Instance.new("TextBox")
ChatInput.Name = "ChatInput"
ChatInput.Parent = ChatGui
ChatInput.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
ChatInput.Position = UDim2.new(0.1, 0, 0.65, 0)
ChatInput.Size = UDim2.new(0.8, 0, 0, 35)
ChatInput.Font = Enum.Font.Gotham
ChatInput.PlaceholderText = "Type your message..."
ChatInput.Text = ""
ChatInput.TextColor3 = Color3.fromRGB(200, 200, 200)
ChatInput.TextSize = 14
local ChatInputCorner = Instance.new("UICorner")
ChatInputCorner.CornerRadius = UDim.new(0, 8)
ChatInputCorner.Parent = ChatInput

local SendButton = Instance.new("TextButton")
SendButton.Name = "SendButton"
SendButton.Parent = ChatGui
SendButton.Position = UDim2.new(0.35, 0, 0.8, 0)
SendButton.Size = UDim2.new(0.3, 0, 0, 35)
SendButton.Font = Enum.Font.GothamBold
SendButton.Text = "Send"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 16
local SendGradient = Instance.new("UIGradient")
SendGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 60))
})
SendGradient.Parent = SendButton
local SendCorner = Instance.new("UICorner")
SendCorner.CornerRadius = UDim.new(0, 10)
SendCorner.Parent = SendButton

local ChatCloseButton = Instance.new("TextButton")
ChatCloseButton.Name = "ChatCloseButton"
ChatCloseButton.Parent = ChatGui
ChatCloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
ChatCloseButton.Position = UDim2.new(0.9, -35, 0.05, 0)
ChatCloseButton.Size = UDim2.new(0, 25, 0, 25)
ChatCloseButton.Font = Enum.Font.GothamBold
ChatCloseButton.Text = "X"
ChatCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatCloseButton.TextSize = 16
local ChatCloseCorner = Instance.new("UICorner")
ChatCloseCorner.CornerRadius = UDim.new(0, 8)
ChatCloseCorner.Parent = ChatCloseButton

-- Анимация кнопок
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(button, tweenInfo, {Size = scale})
    local glow = Instance.new("UIStroke")
    glow.Name = "Glow"
    glow.Parent = button
    glow.Thickness = 2
    glow.Color = Color3.fromRGB(255, 255, 255)
    glow.Transparency = 1
    local glowTween = TweenService:Create(glow, tweenInfo, {Transparency = 0})
    sizeTween:Play()
    glowTween:Play()
end

local function resetButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(button, tweenInfo, {Size = scale})
    local glow = button:FindFirstChild("Glow")
    if glow then
        local glowTween = TweenService:Create(glow, tweenInfo, {Transparency = 1})
        glowTween:Play()
    end
    sizeTween:Play()
end

RunButton.MouseEnter:Connect(function() tweenButton(RunButton, UDim2.new(0.27, 0, 0, 37)) end)
RunButton.MouseLeave:Connect(function() resetButton(RunButton, UDim2.new(0.25, 0, 0, 35)) end)

ScriptsButton.MouseEnter:Connect(function() tweenButton(ScriptsButton, UDim2.new(0.27, 0, 0, 37)) end)
ScriptsButton.MouseLeave:Connect(function() resetButton(ScriptsButton, UDim2.new(0.25, 0, 0, 35)) end)

ChatButton.MouseEnter:Connect(function() tweenButton(ChatButton, UDim2.new(0.27, 0, 0, 37)) end)
ChatButton.MouseLeave:Connect(function() resetButton(ChatButton, UDim2.new(0.25, 0, 0, 35)) end)

FlyButton.MouseEnter:Connect(function() tweenButton(FlyButton, UDim2.new(0.27, 0, 0, 37)) end)
FlyButton.MouseLeave:Connect(function() resetButton(FlyButton, UDim2.new(0.25, 0, 0, 35)) end)

CrashButton.MouseEnter:Connect(function() tweenButton(CrashButton, UDim2.new(0.27, 0, 0, 37)) end)
CrashButton.MouseLeave:Connect(function() resetButton(CrashButton, UDim2.new(0.25, 0, 0, 35)) end)

ThemesButton.MouseEnter:Connect(function() tweenButton(ThemesButton, UDim2.new(0.27, 0, 0, 37)) end)
ThemesButton.MouseLeave:Connect(function() resetButton(ThemesButton, UDim2.new(0.25, 0, 0, 35)) end)

SendButton.MouseEnter:Connect(function() tweenButton(SendButton, UDim2.new(0.32, 0, 0, 37)) end)
SendButton.MouseLeave:Connect(function() resetButton(SendButton, UDim2.new(0.3, 0, 0, 35)) end)

ChatCloseButton.MouseEnter:Connect(function() tweenButton(ChatCloseButton, UDim2.new(0, 27, 0, 27)) end)
ChatCloseButton.MouseLeave:Connect(function() resetButton(ChatCloseButton, UDim2.new(0, 25, 0, 25)) end)

-- Логика выполнения кода
RunButton.MouseButton1Click:Connect(function()
    if CodeInput.Text ~= "" then
        StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Желтый (выполнение)
        local success, result = pcall(function()
            return loadstring(CodeInput.Text)()
        end)
        if success then
            StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (успех)
        else
            StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (ошибка)
            warn("Execution failed: " .. tostring(result))
        end
    end
end)

ScriptsButton.MouseButton1Click:Connect(function()
    local scripts = {
        {
            desc = "Test Print",
            code = [[print("Hello from xAI Executor!")]]
        },
        {
            desc = "Super Speed",
            code = [[game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100]]
        },
        {
            desc = "Infinite Jumps",
            code = [[local UserInputService = game:GetService("UserInputService")
            local LocalPlayer = game.Players.LocalPlayer
            UserInputService.JumpRequest:Connect(function()
                if LocalPlayer.Character then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)]]
        },
        {
            desc = "Fly v3",
            code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()]]
        }
    }
    local selected = scripts[math.random(1, #scripts)]
    CodeInput.Text = "-- " .. selected.desc .. "\n" .. selected.code
end)

-- Логика Crash - Bolz Prison Life
CrashButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sauce-boss01/prison-life-crasher/main/crasher", true))()
end)

-- Логика тем
local isPurple = false
ThemesButton.MouseButton1Click:Connect(function()
    isPurple = not isPurple
    if isPurple then
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 40, 160)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 20, 120))
        })
        Title.TextColor3 = Color3.fromRGB(200, 150, 255)
        CodeInput.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
        CodeInput.TextColor3 = Color3.fromRGB(220, 220, 220)
    else
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 40)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 40, 80))
        })
        Title.TextColor3 = Color3.fromRGB(200, 150, 255)
        CodeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        CodeInput.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- Логика чата (изолированный)
ChatButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ChatGui.Visible = true
end)

local function addMessage(player, message)
    local frame = Instance.new("Frame")
    frame.Parent = ChatDisplay
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 0, 25)

    -- Иконка игрока (скин головы)
    local userId = player.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size48x48
    local image, _ = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    
    local icon = Instance.new("ImageLabel")
    icon.Parent = frame
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0.85, 0, 0, 0)
    icon.Size = UDim2.new(0, 25, 0, 25)
    icon.Image = image
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(1, 0)
    iconCorner.Parent = icon

    -- Текст сообщения
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Parent = frame
    messageLabel.BackgroundTransparency = 1
    messageLabel.Size = UDim2.new(0.8, 0, 1, 0)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.Text = player.Name .. ": " .. message
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageLabel.TextSize = 14
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextWrapped = true

    -- Обновление CanvasSize
    ChatDisplay.CanvasSize = UDim2.new(0, 0, 0, ChatDisplayLayout.AbsoluteContentSize.Y)
end

-- Система изолированного чата
local chatNetwork = Instance.new("RemoteEvent")
chatNetwork.Name = "xAI_ChatNetwork"
chatNetwork.Parent = game:GetService("ReplicatedStorage")

SendButton.MouseButton1Click:Connect(function()
    if ChatInput.Text ~= "" then
        local message = ChatInput.Text
        ChatInput.Text = ""
        addMessage(LocalPlayer, message)
        chatNetwork:FireAllClients(LocalPlayer, message)
    end
end)

ChatInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        SendButton:FireEvent("MouseButton1Click")
    end
end)

chatNetwork.OnClientEvent:Connect(function(sender, message)
    if sender ~= LocalPlayer then
        addMessage(sender, message)
    end
end)

ChatCloseButton.MouseButton1Click:Connect(function()
    ChatGui.Visible = false
    MainFrame.Visible = true
end)
