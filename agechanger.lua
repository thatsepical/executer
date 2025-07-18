local players = game:GetService("Players")
local localPlayer = players.LocalPlayer or players:GetPlayers()[1]
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create the main UI
local playerGui = localPlayer:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "PetAgeChangerUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local isPC = UIS.MouseEnabled
local uiScale = isPC and 1.15 or 1

-- Colors
local discordBlack = Color3.fromRGB(32, 34, 37)
local lavender = Color3.fromRGB(196, 74, 74)
local darkLavender = Color3.fromRGB(196, 74, 74)
local headerColor = Color3.fromRGB(47, 49, 54)
local textColor = Color3.fromRGB(220, 220, 220)

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 100*uiScale, 0, 25*uiScale)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.Text = "Age Changer"
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 14
toggleButton.BackgroundColor3 = discordBlack
toggleButton.TextColor3 = Color3.new(1,1,1)
toggleButton.Parent = gui
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 200)
mainFrame.Position = UDim2.new(0.5, -110, 0.3, 0)
mainFrame.BackgroundColor3 = discordBlack
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Visible = false
mainFrame.Parent = gui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

-- Dragging functionality
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
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
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Header
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = headerColor
header.BorderSizePixel = 0
header.Parent = mainFrame
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Text = "PET AGE CHANGER"
title.Size = UDim2.new(1, -10, 0, 20)
title.Position = UDim2.new(0, 5, 0, 5)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextColor3 = textColor
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Center
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

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Position = UDim2.new(0, 0, 0, 45)
contentFrame.Size = UDim2.new(1, 0, 1, -45)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Current Pet Info
local petInfoFrame = Instance.new("Frame")
petInfoFrame.Size = UDim2.new(0.9, 0, 0, 80)
petInfoFrame.Position = UDim2.new(0.05, 0, 0, 5)
petInfoFrame.BackgroundColor3 = headerColor
petInfoFrame.BorderSizePixel = 0
petInfoFrame.Parent = contentFrame
Instance.new("UICorner", petInfoFrame).CornerRadius = UDim.new(0, 6)

local petNameLabel = Instance.new("TextLabel")
petNameLabel.Text = "Selected Pet: None"
petNameLabel.Size = UDim2.new(0.9, 0, 0, 20)
petNameLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
petNameLabel.Font = Enum.Font.SourceSans
petNameLabel.TextSize = 14
petNameLabel.TextColor3 = textColor
petNameLabel.BackgroundTransparency = 1
petNameLabel.TextXAlignment = Enum.TextXAlignment.Left
petNameLabel.Parent = petInfoFrame

local petWeightLabel = Instance.new("TextLabel")
petWeightLabel.Text = "Weight: N/A"
petWeightLabel.Size = UDim2.new(0.9, 0, 0, 20)
petWeightLabel.Position = UDim2.new(0.05, 0, 0.4, 0)
petWeightLabel.Font = Enum.Font.SourceSans
petWeightLabel.TextSize = 14
petWeightLabel.TextColor3 = textColor
petWeightLabel.BackgroundTransparency = 1
petWeightLabel.TextXAlignment = Enum.TextXAlignment.Left
petWeightLabel.Parent = petInfoFrame

local petAgeLabel = Instance.new("TextLabel")
petAgeLabel.Text = "Age: N/A"
petAgeLabel.Size = UDim2.new(0.9, 0, 0, 20)
petAgeLabel.Position = UDim2.new(0.05, 0, 0.7, 0)
petAgeLabel.Font = Enum.Font.SourceSans
petAgeLabel.TextSize = 14
petAgeLabel.TextColor3 = textColor
petAgeLabel.BackgroundTransparency = 1
petAgeLabel.TextXAlignment = Enum.TextXAlignment.Left
petAgeLabel.Parent = petInfoFrame

-- Age Input
local ageInput = Instance.new("TextBox")
ageInput.Name = "AgeInput"
ageInput.Size = UDim2.new(0.6, 0, 0, 30)
ageInput.Position = UDim2.new(0.05, 0, 0.5, 0)
ageInput.PlaceholderText = "Enter new age (1-100)"
ageInput.Text = ""
ageInput.Font = Enum.Font.SourceSans
ageInput.TextSize = 14
ageInput.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
ageInput.TextColor3 = textColor
ageInput.ClearTextOnFocus = false
ageInput.Parent = contentFrame
Instance.new("UICorner", ageInput).CornerRadius = UDim.new(0, 4)

-- Change Age Button
local changeAgeBtn = Instance.new("TextButton")
changeAgeBtn.Size = UDim2.new(0.3, 0, 0, 30)
changeAgeBtn.Position = UDim2.new(0.67, 0, 0.5, 0)
changeAgeBtn.Text = "Change"
changeAgeBtn.Font = Enum.Font.SourceSans
changeAgeBtn.TextSize = 14
changeAgeBtn.BackgroundColor3 = lavender
changeAgeBtn.TextColor3 = Color3.new(0, 0, 0)
changeAgeBtn.Parent = contentFrame
Instance.new("UICorner", changeAgeBtn).CornerRadius = UDim.new(0, 4)

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 20)
statusLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 12
statusLabel.TextColor3 = textColor
statusLabel.BackgroundTransparency = 1
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Text = ""
statusLabel.Parent = contentFrame

-- Pet Selection Dropdown
local petDropdown = Instance.new("Frame")
petDropdown.Size = UDim2.new(0.9, 0, 0, 30)
petDropdown.Position = UDim2.new(0.05, 0, 0.3, 0)
petDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
petDropdown.Parent = contentFrame
Instance.new("UICorner", petDropdown).CornerRadius = UDim.new(0, 4)

local dropdownButton = Instance.new("TextButton")
dropdownButton.Size = UDim2.new(1, 0, 1, 0)
dropdownButton.Text = "Select Pet"
dropdownButton.Font = Enum.Font.SourceSans
dropdownButton.TextSize = 14
dropdownButton.TextColor3 = textColor
dropdownButton.BackgroundTransparency = 1
dropdownButton.Parent = petDropdown

local dropdownFrame = Instance.new("Frame")
dropdownFrame.Size = UDim2.new(1, 0, 0, 0)
dropdownFrame.Position = UDim2.new(0, 0, 1, 5)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
dropdownFrame.Visible = false
dropdownFrame.Parent = petDropdown
Instance.new("UICorner", dropdownFrame).CornerRadius = UDim.new(0, 4)
Instance.new("UIListLayout", dropdownFrame).SortOrder = Enum.SortOrder.LayoutOrder

-- Variables
local selectedPet = nil
local petsInInventory = {}

-- Function to get pets from inventory (client-side simulation)
local function getPetsFromInventory()
    -- This is a simulation since we can't directly access server inventory
    -- In a real game, you would need to observe the actual inventory UI or use remote events
    
    -- Clear current list
    petsInInventory = {}
    for _, child in ipairs(dropdownFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Simulate finding pets (this part would need adjustment for your specific game)
    local backpack = localPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item:FindFirstChild("Handle") and item:IsA("Model") then
                table.insert(petsInInventory, item)
                
                local petButton = Instance.new("TextButton")
                petButton.Size = UDim2.new(1, 0, 0, 25)
                petButton.Text = item.Name
                petButton.Font = Enum.Font.SourceSans
                petButton.TextSize = 14
                petButton.TextColor3 = textColor
                petButton.BackgroundTransparency = 1
                petButton.Parent = dropdownFrame
                
                petButton.MouseButton1Click:Connect(function()
                    selectedPet = item
                    dropdownButton.Text = item.Name
                    dropdownFrame.Visible = false
                    updateSelectedPetInfo()
                end)
            end
        end
    end
    
    -- Also check for equipped pets
    local character = localPlayer.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if item:FindFirstChild("Handle") and item:IsA("Model") then
                table.insert(petsInInventory, item)
                
                local petButton = Instance.new("TextButton")
                petButton.Size = UDim2.new(1, 0, 0, 25)
                petButton.Text = item.Name .. " (Equipped)"
                petButton.Font = Enum.Font.SourceSans
                petButton.TextSize = 14
                petButton.TextColor3 = textColor
                petButton.BackgroundTransparency = 1
                petButton.Parent = dropdownFrame
                
                petButton.MouseButton1Click:Connect(function()
                    selectedPet = item
                    dropdownButton.Text = item.Name .. " (Equipped)"
                    dropdownFrame.Visible = false
                    updateSelectedPetInfo()
                end)
            end
        end
    end
    
    dropdownFrame.Size = UDim2.new(1, 0, 0, math.min(#petsInInventory * 25, 150))
end

-- Function to update selected pet info
local function updateSelectedPetInfo()
    if not selectedPet then
        petNameLabel.Text = "Selected Pet: None"
        petWeightLabel.Text = "Weight: N/A"
        petAgeLabel.Text = "Age: N/A"
        return
    end
    
    -- Try to get pet attributes
    local name = selectedPet:GetAttribute("PetName") or selectedPet.Name
    local weight = selectedPet:GetAttribute("Weight") or "N/A"
    local age = selectedPet:GetAttribute("Age") or "N/A"
    
    petNameLabel.Text = "Selected Pet: " .. tostring(name)
    petWeightLabel.Text = "Weight: " .. tostring(weight)
    petAgeLabel.Text = "Age: " .. tostring(age)
end

-- Function to visually change the pet's age
local function changePetAge(newAge)
    if not selectedPet then
        statusLabel.Text = "No pet selected!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        task.delay(2, function()
            statusLabel.Text = ""
        end)
        return
    end
    
    -- Validate input
    newAge = tonumber(newAge)
    if not newAge or newAge < 1 or newAge > 100 then
        statusLabel.Text = "Invalid age (1-100)!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        task.delay(2, function()
            statusLabel.Text = ""
        end)
        return
    end
    
    -- Visually change the age (client-side only)
    selectedPet:SetAttribute("Age", newAge)
    petAgeLabel.Text = "Age: " .. newAge
    
    statusLabel.Text = "Age changed to " .. newAge
    statusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
    task.delay(2, function()
        statusLabel.Text = ""
    end)
end

-- Button hover effects
changeAgeBtn.MouseEnter:Connect(function()
    changeAgeBtn.BackgroundColor3 = darkLavender
end)

changeAgeBtn.MouseLeave:Connect(function()
    changeAgeBtn.BackgroundColor3 = lavender
end)

-- Dropdown button hover
dropdownButton.MouseEnter:Connect(function()
    petDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
end)

dropdownButton.MouseLeave:Connect(function()
    petDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
end)

-- Dropdown toggle
dropdownButton.MouseButton1Click:Connect(function()
    dropdownFrame.Visible = not dropdownFrame.Visible
    if dropdownFrame.Visible then
        getPetsFromInventory()
    end
end)

-- Button click event
changeAgeBtn.MouseButton1Click:Connect(function()
    changePetAge(ageInput.Text)
end)

-- Enter key press in input box
ageInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        changePetAge(ageInput.Text)
    end
end)

-- Toggle UI visibility
toggleButton.MouseButton1Click:Connect(function() 
    mainFrame.Visible = not mainFrame.Visible 
    if mainFrame.Visible then
        getPetsFromInventory()
    end
end)

closeBtn.MouseButton1Click:Connect(function() 
    mainFrame.Visible = false
end)

-- Periodically update pet list when UI is visible
while true do
    if mainFrame.Visible then
        getPetsFromInventory()
    end
    task.wait(5) -- Refresh every 5 seconds
end