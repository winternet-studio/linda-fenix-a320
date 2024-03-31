# LINDA module for Fenix A320

This is a module for controlling the [Fenix Airbus 320](https://fenixsim.com/) in [Microsoft Flight Simulator](https://www.flightsimulator.com) via LINDA supported devices. [LINDA](https://www.avsim.com/forums/topic/583434-linda-415-msfs-2020-compatible-5-jun-2022/) is a free software developed by ScotFlieger (but development has [ended](https://www.avsim.com/forums/topic/637967-end-of-linda-support/)) to originally work as a way to use [VRInsight MCP Combo](http://www.vrinsight.com), but now also any other USB/HID devices.


## Credits

Originally developed by Andrew Gransden. Initial version in this repo was 0.3 beta which was downloaded from [AVSIM Forum: Beta Fenix A320 v0.3 (16 Jun 2022)](https://www.avsim.com/forums/topic/619428-beta-fenix-a320-v03-16-jun-2022).


## Installation

You need [FSUIPC](http://www.fsuipc.com/) for LINDA to work.

Copy the files within the `src` folder to their respective LINDA folders found in the `Fsuipc7` folder.

As is, it's configured for the CFM version. To use it for the IAE version change value `FNX_320_CFM` to `FNX_320_IAE` in `src/linda/aircrafts/Fenix A320/ident.lua`. [^1]


[^1]: <https://www.avsim.com/forums/topic/642727-fenix-a320-v2-and-mcp/>
