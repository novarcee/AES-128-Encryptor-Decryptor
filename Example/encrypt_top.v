module encrypt_top(
    input [127:0] key,
    input [127:0] plain_text,
    output [127:0] cipher_text
	);

    wire [127:0] round1_key;
    wire [127:0] round2_key; 
    wire [127:0] round3_key; 
    wire [127:0] round4_key; 
    wire [127:0] round5_key;
	  wire [127:0] round6_key; 
	  wire [127:0] round7_key; 
    wire [127:0] round8_key; 
	  wire [127:0] round9_key; 
	  wire [127:0] round10_key;

    expandkey e1(key,8'h1, round1_key );
    expandkey e2(round1_key,8'h2, round2_key );
    expandkey e3(round2_key,8'h3, round3_key );
    expandkey e4(round3_key,8'h4, round4_key );
    expandkey e5(round4_key,8'h5, round5_key );
    expandkey e6(round5_key,8'h6, round6_key );
    expandkey e7(round6_key,8'h7, round7_key );
    expandkey e8(round7_key,8'h8, round8_key );
    expandkey e9(round8_key,8'h9, round9_key );
    expandkey e10(round9_key,8'hA, round10_key );

    wire [127:0] enc_state_round1_out;
    wire [127:0] enc_state_round2_out;
    wire [127:0] enc_state_round3_out;
    wire [127:0] enc_state_round4_out;
    wire [127:0] enc_state_round5_out;
    wire [127:0] enc_state_round6_out;
    wire [127:0] enc_state_round7_out;
    wire [127:0] enc_state_round8_out;
    wire [127:0] enc_state_round9_out;
    wire [127:0] enc_state_round10_out;
    
    wire [127:0] enc_state_in;


    add_round_key i_add_round_key(
	    . round_key(key),
	    . state_ark_in(plain_text),
	    . state_ark_out(enc_state_in));
    
	encrypt_round i_encrypt_round_1(
		. round_key(round1_key),
		. enc_state_in(enc_state_in),
		. enc_state_round(enc_state_round1_out));
	
	encrypt_round i_encrypt_round_2(
		. round_key(round2_key),
		. enc_state_in(enc_state_round1_out),
		. enc_state_round(enc_state_round2_out));
    
    encrypt_round i_encrypt_round_3(
		. round_key(round3_key),
		. enc_state_in(enc_state_round2_out),
		. enc_state_round(enc_state_round3_out));
    
    encrypt_round i_encrypt_round_4(
		. round_key(round4_key),
		. enc_state_in(enc_state_round3_out),
		. enc_state_round(enc_state_round4_out));
    
    encrypt_round i_encrypt_round_5(
		. round_key(round5_key),
		. enc_state_in(enc_state_round4_out),
		. enc_state_round(enc_state_round5_out));
	
	encrypt_round i_encrypt_round_6(
		. round_key(round6_key),
		. enc_state_in(enc_state_round5_out),
		. enc_state_round(enc_state_round6_out));
	
	encrypt_round i_encrypt_round_7(
		. round_key(round7_key),
		. enc_state_in(enc_state_round6_out),
		. enc_state_round(enc_state_round7_out));
    
    encrypt_round i_encrypt_round_8(
		. round_key(round8_key),
		. enc_state_in(enc_state_round7_out),
		. enc_state_round(enc_state_round8_out));
    
    encrypt_round i_encrypt_round_9(
		. round_key(round9_key),
		. enc_state_in(enc_state_round8_out),
		. enc_state_round(enc_state_round9_out));
    
     encrypt_round10 i_encrypt_round10(
		. round_key(round10_key),
		. enc_state_in(enc_state_round9_out),
		. enc_state_round(enc_state_round10_out));
    
  wire [127:0] enc_state_round_final;
  assign enc_state_round_final=enc_state_round10_out;
  assign cipher_text =enc_state_round_final;
      
	endmodule
