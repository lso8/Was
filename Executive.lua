local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

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
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.Size = UDim2.new(0, 450, 0, 350)
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
RunButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
RunButton.Position = UDim2.new(0.2, 0, 0.65, 0)
RunButton.Size = UDim2.new(0.25, 0, 0, 40)
RunButton.Font = Enum.Font.GothamBold
RunButton.Text = "Run"
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.TextSize = 18
local RunCorner = Instance.new("UICorner")
RunCorner.CornerRadius = UDim.new(0, 10)
RunCorner.Parent = RunButton

-- Кнопка Scripts
local ScriptsButton = Instance.new("TextButton")
ScriptsButton.Name = "ScriptsButton"
ScriptsButton.Parent = MainFrame
ScriptsButton.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
ScriptsButton.Position = UDim2.new(0.55, 0, 0.65, 0)
ScriptsButton.Size = UDim2.new(0.25, 0, 0, 40)
ScriptsButton.Font = Enum.Font.GothamBold
ScriptsButton.Text = "Scripts"
ScriptsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptsButton.TextSize = 18
local ScriptsCorner = Instance.new("UICorner")
ScriptsCorner.CornerRadius = UDim.new(0, 10)
ScriptsCorner.Parent = ScriptsButton

-- Индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (ошибка)
StatusCircle.Position = UDim2.new(0.85, -20, 0.65, 0)
StatusCircle.Size = UDim2.new(0, 40, 0, 40)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Кнопка Theme
local ThemeButton = Instance.new("TextButton")
ThemeButton.Name = "ThemeButton"
ThemeButton.Parent = MainFrame
ThemeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 100)
ThemeButton.Position = UDim2.new(0.375, 0, 0.8, 0)
ThemeButton.Size = UDim2.new(0.25, 0, 0, 40)
ThemeButton.Font = Enum.Font.GothamBold
ThemeButton.Text = "Theme"
ThemeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeButton.TextSize = 18
local ThemeCorner = Instance.new("UICorner")
ThemeCorner.CornerRadius = UDim.new(0, 10)
ThemeCorner.Parent = ThemeButton

-- Сворачиваемая иконка
local MinimizeIcon = Instance.new("Frame")
MinimizeIcon.Name = "MinimizeIcon"
MinimizeIcon.Parent = ExecutorGui
MinimizeIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeIcon.Position = UDim2.new(0.1, 10, 0.1, 10)
MinimizeIcon.Size = UDim2.new(0, 50, 0, 50)
MinimizeIcon.Visible = false
MinimizeIcon.Active = true
MinimizeIcon.Draggable = true
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 10)
IconCorner.Parent = MinimizeIcon

local IconText = Instance.new("TextLabel")
IconText.Name = "IconText"
IconText.Parent = MinimizeIcon
IconText.BackgroundTransparency = 1
IconText.Size = UDim2.new(1, 0, 1, 0)
IconText.Font = Enum.Font.GothamBold
IconText.Text = "⚙"
IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
IconText.TextSize = 24

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, -40, 0.05, 0)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeButton

-- Аниме-тема
local AnimeFrame = Instance.new("Frame")
AnimeFrame.Name = "AnimeFrame"
AnimeFrame.Parent = ExecutorGui
AnimeFrame.BackgroundColor3 = Color3.fromRGB(70, 30, 80)
AnimeFrame.BorderSizePixel = 0
AnimeFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
AnimeFrame.Size = UDim2.new(0, 450, 0, 350)
AnimeFrame.Active = true
AnimeFrame.Draggable = true
AnimeFrame.Visible = false
local AnimeGradient = Instance.new("UIGradient")
AnimeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 30, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 120))
})
AnimeGradient.Rotation = 45
AnimeGradient.Parent = AnimeFrame
local AnimeCorner = Instance.new("UICorner")
AnimeCorner.CornerRadius = UDim.new(0, 15)
AnimeCorner.Parent = AnimeFrame

local AnimeTitle = Instance.new("TextLabel")
AnimeTitle.Name = "AnimeTitle"
AnimeTitle.Parent = AnimeFrame
AnimeTitle.BackgroundTransparency = 1
AnimeTitle.Size = UDim2.new(1, 0, 0, 40)
AnimeTitle.Font = Enum.Font.GothamBold
AnimeTitle.Text = "Anime Theme 🌸"
AnimeTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
AnimeTitle.TextSize = 24
AnimeTitle.TextStrokeTransparency = 0.6

local BackToMain = Instance.new("TextButton")
BackToMain.Name = "BackToMain"
BackToMain.Parent = AnimeFrame
BackToMain.BackgroundColor3 = Color3.fromRGB(100, 50, 100)
BackToMain.Position = UDim2.new(0.375, 0, 0.5, 0)
BackToMain.Size = UDim2.new(0.25, 0, 0, 40)
BackToMain.Font = Enum.Font.GothamBold
BackToMain.Text = "Back to Executor"
BackToMain.TextColor3 = Color3.fromRGB(255, 255, 255)
BackToMain.TextSize = 18
local BackCorner = Instance.new("UICorner")
BackCorner.CornerRadius = UDim.new(0, 10)
BackCorner.Parent = BackToMain

-- Анимация кнопок
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, {Size = scale})
    tween:Play()
end

RunButton.MouseEnter:Connect(function() tweenButton(RunButton, UDim2.new(0.27, 0, 0, 42)) end)
RunButton.MouseLeave:Connect(function() tweenButton(RunButton, UDim2.new(0.25, 0, 0, 40)) end)

ScriptsButton.MouseEnter:Connect(function() tweenButton(ScriptsButton, UDim2.new(0.27, 0, 0, 42)) end)
ScriptsButton.MouseLeave:Connect(function() tweenButton(ScriptsButton, UDim2.new(0.25, 0, 0, 40)) end)

ThemeButton.MouseEnter:Connect(function() tweenButton(ThemeButton, UDim2.new(0.27, 0, 0, 42)) end)
ThemeButton.MouseLeave:Connect(function() tweenButton(ThemeButton, UDim2.new(0.25, 0, 0, 40)) end)

BackToMain.MouseEnter:Connect(function() tweenButton(BackToMain, UDim2.new(0.27, 0, 0, 42)) end)
BackToMain.MouseLeave:Connect(function() tweenButton(BackToMain, UDim2.new(0.25, 0, 0, 40)) end)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    AnimeFrame.Visible = false
    MinimizeIcon.Visible = true
end)

MinimizeIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        MainFrame.Visible = true
        MinimizeIcon.Visible = false
    end
end)

-- Логика кнопок
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
        [[print("Hello from xAI Executor!")]], -- Тестовый скрипт
        [[game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100]], -- Ускорение
        [[local Players = game:GetService("Players")
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                player.Character.Humanoid.JumpPower = 100
            end
        end]] -- Прыжки
    }
    CodeInput.Text = scripts[math.random(1, #scripts)]
end)

ThemeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    AnimeFrame.Visible = true
end)

BackToMain.MouseButton1Click:Connect(function()
    AnimeFrame.Visible = false
    MainFrame.Visible = true
end)
