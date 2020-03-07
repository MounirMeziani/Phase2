LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY Ram IS
	PORT
	(
		Adress	: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clk		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		rSig		: IN STD_LOGIC  := '1';
		wSig		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Ram;


ARCHITECTURE SYN OF Ram IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT altsyncram
	GENERIC (
		clock_enable_input_a				: STRING;
		clock_enable_output_a			: STRING;
		--init_file							: STRING;    , you may need to include this ??
		intended_device_family			: STRING;
		lpm_hint								: STRING;
		lpm_type								: STRING;
		numwords_a							: NATURAL;
		operation_mode						: STRING;
		outdata_aclr_a						: STRING;
		outdata_reg_a						: STRING;
		power_up_uninitialized			: STRING;
		read_during_write_mode_port_a	: STRING;
		widthad_a							: NATURAL;
		width_a								: NATURAL;
		width_byteena_a					: NATURAL
	);
	PORT (
			address_a		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			clock0			: IN STD_LOGIC ;
			data_a			: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren_a			: IN STD_LOGIC ;
			q_a				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			rden_a			: IN STD_LOGIC 
	);
	END COMPONENT;
	
	
	BEGIN
	q    <= sub_wire0(31 DOWNTO 0);

	altsyncram_component : altsyncram
	
	GENERIC MAP (
		clock_enable_input_a => "BYPASS",
		clock_enable_output_a => "BYPASS",
		intended_device_family => "Cyclone III",
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "altsyncram",
		numwords_a => 512,
		operation_mode => "SINGLE_PORT",
		outdata_aclr_a => "NONE",
		outdata_reg_a => "CLOCK0",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		widthad_a => 9,
		width_a => 32,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => Adress,
		clock0 => clk,
		data_a => data,
		wren_a => wSig,
		rden_a => rSig,
		q_a => sub_wire0
	);



END SYN;

