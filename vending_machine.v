module vending_machine(clk, coins, rst,  choice, start, done, product, change);
input clk, start, choice, rst;
input [1:0] coins;
output done;
output reg [1:0] product;
output reg [2:0] change;

parameter chocalate = 1'b0, drink = 1'b1;
parameter s0 = 4'h0, s1 = 4'h1, s2 = 4'h2, s3 = 4'h3, s4 = 4'h4, s5 = 4'h5, s6 = 4'h6, s7 = 4'h7, s8 = 4'h8, s9 = 4'h9, s10 = 4'ha;
parameter one = 2'b00, two = 2'b01, five = 2'b10;

reg[3:0] state , next;

always @ (*) begin // state transition logic
    case (state)
    s0: next = start ? s1 : s0;

    s1: begin if (choice == chocalate) begin
        next = s2; end
        else if (choice == drink) begin
            next = s3;
        end
    end

    s2: begin case (coins)
    one: next = s4;
    two, five: next = s5;
    default: next = s2;
    endcase
    end

    s4: begin case (coins)
    one, two, five: next = s5;
    default: next = s4;
    endcase
    end

    s5: next = s0;

    s3: begin case(coins)
    five: next = s10;
    one: next = s6;
    two: next = s7;
    default: next = s3;
    endcase
    end

    s6: begin case(coins)
    five: next = s10;
    one: next = s7;
    two: next = s8;
    default: next = s6;
    endcase
    end

    s7: begin case(coins)
    five: next = s10;
    one: next = s8;
    two: next = s9;
    default: next = s7;
    endcase
    end

    s8: begin case(coins)
    five, two: next = s10;
    one: next = s9;
    default: next = s8;
    endcase
    end

    s9: begin case(coins)
    one, two, five: next = s10;
    default: next = s9;
    endcase
    end 

    s10: next = s0;

    default: next = s0;

    endcase
end

always @ (posedge clk) begin // state flip-flop
    if (rst)
    state <= s0;
    else
    state <= next;
end

assign done = ((state == s5) | (state == s10)); // done logic

always @ (state) begin // product logic 2'b01 = chocalate, 2'b10 = drink
    case (state)
    s5: product = 2'b01;
    s10: product = 2'b10;
    default: product = 2'b00;
    endcase
end

always @ (posedge clk) begin // change logic
    if(rst) begin
        change <= 3'b000;
    end
    else begin
    case(state)
    s2: case (coins)
    five: change = 3'b011;
    default: change = 3'b000;
    endcase

    s4: case (coins)
    two: change = 3'b001;
    five: change = 3'b100;
    default: change = 3'b000;
    endcase

    s6: case(coins)
    five: change = 3'b001;
    default: change = 3'b000;
    endcase

    s7: case(coins)
    five: change = 3'b010;
    default: change = 3'b000;
    endcase

    s8: case(coins)
    five: change = 3'b011;
    default: change = 3'b000;
    endcase

    s9: case(coins)
    two: change = 3'b001;
    five: change = 3'b100;
    default: change = 3'b000;
    endcase

    default: change = 3'b000;
    endcase
    end
end

endmodule


    




    
    
    



    






