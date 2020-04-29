LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY moore_abc IS
	PORT (
		clk, rst	: IN std_logic;
		entrada	: IN std_logic_vector(1 DOWNTO 0);
		saida		: OUT std_logic
	);
END moore_abc;

ARCHITECTURE arquitetura OF moore_abc IS

TYPE estados IS (estado_inicial, A, B, C);
SIGNAL estado_atual, estado_proximo : estados;

BEGIN

	PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			estado_atual <= estado_inicial;
		ELSIF (clk'EVENT AND clk='1') THEN
			estado_atual <= estado_proximo;
		END IF;
	END PROCESS;

	PROCESS (entrada, estado_atual)
	BEGIN
	
		CASE estado_atual IS
			WHEN estado_inicial =>
				saida <= '0';
				IF (entrada = "00") THEN estado_proximo <= A;
				ELSE estado_proximo <= estado_inicial;
				END IF;

			WHEN A =>
				saida <= '0';
				IF (entrada = "01") THEN estado_proximo <= B;
				ELSE IF (entrada = "00" ) THEN estado_proximo <= A;
				ELSE estado_proximo <= estado_inicial;
				END IF;
				END IF;

			WHEN B =>
				saida <= '0';
				IF (entrada = "10") THEN estado_proximo <= C;
				ELSE IF (entrada = "00" ) THEN estado_proximo <= A;
				ELSE estado_proximo <= estado_inicial;
				END IF;
				END IF;

			WHEN C =>
				saida <= '1';
				IF (entrada /= "00") THEN estado_proximo <= estado_inicial;
				ELSE estado_proximo <= A;
				END IF;

		END CASE ;
	END PROCESS;
END arquitetura;