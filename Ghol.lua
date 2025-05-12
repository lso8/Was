local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создаем основной GUI
local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "KeySystem"
KeySystem.Parent = CoreGui
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм для ввода ключа
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = KeySystem
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
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
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.7

-- Поле ввода ключа
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
KeyInput.Position = UDim2.new(0.25, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.5, 0, 0, 40)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter Key (123)"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(200, 200, 200)
KeyInput.TextSize = 16
local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInput

-- Кнопка Submit
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = MainFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
SubmitButton.Position = UDim2.new(0.375, 0, 0.55, 0)
SubmitButton.Size = UDim2.new(0.25, 0, 0, 40)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "Submit"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 18
local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitButton

-- Подпись автора
local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Parent = MainFrame
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.75, -50, 0.9, 0)
Credit.Size = UDim2.new(0.5, 0, 0, 20)
Credit.Font = Enum.Font.Gotham
Credit.Text = "by: Artem"
Credit.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit.TextSize = 14
Credit.TextStrokeTransparency = 0.9

-- Анимация кнопки
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, {Size = scale})
    tween:Play()
end

SubmitButton.MouseEnter:Connect(function()
    tweenButton(SubmitButton, UDim2.new(0.27, 0, 0, 42))
end)
SubmitButton.MouseLeave:Connect(function()
    tweenButton(SubmitButton, UDim2.new(0.25, 0, 0, 40))
end)

-- Второе GUI (меню)
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = KeySystem
MenuFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MenuFrame.BorderSizePixel = 0
MenuFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MenuFrame.Size = UDim2.new(0, 300, 0, 300)
MenuFrame.Visible = false
MenuFrame.Active = true
MenuFrame.Draggable = true

-- Градиент для меню
local MenuGradient = Instance.new("UIGradient")
MenuGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 40, 70))
})
MenuGradient.Rotation = 90
MenuGradient.Parent = MenuFrame

-- Скругленные углы для меню
local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 15)
MenuCorner.Parent = MenuFrame

-- Заголовок меню
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Name = "MenuTitle"
MenuTitle.Parent = MenuFrame
MenuTitle.BackgroundTransparency = 1
MenuTitle.Size = UDim2.new(1, 0, 0, 40)
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.Text = "Exploit Menu"
MenuTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
MenuTitle.TextSize = 24
MenuTitle.TextStrokeTransparency = 0.7

-- Кнопка Godmode
local GodmodeButton = Instance.new("TextButton")
GodmodeButton.Name = "GodmodeButton"
GodmodeButton.Parent = MenuFrame
GodmodeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
GodmodeButton.Position = UDim2.new(0.35, 0, 0.3, 0)
GodmodeButton.Size = UDim2.new(0.3, 0, 0, 40)
GodmodeButton.Font = Enum.Font.GothamBold
GodmodeButton.Text = "Godmode"
GodmodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GodmodeButton.TextSize = 18
local GodmodeCorner = Instance.new("UICorner")
GodmodeCorner.CornerRadius = UDim.new(0, 8)
GodmodeCorner.Parent = GodmodeButton

-- Кнопка Soon
local SoonButton = Instance.new("TextButton")
SoonButton.Name = "SoonButton"
SoonButton.Parent = MenuFrame
SoonButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
SoonButton.Position = UDim2.new(0.35, 0, 0.45, 0)
SoonButton.Size = UDim2.new(0.3, 0, 0, 40)
SoonButton.Font = Enum.Font.GothamBold
SoonButton.Text = "Soon"
SoonButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SoonButton.TextSize = 18
local SoonCorner = Instance.new("UICorner")
SoonCorner.CornerRadius = UDim.new(0, 8)
SoonCorner.Parent = SoonButton

-- Подпись в меню
local MenuCredit = Instance.new("TextLabel")
MenuCredit.Name = "MenuCredit"
MenuCredit.Parent = MenuFrame
MenuCredit.BackgroundTransparency = 1
MenuCredit.Position = UDim2.new(0.75, -50, 0.9, 0)
MenuCredit.Size = UDim2.new(0.5, 0, 0, 20)
MenuCredit.Font = Enum.Font.Gotham
MenuCredit.Text = "by: Artem"
MenuCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
MenuCredit.TextSize = 14
MenuCredit.TextStrokeTransparency = 0.9

-- Анимации для кнопок меню
GodmodeButton.MouseEnter:Connect(function()
    tweenButton(GodmodeButton, UDim2.new(0.32, 0, 0, 42))
end)
GodmodeButton.MouseLeave:Connect(function()
    tweenButton(GodmodeButton, UDim2.new(0.3, 0, 0, 40))
end)
SoonButton.MouseEnter:Connect(function()
    tweenButton(SoonButton, UDim2.new(0.32, 0, 0, 42))
end)
SoonButton.MouseLeave:Connect(function()
    tweenButton(SoonButton, UDim2.new(0.3, 0, 0, 40))
end)

-- Логика проверки ключа
SubmitButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == "123" then
        MainFrame.Visible = false
        MenuFrame.Visible = true
        -- Анимация появления меню
        MenuFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local tween = TweenService:Create(MenuFrame, tweenInfo, {Position = UDim2.new(0.5, -150, 0.5, -150)})
        tween:Play()
    else
        KeyInput.Text = ""
        KeyInput.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
        KeyInput.PlaceholderText = "Invalid Key!"
        KeyInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        wait(1)
        KeyInput.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
        KeyInput.PlaceholderText = "Enter Key (123)"
        KeyInput.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- Функция Godmode
local function enableGodmode()
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if humanoid.Health < math.huge then
                humanoid.Health = math.huge
            end
        end)
    end
end

-- Обновление Godmode при респавне
LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1)
    enableGodmode()
end)

-- Активация Godmode
GodmodeButton.MouseButton1Click:Connect(function()
    enableGodmode()
    GodmodeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    wait(0.5)
    GodmodeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
end)

-- Выход с места по причине "Soon"
SoonButton.MouseButton1Click:Connect(function()
    game:Kick("Disconnected: Soon")
end)
