# Printing Guidelines
Everything here should be taken as the default unless otherwise stated.
Most parts are good with a thick shell.

If a part needs to be printed solid, the build guide will have a note for you.
Increase your infill to 100% for these parts.

## Compatible Materials
PLA, PLA+, ABS, PETG, Nylon, PC, POM - almost anything. 
The strength is in the steel.

## Print Settings
 These are the only vital Cura settings to override.
  * 3mm walls
  * 4mm top and bottom
  * 20% infill

### Layer Height
0.2mm layers are a good balance between speed and quality.
0.1mm layers will look 50% better and take twice as long.

If it's a large part, you can probably print it with tall layers. Smaller parts
usually have tighter tolerance requirements and taller layers may cause binding.

## \#FatNozzleGang
Everything can be printed with a 1.5mm nozzle, but 0.4mm works too.
All print times are given for 0.4mm nozzles.

Increasing nozzle diameter yields exponential speed gains. Since you gain so
much speed from a larger nozzle, you can slow down your print speed and use
lower layer heights for better print quality - and *still* be faster than stock.

| Diameter | Area     | Time Multiplier | Effective Time |
|----------|----------|-----------------|----------------|
| 0.2mm    | 0.04mm^2 | 4               | 4 days         |
| 0.4mm    | 0.16mm^2 | 1               | 1 day          |
| 0.8mm    | 0.64mm^2 | 1/4             | 6 hours        |
| 1.6mm    | 2.56mm^2 | 1/16            | 1.5 hours      |