module decrypt_round(
    input [127:0] round_key,
    input [127:0] enc_state_in,
    output [127:0] enc_state_round
	);
	
	wire [127:0] state_invsb_out;
	wire [127:0] state_invsr_out;
	wire [127:0] state_invmc_out;
	wire [127:0] state_ark_out;
	
	add_round_key i_add_round_key( . round_key(round_key),. state_ark_in(enc_state_in),. state_ark_out(state_ark_out));
	inv_mix_columns i_mix_columns( . state_invmc_in(state_ark_out), . state_invmc_out(state_invmc_out));
    inv_shift_rows i_invshift_rows( . state_invsr_in(state_invmc_out), .state_invsr_out(state_invsr_out));
    inv_sub_bytes i_invsub_bytes( . state_invsb_in(state_invsr_out), .state_invsb_out(state_invsb_out));
	
    assign enc_state_round =  state_invsb_out;
	
  endmodule
