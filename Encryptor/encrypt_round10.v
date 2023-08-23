module encrypt_round10(
    input [127:0] round_key,
    input [127:0] enc_state_in,
    output [127:0] enc_state_round
	);
	
	wire [127:0] state_sb_out;
	wire [127:0] state_sr_out;
	wire [127:0] state_ark_out;
	
	
	sub_bytes i_sub_bytes( . state_sb_in(enc_state_in),. state_sb_out(state_sb_out));
	shift_rows i_shift_rows( . state_sr_in(state_sb_out), .state_sr_out(state_sr_out));
	add_round_key i_add_round_key( . round_key(round_key),. state_ark_in(state_sr_out),. state_ark_out(state_ark_out));
    
    assign enc_state_round =  state_ark_out;
	
  endmodule
//add round key*****************************************************************************
module add_round_key(
    input  [127:0] round_key,
    input [127:0] state_ark_in,
    output  [127:0] state_ark_out
	);
	
	//Internal logic
	wire [127:0] round_key_temp;
	wire [127:0] state_ark_out_temp; 
	wire [127:0] state_ark_out_next;
	
    	//Combinational logic
    	assign round_key_temp = round_key;
    	assign state_ark_out_temp = state_ark_in;
    	//Add Round Key
        assign state_ark_out_next = state_ark_out_temp[127:0] ^ round_key_temp[127:0];
   
    assign state_ark_out = state_ark_out_next;
	
	
  endmodule
