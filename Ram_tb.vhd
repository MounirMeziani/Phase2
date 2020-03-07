LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Ram_tb IS
END ;
ARCHITECTURE Ram_tb_arch OF Ram_tb IS

SIGNAL Address_tb :STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL clk_tb 		:STD_LOGIC; 
SIGNAL data_tb 	:STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL rSig_tb 	:STD_LOGIC; 
SIGNAL wSig_tb 	:STD_LOGIC;
SIGNAL q_tb		   :STD_LOGIC_VECTOR(31 DOWNTO 0); 



 COMPONENT Ram
 PORT (
		Adress	: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clk		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		rSig		: IN STD_LOGIC  := '1';
		wSig		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
 END COMPONENT Ram;
 
BEGIN
	 DUT1 : Ram
	 
	 PORT MAP (
	  Adress => Address_tb,
	  clk => clk_tb,
	  data =>data_tb,
	  rSig => rSig_tb,
	  wSig => wSig_tb,
	  q => q_tb
	  );
	  

	  clk_process : process 
	begin
		clk_tb <= '1', '0' after 10 ns;
		wait for 20 ns;
	end process clk_process;

	  
	 sim_process: process
	 
	 begin
		
	
		
	 end process sim_process; 
 END;