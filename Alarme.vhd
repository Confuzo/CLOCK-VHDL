Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;
Use ieee.numeric_std.all;

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
signal hora_dec_in : std_logic_vector(6 DOWNTO 0);
signal hora_uni_in : std_logic_vector(6 DOWNTO 0);
signal min_dec_in : std_logic_vector(6 DOWNTO 0);
signal min_uni_in : std_logic_vector(6 DOWNTO 0);
signal count : integer := 0;
signal count_2 : integer := 0;
signal led_alarme_A : std_logic;
begin
	process(set)
	begin
		if (config = '1') then
			if(str_sto = '0') then
				if(hora_uni_in = "0001001") then
					hora_dec_in <= hora_dec_A + 1;
					hora_uni_in <= "0000000";
				elsif(hora_dec_in = "0000010" and hora_uni_in = "0000011") then
					hora_dec_in <= "0000000";
					hora_uni_in <= "0000000";
				else
					hora_uni_in <= hora_uni_in + 1;
				end if;
			end if;
			if(set = '0' and set'event) then
				if(str_sto = '0') then
					if(min_uni_in = "0001001") then
						min_dec_in <= min_dec_in + 1;
						min_uni_in <= "0000000";
					elsif(min_dec_in = "0000101" and min_uni_in = "0001001") then
						min_dec_in <= "0000000";
						min_uni_in <= "0000000";
					else
						min_uni_in <= min_uni_in + 1;
					end if;
				end if;
		end if;
	end if;

	if(min_uni = min_uni_in) then
		if(min_dec = min_dec_in) then
			if(hora_uni = hora_uni_in) then
				if(hora_dec = hora_dec_in) then
					led_alarme_A <= '1';
				end if;
			end if;
		end if;
	end if;

	IF (min_uni_in = "0000") THEN
		min_uni <= "1000000";
	ELSIF (min_uni_in = "0001") THEN
		min_uni <= "1111001";
	ELSIF (min_uni_in = "0010") THEN
		min_uni <= "0100100";
	ELSIF (min_uni_in = "0011") THEN
		min_uni <= "0110000";
	ELSIF (min_uni_in = "0100") THEN
		min_uni <= "0011001";
	ELSIF (min_uni_in = "0101") THEN
		min_uni <= "0010010";
	ELSIF (min_uni_in = "0110") THEN
		min_uni <= "0000010";
	ELSIF (min_uni_in = "0111") THEN
		min_uni <= "1111000";
	ELSIF (min_uni_in = "1000") THEN
		min_uni <= "0000000";
	ELSIF (min_uni_in = "1001") THEN
		min_uni <= "0010000";
	END IF;

	IF (min_dec_in = "0000") THEN
		min_dec <= "1000000";
	ELSIF (min_dec_in = "0001") THEN
		min_dec <= "1111001";
	ELSIF (min_dec_in = "0010") THEN
		min_dec <= "0100100";
	ELSIF (min_dec_in = "0011") THEN
		min_dec <= "0110000";
	ELSIF (min_dec_in = "0100") THEN
		min_dec <= "0011001";
	ELSIF (min_dec_in = "0101") THEN
		min_dec <= "0010010";
	ELSIF (min_dec_in = "0110") THEN
		min_dec <= "0000010";
	ELSIF (min_dec_in = "0111") THEN
		min_dec <= "1111000";
	ELSIF (min_dec_in = "1000") THEN
		min_dec <= "0000000";
	ELSIF (min_dec_in = "1001") THEN
		min_dec <= "0010000";
	END IF;

	IF (hora_uni_in = "0000") THEN
		hora_uni <= "1000000";
	ELSIF (hora_uni_in = "0001") THEN
		hora_uni <= "1111001";
	ELSIF (hora_uni_in = "0010") THEN
		hora_uni <= "0100100";
	ELSIF (hora_uni_in = "0011") THEN
		hora_uni <= "0110000";
	ELSIF (hora_uni_in = "0100") THEN
		hora_uni <= "0011001";
	ELSIF (hora_uni_in = "0101") THEN
		hora_uni <= "0010010";
	ELSIF (hora_uni_in = "0110") THEN
		hora_uni <= "0000010";
	ELSIF (hora_uni_in = "0111") THEN
		hora_uni <= "1111000";
	ELSIF (hora_uni_in = "1000") THEN
		hora_uni <= "0000000";
	ELSIF (hora_uni_in = "1001") THEN
		hora_uni <= "0010000";
	END IF;

	IF (hora_dec_in = "0000") THEN
		hora_dec <= "1000000";
	ELSIF (hora_dec_in = "0001") THEN
		hora_dec <= "1111001";
	ELSIF (hora_dec_in = "0010") THEN
		hora_dec <= "0100100";
	ELSIF (hora_dec_in = "0011") THEN
		hora_dec <= "0110000";
	ELSIF (hora_dec_in = "0100") THEN
		hora_dec <= "0011001";
	ELSIF (hora_dec_in = "0101") THEN
		hora_dec <= "0010010";
	ELSIF (hora_dec_in = "0110") THEN
		hora_dec <= "0000010";
	ELSIF (hora_dec_in = "0111") THEN
		hora_dec <= "1111000";
	ELSIF (hora_dec_in = "1000") THEN
		hora_dec <= "0000000";
	ELSIF (hora_dec_in = "1001") THEN
		hora_dec <= "0010000";
	END IF;

	end process;

led_alarme <= led_alarme_A;

end Alarme;
