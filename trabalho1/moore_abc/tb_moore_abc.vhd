LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_moore_abc IS
END tb_moore_abc;

ARCHITECTURE testbench OF tb_moore_abc IS 

	SIGNAL clk		: std_logic;
	SIGNAL rst		: std_logic; 
	SIGNAL entrada	: std_logic_vector(1 DOWNTO 0);
	SIGNAL saida	: std_logic;
	
	COMPONENT moore_abc  
	PORT (
		clk		: IN std_logic; 
		rst		: IN std_logic;
		entrada	: IN std_logic_vector(1 DOWNTO 0);
		saida		: OUT std_logic
	);
	END COMPONENT;
		
BEGIN 
	
	i1: moore_abc 
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
				
	entry: PROCESS
	
	BEGIN 
	
		entrada <= "00";
		wait for 20 ns;
		entrada <= "01";
		wait for 20 ns;
		entrada <= "10";
		wait for 20 ns;
		
	END PROCESS;
END testbench;