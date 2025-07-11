`timescale 1ns / 1ps
module testbench;
reg clk, start, choice, rst;
reg [1:0] coins;
wire done;
wire [1:0] product;
wire [2:0] change;

vending_machine dut(.clk(clk), .rst(rst), .start(start), .choice(choice), .coins(coins), .done(done), .product(product), .change(change));

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1'b0;
end

initial begin
    start = 1'b1;
end

initial begin
    #2 choice = 1'b0;
    forever #100 choice = ~choice;
end

initial begin
    #2 coins = 2'b01;
    #100 coins = 2'b00;
    #100 coins = 2'b10;
    #100 coins = 2'b01;
    #100 coins = 2'b00;
    #100 coins = 2'b10;
end

initial begin
    $dumpfile("v_m.vcd");
    $dumpvars(0, testbench);
    $monitor($time, " clk = %b, rst = %b, choice = %b, start = %b, coins = %2b, done = %b, product = %2b, change = %3b", clk, rst, choice, start, coins, done, product, change);
end

initial begin
    #1000 $finish;
end

endmodule

    
    