
--====================================--
--          LANZZ HUB V1.0
--       STEAL AND EGG EDITION
--          PURPLE THEME
--====================================--

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "LANZZ_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local purple = Color3.fromRGB(160, 75, 255)
local dark = Color3.fromRGB(20, 15, 30)
local panel = Color3.fromRGB(35, 25, 48)
local white = Color3.fromRGB(245, 240, 255)

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(360, 300)
main.Position = UDim2.new(0.5, -180, 0.5, -150)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local outline = Instance.new("UIStroke", main)
outline.Color = purple
outline.Thickness = 2

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 43)
header.BackgroundColor3 = panel
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -85, 1, 0)
title.Position = UDim2.fromOffset(12, 0)
title.BackgroundTransparency = 1
title.Text = "LANZZ HUB  |  V1.0"
title.TextColor3 = purple
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

local minimize = Instance.new("TextButton", header)
minimize.Size = UDim2.fromOffset(30, 30)
minimize.Position = UDim2.new(1, -70, 0, 6)
minimize.Text = "-"
minimize.BackgroundColor3 = purple
minimize.TextColor3 = white
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 20

local close = Instance.new("TextButton", header)
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -35, 0, 6)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(120, 40, 70)
close.TextColor3 = white
close.Font = Enum.Font.GothamBold
close.TextSize = 14

-- DRAG
local dragging = false
local dragStart, startPos

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local minimized = false

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    main.Size = minimized
        and UDim2.fromOffset(360, 43)
        or UDim2.fromOffset(360, 300)
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.fromOffset(8, 51)
sidebar.Size = UDim2.fromOffset(105, 240)
sidebar.BackgroundColor3 = panel

Instance.new("UICorner", sidebar).CornerRadius =
    UDim.new(0, 8)

local menu = Instance.new("Frame", main)
menu.Position = UDim2.fromOffset(120, 51)
menu.Size = UDim2.fromOffset(232, 240)
menu.BackgroundColor3 = panel

Instance.new("UICorner", menu).CornerRadius =
    UDim.new(0, 8)

local pages = {
    "Home",
    "Farm",
    "Player",
    "Visual",
    "Server",
    "Settings",
    "Config"
}

local currentPage

local function clearPage()
    if currentPage then
        currentPage:Destroy()
    end

    currentPage = Instance.new("ScrollingFrame")
    currentPage.Parent = menu
    currentPage.Size = UDim2.new(1, -10, 1, -10)
    currentPage.Position = UDim2.fromOffset(5, 5)
    currentPage.BackgroundTransparency = 1
    currentPage.BorderSizePixel = 0
    currentPage.ScrollBarThickness = 3
    currentPage.ScrollBarImageColor3 = purple
    currentPage.CanvasSize = UDim2.new(0, 0, 0, 0)
end

local function addLabel(text, y)
    local label = Instance.new("TextLabel", currentPage)
    label.Position = UDim2.fromOffset(8, y)
    label.Size = UDim2.new(1, -16, 0, 28)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = purple
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
end

local function addButton(text, y)
    local btn = Instance.new("TextButton", currentPage)
    btn.Position = UDim2.fromOffset(8, y)
    btn.Size = UDim2.new(1, -16, 0, 31)
    btn.BackgroundColor3 = Color3.fromRGB(75, 45, 105)
    btn.Text = text
    btn.TextColor3 = white
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12

    Instance.new("UICorner", btn).CornerRadius =
        UDim.new(0, 6)

    return btn
end

local function addToggle(text, y)
    local enabled = false
    local btn = addButton(text .. " : OFF", y)

    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        btn.Text = text .. (enabled and " : ON" or " : OFF")
        btn.BackgroundColor3 = enabled
            and purple
            or Color3.fromRGB(75, 45, 105)
    end)
end

local function showPage(name)
    clearPage()

    if name == "Home" then
        addLabel("WELCOME TO LANZZ HUB", 5)
        addButton("Steal and Egg Edition", 42)
        addButton("Version 1.0 - Purple", 82)

    elseif name == "Farm" then
        addLabel("FARM MENU", 5)
        addToggle("Auto Steal (UI)", 40)
        addToggle("Instant Steal (UI)", 78)
        addButton("Go to Egg Area (UI)", 116)
        addButton("Return to Base (UI)", 154)

    elseif name == "Player" then
        addLabel("PLAYER MENU", 5)
        addToggle("Player Info", 40)
        addToggle("Show Statistics", 78)

    elseif name == "Visual" then
        addLabel("VISUAL MENU", 5)
        addToggle("Purple Theme", 40)
        addToggle("Show Notifications", 78)

    elseif name == "Server" then
        addLabel("SERVER MENU", 5)
        addButton("Server Information", 40)
        addButton("Current Player Count", 78)

    elseif name == "Settings" then
        addLabel("SETTINGS", 5)
        addButton("Purple Theme", 40)
        addButton("Panel Size: Medium", 78)

    elseif name == "Config" then
        addLabel("CONFIGURATION", 5)
        addButton("LANZZ HUB V1.0", 40)
        addButton("Made with Lua", 78)
    end

    currentPage.CanvasSize = UDim2.new(0, 0, 0, 220)
end

for i, name in ipairs(pages) do
    local btn = Instance.new("TextButton", sidebar)
    btn.Position = UDim2.fromOffset(5, 5 + (i-1)*33)
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(65, 40, 90)
    btn.Text = name
    btn.TextColor3 = white
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11

    Instance.new("UICorner", btn).CornerRadius =
        UDim.new(0, 5)

    btn.MouseButton1Click:Connect(function()
        showPage(name)
    end)
end

showPage("Home")

print("LANZZ HUB V1.0 Loaded!")
