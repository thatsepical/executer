local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdvancedSpawnerUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local isPC = UIS.MouseEnabled
local uiScale = isPC and 1.15 or 1

local discordBlack = Color3.fromRGB(32, 34, 37)
local orangeAccent = Color3.fromHex("#f58d42")
local headerColor = Color3.fromRGB(47, 49, 54)
local textColor = Color3.fromRGB(220, 220, 220)
local sidebarColor = Color3.fromRGB(40, 42, 46)

local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 600*uiScale, 0, 400*uiScale)
mainContainer.Position = UDim2.new(0.5, -300*uiScale, 0.5, -200*uiScale)
mainContainer.BackgroundColor3 = discordBlack
mainContainer.BorderSizePixel = 0
mainContainer.Visible = true
mainContainer.Parent = screenGui
Instance.new("UICorner", mainContainer).CornerRadius = UDim.new(0, 8)

local dragging, dragStart, startPos
mainContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then 
                dragging = false 
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainContainer.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 150*uiScale, 1, 0)
sidebar.BackgroundColor3 = sidebarColor
sidebar.BorderSizePixel = 0
sidebar.Parent = mainContainer
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 8, 0, 8)

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -150*uiScale, 1, 0)
contentFrame.Position = UDim2.new(0, 150*uiScale, 0, 0)
contentFrame.BackgroundColor3 = discordBlack
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainContainer

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 1, -40)
scrollFrame.Position = UDim2.new(0, 0, 0, 40)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
scrollFrame.Parent = contentFrame

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 10)
contentLayout.Parent = scrollFrame

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = headerColor
header.BorderSizePixel = 0
header.Parent = contentFrame
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8, 0, 0)

local title = Instance.new("TextLabel")
title.Text = "PET SPAWNER"
title.Size = UDim2.new(1, -10, 1, -10)
title.Position = UDim2.new(0, 10, 0, 5)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = textColor
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSans
closeBtn.TextSize = 16
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = textColor
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header

local function createSidebarButton(name, posY)
    local btn = Instance.new("TextButton")
    btn.Name = name.."Btn"
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, posY)
    btn.Text = name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.TextColor3 = textColor
    btn.BackgroundColor3 = sidebarColor
    btn.BorderSizePixel = 0
    btn.Parent = sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 52, 56)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = sidebarColor
    end)
    
    return btn
end

local mainBtn = createSidebarButton("Main", 10)
local petBtn = createSidebarButton("Pet Spawner", 50)
local randomBtn = createSidebarButton("Randomizer", 90)

local function createSection(titleText)
    local section = Instance.new("Frame")
    section.Name = titleText.."Section"
    section.Size = UDim2.new(1, -20, 0, 0)
    section.BackgroundTransparency = 1
    section.AutomaticSize = Enum.AutomaticSize.Y
    section.Parent = scrollFrame
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Text = titleText
    sectionTitle.Size = UDim2.new(1, 0, 0, 25)
    sectionTitle.Font = Enum.Font.SourceSansBold
    sectionTitle.TextSize = 16
    sectionTitle.TextColor3 = textColor
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = section
    
    return section
end

local function createInputField(parent, placeholder, posY)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 60)
    container.BackgroundTransparency = 1
    container.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Text = placeholder
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 14
    label.TextColor3 = textColor
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Position = UDim2.new(0, 0, 0, 25)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.Font = Enum.Font.SourceSans
    box.TextSize = 14
    box.TextColor3 = textColor
    box.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    box.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    box.BorderSizePixel = 0
    box.Parent = container
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
    
    return box
end

local function createButton(parent, text, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.Text = text
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(0,0,0)
    btn.BackgroundColor3 = orangeAccent
    btn.BorderSizePixel = 0
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromHex("#f67f2a")
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = orangeAccent
    end)
    
    return btn
end

-- Main Section
local mainSection = createSection("Main")
mainSection.Visible = true

local seedsBox = createInputField(mainSection, "Seed Name", 0)
local spawnSeedsBtn = createButton(mainSection, "Spawn Seeds", 70)

local eggsBox = createInputField(mainSection, "Egg Name", 120)
local spawnEggsBtn = createButton(mainSection, "Spawn Eggs", 190)

-- Pet Spawner Section
local petSection = createSection("Pet Spawner")
petSection.Visible = false

local petNameBox = createInputField(petSection, "Pet Name", 0)
local weightBox = createInputField(petSection, "Weight", 70)
local ageBox = createInputField(petSection, "Age", 140)
local spawnPetBtn = createButton(petSection, "Spawn Pet", 210)

-- Randomizer Section
local randomSection = createSection("Randomizer")
randomSection.Visible = false

local plantBox = createInputField(randomSection, "Plant to Spin", 0)
local spinBtn = createButton(randomSection, "Spin Plant", 70)

local function showNotification(message)
    local notification = Instance.new("Frame")
    notification.Name = "SpawnNotification"
    notification.Size = UDim2.new(0, 250, 0, 60)
    notification.Position = UDim2.new(1, -260, 1, -70)
    notification.BackgroundColor3 = headerColor
    notification.BorderSizePixel = 0
    notification.Parent = screenGui
    Instance.new("UICorner", notification).CornerRadius = UDim.new(0, 8)
    
    local notificationText = Instance.new("TextLabel")
    notificationText.Text = message
    notificationText.Size = UDim2.new(1, -10, 1, -10)
    notificationText.Position = UDim2.new(0, 5, 0, 5)
    notificationText.Font = Enum.Font.SourceSans
    notificationText.TextSize = 14
    notificationText.TextColor3 = textColor
    notificationText.BackgroundTransparency = 1
    notificationText.TextWrapped = true
    notificationText.Parent = notification
    
    notification.Position = UDim2.new(1, 300, 1, -70)
    notification:TweenPosition(
        UDim2.new(1, -260, 1, -70),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    
    task.delay(3, function()
        notification:TweenPosition(
            UDim2.new(1, 300, 1, -70),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quad,
            0.3,
            true,
            function()
                notification:Destroy()
            end
        )
    end)
end

local function switchTab(tab)
    mainSection.Visible = (tab == "Main")
    petSection.Visible = (tab == "Pet Spawner")
    randomSection.Visible = (tab == "Randomizer")
    
    title.Text = string.upper(tab)
end

mainBtn.MouseButton1Click:Connect(function() switchTab("Main") end)
petBtn.MouseButton1Click:Connect(function() switchTab("Pet Spawner") end)
randomBtn.MouseButton1Click:Connect(function() switchTab("Randomizer") end)

closeBtn.MouseButton1Click:Connect(function() 
    mainContainer.Visible = false 
end)

spawnSeedsBtn.MouseButton1Click:Connect(function()
    local seedName = seedsBox.Text
    if seedName == "" then
        showNotification("Please enter a seed name")
        return
    end
    showNotification("Successfully spawned "..seedName)
end)

spawnEggsBtn.MouseButton1Click:Connect(function()
    local eggName = eggsBox.Text
    if eggName == "" then
        showNotification("Please enter an egg name")
        return
    end
    showNotification("Successfully spawned "..eggName)
end)

spawnPetBtn.MouseButton1Click:Connect(function()
    local petName = petNameBox.Text
    local weight = weightBox.Text
    local age = ageBox.Text
    if petName == "" then
        showNotification("Please enter a pet name")
        return
    end
    showNotification("Successfully spawned "..petName)
end)

spinBtn.MouseButton1Click:Connect(function()
    local plantName = plantBox.Text
    if plantName == "" then
        showNotification("Please enter a plant name")
        return
    end
    showNotification("Plant spin functionality would go here")
end)

-- Initialize with Main tab open
switchTab("Main")
mainContainer.Visible = true
screenGui.Enabled = true