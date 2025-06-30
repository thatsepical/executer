-- Pet Spawner Exploit Script
-- Note: This is for educational purposes only

-- Create the main UI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")

-- Properties for the UI
ScreenGui.Name = "PetSpawnerExploit"
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Active = true
Frame.Draggable = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderColor3 = Color3.fromRGB(20, 20, 20)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Pet Spawner"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExecuteButton.BorderColor3 = Color3.fromRGB(30, 30, 30)
ExecuteButton.Position = UDim2.new(0.5, -75, 0.5, -20)
ExecuteButton.Size = UDim2.new(0, 150, 0, 40)
ExecuteButton.Font = Enum.Font.Gotham
ExecuteButton.Text = "Execute Script"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

-- Close button (optional)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
CloseButton.BorderColor3 = Color3.fromRGB(40, 0, 0)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Function that runs when Execute is clicked
local function executeExploit()
    -- This is where your exploit functionality would go
    -- For demonstration, we'll just show a message
    
    -- Create a notification
    local Notification = Instance.new("TextLabel")
    Notification.Name = "Notification"
    Notification.Parent = Frame
    Notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Notification.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Notification.Position = UDim2.new(0.5, -90, 0.8, -15)
    Notification.Size = UDim2.new(0, 180, 0, 30)
    Notification.Font = Enum.Font.Gotham
    Notification.Text = "Exploit executed! (Placeholder)"
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 14
    Notification.Visible = true
    
    -- Make the notification disappear after 3 seconds
    wait(3)
    Notification:Destroy()
    
    -- In a real exploit, you would put your pet spawning code here
    -- For example:
    -- spawnPets()
    -- or whatever your exploit function is called
end

-- Connect the execute function to the button
ExecuteButton.MouseButton1Click:Connect(executeExploit)

-- Example of how you might implement the actual exploit function
--[[
function spawnPets()
    -- This would be your actual exploit code
    -- For example:
    for i = 1, 10 do
        local pet = Instance.new("Part")
        pet.Name = "ExploitPet"
        pet.Size = Vector3.new(2, 2, 2)
        pet.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        pet.Parent = workspace
    end
end
]]
