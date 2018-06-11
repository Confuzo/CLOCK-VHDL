library ieee;
use ieee.std_logic_1164.all;

entity Alarme is
	port(set : IN std_logic;
	     clock : IN std_logic;
	     config : IN std_logic;
		  str_sto : IN std_logic;
	     hora_dec : IN  std_logic_vector(6 DOWNTO 0);
	     hora_uni : IN std_logic_vector(6 DOWNTO 0);
		  min_dec : IN std_logic_vector(6 DOWNTO 0);
        min_uni : IN std_logic_vector(6 DOWNTO 0);
		  led_alarme : OUT std_logic);
end Alarme;

Architecture Alarme of Alarme is
signal hora_dec_A : std_logic_vector(6 DOWNTO 0);
signal hora_uni_A : std_logic_vector(6 DOWNTO 0);
signal min_dec_A : std_logic_vector(6 DOWNTO 0);
signal min_uni_A : std_logic_vector(6 DOWNTO 0);
signal count : integer := 0;
signal count_2 : integer := 0;
signal led_alarme_A : std_logic;
begin
	process(set)
	begin
		if (config = '1') then
			if(str_sto = '0') then
				if(hora_uni_A = "0001001") then
					hora_dec_A <= hora_dec_A + 1;
					hora_uni_A <= "0000000";
				elsif(hora_dec_A = "0000010" and hora_uni_A = "0000011") then
					hora_dec_A <= "0000000";
					hora_uni_A <= "0000000";
				else
					hora_uni_A <= hora_uni_A + 1;
				end if;
			end if;
			if(set = '0' and set'event) then
				if(str_sto = '0') then
					if(min_uni_A = "0001001") then
						min_dec_A <= min_dec_A + 1;
						min_uni_A <= "0000000";
					elsif(min_dec_A = "0000101" and min_uni_A = "0001001") then
						min_dec_A <= "0000000";
						min_uni_A <= "0000000";
					else
						min_uni_A <= min_uni_A + 1;
					end if;
				end if;
		end if;
	end if;

	if(min_uni = min_uni_A) then
		if(min_dec = min_dec_A) then
			if(hora_uni = hora_uni_A) then
				if(hora_dec = hora_dec_A) then
					led_alarme_A <= '1';
				end if;
			end if;
		end if;
	end if;

	end process;

led_alarme <= led_alarme_A;

end Alarme;
