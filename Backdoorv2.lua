local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создаем основной GUI
local ScannerGui = Instance.new("ScreenGui")
ScannerGui.Name = "BackdoorScanner"
ScannerGui.Parent = CoreGui
ScannerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScannerGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Градиентный эффект
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 40, 70))
})
Gradient.Rotation = 90
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
Title.Text = "Backdoor Scanner V2"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.7

-- Круглый индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный по умолчанию (нет бэкдора)
StatusCircle.Position = UDim2.new(0.5, -15, 0.15, 0)
StatusCircle.Size = UDim2.new(0, 30, 0, 30)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Область вывода
local Output = Instance.new("TextLabel")
Output.Name = "Output"
Output.Parent = MainFrame
Output.BackgroundTransparency = 1
Output.Position = UDim2.new(0.1, 0, 0.25, 0)
Output.Size = UDim2.new(0.8, 0, 0.3, 0)
Output.Font = Enum.Font.Gotham
Output.Text = "No backdoors detected yet..."
Output.TextColor3 = Color3.fromRGB(200, 200, 200)
Output.TextSize = 14
Output.TextWrapped = true

-- Поле для ввода require
local RequireInput = Instance.new("TextBox")
RequireInput.Name = "RequireInput"
RequireInput.Parent = MainFrame
RequireInput.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
RequireInput.Position = UDim2.new(0.1, 0, 0.55, 0)
RequireInput.Size = UDim2.new(0.5, 0, 0, 30)
RequireInput.Font = Enum.Font.Gotham
RequireInput.PlaceholderText = "Enter require ID..."
RequireInput.Text = ""
RequireInput.TextColor3 = Color3.fromRGB(200, 200, 200)
RequireInput.TextSize = 14
local RequireInputCorner = Instance.new("UICorner")
RequireInputCorner.CornerRadius = UDim.new(0, 8)
RequireInputCorner.Parent = RequireInput

-- Кнопка Scan с символом шприца
local ScanButton = Instance.new("TextButton")
ScanButton.Name = "ScanButton"
ScanButton.Parent = MainFrame
ScanButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
ScanButton.Position = UDim2.new(0.35, 0, 0.65, 0)
ScanButton.Size = UDim2.new(0.3, 0, 0, 40)
ScanButton.Font = Enum.Font.GothamBold
ScanButton.Text = "💉 Scan"
ScanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.TextSize = 18
local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 8)
ScanCorner.Parent = ScanButton

-- Вкладка с готовыми require
local PredefinedButton = Instance.new("TextButton")
PredefinedButton.Name = "PredefinedButton"
PredefinedButton.Parent = MainFrame
PredefinedButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
PredefinedButton.Position = UDim2.new(0.65, 0, 0.55, 0)
PredefinedButton.Size = UDim2.new(0.25, 0, 0, 30)
PredefinedButton.Font = Enum.Font.GothamBold
PredefinedButton.Text = "Polaria"
PredefinedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PredefinedButton.TextSize = 14
local PredefinedCorner = Instance.new("UICorner")
PredefinedCorner.CornerRadius = UDim.new(0, 8)
PredefinedCorner.Parent = PredefinedButton

-- Подпись
local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Parent = MainFrame
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.75, -50, 0.9, 0)
Credit.Size = UDim2.new(0.5, 0, 0, 20)
Credit.Font = Enum.Font.Gotham
Credit.Text = "by: xAI"
Credit.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit.TextSize = 14
Credit.TextStrokeTransparency = 0.9

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, 0, 0.05, 0)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

-- Иконка при сворачивании
local MinimizedIcon = Instance.new("Frame")
MinimizedIcon.Name = "MinimizedIcon"
MinimizedIcon.Parent = ScannerGui
MinimizedIcon.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MinimizedIcon.Position = UDim2.new(0.5, -25, 0.5, -25)
MinimizedIcon.Size = UDim2.new(0, 50, 0, 50)
MinimizedIcon.Visible = false
MinimizedIcon.Active = true
MinimizedIcon.Draggable = true
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 8)
IconCorner.Parent = MinimizedIcon

-- Символ консоли на иконке
local ConsoleIcon = Instance.new("TextLabel")
ConsoleIcon.Name = "ConsoleIcon"
ConsoleIcon.Parent = MinimizedIcon
ConsoleIcon.BackgroundTransparency = 1
ConsoleIcon.Size = UDim2.new(1, 0, 1, 0)
ConsoleIcon.Font = Enum.Font.GothamBold
ConsoleIcon.Text = "💻"
ConsoleIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
ConsoleIcon.TextSize = 24
ConsoleIcon.TextTransparency = 0.2

-- Анимация кнопок
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, {Size = scale})
    tween:Play()
end

ScanButton.MouseEnter:Connect(function()
    tweenButton(ScanButton, UDim2.new(0.32, 0, 0, 42))
end)
ScanButton.MouseLeave:Connect(function()
    tweenButton(ScanButton, UDim2.new(0.3, 0, 0, 40))
end)

PredefinedButton.MouseEnter:Connect(function()
    tweenButton(PredefinedButton, UDim2.new(0.27, 0, 0, 32))
end)
PredefinedButton.MouseLeave:Connect(function()
    tweenButton(PredefinedButton, UDim2.new(0.25, 0, 0, 30))
end)

-- Логика сворачивания
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizedIcon.Visible = true
end)

MinimizedIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        MainFrame.Visible = true
        MinimizedIcon.Visible = false
    end
end)

-- Функция сканирования бэкдоров
local function scanForBackdoors()
    StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Желтый (сканирование)
    Output.Text = "Scanning for backdoors..."
    wait(2) -- Эмуляция сканирования

    local backdoorsFound = false
    local backdoorOutput = ""

    -- Проверяем все скрипты в игре
    for _, instance in pairs(game:GetDescendants()) do
        if instance:IsA("LocalScript") or instance:IsA("ModuleScript") then
            local success, source = pcall(function()
                return instance.Source
            end)
            if success and source then
                if string.find(source, "require") or string.find(source, "getfenv") or string.find(source, "loadstring") then
                    backdoorsFound = true
                    backdoorOutput = backdoorOutput .. "Backdoor found in: " .. instance:GetFullName() .. "\n"
                end
            end
        end
    end

    if backdoorsFound then
        StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (бэкдор найден)
        Output.Text = backdoorOutput .. "Backdoor detected! Use require to exploit."
    else
        StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (нет бэкдора)
        Output.Text = "No backdoors detected."
    end
end

-- Логика кнопки Scan
ScanButton.MouseButton1Click:Connect(function()
    scanForBackdoors()
end)

-- Логика для готового require (Polaria)
PredefinedButton.MouseButton1Click:Connect(function()
    local playerName = LocalPlayer.Name
    RequireInput.Text = "require(1234567890) -- Polaria (by " .. playerName .. ")"
end)

-- Логика выполнения require
RequireInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and RequireInput.Text ~= "" then
        local success, result = pcall(function()
            local func = loadstring(RequireInput.Text)
            return func()
        end)
        if success then
            Output.Text = "Require executed successfully!"
            StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            Output.Text = "Failed to execute require: " .. tostring(result)
            StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)
