require 'keybow-pager/config'

if (config.DEVELOP) then
    require 'keybow-pager/mock_c_layer'
end

keybow = {}


local KEYCODES         = "abcdefghijklmnopqrstuvwxyz1234567890\n\a\b\t -=[]\\#;'`,./"
local SHIFTED_KEYCODES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()\a\a\a\a\a_+{}|~:\"~<>?"

keybow.LEFT_CTRL = 0
keybow.LEFT_SHIFT = 1
keybow.LEFT_ALT = 2
keybow.LEFT_META = 3

keybow.RIGHT_CTRL = 4
keybow.RIGHT_SHIFT = 5
keybow.RIGHT_ALT = 6
keybow.RIGHT_META = 7

keybow.ENTER = 0x28
keybow.ESC = 0x29
keybow.BACKSPACE = 0x2a
keybow.TAB = 0x2b
keybow.SPACE = 0x2c
keybow.CAPSLOCK = 0x39

keybow.LEFT_ARROW = 0x50
keybow.RIGHT_ARROW = 0x4f
keybow.UP_ARROW = 0x52
keybow.DOWN_ARROW = 0x51

keybow.INSERT = 0x49
keybow.HOME = 0x4a
keybow.DELETE = 0x4c
keybow.END = 0x4d
keybow.PAGEUP = 0x4b
keybow.PAGEDOWN = 0x4e

keybow.F1 = 0x3a
keybow.F2 = 0x3b
keybow.F3 = 0x3c
keybow.F4 = 0x3d
keybow.F5 = 0x3e
keybow.F6 = 0x3f
keybow.F7 = 0x40
keybow.F8 = 0x41
keybow.F9 = 0x42
keybow.F10 = 0x43
keybow.F11 = 0x44
keybow.F12 = 0x45

keybow.KEY_DOWN = true
keybow.KEY_UP = false

keybow.SYSRQ = 0x46
keybow.SCROLLLOCK = 0x47
keybow.PAUSE = 0x48
keybow.INSERT = 0x49
keybow.DELETE = 0x4c
keybow.HOME = 0x4a
keybow.END = 0x4d
keybow.PAGEUP = 0x4b
keybow.PAGEOWN = 0x4e

keybow.KPSLASH = 0x54
keybow.KPASTERISK = 0x55
keybow.KPMINUS = 0x56
keybow.KPPLUS = 0x57
keybow.KPENTER = 0x58
keybow.KP1 = 0x59
keybow.KP2 = 0x5a
keybow.KP3 = 0x5b
keybow.KP4 = 0x5c
keybow.KP5 = 0x5d
keybow.KP6 = 0x5e
keybow.KP7 = 0x5f
keybow.KP8 = 0x60
keybow.KP9 = 0x61
keybow.KP0 = 0x62
keybow.KPDOT = 0x63
keybow.KPEQUAL = 0x67

keybow.COMPOSE = 0x65
keybow.POWER = 0x66

keybow.OPEN = 0x74
keybow.HELP = 0x75
keybow.PROPS = 0x76
keybow.FRONT = 0x77
keybow.STOP = 0x78
keybow.AGAIN = 0x79
keybow.UNDO = 0x7a
keybow.CUT = 0x7b
keybow.COPY = 0x7c
keybow.PASTE = 0x7d
keybow.FIND = 0x7e
keybow.MUTE = 0x7f
keybow.VOLUMEUP = 0x80
keybow.VOLUMEDOWN = 0x81

keybow.MEDIA_PLAYPAUSE = 0xe8
keybow.MEDIA_STOPCD = 0xe9
keybow.MEDIA_PREVIOUSSONG = 0xea
keybow.MEDIA_NEXTSONG = 0xeb
keybow.MEDIA_EJECTCD = 0xec
keybow.MEDIA_VOLUMEUP = 0xed
keybow.MEDIA_VOLUMEDOWN = 0xee
keybow.MEDIA_MUTE = 0xef
keybow.MEDIA_WWW = 0xf0
keybow.MEDIA_BACK = 0xf1
keybow.MEDIA_FORWARD = 0xf2
keybow.MEDIA_STOP = 0xf3
keybow.MEDIA_FIND = 0xf4
keybow.MEDIA_SCROLLUP = 0xf5
keybow.MEDIA_SCROLLDOWN = 0xf6
keybow.MEDIA_EDIT = 0xf7
keybow.MEDIA_SLEEP = 0xf8
keybow.MEDIA_COFFEE = 0xf9
keybow.MEDIA_REFRESH = 0xfa
keybow.MEDIA_CALC = 0xfb

-- Functions exposed from C
function keybow.set_modifier(key, state)
    keybow_set_modifier(key, state)
end

function keybow.sleep(time)
    keybow_sleep(time)
end

function keybow.usleep(time)
    keybow_usleep(time)
end

function keybow.text(text)
    for i = 1, #text do        
        local c = text:sub(i, i)
        keybow.tap_key(c)
    end

    keybow.set_modifier(keybow.LEFT_SHIFT, false)
end

-- Lighting control

function keybow.set_pixel(x, r, g, b)
    keybow_set_pixel(x, r, g, b)
end

function keybow.auto_lights(state)
    keybow_auto_lights(state)
end

function keybow.clear_lights()
    keybow_clear_lights()
end

function keybow.load_pattern(file)
    keybow_load_pattern(file)
end

-- Meta keys - ctrl, shift, alt and win/apple

function keybow.tap_left_ctrl()
    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
end

function keybow.tap_right_ctrl()
    keybow.set_modifier(keybow.RIGHT_CTRL, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.RIGHT_CTRL, keybow.KEY_UP)
end

function keybow.tap_left_shift()
    keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
end

function keybow.tap_right_shift()
    keybow.set_modifier(keybow.RIGHT_SHIFT, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.RIGHT_SHIFT, keybow.KEY_UP)
end

function keybow.tap_left_alt()
    keybow.set_modifier(keybow.LEFT_ALT, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.LEFT_ALT, keybow.KEY_UP)
end

function keybow.tap_right_alt()
    keybow.set_modifier(keybow.RIGHT_ALT, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.RIGHT_ALT, keybow.KEY_UP)
end

function keybow.tap_left_meta()
    keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)
end

function keybow.tap_right_meta()
    keybow.set_modifier(keybow.RIGHT_META, keybow.KEY_DOWN)
    keybow.set_modifier(keybow.RIGHT_META, keybow.KEY_UP)
end

-- Function keys

function keybow.tap_function_key(index)
    index = 57 + index -- Offset to 0x39 (F1 is 0x3a)
    keybow.set_key(index, true)
    keybow.set_key(index, false)
end

function keybow.ascii_to_shift(key)
    if not (type(key) == "string") then
        return false
    end
    
    return SHIFTED_KEYCODES.find(key) ~= nil
end

function keybow.ascii_to_hid(key)
    if not (type(key) == "string") then
        return key
    end

    key = key:lower()

    code = KEYCODES:find(key)
    
    if code == nil then return nil end

    return code + 3
end

function keybow.set_key(key, pressed)
    if type(key) == "string" then
        local hid_code = nil
        local shifted = SHIFTED_KEYCODES:find(key, 1, true) ~= nil

        if shifted then
            hid_code = SHIFTED_KEYCODES:find(key, 1, true)
        else
            hid_code = KEYCODES:find(key, 1, true)
        end

        if not (hid_code == nil) then
            hid_code = hid_code + 3
            if shifted then keybow.set_modifier(keybow.LEFT_SHIFT, pressed) end
            keybow_set_key(hid_code, pressed)
        end

    else -- already a key code
        keybow_set_key(key, pressed)
    end
end

function keybow.tap_enter()
    keybow.set_key(keybow.ENTER, true)
    keybow.set_key(keybow.ENTER, false)
end

function keybow.tap_space()
    keybow.set_key(keybow.SPACE, true)
    keybow.set_key(keybow.SPACE, false)
end

function keybow.tap_shift()
    keybow.set_key(keybow.LEFT_SHIFT, true)
    keybow.set_key(keybow.LEFT_SHIFT, false)
end

function keybow.tap_tab()
    keybow.set_key(keybow.TAB, true)
    keybow.set_key(keybow.TAB, false)
end

function keybow.tap_key(key)
    keybow.set_key(key, true)
    keybow.set_key(key, false)
end

function keybow.press_key(key)
    keybow.set_key(key, true)
end

function keybow.release_key(key)
    keybow.set_key(key, false)
end

function keybow.tap_key_with_modifiers(key, ...)
    for i = 1, select('#', ...) do
        local j = select(i, ...)
        keybow.set_modifier(j, keybow.KEY_DOWN)
    end
    keybow.tap_key(key)
    for i = 1, select('#', ...) do
        local j = select(i, ...)
        keybow.set_modifier(j, keybow.KEY_UP)
    end
end
