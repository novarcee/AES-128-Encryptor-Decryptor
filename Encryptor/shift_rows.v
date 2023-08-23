module shift_rows(
  
    input wire [127:0] state_sr_in,
    output wire [127:0] state_sr_out
	);
	
	//Internal logic
	wire[127:0] temp; 
	wire [127:0] state_sr_out_next;
	
	
    	//Combinational logic
    	assign state_sr_out_next = state_sr_in;
	
	  //Shift Rows
	    assign temp[7:0] = state_sr_out_next[39:32];
	    assign temp[15:8] = state_sr_out_next[79:72];
	    assign temp[23:16] = state_sr_out_next[119:112];
	    assign temp[31:24] = state_sr_out_next[31:24];
	
	    assign temp[39:32] = state_sr_out_next[71:64];
	    assign temp[47:40] = state_sr_out_next[111:104];
	    assign temp[55:48] = state_sr_out_next[23:16];
	    assign temp[63:56] = state_sr_out_next[63:56];
	
	    assign temp[71:64] = state_sr_out_next[103:96];
	    assign temp[79:72] = state_sr_out_next[15:8];
	    assign temp[87:80] = state_sr_out_next[55:48];
	    assign temp[95:88] = state_sr_out_next[95:88];
	
	    assign temp[103:96] = state_sr_out_next[7:0];
	    assign temp[111:104] = state_sr_out_next[47:40];
	    assign temp[119:112] = state_sr_out_next[87:80];
	    assign temp[127:120] = state_sr_out_next[127:120];
	    
	    //assign state_sr_out_next[127:0] = temp[127:0];
    
    assign state_sr_out = temp;
    
  endmodule
