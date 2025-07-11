# Vending-Machine
# Verilog Based Vending Machine FSM Project
<br>
Author - Divyansh Tripathi
<br>
Implemented a Verilog Based Vending Machine with the following features:-
<br>
1> 2 product choices - Chocalate and Drinks.
<br>
2> Price of Chocalate = $2 , Price of Drinks = $5.
<br> 
3> 3 types of coins accepted - 1, 2 and 5.
<br>
4> Start signal to mark the start of operation. 
<br>
5> Clock and Reset signal for synchronous operation.
<br>
6> Done signal to mark the product is received by the user.
<br>
7> Product signal which tells the product received.
<br>
8> Change signal to return the change in case the user has overpaid.
<br>
To view the simulation waveform follow these steps:-
<br>
- save the vending_machine_waveform.gtkw file
<br>
- Open gtkwave.
<br>
- click on File > Open New Tab.
<br>
- open the saved file 
<br>
- select the ports to view the waveforms.
<br>
Files present in the repository:-
<br>
vending_machine.v - dut module
<br>
testbench.v - testbench module to generate the signals for the inputs.
<br>
vending_machine_waveforms.gtkw - gtkwave file to see the waveforms.






