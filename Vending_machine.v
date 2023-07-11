module vending_machine(
  input clk,
  input rst,
  input [2:0]in, // 001 = 5 rs, 010 = 10 rs, 011 = 15rs, 100 = 20rs
  output reg out,
  output reg[2:0] change
);
  parameter s0 = 3'b000;
  parameter s1 = 3'b001;
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100;
  
	reg[2:0] c_state,n_state;
  
	always@ (posedge clk)
	begin
        if(rst == 1)
            begin
                c_state <= 0;
                //n_state = 0;
                change <= 3'b000;
                out<=0;
            end
        else
            c_state <= n_state;
        case(c_state)
            
            s0:begin//state 0 : 0 r
                case(in)
                0:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                1:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                2:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                3:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                4:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                 
                
            endcase
        end
        s1:begin//state 1 : 5 r
            case(in)
                0:begin
                    out<=0;  //0 item
                    change<='b001;  //5 r
                end
                1:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                2:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                3:begin
                    out<=0;  //0 item
                    change<='b000;  //0 r
                end
                4:begin
                    out<=1;  //1 item
                    change<='b000;  //0 r
                end
            endcase
        end
        s2:begin//state 2 : 10 r
            case(in)
                0:begin
                    out=0;  //0 item
                    change='b010;  //10 r
                end
                1:begin
                    out=0;  //0 item
                    change='b000;  //0 r
                end
                2:begin
                    out=0;  //0 item
                    change='b000;  //0 r
                end
                3:begin
                    out=1;  //1 item
                    change='b000; //5 r
                end
                4:begin
                    out=1;  //1 item
                    change='b001;  //5 r
                end
            endcase
        end
        s3:begin//state 3 : 15 r
            case(in)
                0:begin
                    out=0;  //0 item
                    change='b011;  //15 r
                end
                1:begin
                    out=0;  //0 item
                    change='b000;  //0 r
                end
                2:begin
                    out=1;  //1 item
                    change='b000;  //0 r
                end
                3:begin
                    out=1; //1 item
                    change='b001; //5 r
                end
                4:begin
                    out=1;  //1 item
                    change='b010;  //10 r
                end
            endcase
        end
        s4:begin//state 4 : 20 r
            case(in)
                0:begin
                    out=0;  //0 item
                    change='b100;  //20 r
                end
                1:begin
                    out=1;  //1 item
                    change='b000;  //0 r
                end
                2:begin
                    out=1;  //1 item
                    change='b001;  //5 r
                end
                3:begin
                    out=1;  //1 item
                    change='b010;  //10 r
                end
                4:begin
                    out=1;  //1 item
                    change='b011;  //15 r
                end
            endcase
        end
            default:c_state<=s0;
    endcase
    end
    always @(in or c_state) begin
        n_state=0;
        case(c_state)
            s0:begin
                case(in)
                    0:n_state=s0;
                    1:n_state=s1;
                    2:n_state=s2;
                    3:n_state=s3;
                    4:n_state=s4;
                    default:n_state=s0;
                endcase
            end
            s1:begin
                case(in)
                    0:n_state=s1;
                    1:n_state=s2;
                    2:n_state=s3;
                    3:n_state=s4;
                    4:n_state=s0;
                    default:n_state=s1;
                endcase
            end
            s2:begin
                case(in)
                    0:n_state=s2;
                    1:n_state=s3;
                    2:n_state=s4;
                    3:n_state=s0;
                    4:n_state=s0;
                    default:n_state=s2;
                endcase
            end
            s3:begin
                case(in)
                    0:n_state=s3;
                    1:n_state=s4;
                    2:n_state=s0;
                    3:n_state=s0;
                    4:n_state=s0;
                    default:n_state=s3;
                endcase
            end
            s4:begin
                n_state=s0;
            end
            default:n_state=s0;
        endcase
    end
endmodule
