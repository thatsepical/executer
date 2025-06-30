local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")

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

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderColor3 = Color3.fromRGB(20, 20, 20)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Pet Spawner"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(110, 112, 186)
ExecuteButton.BorderColor3 = Color3.fromRGB(80, 82, 156)
ExecuteButton.Position = UDim2.new(0.5, -75, 0.5, -20)
ExecuteButton.Size = UDim2.new(0, 150, 0, 40)
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.Text = "EXECUTE SCRIPT"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ExecuteButton

local function executeExploit()
    local Notification = Instance.new("TextLabel")
    Notification.Name = "Notification"
    Notification.Parent = Frame
    Notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Notification.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Notification.Position = UDim2.new(0.5, -90, 0.8, -15)
    Notification.Size = UDim2.new(0, 180, 0, 30)
    Notification.Font = Enum.Font.SourceSans
    Notification.Text = "Exploit executed! (Placeholder)"
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 14
    Notification.Visible = true
    
    local NotificationCorner = Instance.new("UICorner")
    NotificationCorner.CornerRadius = UDim.new(0, 6)
    NotificationCorner.Parent = Notification
    
    wait(3)
    Notification:Destroy()
end

ExecuteButton.MouseButton1Click:Connect(executeExploit)