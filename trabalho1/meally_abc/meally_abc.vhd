LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY meally_abc IS
	PORT (
		clk, rst	: IN std_logic;
		entrada	: IN std_logic_vector(1 DOWNTO 0);
		saida		: OUT std_logic
	);
END meally_abc;

ARCHITECTURE arquitetura OF meally_abc IS

TYPE estados IS (A, B, C);
SIGNAL estado_atual, estado_proximo : estados;

BEGIN

	PROCESS(clk, rst)
	BEGIN
		IF (rst = '1') THEN
			estado_atual <= A;
		ELSIF (clk'EVENT AND clk = '1') THEN
			estado_atual <= estado_proximo;
		END IF;
	END PROCESS;

	PROCESS(estado_atual, entrada)

	BEGIN

		CASE estado_atual IS
			WHEN A =>
				CASE entrada IS 
					WHEN "00" =>
						estado_proximo <= B;			
						saida <= '0';
					WHEN OTHERS =>
						estado_proximo <= A;
						saida <= '0';
				END CASE;

			WHEN B =>
				CASE entrada IS 
					WHEN "01" =>
						estado_proximo <= C;
						saida <= '0';
					WHEN "00" =>
						estado_proximo <= B;
						saida <= '0';
					WHEN OTHERS =>
						estado_proximo <= A;
						saida <= '0';
				END CASE;

			WHEN C =>
				CASE entrada IS
					WHEN "10" =>
						estado_proximo <= A;
						saida <= '1';
					WHEN OTHERS =>
						estado_proximo <= A;
						saida <= '0';
				END CASE;

		END CASE;
END PROCESS;

END arquitetura;
