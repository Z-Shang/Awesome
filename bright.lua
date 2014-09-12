local wibox = require("wibox")
local awful = require("awful")

b_widget = wibox.widget.textbox()
b_widget:set_align("right")

function update_brightness(widget)
    local b = io.popen("xbacklight")
    local status = b:read("*all")
    b:close()

    local brightness = string.format("%d", status) .. "%"

    widget:set_markup(brightness)
end

update_brightness(b_widget)

mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_brightness(b_widget) end)
mytimer:start()
