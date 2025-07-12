G90                                     ; use absolute coordinates
M83                                     ; extruder relative mode
; — Temperature setup (optimized) —
M140 S[first_layer_bed_temperature]     ; set bed temp
M190 S{first_layer_bed_temperature-10}  ; wait for bed to get close
M104 S[first_layer_temperature]         ; start heating nozzle
M190 S[first_layer_bed_temperature]     ; wait for final bed temp
M109 S[first_layer_temperature]         ; wait for nozzle
; — Home and auto-level —
G28                                     ; move X/Y/Z to min endstops
G29                                     ; auto bed leveling
M420 S1                                 ; enable leveling compensation
G1 Z0.28                                ; lift nozzle a bit
; — Prime and reset extruder —
G92 E0                                  ; zero the extruded length
; — Bambu-style purge line adapted for 420x420 bed —
G1 X18.0 Y5.0 Z0.8 F18000              ; move to start position (front left)
G1 Z0.2                                 ; lower to bed level
G0 E2 F300                              ; prime extruder
G0 X400 E35 F1500                       ; purge line across bed (long stroke)
G0 Y15 E0.7 F400                        ; move back slightly with small extrusion
G0 X399.5                               ; move slightly left
G0 E0.2                                 ; small extrusion
G0 Y5.5 E0.7                           ; move forward with small extrusion
G0 X21 E35 F1500                        ; return purge line (but not all the way back)
; — Nozzle wipe —
G1 Z2 F3000                             ; lift nozzle
G1 X18 Y5 F9000                         ; move to wipe start
G1 Z0.2 F3000                           ; lower nozzle
G1 X30 F3000                            ; wipe motion
M400                                    ; wait for moves to complete
G92 E0                                  ; reset extruder position
M117 Print Starting...                  ; display status
