# Iron Beams

Replaces **Iron Sticks** with **Iron Beams**, visually, by name, and recipe. **Iron Beams** are more expensive, ergo default **4x** decrease in cost (min: 1) in associated recipes.

Mainly for [Krastorio 2](https://mods.factorio.com/mod/Krastorio2), and uses their `kr-iron-beam`, but can be used in Vanilla or with other mods. Uses their item graphic.
Adjusted in `data-updates.lua`, so it can be modified itself, but may cause issues if there's any `iron-stick` related changes in `data-final-fixes.lua` in other mods.

## Why?

Because it's annoying to make early/belt malls when you have two essentially same things, just one uses sticks and one uses sticks but they're called beams. Cleaner, especially since **Iron Gears** are still there and there are no "Steel Sticks". Plus "Sticks" is such a lame term for it, even "Iron Rods" would be better, and they look so lackluster how would a rail-line go over them. There's not enough critical usage of **Iron Sticks** to justify it (except maybe **Production Science**), so it just sorta feels like needless bloat.

There is some minor balancing in Purple science, as the high-throughput of **Iron Sticks**, but **Stone** is still part of that logistics puzzle, and it's overall not a huge deal. Technically causes some things to be more iron-expensive, and crafting time is still longer, hopefully it offsets the lessened throughput logistics puzzles.

## To-Do

- [ ] Replace Foundry Smelting Icon for Space Age.
	- Are those dynamically generated?
- [ ] Add option or separate mod for re-balancing Beams and Gears (1 Plate -> 2 Gears, 2 Plates -> 1 Beam).