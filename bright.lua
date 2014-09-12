local wibox = require("wibox")
local awful = require("awful")

local bright = {}

local b_widget = wibox.widget.textbox()
b_widget:set_align("right")

local screen_b = 0
local screen_on = true

local function update_brightness(widget)
    local b = io.popen("xbacklight")
    local status = b:read("*all")
    screen_b = string.format("%d", status)
    b:close()

    local brightness = string.format("%d", status) .. "%"

    widget:set_markup(brightness)
end


local function toggle_screen()
        local b = io.popen("xbacklight")
        local status = b:read("*all")
        screen_b = string.format("%d", status)
        b:close()
    if tonumber(screen_b) > 0 then
        os.execute("xbacklight -set 0")
        return false
    else
        os.execute("xbacklight -inc 100")
        return true
    end
    return false
end

update_brightness(b_widget)

mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_brightness(b_widget) end)
mytimer:start()

bright.b_widget = b_widget
bright.toggle_screen = toggle_screen

return bright
