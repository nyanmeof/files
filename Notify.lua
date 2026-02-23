--[[
kid diem skid cc
]]
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local SC_UI_Name = "Geta Bi Thieu Nang"
local existingUI = game:GetService("CoreGui"):FindFirstChild(SC_UI_Name)

if existingUI then
    existingUI:Destroy()
end

function Tween(object,time,easingstyle,easingdirection,properties)
    return TweenService:Create(object,TweenInfo.new(time, easingstyle, easingdirection),properties)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = SC_UI_Name
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NotificationContainer_1 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")

local ImageAssets = {
    NotifyDetail = "rbxassetid://14184951412",
    NotifyIcon = "rbxassetid://3926307971",
    NotifyNyan = "rbxassetid://71119026253351", 
}

NotificationContainer_1.Name = "NotificationContainer_1"
NotificationContainer_1.Parent = ScreenGui
NotificationContainer_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationContainer_1.BackgroundTransparency = 1.000
NotificationContainer_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotificationContainer_1.BorderSizePixel = 0
NotificationContainer_1.Position = UDim2.new(1, 0, 0, 0)
NotificationContainer_1.Size = UDim2.new(0, 0, 0.970000029, 0)

UIListLayout_3.Parent = NotificationContainer_1
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout_3.Padding = UDim.new(0, 30)

function Notify(Configs)
    Configs = Configs or {}
    Configs.Text = Configs.Text or "No Text"
    Configs.Delay = Configs.Delay or 3
    Configs.Type2 = Configs.Type2 or "Default"
    
    local Notify = Instance.new("Frame")
    local Notify2 = Instance.new("Frame")
    local NotifyText = Instance.new("TextLabel")
    local NotifyDetail = Instance.new("ImageLabel")
    local NotifyIcon = Instance.new("ImageButton")
    local NotifyIconFrame = Instance.new("Frame")
    local NotifyIcon2 = Instance.new("TextLabel")
    local NotifyDelayFrame1 = Instance.new("Frame")
    local NotifyDelayFrame2 = Instance.new("Frame")
    local UIStroke = Instance.new("UIStroke")
    local NotifyImage = Instance.new("ImageLabel")

    Notify.Name = "Notify"
    Notify.Parent = NotificationContainer_1
    Notify.BackgroundColor3 = Color3.fromRGB(15, 15, 14)
    Notify.BackgroundTransparency = 0.350
    Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notify.BorderSizePixel = 0
    Notify.BackgroundTransparency = 1
    Notify.Size = UDim2.new(0, 110, 0, 45)

    UIStroke.Parent = NotifyIconFrame
    UIStroke.ApplyStrokeMode = "Border"
    UIStroke.Thickness = 2
    UIStroke.Color = Color3.fromRGB(236, 229, 216)
    UIStroke.Enabled = false

    Notify2.Name = "Notify2"
    Notify2.Parent = Notify
    Notify2.BackgroundColor3 = Color3.fromRGB(15, 15, 14)
    Notify2.BackgroundTransparency = 0.350
    Notify2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notify2.BorderSizePixel = 0
    Notify2.Position = UDim2.new(3, -110, 0, 0)
    Notify2.Size = UDim2.new(1, 0, 1, 0)

    NotifyText.Name = "NotifyText"
    NotifyText.Parent = Notify2
    NotifyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyText.BackgroundTransparency = 1.000
    NotifyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyText.BorderSizePixel = 0
    NotifyText.Position = UDim2.new(0, 75, 0.200000003, 0)
    NotifyText.Size = UDim2.new(1, -110, 0.600000024, 0)
    NotifyText.Font = Enum.Font.Fantasy
    NotifyText.RichText = true
    NotifyText.Text = "<b>"..Configs.Text.."</b>"
    NotifyText.TextColor3 = Color3.fromRGB(236, 229, 216)
    NotifyText.TextSize = 22
    NotifyText.TextWrapped = true
    NotifyText.TextXAlignment = Enum.TextXAlignment.Left

    NotifyDetail.Name = "NotifyDetail"
    NotifyDetail.Parent = Notify2
    NotifyDetail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDetail.BackgroundTransparency = 1.000
    NotifyDetail.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDetail.BorderSizePixel = 0
    NotifyDetail.Position = UDim2.new(0, -25, 0, 0)
    NotifyDetail.Size = UDim2.new(0, 25, 1, 0)
    NotifyDetail.Image = ImageAssets.NotifyDetail
    NotifyDetail.ImageColor3 = Color3.fromRGB(15, 15, 14)
    NotifyDetail.ImageTransparency = 0.350

    NotifyIcon.Name = "NotifyIcon"
    NotifyIcon.Parent = Notify2
    NotifyIcon.BackgroundTransparency = 1.000
    NotifyIcon.LayoutOrder = 9
    NotifyIcon.Position = UDim2.new(1, -30, 0.218999997, 0)
    NotifyIcon.Size = UDim2.new(0, 20, 0, 25)
    NotifyIcon.ZIndex = 3
    NotifyIcon.Image = ImageAssets.NotifyIcon
    NotifyIcon.ImageColor3 = Color3.fromRGB(236, 229, 216)
    NotifyIcon.ImageRectOffset = Vector2.new(764, 244)
    NotifyIcon.ImageRectSize = Vector2.new(36, 36)

    NotifyIconFrame.Name = "NotifyIconFrame"
    NotifyIconFrame.Parent = Notify2
    NotifyIconFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIconFrame.BackgroundTransparency = 0.550
    NotifyIconFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIconFrame.BorderSizePixel = 0
    NotifyIconFrame.Position = UDim2.new(0, 10, 0, -5)
    NotifyIconFrame.Rotation = 45.000
    NotifyIconFrame.Size = UDim2.new(0, 50, 0, 50)

    NotifyImage.Name = "NotifyImage"
    NotifyImage.Parent = NotifyIconFrame
    NotifyImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyImage.BackgroundTransparency = 1.000
    NotifyImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyImage.BorderSizePixel = 0
    NotifyImage.Position = UDim2.new(-0.1, -1, -0.1, -1)
    NotifyImage.Rotation = -45.000
    NotifyImage.Size = UDim2.new(1.2, 2, 1.2, 2)
    NotifyImage.Image = ImageAssets.NotifyNyan
    NotifyImage.Visible = false

    NotifyIcon2.Name = "NotifyIcon2"
    NotifyIcon2.Parent = NotifyIconFrame
    NotifyIcon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyIcon2.BackgroundTransparency = 1.000
    NotifyIcon2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIcon2.BorderSizePixel = 0
    NotifyIcon2.Rotation = -45.000
    NotifyIcon2.Size = UDim2.new(1, 0, 1, 0)
    NotifyIcon2.Font = Enum.Font.FredokaOne
    NotifyIcon2.Text = "!"
    NotifyIcon2.TextColor3 = Color3.fromRGB(255, 74, 74)
    NotifyIcon2.TextScaled = true
    NotifyIcon2.TextSize = 14.000
    NotifyIcon2.TextWrapped = true
    NotifyIcon2.Visible = false

    if Configs.Type2 == "Nyan" then
        NotifyImage.Visible = true
        UIStroke.Enabled = true
        NotifyIconFrame.BackgroundColor3 = Color3.fromRGB(159, 154, 145)
        NotifyIconFrame.Transparency = 0
    else
        NotifyIcon2.Visible = true
    end

    NotifyDelayFrame1.Name = "NotifyDelayFrame1"
    NotifyDelayFrame1.Parent = Notify2
    NotifyDelayFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDelayFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDelayFrame1.BorderSizePixel = 0
    NotifyDelayFrame1.BackgroundTransparency = 1
    NotifyDelayFrame1.Position = UDim2.new(0, 45, 1, -2)
    NotifyDelayFrame1.Size = UDim2.new(1, -45, 0, 2)

    NotifyDelayFrame2.Name = "NotifyDelayFrame2"
    NotifyDelayFrame2.Parent = NotifyDelayFrame1
    NotifyDelayFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDelayFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDelayFrame2.BorderSizePixel = 0
    NotifyDelayFrame2.Size = UDim2.new(1, 0, 1, 0)

    local totalTextSize = 0
    local saveTemp = Notify.Size.X.Offset/2
    for i,v in pairs((NotifyText.Text):split("")) do
        CalcTextSize = TextService:GetTextSize(v,22,"Fantasy",Vector2.new(0,0))
        totalTextSize = totalTextSize + CalcTextSize.X
    end
    Notify2.Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
    Notify.Size = UDim2.new(0, totalTextSize+saveTemp, 0, 45)
    Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out,
        {
            Position = UDim2.new(1, -(totalTextSize+saveTemp), 0, 0)
        }
    ):Play()
    if Configs.Delay then
        local checkTW = Tween(NotifyDelayFrame2, Configs.Delay, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,
            {
                Size = UDim2.new(0,0,1,0),
                Position = UDim2.new(1,0,0,0)
            }
        )
        checkTW:Play()
        checkTW.Completed:Connect(function()
            local checkTW2 = Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In,
                {
                    Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
                }
            )
            checkTW2:Play()
            checkTW2.Completed:Connect(function()
                Notify:Destroy()
            end)
        end)
    end
    NotifyIcon.MouseButton1Click:Connect(function()
        local checkTW = Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In,
            {
                Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
            }
        )
        checkTW:Play()
        checkTW.Completed:Connect(function()
            Notify:Destroy()
        end)
    end)
end

getgenv().Notify = Notify

return Notify
