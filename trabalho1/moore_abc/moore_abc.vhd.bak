LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY detector_ABC_Moore IS
	PORT (  clk, rst: IN std_logic;
			entrada: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            saida: OUT std_logic);
END detector_ABC_Moore;


ARCHITECTURE arquitetura OF detector_ABC_Moore IS

TYPE estado IS (estado_inicial, A, B, C);
SIGNAL estado_atual, proximo_estado: estado;

BEGIN
	----- Registrador de estado ---------------
	PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			estado_atual <= estado_inicial;
		ELSIF (clk'EVENT AND clk='1') THEN
			estado_atual <= proximo_estado;
		END IF;
	END PROCESS;

	-- Logica de proximo estado e saida --------
	PROCESS (entrada, estado_atual)
	BEGIN
		CASE estado_atual IS
			WHEN estado_inicial =>
				saida <= '0';
				IF (entrada = "00") THEN proximo_estado <= A;
				ELSE proximo_estado <= estado_inicial;
				END IF;

			WHEN A =>
				saida <= '0';
				IF (entrada = "01") THEN proximo_estado <= B;
				ELSE IF (entrada = "00" ) THEN proximo_estado <= A;
            ELSE proximo_estado <= estado_inicial;
				END IF;
				END IF;

			WHEN B =>
				saida <= '0';
				IF (entrada = "10") THEN proximo_estado <= C;
            ELSE IF (entrada = "00" ) THEN proximo_estado <= A;
				ELSE proximo_estado <= estado_inicial;
				END IF;
				END IF;

			WHEN C =>
				saida <= '1';
				IF (entrada /= "00") THEN proximo_estado <= estado_inicial;
				ELSE proximo_estado <= A;
				END IF;

		END CASE ;
	END PROCESS;
END arquitetura;