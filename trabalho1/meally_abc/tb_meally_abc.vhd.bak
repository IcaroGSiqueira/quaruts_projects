LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ABC_tb_Meally IS
END ABC_tb_Meally;

ARCHITECTURE testbench OF ABC_tb_Meally IS 

	SIGNAL clk  	: std_logic;
	SIGNAL rst	    : std_logic; 
	SIGNAL entrada	: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL saida	: std_logic;
	
	COMPONENT detector_ABC_Meally  
	PORT (
		clk 	: IN std_logic; 
		rst	    : IN std_logic;
		entrada : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		saida	: OUT std_logic
	);
	END COMPONENT;
		
BEGIN 
	
	i1: detector_ABC_Meally 
	PORT MAP (
		clk => clk,
		rst => rst,
		entrada => entrada,
		saida => saida
	);
		
	clock: PROCESS
	BEGIN 
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	END PROCESS;
				
	reset: PROCESS
	BEGIN
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		wait;  
	END PROCESS;
				
	entrada01: PROCESS
	BEGIN 
		entrada <= "00";
		wait for 20 ns;
		entrada <= "01";
		wait for 20 ns;
		entrada <= "10";
		wait for 20 ns;
        
	END PROCESS;
END testbench;