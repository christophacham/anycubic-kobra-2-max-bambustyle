M104 S0                                    ; Extruder off 
M140 S0                                    ; Heatbed off 
M107                                       ; Fan off 
G91                                        ; relative positioning 
G1 E-5 F3000  
G1 Z+0.3 F3000                             ; lift print head 
G28 X0  F3000
M84                                        ; disable stepper motors
