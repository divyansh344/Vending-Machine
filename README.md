# Verilog Based Vending Machine FSM Project

## Author
**Divyansh Tripathi**

## 🛒 Project Overview

This project implements a Finite State Machine (FSM) based Vending Machine using Verilog HDL.

## ✨ Features

- **2 Product Choices**: Chocolate and Drinks
- **Pricing**:
  - Chocolate – $2
  - Drinks – $5
- **Accepted Coins**: 1, 2, and 5 units
- **Control Signals**:
  - `start` – Initiates the operation
  - `clk`, `rst` – Clock and reset signals for synchronous FSM control
  - `done` – Indicates product has been dispensed
  - `product` – Encodes the type of product selected
  - `change` – Returns excess amount if overpaid

## 📊 How to View Simulation Waveforms

1. Save the `vending_machine_waveform.gtkw` file.
2. Open **GTKWave**.
3. Click on **File > Open New Tab**.
4. Open the saved `.gtkw` file.
5. Select ports/signals to observe simulation results.

## 📁 Files in This Repository

- `vending_machine.v` – FSM design module (DUT)
- `testbench.v` – Verilog testbench to simulate user interaction
- `vending_machine_waveforms.gtkw` – GTKWave file for waveform viewing
- `Simulation_images/` – Folder containing screenshots of simulation output

---

**Thanks for checking out the project!**  
Feedback and contributions are always welcome.
