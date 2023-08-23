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
