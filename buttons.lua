require 'keybow-pager/keybow'

button = {}

button.TAB_0 = 11
button.TAB_1 = 8
button.TAB_2 = 5
button.TAB_3 = 2

function button.set_color(button, color)
    keybow.set_pixel(button, color[1], color[2], color[3]) 
end  
