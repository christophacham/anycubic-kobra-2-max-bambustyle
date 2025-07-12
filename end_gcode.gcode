; — Part cooling —
M106 S255                               ; fan on full
G4 P3000                                ; wait 3 seconds
M107                                    ; fan off
; — Heaters off —
M104 S0                                 ; extruder off 
M140 S0                                 ; heatbed off 
; — Retract and lift —
G91                                     ; relative positioning 
G1 E-5 F3000                            ; retract filament
G1 Z+5 F3000                            ; lift print head 5mm
; — Present print —
G90                                     ; absolute positioning
G1 X0 Y420 F3000                        ; present print at front
M84                                     ; disable stepper motors
M117 Print Complete!                    ; display status
