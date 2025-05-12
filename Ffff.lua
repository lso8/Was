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

-- Надпись By: AXaim
local CreditLabel = Instance.new("TextLabel")
CreditLabel.Name = "CreditLabel"
CreditLabel.Parent = MainFrame
CreditLabel.BackgroundTransparency = 1
CreditLabel.Position = UDim2.new(0, 0, 0, 40)
CreditLabel.Size = UDim2.new(1, 0, 0, 20)
CreditLabel.Font = Enum.Font.GothamBold
CreditLabel.Text = "By: AXaim"
CreditLabel.TextColor3 = Color3.fromRGB(200, 150, 255)
CreditLabel.TextSize = 16
CreditLabel.TextStrokeTransparency = 0.6

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

-- Кнопка Crash
local CrashButton = Instance.new("TextButton")
CrashButton.Name = "CrashButton"
CrashButton.Parent = MainFrame
CrashButton.Position = UDim2.new(0.375, 0, 0.8, 0)
CrashButton.Size = UDim2.new(0.25, 0, 0, 35)
CrashButton.Font = Enum.Font.GothamBold
CrashButton.Text = "Crash"
CrashButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CrashButton.TextSize = 18
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

-- Индикатор состояния (в верхнем левом углу)
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (ошибка)
StatusCircle.Position = UDim2.new(0.05, 0, 0.05, 0)
StatusCircle.Size = UDim2.new(0, 35, 0, 35)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Текст состояния
local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.Parent = MainFrame
StatusText.BackgroundTransparency = 1
StatusText.Position = UDim2.new(0.15, 0, 0.05, 0)
StatusText.Size = UDim2.new(0, 150, 0, 35)
StatusText.Font = Enum.Font.GothamBold
StatusText.TextColor3 = Color3.fromRGB(200, 150, 255)
StatusText.TextSize = 16
StatusText.TextStrokeTransparency = 0.6
StatusText.Visible = false

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

local function pressButton(button)
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local pressTween = TweenService:Create(button, tweenInfo, {Size = UDim2.new(button.Size.X.Scale * 0.95, 0, button.Size.Y.Scale * 0.95, 0)})
    local releaseTween = TweenService:Create(button, tweenInfo, {Size = button.Size})
    pressTween:Play()
    pressTween.Completed:Connect(function()
        releaseTween:Play()
    end)
end

RunButton.MouseEnter:Connect(function() tweenButton(RunButton, UDim2.new(0.27, 0, 0, 37)) end)
RunButton.MouseLeave:Connect(function() resetButton(RunButton, UDim2.new(0.25, 0, 0, 35)) end)
RunButton.MouseButton1Down:Connect(function() pressButton(RunButton) end)

ScriptsButton.MouseEnter:Connect(function() tweenButton(ScriptsButton, UDim2.new(0.27, 0, 0, 37)) end)
ScriptsButton.MouseLeave:Connect(function() resetButton(ScriptsButton, UDim2.new(0.25, 0, 0, 35)) end)
ScriptsButton.MouseButton1Down:Connect(function() pressButton(ScriptsButton) end)

ChatButton.MouseEnter:Connect(function() tweenButton(ChatButton, UDim2.new(0.27, 0, 0, 37)) end)
ChatButton.MouseLeave:Connect(function() resetButton(ChatButton, UDim2.new(0.25, 0, 0, 35)) end)
ChatButton.MouseButton1Down:Connect(function() pressButton(ChatButton) end)

FlyButton.MouseEnter:Connect(function() tweenButton(FlyButton, UDim2.new(0.27, 0, 0, 37)) end)
FlyButton.MouseLeave:Connect(function() resetButton(FlyButton, UDim2.new(0.25, 0, 0, 35)) end)
FlyButton.MouseButton1Down:Connect(function() pressButton(FlyButton) end)

CrashButton.MouseEnter:Connect(function() tweenButton(CrashButton, UDim2.new(0.27, 0, 0, 37)) end)
CrashButton.MouseLeave:Connect(function() resetButton(CrashButton, UDim2.new(0.25, 0, 0, 35)) end)
CrashButton.MouseButton1Down:Connect(function() pressButton(CrashButton) end)

ThemesButton.MouseEnter:Connect(function() tweenButton(ThemesButton, UDim2.new(0.27, 0, 0, 37)) end)
ThemesButton.MouseLeave:Connect(function() resetButton(ThemesButton, UDim2.new(0.25, 0, 0, 35)) end)
ThemesButton.MouseButton1Down:Connect(function() pressButton(ThemesButton) end)

SendButton.MouseEnter:Connect(function() tweenButton(SendButton, UDim2.new(0.32, 0, 0, 37)) end)
SendButton.MouseLeave:Connect(function() resetButton(SendButton, UDim2.new(0.3, 0, 0, 35)) end)
SendButton.MouseButton1Down:Connect(function() pressButton(SendButton) end)

ChatCloseButton.MouseEnter:Connect(function() tweenButton(ChatCloseButton, UDim2.new(0, 27, 0, 27)) end)
ChatCloseButton.MouseLeave:Connect(function() resetButton(ChatCloseButton, UDim2.new(0, 25, 0, 25)) end)
ChatCloseButton.MouseButton1Down:Connect(function() pressButton(ChatCloseButton) end)

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
            desc = "ESP (Wallhack)",
            code = [[local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local function createESP(player)
                if player ~= LocalPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESP"
                        billboard.Parent = head
                        billboard.Size = UDim2.new(0, 100, 0, 30)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        local text = Instance.new("TextLabel")
                        text.Parent = billboard
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.BackgroundTransparency = 1
                        text.Text = player.Name
                        text.TextColor3 = Color3.fromRGB(255, 0, 0)
                        text.TextSize = 14
                        text.Font = Enum.Font.SourceSansBold
                    end
                end
            end
            for _, player in pairs(Players:GetPlayers()) do
                createESP(player)
            end
            Players.PlayerAdded:Connect(createESP)]]
        }
    }
    local selected = scripts[math.random(1, #scripts)]
    CodeInput.Text = "-- " .. selected.desc .. "\n" .. selected.code
end)

-- Логика Fly v3
FlyButton.MouseButton1Click:Connect(function()
    StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый
    local main = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local up = Instance.new("TextButton")
    local down = Instance.new("TextButton")
    local onof = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local plus = Instance.new("TextButton")
    local speed = Instance.new("TextLabel")
    local mine = Instance.new("TextButton")
    local closebutton = Instance.new("TextButton")
    local mini = Instance.new("TextButton")
    local mini2 = Instance.new("TextButton") 

    main.Name = "main"
    main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main.ResetOnSpawn = false 

    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
    Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
    Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
    Frame.Size = UDim2.new(0, 190, 0, 57) 

    up.Name = "up"
    up.Parent = Frame
    up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
    up.Size = UDim2.new(0, 44, 0, 28)
    up.Font = Enum.Font.SourceSans
    up.Text = "UP"
    up.TextColor3 = Color3.fromRGB(0, 0, 0)
    up.TextSize = 14.000 

    down.Name = "down"
    down.Parent = Frame
    down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
    down.Position = UDim2.new(0, 0, 0.491228074, 0)
    down.Size = UDim2.new(0, 44, 0, 28)
    down.Font = Enum.Font.SourceSans
    down.Text = "DOWN"
    down.TextColor3 = Color3.fromRGB(0, 0, 0)
    down.TextSize = 14.000 

    onof.Name = "onof"
    onof.Parent = Frame
    onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
    onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
    onof.Size = UDim2.new(0, 56, 0, 28)
    onof.Font = Enum.Font.SourceSans
    onof.Text = "fly"
    onof.TextColor3 = Color3.fromRGB(0, 0, 0)
    onof.TextSize = 14.000 

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
    TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 0, 28)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Fly GUI V3"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true 

    plus.Name = "plus"
    plus.Parent = Frame
    plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
    plus.Position = UDim2.new(0.231578946, 0, 0, 0)
    plus.Size = UDim2.new(0, 45, 0, 28)
    plus.Font = Enum.Font.SourceSans
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(0, 0, 0)
    plus.TextScaled = true
    plus.TextSize = 14.000
    plus.TextWrapped = true 

    speed.Name = "speed"
    speed.Parent = Frame
    speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
    speed.Size = UDim2.new(0, 44, 0, 28)
    speed.Font = Enum.Font.SourceSans
    speed.Text = "1"
    speed.TextColor3 = Color3.fromRGB(0, 0, 0)
    speed.TextScaled = true
    speed.TextSize = 14.000
    speed.TextWrapped = true 

    mine.Name = "mine"
    mine.Parent = Frame
    mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
    mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
    mine.Size = UDim2.new(0, 45, 0, 29)
    mine.Font = Enum.Font.SourceSans
    mine.Text = "-"
    mine.TextColor3 = Color3.fromRGB(0, 0, 0)
    mine.TextScaled = true
    mine.TextSize = 14.000
    mine.TextWrapped = true 

    closebutton.Name = "Close"
    closebutton.Parent = main.Frame
    closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
    closebutton.Font = "SourceSans"
    closebutton.Size = UDim2.new(0, 45, 0, 28)
    closebutton.Text = "X"
    closebutton.TextSize = 30
    closebutton.Position = UDim2.new(0, 0, -1, 27) 

    mini.Name = "minimize"
    mini.Parent = main.Frame
    mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini.Font = "SourceSans"
    mini.Size = UDim2.new(0, 45, 0, 28)
    mini.Text = "-"
    mini.TextSize = 40
    mini.Position = UDim2.new(0, 44, -1, 27) 

    mini2.Name = "minimize2"
    mini2.Parent = main.Frame
    mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini2.Font = "SourceSans"
    mini2.Size = UDim2.new(0, 45, 0, 28)
    mini2.Text = "+"
    mini2.TextSize = 40
    mini2.Position = UDim2.new(0, 44, -1, 57)
    mini2.Visible = false 

    speeds = 1 

    local speaker = game:GetService("Players").LocalPlayer 

    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") 

    nowe = false 

    game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "Fly GUI V3";
    Text = "By me_ozone and Quandale The Dinglish XII#3550";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
    Duration = 5; 

    Frame.Active = true -- main = gui
    Frame.Draggable = true 

    onof.MouseButton1Down:connect(function() 

    if nowe == true then
    nowe = false 

    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
    speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
    nowe = true

    for i = 1, speeds do
    spawn(function() 

    local hb = game:GetService("RunService").Heartbeat

    tpwalking = true
    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
    if hum.MoveDirection.Magnitude > 0 then
    chr:TranslateBy(hum.MoveDirection)
    end
    end 

    end)
    end
    game.Players.LocalPlayer.Character.Animate.Disabled = true
    local Char = game.Players.LocalPlayer.Character
    local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController") 

    for i,v in next, Hum:GetPlayingAnimationTracks() do
    v:AdjustSpeed(0)
    end
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
    speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end

    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then

    local plr = game.Players.LocalPlayer
    local torso = plr.Character.Torso
    local flying = true
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local maxspeed = 50
    local speed = 0

    local bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame
    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    if nowe == true then
    plr.Character.Humanoid.PlatformStand = true
    end
    while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
    game:GetService("RunService").RenderStepped:Wait() 

    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
    speed = speed+.5+(speed/maxspeed)
    if speed > maxspeed then
    speed = maxspeed
    end
    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
    speed = speed-1
    if speed < 0 then
    speed = 0
    end
    end
    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
    else
    bv.velocity = Vector3.new(0,0,0)
    end
    bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
    end
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    plr.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false
    tpwalking = false

    else
    local plr = game.Players.LocalPlayer
    local UpperTorso = plr.Character.UpperTorso
    local flying = true
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local maxspeed = 50
    local speed = 0

    local bg = Instance.new("BodyGyro", UpperTorso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = UpperTorso.CFrame
    local bv = Instance.new("BodyVelocity", UpperTorso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    if nowe == true then
    plr.Character.Humanoid.PlatformStand = true
    end
    while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
    wait() 

    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
    speed = speed+.5+(speed/maxspeed)
    if speed > maxspeed then
    speed = maxspeed
    end
    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
    speed = speed-1
    if speed < 0 then
    speed = 0
    end
    end
    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
    else
    bv.velocity = Vector3.new(0,0,0)
    end 

    bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
    end
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    plr.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false
    tpwalking = false

    end

    end) 

    local tis 

    up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
    while tis do
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
    end
    end)
    end) 

    up.MouseLeave:connect(function()
    if tis then
    tis:Disconnect()
    tis = nil
    end
    end) 

    local dis 

    down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
    while dis do
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
    end
    end)
    end) 

    down.MouseLeave:connect(function()
    if dis then
    dis:Disconnect()
    dis = nil
    end
    end)

    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false 

    end)

    plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if nowe == true then

    tpwalking = false
    for i = 1, speeds do
    spawn(function() 

    local hb = game:GetService("RunService").Heartbeat

    tpwalking = true
    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
    if hum.MoveDirection.Magnitude > 0 then
    chr:TranslateBy(hum.MoveDirection)
    end
    end 

    end)
    end
    end
    end)
    mine.MouseButton1Down:connect(function()
    if speeds == 1 then
    speed.Text = 'cannot be less than 1'
    wait(1)
    speed.Text = speeds
    else
    speeds = speeds - 1
    speed.Text = speeds
    if nowe == true then
    tpwalking = false
    for i = 1, speeds do
    spawn(function() 

    local hb = game:GetService("RunService").Heartbeat

    tpwalking = true
    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
    if hum.MoveDirection.Magnitude > 0 then
    chr:TranslateBy(hum.MoveDirection)
    end
    end 

    end)
    end
    end
    end
    end) 

    closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
    end) 

    mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    main.Frame.BackgroundTransparency = 1
    closebutton.Position = UDim2.new(0, 0, -1, 57)
    end) 

    mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    main.Frame.BackgroundTransparency = 0 
    closebutton.Position = UDim2.new(0, 0, -1, 27)
    end)
end)

-- Логика Crash
CrashButton.MouseButton1Click:Connect(function()
    StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый
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
        ChatGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 20, 120)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 40, 160))
        })
        Title.TextColor3 = Color3.fromRGB(200, 150, 255)
        CodeInput.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
        CodeInput.TextColor3 = Color3.fromRGB(220, 220, 220)
        ChatDisplay.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
        ChatInput.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
    else
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 40)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 40, 80))
        })
        ChatGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 35, 55)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 65, 85))
        })
        Title.TextColor3 = Color3.fromRGB(200, 150, 255)
        CodeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        CodeInput.TextColor3 = Color3.fromRGB(200, 200, 200)
        ChatDisplay.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
        ChatInput.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
    end
    StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый
end)

-- Логика статуса
StatusCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        StatusText.Visible = true
        if StatusCircle.BackgroundColor3 == Color3.fromRGB(0, 255, 0) then
            StatusText.Text = "Все работает"
        elseif StatusCircle.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
            StatusText.Text = "Не работает"
        elseif StatusCircle.BackgroundColor3 == Color3.fromRGB(255, 255, 0) then
            StatusText.Text = "Загрузка"
        end
    end
end)

StatusCircle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        StatusText.Visible = false
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
