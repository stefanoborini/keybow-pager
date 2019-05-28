require 'keybow-pager/keybow'
require 'keybow-pager/buttons'
require 'keybow-pager/colors'
require 'keybow-pager/pages'

function setup() 
    keybow.auto_lights(false)
    keybow.clear_lights()
    pages.set_page(pages.DESKTOP)
end

-- Key mappings --

function handle_key_00(pressed)
    if pressed then
        keybow.set_pixel(6, 255, 255, 255) 
    end
end

function handle_key_01(pressed)
end

function handle_key_02(pressed)
    pages.set_page(pages.UNUSED_3)
end

function handle_key_03(pressed)
end

function handle_key_04(pressed)
end

function handle_key_05(pressed)
    pages.set_page(pages.UNUSED_2)
end

function handle_key_06(pressed)
end

function handle_key_07(pressed)
end

function handle_key_08(pressed)
    pages.set_page(pages.CODING)
end

function handle_key_09(pressed)
end

function handle_key_10(pressed)
end

function handle_key_11(pressed)
    pages.set_page(pages.DESKTOP)
end

