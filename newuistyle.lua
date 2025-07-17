-- Restyled AdvancedSpawnerUI
-- Matches style from "Grow a Garden" type UI (modern card-like dark theme)

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdvancedSpawnerUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local isPC = UIS.MouseEnabled
local uiScale = isPC and 1.15 or 1

-- Modern dark theme colors
local mainBg = Color3.fromRGB(24, 24, 27)
local cardBg = Color3.fromRGB(39, 39, 42)
local accent = Color3.fromRGB(99, 102, 241)
local textColor = Color3.fromRGB(235, 235, 245)

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 15, 0, 15)
toggleButton.Text = "Toggle UI"
toggleButton.Font = Enum.Font.SourceSansSemibold
toggleButton.TextSize = 14
toggleButton.BackgroundColor3 = accent
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = screenGui
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 260)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -130)
mainFrame.BackgroundColor3 = mainBg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = cardBg
header.BorderSizePixel = 0
header.Parent = mainFrame
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Text = "Advanced Spawner"
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = textColor
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -35, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = textColor
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

-- Dragging
local dragging, dragStart, startPos
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Tabs
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 30)
tabContainer.Position = UDim2.new(0, 0, 0, 45)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = mainFrame

local tabButtons = {}
local tabFrames = {}

local function createTab(name, index)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.33, -5, 1, 0)
    button.Position = UDim2.new((index - 1) * 0.33, index == 1 and 5 or 2, 0, 0)
    button.Text = name
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.BackgroundColor3 = cardBg
    button.TextColor3 = textColor
    button.BorderSizePixel = 0
    button.Parent = tabContainer
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 1, -90)
    frame.Position = UDim2.new(0, 10, 0, 80)
    frame.BackgroundColor3 = cardBg
    frame.BorderSizePixel = 0
    frame.Visible = (index == 1)
    frame.Parent = mainFrame
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    button.MouseButton1Click:Connect(function()
        for _, f in pairs(tabFrames) do f.Visible = false end
        for _, b in pairs(tabButtons) do b.BackgroundColor3 = cardBg end
        frame.Visible = true
        button.BackgroundColor3 = accent
    end)

    tabButtons[name] = button
    tabFrames[name] = frame

    return frame
end

local petTab = createTab("PET", 1)
local seedTab = createTab("SEED", 2)
local eggTab = createTab("EGG", 3)

-- More UI details like buttons, loading bars, etc., are reused from original script
-- You can now reinsert your textbox, buttons, loading bar code using tabFrames["PET"], etc.

-- Close and Toggle functionality
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

mainFrame.Visible = true
screenGui.Enabled = true
