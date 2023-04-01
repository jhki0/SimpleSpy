if getgenv().SimpleSpyExecuted and type(getgenv().SimpleSpyShutdown) == "function" then
    getgenv().SimpleSpyShutdown()
end

local configs = {
    logcheckcaller = false,
    autoblock = false,
    funcEnabled = true,
    advancedinfo = false,
    logreturnvalues = false,
    supersecretdevtoggle = false,
    weaktables = false
}

local game = game
local mt = getrawmetatable(game)
local workspace = workspace
local table = table
local math = math
local task = task
local coroutine = coroutine
local string = string
local Color3 = Color3
local Instance = Instance
local syn = syn 
local oth = syn and syn.oth

local unhook = oth and oth.unhook
local hook = oth and oth.hook
local lower = string.lower
local round = math.round
local running = coroutine.running
local resume = coroutine.resume
local status = coroutine.status
local yield = coroutine.yield
local create = coroutine.create

local GetDebugId = game.GetDebugId
local tostring = tostring
local tonumber = tonumber
local delay = task.delay
local spawn = task.spawn
local clear = table.clear
local clone = table.clone

local get_thread_identity = (syn and syn.get_thread_identity) or getthreadidentity
local set_thread_identity = (syn and syn.set_thread_identity) or setidentity
local getcustomasset = getsynasset or getcustomasset
local clonefunction = clonefunction or function(func)
    return func
end
local cloneref = cloneref or function(instance)
    return instance
end

local function Create(instance, properties, children)
    local obj = Instance.new(instance)

    for i, v in next, properties or {} do
        obj[i] = v
        for _, child in next, children or {} do
            child.Parent = obj;
        end
    end
    return obj;
end

local function SafeGetService(service)
    return cloneref(game:GetService(service))
end

local function Safetostring(userdata)
	if type(userdata) == "table" or typeof(userdata) == "userdata" then
		local rawmetatable = getrawmetatable(userdata)
		local cachedstring = rawmetatable and rawget(rawmetatable, "__tostring")

		if cachedstring then
			rawset(rawmetatable, "__tostring", nil)
			local safestring = tostring(userdata)
			rawset(rawmetatable, "__tostring", cachedstring)
			return safestring
		end
	end
	return tostring(userdata)
end

local CoreGui = SafeGetService("CoreGui")
local Players = SafeGetService("Players")
local RunService = SafeGetService("RunService")
local UserInputService = SafeGetService("UserInputService")
local TweenService = SafeGetService("TweenService")
local ContentProvider = SafeGetService("ContentProvider")
local TextService = SafeGetService("TextService")
local http = SafeGetService("HttpService")

local function ErrorPrompt(Message,state)
    if getrenv then
        local ErrorPrompt = getrenv().require(CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("ErrorPrompt")) -- File can be located in your roblox folder (C:\Users\%Username%\AppData\Local\Roblox\Versions\whateverversionitis\ExtraContent\scripts\CoreScripts\Modules)
        local prompt = ErrorPrompt.new("Default",{HideErrorCode = true})
        local ErrorStoarge = Create("ScreenGui",{Parent = CoreGui,ResetOnSpawn = false})
        local thread = state and running()
        prompt:setParent(ErrorStoarge)
        prompt:setErrorTitle("Simple Spy V3 Error")
        prompt:updateButtons({{
            Text = "Proceed",
            Callback = function()
                prompt:_close()
                ErrorStoarge:Destroy()
                if thread then
                    resume(thread)
                end
            end,
            Primary = true
        }}, 'Default')
        prompt:_open(Message)
        if thread then
            yield(thread)
        end
    else
        warn(Message)
    end
end

local Highlight = (isfile and loadfile and isfile("Highlight.lua") and loadfile("Highlight.lua")()) or loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/Highlight.lua"))()

local oldcolor = Color3.new
local oldcolorrgb = Color3.fromRGB

local old = Random.new(math.random(1,1000))
local fun = function()
    return oldcolor(old:NextNumber(),old:NextNumber(),old:NextNumber())
end

local fun2 = function()
    return oldcolorrgb(old:NextNumber()*255,old:NextNumber()*255,old:NextNumber()*255)
end

---- GENERATED (kinda sorta mostly) BY GUI to LUA ----

-- Instances:

local SimpleSpy3 = Create("ScreenGui",{ResetOnSpawn = false})
local Storage = Create("Folder",{Parent = SimpleSpy3})
local Background = Create("Frame",{Parent = SimpleSpy3,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 500, 0, 200),Size = UDim2.new(0, 450, 0, 268)})
local LeftPanel = Create("Frame",{Parent = Background,BackgroundColor3 = fun2(53, 52, 55),BorderSizePixel = 0,Position = UDim2.new(0, 0, 0, 19),Size = UDim2.new(0, 131, 0, 249)})
local LogList = Create("ScrollingFrame",{Parent = LeftPanel,Active = true,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,BorderSizePixel = 0,Position = UDim2.new(0, 0, 0, 9),Size = UDim2.new(0, 131, 0, 232),CanvasSize = UDim2.new(0, 0, 0, 0),ScrollBarThickness = 4})
local UIListLayout = Create("UIListLayout",{Parent = LogList,HorizontalAlignment = Enum.HorizontalAlignment.Center,SortOrder = Enum.SortOrder.LayoutOrder})
local RightPanel = Create("Frame",{Parent = Background,BackgroundColor3 = fun2(37, 36, 38),BorderSizePixel = 0,Position = UDim2.new(0, 131, 0, 19),Size = UDim2.new(0, 319, 0, 249)})
local CodeBox = Create("Frame",{Parent = RightPanel,BackgroundColor3 = fun(0.0823529, 0.0745098, 0.0784314),BorderSizePixel = 0,Size = UDim2.new(0, 319, 0, 119)})
local ScrollingFrame = Create("ScrollingFrame",{Parent = RightPanel,Active = true,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 0, 0.5, 0),Size = UDim2.new(1, 0, 0.5, -9),CanvasSize = UDim2.new(0, 0, 0, 0),ScrollBarThickness = 4})
local UIGridLayout = Create("UIGridLayout",{Parent = ScrollingFrame,HorizontalAlignment = Enum.HorizontalAlignment.Center,SortOrder = Enum.SortOrder.LayoutOrder,CellPadding = UDim2.new(0, 0, 0, 0),CellSize = UDim2.new(0, 94, 0, 27)})
local TopBar = Create("Frame",{Parent = Background,BackgroundColor3 = fun2(37, 35, 38),BorderSizePixel = 0,Size = UDim2.new(0, 450, 0, 19)})
local Simple = Create("TextButton",{Parent = TopBar,BackgroundColor3 = fun(1, 1, 1),AutoButtonColor = false,BackgroundTransparency = 1,Position = UDim2.new(0, 5, 0, 0),Size = UDim2.new(0, 57, 0, 18),Font = Enum.Font.SourceSansBold,Text =  "SimpleSpy",TextColor3 = fun(1, 1, 1),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
local CloseButton = Create("TextButton",{Parent = TopBar,BackgroundColor3 = fun(0.145098, 0.141176, 0.14902),BorderSizePixel = 0,Position = UDim2.new(1, -19, 0, 0),Size = UDim2.new(0, 19, 0, 19),Font = Enum.Font.SourceSans,Text = "",TextColor3 = fun(0, 0, 0),TextSize = 14})
local ImageLabel = Create("ImageLabel",{Parent = CloseButton,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 5, 0, 5),Size = UDim2.new(0, 9, 0, 9),Image = "http://www.roblox.com/asset/?id=5597086202"})
local MaximizeButton = Create("TextButton",{Parent = TopBar,BackgroundColor3 = fun(0.145098, 0.141176, 0.14902),BorderSizePixel = 0,Position = UDim2.new(1, -38, 0, 0),Size = UDim2.new(0, 19, 0, 19),Font = Enum.Font.SourceSans,Text = "",TextColor3 = fun(0, 0, 0),TextSize = 14})
local ImageLabel_2 = Create("ImageLabel",{Parent = MaximizeButton,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 5, 0, 5),Size = UDim2.new(0, 9, 0, 9),Image = "http://www.roblox.com/asset/?id=5597108117"})
local MinimizeButton = Create("TextButton",{Parent = TopBar,BackgroundColor3 = fun(0.145098, 0.141176, 0.14902),BorderSizePixel = 0,Position = UDim2.new(1, -57, 0, 0),Size = UDim2.new(0, 19, 0, 19),Font = Enum.Font.SourceSans,Text = "",TextColor3 = fun(0, 0, 0),TextSize = 14})
local ImageLabel_3 = Create("ImageLabel",{Parent = MinimizeButton,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 5, 0, 5),Size = UDim2.new(0, 9, 0, 9),Image = "http://www.roblox.com/asset/?id=5597105827"})

local ToolTip = Create("Frame",{Parent = SimpleSpy3,BackgroundColor3 = fun2(26, 26, 26),BackgroundTransparency = 0.1,BorderColor3 = fun(1, 1, 1),Size = UDim2.new(0, 200, 0, 50),ZIndex = 3,Visible = false})
local TextLabel = Create("TextLabel",{Parent = ToolTip,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 2, 0, 2),Size = UDim2.new(0, 196, 0, 46),ZIndex = 3,Font = Enum.Font.SourceSans,Text = "This is some slightly longer text.",TextColor3 = fun(1, 1, 1),TextSize = 14,TextWrapped = true,TextXAlignment = Enum.TextXAlignment.Left,TextYAlignment = Enum.TextYAlignment.Top})

-------------------------------------------------------------------------------

local selectedColor = fun(0.321569, 0.333333, 1)
local deselectedColor = fun(0.8, 0.8, 0.8)
--- So things are descending
local layoutOrderNum = 999999999
--- Whether or not the gui is closing
local mainClosing = false
--- Whether or not the gui is closed (defaults to false)
local closed = false
--- Whether or not the sidebar is closing
local sideClosing = false
--- Whether or not the sidebar is closed (defaults to true but opens automatically on remote selection)
local sideClosed = false
--- Whether or not the code box is maximized (defaults to false)
local maximized = false
--- The event logs to be read from
local logs = setmetatable({},{__mode="kv"})
--- The event currently selected.Log (defaults to nil)
local selected = nil
--- The blacklist (can be a string name or the Remote Instance)
local blacklist = {}
--- The block list (can be a string name or the Remote Instance)
local blocklist = {}
--- Whether or not to add getNil function
local getNil = false
--- Array of remotes (and original functions) connected to
local connectedRemotes = {}
--- True = hookfunction, false = namecall
local toggle = false
--- used to prevent recursives
local prevTables = {}
--- holds logs (for deletion)
local remoteLogs = {}
--- used for hookfunction
getgenv().SIMPLESPYCONFIG_MaxRemotes = 300
local indent = 4
local scheduled = {}
local schedulerconnect
local SimpleSpy = {}
local topstr = ""
local bottomstr = ""
local remotesFadeIn
local rightFadeIn
local codebox
local p
local getnilrequired = false

-- autoblock variables
local history = {}
local excluding = {}

-- if mouse inside gui
local mouseInGui = false

local function jsone(str) return http:JSONEncode(str) end
local function jsond(str) return http:JSONDecode(str) end

local connections = {}
local DecompiledScripts = {}
local generation = {}
local writefiletoggle = false
local originalnamecall

local remoteEvent = Instance.new("RemoteEvent",Storage)
local remoteFunction = Instance.new("RemoteFunction",Storage)
local originalEvent = remoteEvent.FireServer
local originalFunction = remoteFunction.InvokeServer

local oldhooks = {
    
}

local methodtypes = {
    ["fireserver"] = true,
    ["invokeserver"] = true
}

local instancetypes = {
    ["RemoteEvent"] = "FireServer",
    ["RemoteFunction"] = "InvokeServer"
}

local getinfolevel = 3
local synv3 = false

if identifyexecutor then
    local _, version = identifyexecutor()
    if (version and version:sub(1, 2) == 'v3') then
        getinfolevel = 1
        synv3 = true
    end
end

local suc,err = pcall(function() --Only reason Im pcalling this is because of json encoding stuff which requires an http junk
    local cachedconfigs = isfile and readfile and isfile("SimpleSpy//Settings.json") and jsond(readfile("SimpleSpy//Settings.json"))

    if cachedconfigs then
        for i,v in next, configs do
            if cachedconfigs[i] == nil then
                cachedconfigs[i] = v
            end
        end
        configs = cachedconfigs
    end

    if makefolder and isfolder and isfile and writefile then
        if not isfolder("SimpleSpy") then
            makefolder("SimpleSpy")
        end
        if not isfolder("SimpleSpy//Assets") then
            makefolder("SimpleSpy//Assets")
        end
        if not isfile("SimpleSpy//Settings.json") then
            writefile("SimpleSpy//Settings.json",jsone(configs))
        end
        spawn(function()
            repeat wait(6)
                writefile("SimpleSpy//Settings.json",jsone(configs))
            until not writefiletoggle
        end)
    end
end)
if not suc then ErrorPrompt(("An error has occured: (%s)"):format(err)) end

--- Converts arguments to a string and generates code that calls the specified method with them, recommended to be used in conjunction with ValueToString (method must be a string, e.g. `game:GetService("ReplicatedStorage").Remote:FireServer`)
--- @param method string
--- @param args any[]
--- @return string
function SimpleSpy:ArgsToString(method, args)
    assert(typeof(method) == "string", "string expected, got " .. typeof(method))
    assert(typeof(args) == "table", "table expected, got " .. typeof(args))
    return v2v({args = args}) .. "\n\n" .. method .. "(unpack(args))"
end

--- Converts a value to variables with the specified index as the variable name (if nil/invalid then the name will be assigned automatically)
--- @param t any[]
--- @return string
function SimpleSpy:TableToVars(t)
    assert(typeof(t) == "table", "table expected, got " .. typeof(t))
    return v2v(t)
end

--- Converts a value to a variable with the specified `variablename` (if nil/invalid then the name will be assigned automatically)
--- @param value any
--- @return string
function SimpleSpy:ValueToVar(value, variablename)
    assert(variablename == nil or typeof(variablename) == "string", "string expected, got " .. typeof(variablename))
    if not variablename then
        variablename = 1
    end
    return v2v({[variablename] = value})
end

--- Converts any value to a string, cannot preserve function contents
--- @param value any
--- @return string
function SimpleSpy:ValueToString(value)
    return v2s(value)
end

--- Blocks the specified remote instance/string
--- @param remote any
function SimpleSpy:BlockRemote(remote)
    assert(typeof(remote) == "Instance" or typeof(remote) == "string", "Instance | string expected, got " .. typeof(remote))
    blocklist[remote] = true
end

--- Excludes the specified remote from logs (instance/string)
--- @param remote any
function SimpleSpy:ExcludeRemote(remote)
    assert(typeof(remote) == "Instance" or typeof(remote) == "string", "Instance | string expected, got " .. typeof(remote))
    blacklist[remote] = true
end

--- Prevents remote spam from causing lag (clears logs after `getgenv().SIMPLESPYCONFIG_MaxRemotes` or 500 remotes)
function clean()
    local max = getgenv().SIMPLESPYCONFIG_MaxRemotes
    if not typeof(max) == "number" and math.floor(max) ~= max then
        max = 500
    end
    if #remoteLogs > max then
        for i = 100, #remoteLogs do
            local v = remoteLogs[i]
            if typeof(v[1]) == "RBXScriptConnection" then
                v[1]:Disconnect()
            end
            if typeof(v[2]) == "Instance" then
                v[2]:Destroy()
            end
        end
        local newLogs = {}
        for i = 1, 100 do
            table.insert(newLogs, remoteLogs[i])
        end
        remoteLogs = newLogs
    end
end

--- Scales the ToolTip to fit containing text
function scaleToolTip()
    local size = TextService:GetTextSize(TextLabel.Text, TextLabel.TextSize, TextLabel.Font, Vector2.new(196, math.huge))
    TextLabel.Size = UDim2.new(0, size.X, 0, size.Y)
    ToolTip.Size = UDim2.new(0, size.X + 4, 0, size.Y + 4)
end

--- Executed when the toggle button (the SimpleSpy logo) is hovered over
function onToggleButtonHover()
    if not toggle then
        TweenService:Create(Simple, TweenInfo.new(0.5), {TextColor3 = fun2(252, 51, 51)}):Play()
    else
        TweenService:Create(Simple, TweenInfo.new(0.5), {TextColor3 = fun2(68, 206, 91)}):Play()
    end
end

--- Executed when the toggle button is unhovered over
function onToggleButtonUnhover()
    TweenService:Create(Simple, TweenInfo.new(0.5), {TextColor3 = fun2(255, 255, 255)}):Play()
end

--- Executed when the X button is hovered over
function onXButtonHover()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = fun2(255, 60, 60)}):Play()
end

--- Executed when the X button is unhovered over
function onXButtonUnhover()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = fun2(37, 36, 38)}):Play()
end

--- Toggles the remote spy method (when button clicked)
function onToggleButtonClick()
    if toggle then
        TweenService:Create(Simple, TweenInfo.new(0.5), {TextColor3 = fun2(252, 51, 51)}):Play()
    else
        TweenService:Create(Simple, TweenInfo.new(0.5), {TextColor3 = fun2(68, 206, 91)}):Play()
    end
    toggleSpyMethod()
end

--- Reconnects bringBackOnResize if the current viewport changes and also connects it initially
function connectResize()
    if not workspace.CurrentCamera then
        workspace:GetPropertyChangedSignal("CurrentCamera"):Wait()
    end
    local lastCam = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(bringBackOnResize)
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        lastCam:Disconnect()
        if typeof(lastCam) == 'Connection' then
            lastCam:Disconnect()
        end
        lastCam = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(bringBackOnResize)
    end)
end

--- Brings gui back if it gets lost offscreen (connected to the camera viewport changing)
function bringBackOnResize()
    validateSize()
    if sideClosed then
        minimizeSize()
    else
        maximizeSize()
    end
    local currentX = Background.AbsolutePosition.X
    local currentY = Background.AbsolutePosition.Y
    local viewportSize = workspace.CurrentCamera.ViewportSize
    if (currentX < 0) or (currentX > (viewportSize.X - (sideClosed and 131 or Background.AbsoluteSize.X))) then
        if currentX < 0 then
            currentX = 0
        else
            currentX = viewportSize.X - (sideClosed and 131 or Background.AbsoluteSize.X)
        end
    end
    if (currentY < 0) or (currentY > (viewportSize.Y - (closed and 19 or Background.AbsoluteSize.Y) - 36)) then
        if currentY < 0 then
            currentY = 0
        else
            currentY = viewportSize.Y - (closed and 19 or Background.AbsoluteSize.Y) - 36
        end
    end
    TweenService.Create(TweenService, Background, TweenInfo.new(0.1), {Position = UDim2.new(0, currentX, 0, currentY)}):Play()
end

--- Drags gui (so long as mouse is held down)
--- @param input InputObject
function onBarInput(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local lastPos = UserInputService:GetMouseLocation()
        local mainPos = Background.AbsolutePosition
        local offset = mainPos - lastPos
        local currentPos = offset + lastPos
        if not connections["drag"] then
            connections["drag"] = RunService.RenderStepped:Connect(function()
                local newPos = UserInputService:GetMouseLocation()
                if newPos ~= lastPos then
                    local currentX = (offset + newPos).X
                    local currentY = (offset + newPos).Y
                    local viewportSize = workspace.CurrentCamera.ViewportSize
                    if (currentX < 0 and currentX < currentPos.X) or (currentX > (viewportSize.X - (sideClosed and 131 or TopBar.AbsoluteSize.X)) and currentX > currentPos.X) then
                        if currentX < 0 then
                            currentX = 0
                        else
                            currentX = viewportSize.X - (sideClosed and 131 or TopBar.AbsoluteSize.X)
                        end
                    end
                    if (currentY < 0 and currentY < currentPos.Y) or (currentY > (viewportSize.Y - (closed and 19 or Background.AbsoluteSize.Y) - 36) and currentY > currentPos.Y) then
                        if currentY < 0 then
                            currentY = 0
                        else
                            currentY = viewportSize.Y - (closed and 19 or Background.AbsoluteSize.Y) - 36
                        end
                    end
                    currentPos = Vector2.new(currentX, currentY)
                    lastPos = newPos
                    TweenService.Create(TweenService, Background, TweenInfo.new(0.1), {Position = UDim2.new(0, currentPos.X, 0, currentPos.Y)}):Play()
                end
                    -- if input.UserInputState ~= Enum.UserInputState.Begin then
                    --     RunService.UnbindFromRenderStep(RunService, "drag")
                    -- end
            end)
        end
        table.insert(connections, UserInputService.InputEnded:Connect(function(inputE)
            if input == inputE then
                if connections["drag"] then
                    connections["drag"]:Disconnect()
                    connections["drag"] = nil
                end
            end
        end))
    end
end

--- Fades out the table of elements (and makes them invisible), returns a function to make them visible again
function fadeOut(elements)
    local data = {}
    for _, v in next, elements do
        if typeof(v) == "Instance" and v:IsA("GuiObject") and v.Visible then
            spawn(function()
                data[v] = {
                    BackgroundTransparency = v.BackgroundTransparency
                }
                TweenService:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
                if v:IsA("TextBox") or v:IsA("TextButton") or v:IsA("TextLabel") then
                    data[v].TextTransparency = v.TextTransparency
                    TweenService:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
                elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
                    data[v].ImageTransparency = v.ImageTransparency
                    TweenService:Create(v, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
                end
                delay(0.5,function()
                    v.Visible = false
                    for i, x in next, data[v] do
                        v[i] = x
                    end
                    data[v] = true
                end)
            end)
        end
    end
    return function()
        for i, _ in next, data do
            spawn(function()
                local properties = {
                    BackgroundTransparency = i.BackgroundTransparency
                }
                i.BackgroundTransparency = 1
                TweenService:Create(i, TweenInfo.new(0.5), {BackgroundTransparency = properties.BackgroundTransparency}):Play()
                if i:IsA("TextBox") or i:IsA("TextButton") or i:IsA("TextLabel") then
                    properties.TextTransparency = i.TextTransparency
                    i.TextTransparency = 1
                    TweenService:Create(i, TweenInfo.new(0.5), {TextTransparency = properties.TextTransparency}):Play()
                elseif i:IsA("ImageButton") or i:IsA("ImageLabel") then
                    properties.ImageTransparency = i.ImageTransparency
                    i.ImageTransparency = 1
                    TweenService:Create(i, TweenInfo.new(0.5), {ImageTransparency = properties.ImageTransparency}):Play()
                end
                i.Visible = true
            end)
        end
    end
end

--- Expands and minimizes the gui (closed is the toggle boolean)
function toggleMinimize(override)
    if mainClosing and not override or maximized then
        return
    end
    mainClosing = true
    closed = not closed
    if closed then
        if not sideClosed then
            toggleSideTray(true)
        end
        LeftPanel.Visible = true
        remotesFadeIn = fadeOut(LeftPanel:GetDescendants())
        TweenService:Create(LeftPanel, TweenInfo.new(0.5), {Size = UDim2.new(0, 131, 0, 0)}):Play()
        wait(0.5)
    else
        TweenService:Create(LeftPanel, TweenInfo.new(0.5), {Size = UDim2.new(0, 131, 0, 249)}):Play()
        wait(0.5)
        if remotesFadeIn then
            remotesFadeIn()
            remotesFadeIn = nil
        end
        bringBackOnResize()
    end
    mainClosing = false
end

--- Expands and minimizes the sidebar (sideClosed is the toggle boolean)
function toggleSideTray(override)
    if sideClosing and not override or maximized then
        return
    end
    sideClosing = true
    sideClosed = not sideClosed
    if sideClosed then
        rightFadeIn = fadeOut(RightPanel:GetDescendants())
        wait(0.5)
        minimizeSize(0.5)
        wait(0.5)
        RightPanel.Visible = false
    else
        if closed then
            toggleMinimize(true)
        end
        RightPanel.Visible = true
        maximizeSize(0.5)
        wait(0.5)
        if rightFadeIn then
            rightFadeIn()
        end
        bringBackOnResize()
    end
    sideClosing = false
end

--- Expands code box to fit screen for more convenient viewing
function toggleMaximize()
    if not sideClosed and not maximized then
        maximized = true
        local disable = Instance.new("TextButton")
        local prevSize = UDim2.new(0, CodeBox.AbsoluteSize.X, 0, CodeBox.AbsoluteSize.Y)
        local prevPos = UDim2.new(0,CodeBox.AbsolutePosition.X, 0, CodeBox.AbsolutePosition.Y)
        disable.Size = UDim2.new(1, 0, 1, 0)
        disable.BackgroundColor3 = fun()
        disable.BorderSizePixel = 0
        disable.Text = 0
        disable.ZIndex = 3
        disable.BackgroundTransparency = 1
        disable.AutoButtonColor = false
        CodeBox.ZIndex = 4
        CodeBox.Position = prevPos
        CodeBox.Size = prevSize
        TweenService:Create(CodeBox, TweenInfo.new(0.5), {Size = UDim2.new(0.5, 0, 0.5, 0), Position = UDim2.new(0.25, 0, 0.25, 0)}):Play()
        TweenService:Create(disable, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
        disable.MouseButton1Click:Connect(function()
            if UserInputService:GetMouseLocation().Y + 36 >= CodeBox.AbsolutePosition.Y and UserInputService:GetMouseLocation().Y + 36 <= CodeBox.AbsolutePosition.Y + CodeBox.AbsoluteSize.Y and UserInputService:GetMouseLocation().X >= CodeBox.AbsolutePosition.X and UserInputService:GetMouseLocation().X <= CodeBox.AbsolutePosition.X + CodeBox.AbsoluteSize.X then
                return
            end
            TweenService:Create(CodeBox, TweenInfo.new(0.5), {Size = prevSize, Position = prevPos}):Play()
            TweenService:Create(disable, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
            wait(0.5)
            disable:Destroy()
            CodeBox.Size = UDim2.new(1, 0, 0.5, 0)
            CodeBox.Position = UDim2.new(0, 0, 0, 0)
            CodeBox.ZIndex = 0
            maximized = false
        end)
    end
end

--- Checks if cursor is within resize range
--- @param p Vector2
function isInResizeRange(p)
    local relativeP = p - Background.AbsolutePosition
    local range = 5
    if relativeP.X >= TopBar.AbsoluteSize.X - range and relativeP.Y >= Background.AbsoluteSize.Y - range
        and relativeP.X <= TopBar.AbsoluteSize.X and relativeP.Y <= Background.AbsoluteSize.Y then
        return true, 'B'
    elseif relativeP.X >= TopBar.AbsoluteSize.X - range and relativeP.X <= Background.AbsoluteSize.X then
        return true, 'X'
    elseif relativeP.Y >= Background.AbsoluteSize.Y - range and relativeP.Y <= Background.AbsoluteSize.Y then
        return true, 'Y'
    end
    return false
end

--- Checks if cursor is within dragging range
--- @param p Vector2
function isInDragRange(p)
    local relativeP = p - Background.AbsolutePosition
    if relativeP.X <= TopBar.AbsoluteSize.X - CloseButton.AbsoluteSize.X * 3 and relativeP.X >= 0
        and relativeP.Y <= TopBar.AbsoluteSize.Y and relativeP.Y >= 0 then
        return true
    end
    return false
end

--- Called when mouse enters SimpleSpy
local customCursor = Create("ImageLabel",{Parent = SimpleSpy3,Visible = false,Size = UDim2.fromOffset(200, 200),ZIndex = 1e5,BackgroundTransparency = 1,Image = "",Parent = SimpleSpy3})
function mouseEntered()
    local con = connections["SIMPLESPY_CURSOR"]
    if con then
        con:Disconnect()
        connections["SIMPLESPY_CURSOR"] = nil
    end
    connections["SIMPLESPY_CURSOR"] = RunService.RenderStepped:Connect(function()
        UserInputService.MouseIconEnabled = not mouseInGui
        customCursor.Visible = mouseInGui
        if mouseInGui and getgenv().SimpleSpyExecuted then
            local mouseLocation = UserInputService:GetMouseLocation() - Vector2.new(0, 36)
            customCursor.Position = UDim2.fromOffset(mouseLocation.X - customCursor.AbsoluteSize.X / 2, mouseLocation.Y - customCursor.AbsoluteSize.Y / 2)
            local inRange, type = isInResizeRange(mouseLocation)
            if inRange and not closed then
                if not sideClosed then
                    customCursor.Image = type == 'B' and "rbxassetid://6065821980" or type == 'X' and "rbxassetid://6065821086" or type == 'Y' and "rbxassetid://6065821596"
                elseif type == 'Y' or type == 'B' then
                    customCursor.Image = "rbxassetid://6065821596"
                end
            elseif customCursor.Image ~= "rbxassetid://6065775281" then
                customCursor.Image = "rbxassetid://6065775281"
            end
        else
            connections["SIMPLESPY_CURSOR"]:Disconnect()
        end
    end)
end

--- Called when mouse moves
function mouseMoved()
    local mousePos = UserInputService:GetMouseLocation() - Vector2.new(0, 36)
    if not closed
    and mousePos.X >= TopBar.AbsolutePosition.X and mousePos.X <= TopBar.AbsolutePosition.X + TopBar.AbsoluteSize.X
    and mousePos.Y >= Background.AbsolutePosition.Y and mousePos.Y <= Background.AbsolutePosition.Y + Background.AbsoluteSize.Y then
        if not mouseInGui then
            mouseInGui = true
            mouseEntered()
        end
    else
        mouseInGui = false
    end
end

--- Adjusts the ui elements to the 'Maximized' size
function maximizeSize(speed)
    if not speed then
        speed = 0.05
    end
    TweenService:Create(LeftPanel, TweenInfo.new(speed), { Size = UDim2.fromOffset(LeftPanel.AbsoluteSize.X, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(RightPanel, TweenInfo.new(speed), { Size = UDim2.fromOffset(Background.AbsoluteSize.X - LeftPanel.AbsoluteSize.X, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(TopBar, TweenInfo.new(speed), { Size = UDim2.fromOffset(Background.AbsoluteSize.X, TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(ScrollingFrame, TweenInfo.new(speed), { Size = UDim2.fromOffset(Background.AbsoluteSize.X - LeftPanel.AbsoluteSize.X, 110), Position = UDim2.fromOffset(0, Background.AbsoluteSize.Y - 119 - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(CodeBox, TweenInfo.new(speed), { Size = UDim2.fromOffset(Background.AbsoluteSize.X - LeftPanel.AbsoluteSize.X, Background.AbsoluteSize.Y - 119 - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(LogList, TweenInfo.new(speed), { Size = UDim2.fromOffset(LogList.AbsoluteSize.X, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y - 18) }):Play()
end

--- Adjusts the ui elements to close the side
function minimizeSize(speed)
    if not speed then
        speed = 0.05
    end
    TweenService:Create(LeftPanel, TweenInfo.new(speed), { Size = UDim2.fromOffset(LeftPanel.AbsoluteSize.X, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(RightPanel, TweenInfo.new(speed), { Size = UDim2.fromOffset(0, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(TopBar, TweenInfo.new(speed), { Size = UDim2.fromOffset(LeftPanel.AbsoluteSize.X, TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(ScrollingFrame, TweenInfo.new(speed), { Size = UDim2.fromOffset(0, 119), Position = UDim2.fromOffset(0, Background.AbsoluteSize.Y - 119 - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(CodeBox, TweenInfo.new(speed), { Size = UDim2.fromOffset(0, Background.AbsoluteSize.Y - 119 - TopBar.AbsoluteSize.Y) }):Play()
    TweenService:Create(LogList, TweenInfo.new(speed), { Size = UDim2.fromOffset(LogList.AbsoluteSize.X, Background.AbsoluteSize.Y - TopBar.AbsoluteSize.Y - 18) }):Play()
end

--- Ensures size is within screensize limitations
function validateSize()
    local x, y = Background.AbsoluteSize.X, Background.AbsoluteSize.Y
    local screenSize = workspace.CurrentCamera.ViewportSize
    if x + Background.AbsolutePosition.X > screenSize.X then
        if screenSize.X - Background.AbsolutePosition.X >= 450 then
            x = screenSize.X - Background.AbsolutePosition.X
        else
            x = 450
        end
    elseif y + Background.AbsolutePosition.Y > screenSize.Y then
        if screenSize.X - Background.AbsolutePosition.Y >= 268 then
            y = screenSize.Y - Background.AbsolutePosition.Y
        else
            y = 268
        end
    end
    Background.Size = UDim2.fromOffset(x, y)
end

--- Called on user input while mouse in 'Background' frame
--- @param input InputObject
function backgroundUserInput(input)
    local mousePos = UserInputService:GetMouseLocation() - Vector2.new(0, 36)
    local inResizeRange, type = isInResizeRange(mousePos)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and inResizeRange then
        local lastPos = UserInputService:GetMouseLocation()
        local offset = Background.AbsoluteSize - lastPos
        local currentPos = lastPos + offset
        if not connections["SIMPLESPY_RESIZE"] then
            connections["SIMPLESPY_RESIZE"] = RunService.RenderStepped:Connect(function()
                local newPos = UserInputService:GetMouseLocation()
                if newPos ~= lastPos then
                    local currentX = (newPos + offset).X
                    local currentY = (newPos + offset).Y
                    if currentX < 450 then
                        currentX = 450
                    end
                    if currentY < 268 then
                        currentY = 268
                    end
                    currentPos = Vector2.new(currentX, currentY)
                    Background.Size = UDim2.fromOffset((not sideClosed and not closed and (type == "X" or type == "B")) and currentPos.X or Background.AbsoluteSize.X, (--[[(not sideClosed or currentPos.X <= LeftPanel.AbsolutePosition.X + LeftPanel.AbsoluteSize.X) and]] not closed and (type == "Y" or type == "B")) and currentPos.Y or Background.AbsoluteSize.Y)
                    validateSize()
                    if sideClosed then
                        minimizeSize()
                    else
                        maximizeSize()
                    end
                    lastPos = newPos
                end
            end)
        end
        table.insert(connections, UserInputService.InputEnded:Connect(function(inputE)
            if input == inputE then
                if connections["SIMPLESPY_RESIZE"] then
                    connections["SIMPLESPY_RESIZE"]:Disconnect()
                    connections["SIMPLESPY_RESIZE"] = nil
                end
            end
        end))
    elseif isInDragRange(mousePos) then
        onBarInput(input)
    end
end

--- Gets the player an instance is descended from
function getPlayerFromInstance(instance)
    for _, v in next, Players:GetPlayers() do
        if v.Character and (instance:IsDescendantOf(v.Character) or instance == v.Character) then
            return v
        end
    end
end

--- Runs on MouseButton1Click of an event frame
function eventSelect(frame)
    if selected and selected.Log  then
        if selected.Button then
            spawn(function()
                TweenService:Create(selected.Button, TweenInfo.new(0.5), {BackgroundColor3 = fun2(0, 0, 0)}):Play()
            end)
        end
        selected = nil
    end
    for _, v in next, logs do
        if frame == v.Log then
            selected = v
        end
    end
    if selected and selected.Log then
        spawn(function()
            TweenService:Create(frame.Button, TweenInfo.new(0.5), {BackgroundColor3 = fun2(92, 126, 229)}):Play()
        end)
        codebox:setRaw(selected.GenScript)
    end
    if sideClosed then
        toggleSideTray()
    end
end

--- Updates the canvas size to fit the current amount of function buttons
function updateFunctionCanvas()
    ScrollingFrame.CanvasSize = UDim2.fromOffset(UIGridLayout.AbsoluteContentSize.X, UIGridLayout.AbsoluteContentSize.Y)
end

--- Updates the canvas size to fit the amount of current remotes
function updateRemoteCanvas()
    LogList.CanvasSize = UDim2.fromOffset(UIListLayout.AbsoluteContentSize.X, UIListLayout.AbsoluteContentSize.Y)
end

--- Allows for toggling of the tooltip and easy setting of le description
--- @param enable boolean
--- @param text string
function makeToolTip(enable, text)
    if enable and text then
        if ToolTip.Visible then
            ToolTip.Visible = false
            local tooltip = connections["ToolTip"]
            if tooltip then
                tooltip:Disconnect()
            end
        end
        local first = true
        connections["ToolTip"] = RunService.RenderStepped:Connect(function()
            local MousePos = UserInputService:GetMouseLocation()
            local topLeft = MousePos + Vector2.new(20, -15)
            local bottomRight = topLeft + ToolTip.AbsoluteSize
            local ViewportSize = workspace.CurrentCamera.ViewportSize
            local ViewportSizeX = ViewportSize.X
            local ViewportSizeY = ViewportSize.Y

            if topLeft.X < 0 then
                topLeft = Vector2.new(0, topLeft.Y)
            elseif bottomRight.X > ViewportSizeX then
                topLeft = Vector2.new(ViewportSizeX - ToolTip.AbsoluteSize.X, topLeft.Y)
            end
            if topLeft.Y < 0 then
                topLeft = Vector2.new(topLeft.X, 0)
            elseif bottomRight.Y > ViewportSizeY - 35 then
                topLeft = Vector2.new(topLeft.X, ViewportSizeY - ToolTip.AbsoluteSize.Y - 35)
            end
            if topLeft.X <= MousePos.X and topLeft.Y <= MousePos.Y then
                topLeft = Vector2.new(MousePos.X - ToolTip.AbsoluteSize.X - 2, MousePos.Y - ToolTip.AbsoluteSize.Y - 2)
            end
            if first then
                ToolTip.Position = UDim2.fromOffset(topLeft.X, topLeft.Y)
                first = false
            else
                ToolTip:TweenPosition(UDim2.fromOffset(topLeft.X, topLeft.Y), "Out", "Linear", 0.1)
            end
        end)
        TextLabel.Text = text
        TextLabel.TextScaled = true
        ToolTip.Visible = true
        return
    else
        if ToolTip.Visible then
            ToolTip.Visible = false
            local tooltip = connections["ToolTip"]
            if tooltip then
                tooltip:Disconnect()
            end
        end
    end
end

--- Creates new function button (below codebox)
--- @param name string
---@param description function
---@param onClick function
function newButton(name, description, onClick)
    local FunctionTemplate = Create("Frame",{Name = "FunctionTemplate",Parent = ScrollingFrame,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Size = UDim2.new(0, 117, 0, 23)})
    local ColorBar = Create("Frame",{Name = "ColorBar",Parent = FunctionTemplate,BackgroundColor3 = fun(1, 1, 1),BorderSizePixel = 0,Position = UDim2.new(0, 7, 0, 10),Size = UDim2.new(0, 7, 0, 18),ZIndex = 3})
    local Text = Create("TextLabel",{Text = name,Name = "Text",Parent = FunctionTemplate,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 19, 0, 10),Size = UDim2.new(0, 69, 0, 18),ZIndex = 2,Font = Enum.Font.SourceSans,TextColor3 = fun(1, 1, 1),TextSize = 14,TextStrokeColor3 = fun(0.145098, 0.141176, 0.14902),TextXAlignment = Enum.TextXAlignment.Left})
    local Button = Create("TextButton",{Name = "Button",Parent = FunctionTemplate,BackgroundColor3 = fun(0, 0, 0),BackgroundTransparency = 0.69999998807907,BorderColor3 = fun(1, 1, 1),Position = UDim2.new(0, 7, 0, 10),Size = UDim2.new(0, 80, 0, 18),AutoButtonColor = false,Font = Enum.Font.SourceSans,Text = "",TextColor3 = fun(0, 0, 0),TextSize = 14})

    Button.MouseEnter:Connect(function()
        makeToolTip(true, description())
    end)
    Button.MouseLeave:Connect(function()
        makeToolTip(false)
    end)
    FunctionTemplate.AncestryChanged:Connect(function()
        makeToolTip(false)
    end)
    Button.MouseButton1Click:Connect(function(...)
        onClick(FunctionTemplate, ...)
    end)
    updateFunctionCanvas()
end

--- Adds new Remote to logs
--- @param name string The name of the remote being logged
--- @param type string The type of the remote being logged (either 'function' or 'event')
--- @param args any
--- @param remote any
--- @param function_info string
--- @param blocked any
function newRemote(type, name, args, remote, func, blocked, src, metamethod,info,id)
    if layoutOrderNum < 1 then layoutOrderNum = 999999999 end
    local RemoteTemplate = Create("Frame",{LayoutOrder = layoutOrderNum,Name = "RemoteTemplate",Parent = LogList,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Size = UDim2.new(0, 117, 0, 27)})
    local ColorBar = Create("Frame",{Name = "ColorBar",Parent = RemoteTemplate,BackgroundColor3 = (type == "event" and fun2(255, 242, 0)) or fun2(99, 86, 245),BorderSizePixel = 0,Position = UDim2.new(0, 0, 0, 1),Size = UDim2.new(0, 7, 0, 18),ZIndex = 2})
    local Text = Create("TextLabel",{TextTruncate = Enum.TextTruncate.AtEnd,Name = "Text",Parent = RemoteTemplate,BackgroundColor3 = fun(1, 1, 1),BackgroundTransparency = 1,Position = UDim2.new(0, 12, 0, 1),Size = UDim2.new(0, 105, 0, 18),ZIndex = 2,Font = Enum.Font.SourceSans,Text = name,TextColor3 = fun(1, 1, 1),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
    local Button = Create("TextButton",{Name = "Button",Parent = RemoteTemplate,BackgroundColor3 = fun(0, 0, 0),BackgroundTransparency = 0.75,BorderColor3 = fun(1, 1, 1),Position = UDim2.new(0, 0, 0, 1),Size = UDim2.new(0, 117, 0, 18),AutoButtonColor = false,Font = Enum.Font.SourceSans,Text = "",TextColor3 = fun(0, 0, 0),TextSize = 14})

    local log = {
        Name = name,
        Function = func,
        Remote = cloneref(remote),
        DebugId = id,
        metamethod = metamethod,
        args = configs.weaktables and setmetatable(args,{__mode="kv"}) or args,
        info = info,
        Log = RemoteTemplate,
        Button = Button,
        Blocked = blocked,
        Source = src and cloneref(src),
        GenScript = "-- Generating, please wait...\n-- (If this message persists, the remote args are likely extremely long)"
    }
    if src and not DecompiledScripts[src] then
        DecompiledScripts[src] = nil
    end
    logs[#logs + 1] = log
    local connect = Button.MouseButton1Click:Connect(function()
        eventSelect(RemoteTemplate)
        log.GenScript = genScript(remote, args)
        if blocked then
            log.GenScript = "-- THIS REMOTE WAS PREVENTED FROM FIRING TO THE SERVER BY SIMPLESPY\n\n" .. log.GenScript
        end
        if selected == log and RemoteTemplate then
            eventSelect(RemoteTemplate)
        end
    end)
    layoutOrderNum -= 1
    table.insert(remoteLogs, 1, {connect, RemoteTemplate})
    clean()
    updateRemoteCanvas()
end

--- Generates a script from the provided arguments (first has to be remote path)
function genScript(remote, args)
    prevTables = {}
    local gen = ""
    if #args > 0 then
        xpcall(function()
            gen = v2v({args = args}) .. "\n"
        end,function(err)
            gen = gen.."-- An error has occured:\n--"..err.."\n-- TableToString failure! Reverting to legacy functionality (results may vary)\nlocal args = {"
            if not pcall(function()
                    for i, v in next, args do
                        if type(i) ~= "Instance" and type(i) ~= "userdata" then
                            gen = gen .. "\n    [object] = "
                        elseif type(i) == "string" then
                            gen = gen .. '\n    ["' .. i .. '"] = '
                        elseif type(i) == "userdata" and typeof(i) ~= "Instance" then
                            gen = gen .. "\n    [" .. string.format("nil --[[%s]]", typeof(v)) .. ")] = "
                        elseif type(i) == "userdata" then
                            gen = gen .. "\n    [game." .. i:GetFullName() .. ")] = "
                        end
                        if type(v) ~= "Instance" and type(v) ~= "userdata" then
                            gen = gen .. "object"
                        elseif type(v) == "string" then
                            gen = gen .. '"' .. v .. '"'
                        elseif type(v) == "userdata" and typeof(v) ~= "Instance" then
                            gen = gen .. string.format("nil --[[%s]]", typeof(v))
                        elseif type(v) == "userdata" then
                            gen = gen .. "game." .. v:GetFullName()
                        end
                    end
                    gen = gen .. "\n}\n\n"
                end)
            then
                gen = gen .. "}\n-- Legacy tableToString failure! Unable to decompile."
            end
        end)
        if not remote:IsDescendantOf(game) and not getnilrequired then
            gen = "function getNil(name,class) for _,v in next, getnilinstances()do if v.ClassName==class and v.Name==name then return v;end end end\n\n" .. gen
        end
        if remote:IsA("RemoteEvent") then
            gen = gen .. v2s(remote) .. ":FireServer(unpack(args))"
        elseif remote:IsA("RemoteFunction") then
            gen = gen .. v2s(remote) .. ":InvokeServer(unpack(args))"
        end
    else
        if remote:IsA("RemoteEvent") then
            gen = gen .. v2s(remote) .. ":FireServer()"
        elseif remote:IsA("RemoteFunction") then
            gen = gen .. v2s(remote) .. ":InvokeServer()"
        end
    end
    prevTables = {}
    return gen
end

--- value-to-string: value, string (out), level (indentation), parent table, var name, is from tovar

local ufunctions = {
    TweenInfo = function(u)
        return ("TweenInfo.new(%s, %s, %s, %s, %s, %s)"):format(Safetostring(u.Time),Safetostring(u.EasingStyle),Safetostring(u.EasingDirection),Safetostring(u.RepeatCount),Safetostring(u.Reverses),Safetostring(u.DelayTime))
    end,
    Ray = function(u)
        return ("Ray.new(%s)"):format(Safetostring(u))
    end,
    NumberSequence = function(u)
        return ("NumberRange.new(%s, %s)"):format(Safetostring(u.Min),Safetostring(u.Max))
    end,
    ColorSequence = function(u)
        local ret = "ColorSequence.new("
        for i, v in next, u.KeyPoints do
            ret = ret ..("Color3.new(%s)"):format(Safetostring(v))
            if i < #u.Keypoints then
                ret = ret .. ", "
            end
        end
        return ret .. ")"
    end,
    BrickColor = function(u)
        return ("BrickColor.new(%s)"):format(Safetostring(u.Number))
    end,
    NumberRange = function(u)
        return ("NumberRange.new(%s, %s)"):format(Safetostring(u.Min),Safetostring(u.Max))
    end,
    Region3 = function(u)
        local center = u.CFrame.Position
        local centersize = u.Size
        
        return ("Region3.new(%s, %s)"):format(v2s(center-centersize/2),v2s(center+centersize/2))
    end,
    Faces = function(u)
        local faces = {}
        if u.Top then
            table.insert(faces, "Top")
        end
        if u.Bottom then
            table.insert(faces, "Enum.NormalId.Bottom")
        end
        if u.Left then
            table.insert(faces, "Enum.NormalId.Left")
        end
        if u.Right then
            table.insert(faces, "Enum.NormalId.Right")
        end
        if u.Back then
            table.insert(faces, "Enum.NormalId.Back")
        end
        if u.Front then
            table.insert(faces, "Enum.NormalId.Front")
        end
        return ("Faces.new(%s)"):format(table.concat(faces, ", "))
    end,
    EnumItem = function(u)
        return Safetostring(u)
    end,
    Enums = function(u)
        return "Enum"
    end,
    Enum = function(u)
        return "Enum." .. Safetostring(u)
    end,
    RBXScriptSignal = function(u)
        return "RBXScriptSignal --[[RBXScriptSignal's are not supported]]"
    end,
    RBXScriptConnection = function(u)
        return "RBXScriptConnection --[[RBXScriptConnection's are not supported]]"
    end,
    Vector3 = function(u)
        return ("Vector3.new(%s)"):format(Safetostring(u))
    end,
    Vector2 = function(u)
        return ("Vector2.new(%s)"):format(Safetostring(u))
    end,
    CFrame = function(u)
        return ("CFrame.new(%s)"):format(Safetostring(u))
    end,
    PathWaypoint = function(u)
        return ("PathWaypoint.new(%s, %s)"):format(v2s(u.Position), v2s(u.Action), u.Label)
    end,
    UDim = function(u)
        return ("UDim.new(%s)"):format(Safetostring(u))
    end,
    UDim2 = function(u)
        return ("UDim2.new(%s"):format(Safetostring(u))
    end,
    Rect = function(u)
        return ("Rect.new(%s)"):format(Safetostring(u))
    end,
    Color3 = function(u)
        return ("Color3.fromRGB(%s, %s, %s)"):format(u.r*255,u.g*255,u.b*255)
    end
}

local typeofv2sfunctions = {
    number = function(v)
        if v == math.huge then
            return "math.huge"
        elseif v == -math.huge then
            return "-math.huge"
        elseif Safetostring(v):match("nan") then
            return "0/0 --[[NaN]]"
        end
        return Safetostring(v)
    end,
    boolean = function(v)
        return Safetostring(v)
    end,
    string = function(v,l)
        return formatstr(v, l)
    end,
    ["function"] = function(v)
        return f2s(v)
    end,
    table = function(v, l, p, n, vtv, i, pt, path, tables, tI)
        return t2s(v, l, p, n, vtv, i, pt, path, tables, tI)
    end,
    Instance = function(v)
        local instance = cloneref(v)
        return i2p(instance,generation[GetDebugId(instance)])
    end,
    userdata = function(v)
        return "newproxy(true)"
    end
}

local typev2sfunctions = {
    userdata = function(v,vtypeof)
        if ufunctions[vtypeof] then
            return ufunctions[vtypeof](v)
        end
        return ("%s(%s) --[[Generation Failure]]"):format(vtypeof,Safetostring(v))
    end,
    vector = function(v)
        return ("Vector3.new(%s)"):format(Safetostring(v))--string.format("Vector3.new(%s, %s, %s)", v2s(v.X), v2s(v.Y), v2s(v.Z))
    end
}


function v2s(v, l, p, n, vtv, i, pt, path, tables, tI)
    local vtypeof = typeof(v)
    local vtype = type(v)
    if not tI then
        tI = {0}
    else
        tI[1] += 1
    end
    if typeofv2sfunctions[vtypeof] then
        return typeofv2sfunctions[vtypeof](v, l, p, n, vtv, i, pt, path, tables, tI)
    elseif typev2sfunctions[vtype] then
        return typev2sfunctions[vtype](v,vtypeof)
    end
    return ("%s(%s) --[[Generation Failure]]"):format(vtypeof,Safetostring(v))
end

--- value-to-variable
--- @param t any
function v2v(t)
    topstr = ""
    bottomstr = ""
    getnilrequired = false
    local ret = ""
    local count = 1
    for i, v in next, t do
        if type(i) == "string" and i:match("^[%a_]+[%w_]*$") then
            ret = ret .. "local " .. i .. " = " .. v2s(v, nil, nil, i, true) .. "\n"
        elseif Safetostring(i):match("^[%a_]+[%w_]*$") then
            ret = ret .. "local " .. lower(Safetostring(i)) .. "_" .. Safetostring(count) .. " = " .. v2s(v, nil, nil, lower(Safetostring(i)) .. "_" .. Safetostring(count), true) .. "\n"
        else
            ret = ret .. "local " .. type(v) .. "_" .. Safetostring(count) .. " = " .. v2s(v, nil, nil, type(v) .. "_" .. Safetostring(count), true) .. "\n"
        end
        count = count + 1
    end
    if getnilrequired then
        topstr = "function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end\n" .. topstr
    end
    if #topstr > 0 then
        ret = topstr .. "\n" .. ret
    end
    if #bottomstr > 0 then
        ret = ret .. bottomstr
    end
    return ret
end

--- table-to-string
--- @param t table
--- @param l number
--- @param p table
--- @param n string
--- @param vtv boolean
--- @param i any
--- @param pt table
--- @param path string
--- @param tables table
--- @param tI table
function t2s(t, l, p, n, vtv, i, pt, path, tables, tI)
    local globalIndex = table.find(getgenv(), t) -- checks if table is a global
    if type(globalIndex) == "string" then
        return globalIndex
    end
    if not tI then
        tI = {0}
    end
    if not path then -- sets path to empty string (so it doesn't have to manually provided every time)
        path = ""
    end
    if not l then -- sets the level to 0 (for indentation) and tables for logging tables it already serialized
        l = 0
        tables = {}
    end
    if not p then -- p is the previous table but doesn't really matter if it's the first
        p = t
    end
    for _, v in next, tables do -- checks if the current table has been serialized before
        if n and rawequal(v, t) then
            bottomstr = bottomstr .. "\n" .. Safetostring(n) .. Safetostring(path) .. " = " .. Safetostring(n) .. Safetostring(({v2p(v, p)})[2])
            return "{} --[[DUPLICATE]]"
        end
    end
    table.insert(tables, t) -- logs table to past tables
    local s =  "{" -- start of serialization
    local size = 0
    l = l + indent -- set indentation level
    for k, v in next, t do -- iterates over table
        size = size + 1 -- changes size for max limit
        if size > (getgenv().SimpleSpyMaxTableSize or 1000) then
            s = s .. "\n" .. string.rep(" ", l) .. "-- MAXIMUM TABLE SIZE REACHED, CHANGE 'getgenv().SimpleSpyMaxTableSize' TO ADJUST MAXIMUM SIZE "
            break
        end
        if rawequal(k, t) then -- checks if the table being iterated over is being used as an index within itself (yay, lua)
            bottomstr = bottomstr .. "\n" .. Safetostring(n) .. Safetostring(path) .. "[" .. Safetostring(n) .. Safetostring(path) .. "]" .. " = " .. (rawequal(v, k) and Safetostring(n) .. Safetostring(path) or v2s(v, l, p, n, vtv, k, t, path .. "[" .. Safetostring(n) .. Safetostring(path) .. "]", tables))
            size -= 1
            continue
        end
        local currentPath = "" -- initializes the path of 'v' within 't'
        if type(k) == "string" and k:match("^[%a_]+[%w_]*$") then -- cleanly handles table path generation (for the first half)
            currentPath = "." .. k
        else
            currentPath = "[" .. v2s(k, l, p, n, vtv, k, t, path .. currentPath, tables, tI) .. "]"
        end
        if size % 100 == 0 then
            scheduleWait()
        end
        -- actually serializes the member of the table
        s = s .. "\n" .. string.rep(" ", l) .. "[" .. v2s(k, l, p, n, vtv, k, t, path .. currentPath, tables, tI) .. "] = " .. v2s(v, l, p, n, vtv, k, t, path .. currentPath, tables, tI) .. ","
    end
    if #s > 1 then -- removes the last comma because it looks nicer (no way to tell if it's done 'till it's done so...)
        s = s:sub(1, #s - 1)
    end
    if size > 0 then -- cleanly indents the last curly bracket
        s = s .. "\n" .. string.rep(" ", l - indent)
    end
    return s .. "}"
end

--- function-to-string
function f2s(f)
    for k, x in next, getgenv() do
        local isgucci, gpath
        if rawequal(x, f) then
            isgucci, gpath = true, ""
        elseif type(x) == "table" then
            isgucci, gpath = v2p(f, x)
        end
        if isgucci and type(k) ~= "function" then
            if type(k) == "string" and k:match("^[%a_]+[%w_]*$") then
                return k .. gpath
            else
                return "getgenv()[" .. v2s(k) .. "]" .. gpath
            end
        end
    end
    if configs.funcEnabled then
        local funcinfo = getinfo(f)
        local funcinfoname = funcinfo and funcinfo.name
        
        if funcinfoname and funcinfoname:match("^[%a_]+[%w_]*$") then
            return ("function() %s end"):format(funcinfoname)
        end
    end
    return ("function() %s end"):format(Safetostring(f))
end

--- instance-to-path
--- @param i userdata
function i2p(i,customgen)
    if customgen then
        return customgen
    end
    local player = getplayer(i)
    local parent = i
    local out = ""
    if parent == nil then
        return "nil"
    elseif player then
        while true do
            if parent and parent == player.Character then
                if player == Players.LocalPlayer then
                    return 'game:GetService("Players").LocalPlayer.Character' .. out
                else
                    return i2p(player) .. ".Character" .. out
                end
            else
                if parent.Name:match("[%a_]+[%w+]*") ~= parent.Name then
                    out = ':FindFirstChild(' .. formatstr(parent.Name) .. ')' .. out
                else
                    out = "." .. parent.Name .. out
                end
            end
            parent = parent.Parent
        end
    elseif parent ~= game then
        while true do
            if parent and parent.Parent == game then
                if SafeGetService(parent.ClassName) then
                    if lower(parent.ClassName) == "workspace" then
                        return "workspace"..out
                    else
                        return 'game:GetService("' .. parent.ClassName .. '")' .. out
                    end
                else
                    if parent.Name:match("[%a_]+[%w_]*") then
                        return "game." .. parent.Name .. out
                    else
                        return 'game:FindFirstChild(' .. formatstr(parent.Name) .. ')' .. out
                    end
                end
            elseif not parent.Parent then
                getnilrequired = true
                return 'getNil(' .. formatstr(parent.Name) .. ', "' .. parent.ClassName .. '")' .. out
            else
                if parent.Name:match("[%a_]+[%w_]*") ~= parent.Name then
                    out = ':WaitForChild(' .. formatstr(parent.Name) .. ')' .. out
                else
                    out = ':WaitForChild("' .. parent.Name .. '")'..out
                end
            end
            parent = parent.Parent
        end
    else
        return "game"
    end
end

--- Gets the player an instance is descended from
function getplayer(instance)
    for _, v in next, Players:GetPlayers() do
        if v.Character and (instance:IsDescendantOf(v.Character) or instance == v.Character) then
            return v
        end
    end
end

--- value-to-path (in table)
function v2p(x, t, path, prev)
    if not path then
        path = ""
    end
    if not prev then
        prev = {}
    end
    if rawequal(x, t) then
        return true, ""
    end
    for i, v in next, t do
        if rawequal(v, x) then
            if type(i) == "string" and i:match("^[%a_]+[%w_]*$") then
                return true, (path .. "." .. i)
            else
                return true, (path .. "[" .. v2s(i) .. "]")
            end
        end
        if type(v) == "table" then
            local duplicate = false
            for _, y in next, prev do
                if rawequal(y, v) then
                    duplicate = true
                end
            end
            if not duplicate then
                table.insert(prev, t)
                local found
                found, p = v2p(x, v, path, prev)
                if found then
                    if type(i) == "string" and i:match("^[%a_]+[%w_]*$") then
                        return true, "." .. i .. p
                    else
                        return true, "[" .. v2s(i) .. "]" .. p
                    end
                end
            end
        end
    end
    return false, ""
end

--- format s: string, byte encrypt (for weird symbols)
function formatstr(s, indentation)
    if not indentation then
        indentation = 0
    end
    local handled, reachedMax = handlespecials(s, indentation)
    return '"' .. handled .. '"' .. (reachedMax and " --[[ MAXIMUM STRING SIZE REACHED, CHANGE 'getgenv().SimpleSpyMaxStringSize' TO ADJUST MAXIMUM SIZE ]]" or "")
end

--- Adds \'s to the text as a replacement to whitespace chars and other things because string.format can't yayeet

local function isFinished(tableinquestion)
    for _, v in next, tableinquestion do
        if status(v) == "running" then
            return false
        end
    end
    return true
end

function handlespecials(s, indentation)
    local i = 0
    local n = 1
    local coroutines = {}
    local coroutineFunc = function(i, r)
        s = s:sub(0, i - 1) .. r .. s:sub(i + 1, -1)
    end
    repeat
        i = i + 1
        local char = s:sub(i, i)
        if string.byte(char) then
            local c = create(coroutineFunc)
            table.insert(coroutines, c)
            if char == "\n" then
                resume(c, i, "\\n")
                -- s = s:sub(0, i - 1) .. "\\n" .. s:sub(i + 1, -1)
                i = i + 1
            elseif char == "\t" then
                resume(c, i, "\\t")
                -- s = s:sub(0, i - 1) .. "\\t" .. s:sub(i + 1, -1)
                i = i + 1
            elseif char == "\\" then
                resume(c, i, "\\\\")
                -- s = s:sub(0, i - 1) .. "\\\\" .. s:sub(i + 1, -1)
                i = i + 1
            elseif char == '"' then
                resume(c, i, "\\\"")
                -- s = s:sub(0, i - 1) .. '\\"' .. s:sub(i + 1, -1)
                i = i + 1
            elseif string.byte(char) > 126 or string.byte(char) < 32 then
                resume(c, i, "\\" .. string.byte(char))
                -- s = s:sub(0, i - 1) .. "\\" .. string.byte(char) .. s:sub(i + 1, -1)
                i = i + #Safetostring(string.byte(char))
            end
            if i >= n * 100 then
                local extra = string.format('" ..\n%s"', string.rep(" ", indentation + indent))
                s = s:sub(0, i) .. extra .. s:sub(i + 1, -1)
                i += #extra
                n += 1
                scheduleWait()
            end
        end
    until char == "" or i > (getgenv().SimpleSpyMaxStringSize or 10000)
    while not isFinished(coroutines) do
        RunService.Heartbeat:Wait()
    end
    if i > (getgenv().SimpleSpyMaxStringSize or 10000) then
        s = string.sub(s, 0, getgenv().SimpleSpyMaxStringSize or 10000)
        return s, true
    end
    return s, false
end

--- finds script from 'src' from getinfo, returns nil if not found
--- @param src string
function getScriptFromSrc(src)
    local realPath
    local runningTest
    --- @type number
    local s, e
    local match = false
    if src:sub(1, 1) == "=" then
        realPath = game
        s = 2
    else
        runningTest = src:sub(2, e and e - 1 or -1)
        for _, v in next, getnilinstances() do
            if v.Name == runningTest then
                realPath = v
                break
            end
        end
        s = #runningTest + 1
    end
    if realPath then
        e = src:sub(s, -1):find("%.")
        local i = 0
        repeat
            i += 1
            if not e then
                runningTest = src:sub(s, -1)
                local test = realPath.FindFirstChild(realPath, runningTest)
                if test then
                    realPath = test
                end
                match = true
            else
                runningTest = src:sub(s, e)
                local test = realPath.FindFirstChild(realPath, runningTest)
                local yeOld = e
                if test then
                    realPath = test
                    s = e + 2
                    e = src:sub(e + 2, -1):find("%.")
                    e = e and e + yeOld or e
                else
                    e = src:sub(e + 2, -1):find("%.")
                    e = e and e + yeOld or e
                end
            end
        until match or i >= 50
    end
    return realPath
end

--- schedules the provided function (and calls it with any args after)
function schedule(f, ...)
    table.insert(scheduled, {f, ...})
end

--- yields the current thread until the scheduler gives the ok
function scheduleWait()
    local thread = running()
    schedule(function()
        resume(thread)
    end)
    yield()
end

--- the big (well tbh small now) boi task scheduler himself, handles p much anything as quicc as possible
function taskscheduler()
    if not toggle then
        scheduled = {}
        return
    end
    if #scheduled > SIMPLESPYCONFIG_MaxRemotes + 100 then
        table.remove(scheduled, #scheduled)
    end
    if #scheduled > 0 then
        local currentf = scheduled[1]
        table.remove(scheduled, 1)
        if type(currentf) == "table" and type(currentf[1]) == "function" then
            pcall(unpack(currentf))
        end
    end
end

local function tablecheck(tabletocheck,instance,id)
    return tabletocheck[id] or tabletocheck[instance.Name]
end

function remoteHandler(methodName, remote, args, info, callingscript, metamethod, blocked, id)
    if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
        if configs.autoblock then
            if excluding[id] then
                return
            end
            if not history[id] then
                history[id] = {badOccurances = 0, lastCall = tick()}
            end
            if tick() - history[id].lastCall < 1 then
                history[id].badOccurances += 1
                return
            else
                history[id].badOccurances = 0
            end
            if history[id].badOccurances > 3 then
                excluding[id] = true
                return
            end
            history[id].lastCall = tick()
        end

        local functionInfoStr = info and info.func or "--Function Info is disabled"

        newRemote(lower(methodName) == "fireserver" and "event" or "function", remote.Name, args, remote, functionInfoStr, blockcheck, callingscript, metamethod, info, id)
    end
end

local function logreturnvalue(func,...)
    local returndata = func(...)
    return returndata
end


local newindex = function(method,originalfunction,...)
    local remote = ...
    if typeof(remote) == 'Instance' then
        if not configs.logcheckcaller and checkcaller() then return originalfunction(...) end

        if methodtypes[lower(method)] then
            local old = get_thread_identity()
            set_thread_identity(8)
            remote = cloneref(remote)

            local id = GetDebugId(remote)
            local blockcheck = tablecheck(blocklist,remote,id)
            if not tablecheck(blacklist,remote,id) then
                local args = {select(2,...)}
                local info
                local callingscript

                if configs.funcEnabled then
                    info = getinfo(getinfolevel)
                    if not islclosure then
                        info = getinfo(getinfolevel+1)
                    end
                    local calling = getcallingscript()
                    callingscript = calling and cloneref(calling) or nil
                end
                spawn(function()
                    schedule(remoteHandler, method, remote, args, info, callingscript, "__index",blockcheck,id)
                end)
            end
            set_thread_identity(old)
            if blockcheck then return end
        end
    end
    return originalfunction(...)
end

local newnamecall = newcclosure(function(...)
    local remote = ...
    if typeof(remote) == 'Instance' then
        if not configs.logcheckcaller and checkcaller() then return originalnamecall(...) end
        local method = getnamecallmethod()
        if method and methodtypes[lower(method)] then
            local old = get_thread_identity()
            set_thread_identity(8)
            remote = cloneref(remote)
            
            local id = GetDebugId(remote)
            local blockcheck = tablecheck(blocklist,remote,id)
            if not tablecheck(blacklist,remote,id) then
                local args = {select(2,...)}
                local info
                local callingscript

                if configs.funcEnabled then
                    info = getinfo(getinfolevel)
                    local calling = getcallingscript()
                    callingscript = calling and cloneref(calling) or nil
                end
                spawn(function()
                    schedule(remoteHandler, method, remote, args, info, callingscript, "__namecall",blockcheck,id)
                end)
            end
            set_thread_identity(old)
            if blockcheck then return end
        end
    end
    return originalnamecall(...)
end)

local newFireServer = newcclosure(function(...)
    return newindex("FireServer",originalEvent,...)
end)

local newInvokeServer = newcclosure(function(...)
    return newindex("InvokeServer",originalFunction,...)
end)

local function disablehooks()
    if synv3 then
        unhook(mt.__namecall,originalnamecall)
        unhook(Instance.new("RemoteEvent").FireServer, originalEvent)
        unhook(Instance.new("RemoteFunction").InvokeServer, originalFunction)
        restorefunction(originalnamecall)
        restorefunction(originalEvent)
        restorefunction(originalFunction)
    else
        if hookmetamethod then
            hookmetamethod(game,"__namecall",originalnamecall)
        else
            hookfunction(mt.__namecall,originalnamecall)
        end
        hookfunction(Instance.new("RemoteEvent").FireServer, originalEvent)
        hookfunction(Instance.new("RemoteFunction").InvokeServer, originalFunction)
    end
end

--- Toggles on and off the remote spy
function toggleSpy()
    if not toggle then
        local oldnamecall
        if synv3 then
            oldnamecall = hook(mt.__namecall,clonefunction(newnamecall))
            originalEvent = hook(Instance.new("RemoteEvent").FireServer, clonefunction(newFireServer))
            originalFunction = hook(Instance.new("RemoteFunction").InvokeServer, clonefunction(newInvokeServer))
        else
            if hookmetamethod then
                oldnamecall = hookmetamethod(game, "__namecall", clonefunction(newnamecall))
            else
                oldnamecall = hookfunction(mt.__namecall,clonefunction(newnamecall))
            end
            originalEvent = hookfunction(Instance.new("RemoteEvent").FireServer, clonefunction(newFireServer))
            originalFunction = hookfunction(Instance.new("RemoteFunction").InvokeServer, clonefunction(newInvokeServer))
        end
        originalnamecall = originalnamecall or function(...)
            return oldnamecall(...)
        end
    else
        disablehooks()
    end
end

--- Toggles between the two remotespy methods (hookfunction currently = disabled)
function toggleSpyMethod()
    toggleSpy()
    toggle = not toggle
end

--- Shuts down the remote spy
local function shutdown()
    if schedulerconnect then
        schedulerconnect:Disconnect()
    end
    for _, connection in next, connections do
        connection:Disconnect()
    end
    clear(connections)
    clear(logs)
    clear(remoteLogs)
    disablehooks()
    SimpleSpy3:Destroy()
    UserInputService.MouseIconEnabled = true
    getgenv().SimpleSpyExecuted = false
    writefiletoggle = false
end

-- main
if not getgenv().SimpleSpyExecuted then
    local succeeded,err = pcall(function()
        if not RunService:IsClient() then
            error("SimpleSpy cannot run on the server!")
        end
        getgenv().SimpleSpyShutdown = shutdown
        onToggleButtonClick()
        if not hookmetamethod then
            ErrorPrompt("Simple Spy V3 will not function to it's fullest capablity due to your executor not supporting hookmetamethod.",true)
        end
        codebox = Highlight.new(CodeBox)
        spawn(function()
            local suc,err = pcall(game.HttpGet,game,"https://raw.githubusercontent.com/78n/SimpleSpy/main/UpdateLog.lua")
            codebox:setRaw((suc and err) or "")
        end)
        getgenv().SimpleSpy = SimpleSpy
        getgenv().getNil = function(name,class)
			for _,v in next, getnilinstances() do
				if v.ClassName == class and v.Name == name then
					return v;
				end
			end
		end
        Background.MouseEnter:Connect(function(...)
            mouseInGui = true
            mouseEntered()
        end)
        Background.MouseLeave:Connect(function(...)
            mouseInGui = false
            mouseEntered()
        end)
        TextLabel:GetPropertyChangedSignal("Text"):Connect(scaleToolTip)
        -- TopBar.InputBegan:Connect(onBarInput)
        MinimizeButton.MouseButton1Click:Connect(toggleMinimize)
        MaximizeButton.MouseButton1Click:Connect(toggleSideTray)
        Simple.MouseButton1Click:Connect(onToggleButtonClick)
        CloseButton.MouseEnter:Connect(onXButtonHover)
        CloseButton.MouseLeave:Connect(onXButtonUnhover)
        Simple.MouseEnter:Connect(onToggleButtonHover)
        Simple.MouseLeave:Connect(onToggleButtonUnhover)
        CloseButton.MouseButton1Click:Connect(shutdown)
        table.insert(connections, UserInputService.InputBegan:Connect(backgroundUserInput))
        connectResize()
        SimpleSpy3.Enabled = true
        spawn(function()
            delay(1,onToggleButtonUnhover)
        end)
        schedulerconnect = RunService.Heartbeat:Connect(taskscheduler)
        bringBackOnResize()
        SimpleSpy3.Parent = (gethui and gethui()) or (syn and syn.protect_gui and syn.protect_gui(SimpleSpy3)) or CoreGui
        spawn(function()
            local lp = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
            generation = {
                [GetDebugId(lp)] = 'game:GetService("Players").LocalPlayer',
                [GetDebugId(lp:GetMouse())] = 'game:GetService("Players").LocalPlayer:GetMouse',
                [GetDebugId(game)] = "game",
                [GetDebugId(workspace)] = "workspace"
            }
        end)
    end)
    if succeeded then
        getgenv().SimpleSpyExecuted = true
        writefiletoggle = true
    else
        shutdown()
        ErrorPrompt("An error has occured:\n"..Safetostring(err))
        return
    end
else
    SimpleSpy3:Destroy()
    return
end

function SimpleSpy:newButton(name, description, onClick)
    return newButton(name, description, onClick)
end

----- ADD ONS ----- (easily add or remove additonal functionality to the RemoteSpy!)
--[[
    Some helpful things:
        - add your function in here, and create buttons for them through the 'newButton' function
        - the first argument provided is the TextButton the player clicks to run the function
        - generated scripts are generated when the namecall is initially fired and saved in remoteFrame objects
        - blacklisted remotes will be ignored directly in namecall (less lag)
        - the properties of a 'remoteFrame' object:
            {
                Name: (string) The name of the Remote
                GenScript: (string) The generated script that appears in the codebox (generated when namecall fired)
                Source: (Instance (LocalScript)) The script that fired/invoked the remote
                Remote: (Instance (RemoteEvent) | Instance (RemoteFunction)) The remote that was fired/invoked
                Log: (Instance (TextButton)) The button being used for the remote (same as 'selected.Log')
            }
        - globals list: (contact @exx#9394 for more information or if you have suggestions for more to be added)
            - closed: (boolean) whether or not the GUI is currently minimized
            - logs: (table[remoteFrame]) full of remoteFrame objects (properties listed above)
            - selected: (remoteFrame) the currently selected remoteFrame (properties listed above)
            - blacklist: (string[] | Instance[] (RemoteEvent) | Instance[] (RemoteFunction)) an array of blacklisted names and remotes
            - codebox: (Instance (TextBox)) the textbox that holds all the code- cleared often
]]
-- Copies the contents of the codebox
newButton(
    "Copy Code",
    function() return "Click to copy code" end,
    function()
        setclipboard(codebox:getString())
        TextLabel.Text = "Copied successfully!"
    end
)

--- Copies the source script (that fired the remote)
newButton(
    "Copy Remote",
    function() return "Click to copy the path of the remote" end,
    function()
        if selected and selected.Remote then
            setclipboard(v2s(selected.Remote))
            TextLabel.Text = "Copied!"
        end
    end
)

-- Executes the contents of the codebox through loadstring
newButton("Run Code",
    function() return "Click to execute code" end,
    function()
        local Remote = selected and selected.Remote
        if Remote then
            TextLabel.Text = "Executing..."
            local succeeded,returnvalue = pcall(function()
                return Remote[instancetypes[Remote.ClassName]](Remote,unpack(selected.args))
            end)
            if succeeded then
                TextLabel.Text = ("Executed successfully!\n%s"):format(v2s(returnvalue))
            else
                TextLabel.Text = ("Execution error!\n%s"):format(returnvalue)
            end
            return
        end
        TextLabel.Text = "Source not found"
    end
)

--- Gets the calling script (not super reliable but w/e)
newButton(
    "Get Script",
    function() return "Click to copy calling script to clipboard\nWARNING: Not super reliable, nil == could not find" end,
    function()
        if selected then
            if not selected.Source then
                selected.Source = rawget(getfenv(selected.Function),"script")
            end
            setclipboard(v2s(selected.Source))
            TextLabel.Text = "Done!"
        end
    end
)

--- Decompiles the script that fired the remote and puts it in the code box
newButton(
    "Function Info",
    function() return "Click to view calling function information" end,
    function()
        if selected then
            local func = selected.Function
            if func then
                if typeof(func) ~= 'string' then
                    codebox:setRaw("--[[Generating Function Info please wait]]")
                    RunService.Heartbeat:Wait()
                    selected.Function = {
                        info = getinfo(func),
                        constants = islclosure(func) and setmetatable(getconstants(func), {__mode="kv"}) or "nil --Lua Closure expected got C Closure",
                        upvalues = setmetatable(getupvalues(func), {__mode="kv"}), --Thank you GameGuy#5286
                        script = {
                            SourceScript = selected.info and rawget(getfenv(selected.info.func),"script") or 'nil',
                            CallingScript = selected.Source
                        }
                    }
                    
                    if configs.advancedinfo then
                        local Remote = selected.Remote

                        selected.Function["advancedinfo"] = {
                            metamethod = selected.metamethod,
                            DebugId = selected.DebugId,
                            protos = islclosure(func) and setmetatable(getprotos(func), {__mode="kv"}) or "nil --Lua Closure expected got C Closure"
                        }
                        if Remote:IsA("RemoteFunction") then
                            selected.Function["advancedinfo"]["callbackmember"] = getcallbackmember and getcallbackmember(Remote,"OnClientInvoke")
                        else
                            if getconnections then
                                selected.Function["advancedinfo"]["OnClientEvents"] = {}
                                for i,v in next, getconnections(Remote.OnClientEvent) do
                                    selected.Function["advancedinfo"]["OnClientEvents"][i] = {
                                        Function = v.Function,
                                        State = v.State
                                    }
                                end
                            end
                        end
                    end
                    selected.Function = Safetostring(v2v({functionInfo = selected.Function}))
                end
                codebox:setRaw("-- Calling function info\n-- Generated by the SimpleSpy serializer\n\n"..selected.Function)
                TextLabel.Text = "Done! Function info generated by the SimpleSpy Serializer."
            else
                TextLabel.Text = "Error! Selected function was not found."
            end
        end
    end
)

--- Clears the Remote logs
newButton(
    "Clr Logs",
    function() return "Click to clear logs" end,
    function()
        TextLabel.Text = "Clearing..."
        clear(logs)
        for i,v in next, LogList:GetChildren() do
            if not v:IsA("UIListLayout") then
                v:Destroy()
            end
        end
        codebox:setRaw("")
        selected = nil
        TextLabel.Text = "Logs cleared!"
    end
)

--- Excludes the selected.Log Remote from the RemoteSpy
newButton(
    "Exclude (i)",
    function() return "Click to exclude this Remote.\nExcluding a remote makes SimpleSpy ignore it, but it will continue to be usable." end,
    function()
        if selected then
            blacklist[GetDebugId(selected.Remote)] = true
            TextLabel.Text = "Excluded!"
        end
    end
)

--- Excludes all Remotes that share the same name as the selected.Log remote from the RemoteSpy
newButton(
    "Exclude (n)",
    function() return "Click to exclude all remotes with this name.\nExcluding a remote makes SimpleSpy ignore it, but it will continue to be usable." end,
    function()
        if selected then
            blacklist[selected.Name] = true
            TextLabel.Text = "Excluded!"
        end
    end
)

--- clears blacklist
newButton("Clr Blacklist",
function() return "Click to clear the blacklist.\nExcluding a remote makes SimpleSpy ignore it, but it will continue to be usable." end,
function()
    blacklist = {}
    TextLabel.Text = "Blacklist cleared!"
end)

--- Prevents the selected.Log Remote from firing the server (still logged)
newButton(
    "Block (i)",
    function() return "Click to stop this remote from firing.\nBlocking a remote won't remove it from SimpleSpy logs, but it will not continue to fire the server." end,
    function()
        if selected then
            blocklist[GetDebugId(selected.Remote)] = true
            TextLabel.Text = "Excluded!"
        end
    end
)

--- Prevents all remotes from firing that share the same name as the selected.Log remote from the RemoteSpy (still logged)
newButton("Block (n)",function()
    return "Click to stop remotes with this name from firing.\nBlocking a remote won't remove it from SimpleSpy logs, but it will not continue to fire the server." end,
    function()
        if selected then
            blocklist[selected.Name] = true
            TextLabel.Text = "Excluded!"
        end
    end
)

--- clears blacklist
newButton(
    "Clr Blocklist",
    function() return "Click to stop blocking remotes.\nBlocking a remote won't remove it from SimpleSpy logs, but it will not continue to fire the server." end,
    function()
        blocklist = {}
        TextLabel.Text = "Blocklist cleared!"
    end
)

--- Attempts to decompile the source script
newButton("Decompile",
    function() return "Decompile source script" end,
    function()
        if selected and selected.Source then
            local Source = selected.Source
            if not DecompiledScripts[Source] then
                codebox:setRaw("--[[Decompiling]]")
                local suc,err = pcall(function()
                    DecompiledScripts[Source] = decompile(Source):gsub("-- Decompiled with the Synapse X Luau decompiler.","")
                end)
                if suc then
                    local Sourcev2s = v2s(Source)
                    if lower(DecompiledScripts[Source]):find("script") and Sourcev2s then
                        DecompiledScripts[Source] = ("local script = %s\n%s"):format(Sourcev2s,DecompiledScripts[Source])
                    end
                else
                    return codebox:setRaw(("--[[\nAn error has occured\n%s\n]]"):format(err))
                end
            end
            codebox:setRaw(DecompiledScripts[Source])
            TextLabel.Text = "Done!"
        else
            TextLabel.Text = "Source not found!"
        end
    end)

newButton(
    "Disable Info",
    function() return string.format("[%s] Toggle function info (because it can cause lag in some games)", configs.funcEnabled and "ENABLED" or "DISABLED") end,
    function()
        configs.funcEnabled = not configs.funcEnabled
        TextLabel.Text = string.format("[%s] Toggle function info (because it can cause lag in some games)", configs.funcEnabled and "ENABLED" or "DISABLED")
    end
)

newButton(
    "Autoblock",
    function() return string.format("[%s] [BETA] Intelligently detects and excludes spammy remote calls from logs", configs.autoblock and "ENABLED" or "DISABLED") end,
    function()
        configs.autoblock = not configs.autoblock
        TextLabel.Text = string.format("[%s] [BETA] Intelligently detects and excludes spammy remote calls from logs", configs.autoblock and "ENABLED" or "DISABLED")
        history = {}
        excluding = {}
    end
)

newButton("Logcheckcaller",function()
    return ("[%s] Log remotes fired by the client"):format(configs.logcheckcaller and "ENABLED" or "DISABLED")
end,
function()
    configs.logcheckcaller = not configs.logcheckcaller
    TextLabel.Text = ("[%s] Log remotes fired by the client"):format(configs.logcheckcaller and "ENABLED" or "DISABLED")
end)

newButton("Advanced Info",function()
    return ("[%s] Display more remoteinfo"):format(configs.advancedinfo and "ENABLED" or "DISABLED")
end,
function()
    configs.advancedinfo = not configs.advancedinfo
    TextLabel.Text = ("[%s] Display more remoteinfo"):format(configs.advancedinfo and "ENABLED" or "DISABLED")
end)

newButton("Weak Tables",function()
    return ("[%s] [SECURITY] sets the arguments table to a weak table. Can cause argument loss."):format(configs.weaktables and "ENABLED" or "DISABLED")
end,
function()
    configs.weaktables = not configs.weaktables
    TextLabel.Text = ("[%s] [SECURITY] sets the arguments table to a weak table. Can cause argument loss."):format(configs.weaktables and "ENABLED" or "DISABLED")
end)

if syn and syn.request then request = syn.request end
newButton("Join Discord",function()
    return "Joins The Simple Spy Discord"
end,
function()
    setclipboard("https://discord.com/invite/AWS6ez9")
    TextLabel.Text = "Copied invite to your clipboard"
    if request then
        request({Url = 'http://127.0.0.1:6463/rpc?v=1',Method = 'POST',Headers = {['Content-Type'] = 'application/json', Origin = 'https://discord.com'},Body = http:JSONEncode({cmd = 'INVITE_BROWSER',nonce = http:GenerateGUID(false),args = {code = 'AWS6ez9'}})})
    end
end)

if configs.supersecretdevtoggle then
    newButton("Load SSV2.2",function()
        return "Load's Simple Spy V2.2"
    end,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
    end)
    newButton("Load SSV3",function()
        return "Load's Simple Spy V3"
    end,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end)
    local SuperSecretFolder = Create("Folder",{Parent = SimpleSpy3})
    newButton("SUPER SECRET BUTTON",function()
        return "You dont need a discription you already know what it does"
    end,
    function()
        SuperSecretFolder:ClearAllChildren()
        local random = listfiles("Music")
        local NotSound = Create("Sound",{Parent = SuperSecretFolder,Looped = false,Volume = math.random(1,5),SoundId = getsynasset(random[math.random(1,#random)])})
        NotSound:Play()
    end)
end
