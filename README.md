# Anycubic Kobra Max 2 First Layer Fix

## Problem
First layer lines weren't fusing properly on Anycubic Kobra Max 2 (0.6mm nozzle, 420x420 bed) despite good adhesion. Lines remained distinct instead of merging into solid surface.

## Root Cause
Custom start G-code contained flow reduction command that was under-extruding the first layer:
```gcode
M221 S{if layer_height<0.2}100{else}{if layer_height<0.36}98{else}96{endif}{endif}
```

## Solution
1. **Removed flow reduction** from start G-code
2. **Replaced ineffective purge line** with Bambu Lab-style routine adapted for Anycubic firmware
3. **Used G1 commands instead of G0** for better compatibility
4. **Scaled purge line** for 420x420 bed dimensions

## Key Settings
- **First layer extrusion width**: 0.72-0.84mm (120-140% of nozzle diameter)
- **Layer heights**: Use 0.04mm increments (0.20mm, 0.24mm, 0.28mm, 0.32mm, 0.36mm, 0.40mm)
- **Purge pattern**: 18→400→21mm with back-and-forth motion

## Files
- `start_gcode.gcode` - Fixed start G-code for Anycubic Kobra Max 2
- Original issue was M221 flow reduction, not Z-offset or mechanical problems
