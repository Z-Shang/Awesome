Z-Shang's awesome collection
=
---

Here are my plugins collection of Awesome WM:

1. *bright.lua"* a brightness control widget written by myself, usage:

>add these to your rc.lua file:

>awful.key({}, "XF86MonBrightnessUp", function() awful.util.spawn("xbacklight -inc 10", false) end),

>awful.key({}, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 10", false) end),

>and set your key binding.

then require the bright.lua in your rc.lua and put the `b_widget` in you panel.
