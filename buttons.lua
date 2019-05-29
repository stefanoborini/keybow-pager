require 'keybow-pager/keybow'

button = {}

button.TAB_0 = 11
button.TAB_1 = 8
button.TAB_2 = 5
button.TAB_3 = 2

button.ACTION_A0 = 10
button.ACTION_A1 = 7
button.ACTION_A2 = 4
button.ACTION_A3 = 1

button.ACTION_B0 = 9
button.ACTION_B1 = 6
button.ACTION_B2 = 3
button.ACTION_B3 = 0

function button.set_color(button, color)
    keybow.set_pixel(button, color[1], color[2], color[3]) 
end  
