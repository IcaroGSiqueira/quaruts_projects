LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY detector_ABC_Meally IS
PORT (
	clk	, rst           	: IN std_logic;
   entrada: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	saida		            : OUT std_logic
);
END detector_ABC_Meally;


ARCHITECTURE arquitetura OF detector_ABC_Meally IS

type tipo_estados is (A, B , C);

signal estado_atual, proximo_estado : tipo_estados;

BEGIN

-- Processo 1: registrador de estado

PROCESS(clk, rst)
BEGIN
	IF (rst = '1') THEN
		estado_atual <= A;
	ELSIF (clk'EVENT AND clk = '1') THEN
		estado_atual <= proximo_estado;
	END IF;
END PROCESS;
		
-- Processo 2: logicas de proximo estado e de saida

PROCESS(estado_atual, entrada)
BEGIN
   CASE estado_atual IS
      WHEN A =>
			CASE entrada IS 
				WHEN "00" =>
					proximo_estado <= B;			
					saida <= '0';
				WHEN OTHERS =>
					proximo_estado <= A;
					saida <= '0';
		END CASE;
		
      WHEN B =>
			CASE entrada IS 
				WHEN "01" =>
					proximo_estado <= C;
					saida <= '0';
				WHEN "00" =>
					proximo_estado <= B;
					saida <= '0';
				WHEN OTHERS =>
					proximo_estado <= A;
					saida <= '0';
		END CASE;
		
      WHEN C =>
			CASE entrada IS
				WHEN "10" =>
					proximo_estado <= A;
					saida <= '1';
				WHEN OTHERS =>
					proximo_estado <= A;
					saida <= '0';
	 END CASE; 
	     
   END CASE;
END PROCESS;
		
END arquitetura;
