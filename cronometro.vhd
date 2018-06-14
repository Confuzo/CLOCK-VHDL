Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;
Use ieee.numeric_std.all;

Entity Projeto_relogio is
Port (clock : IN std_logic;
	config : IN std_logic;
  str_sto : IN std_logic;
	set : IN std_logic;
	reset : IN std_logic;
  hora_dec : OUT  std_logic_vector(6 DOWNTO 0);
  hora_uni : OUT std_logic_vector(6 DOWNTO 0);
  min_dec : OUT std_logic_vector(6 DOWNTO 0);
  min_uni : OUT std_logic_vector(6 DOWNTO 0);
  seg_dec : OUT std_logic_vector(6 DOWNTO 0);
  seg_uni : OUT std_logic_vector(6 DOWNTO 0));
End  Projeto_relogio;

Architecture Projeto_relogio of Projeto_relogio is
  signal hora_dec_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal hora_uni_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal min_dec_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal min_uni_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal seg_dec_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal seg_uni_in : std_logic_vector(6 DOWNTO 0) := "0000000";
  signal en : std_logic := '0' ;
  signal count : integer := 0;
begin
	process(clock,reset)
	begin
		if( reset = '0') then
			seg_uni_in <= "0000000";
			seg_dec_in <= "0000000";
			min_uni_in <= "0000000";
			min_dec_in <= "0000000";
			hora_uni_in <= "0000000";
			hora_dec_in <= "0000000";
				elsif(clock'event and clock = '1') then
					if(en = '1') then
						if(count = 50000000) then
						count <= 0;
					  if(seg_uni_in = "0001001") then
						 if(seg_dec_in = "0000101") then
							if(min_uni_in = "0001001") then
							  if(min_dec_in = "0000101") then
								 if(hora_uni_in = "0001001" or hora_uni_in = "0000011") then
									if(hora_dec_in = "0000010") then
									  if(hora_dec_in = "0000010" and hora_uni_in = "0000011") then
										 seg_uni_in <= "0000000";
										 seg_dec_in <= "0000000";
										 min_uni_in <= "0000000";
										 min_dec_in <= "0000000";
										 hora_uni_in <= "0000000";
										 hora_dec_in <= "0000000";
									  end if;
									else
									  seg_uni_in <= "0000000";
									  seg_dec_in <= "0000000";
									  min_uni_in <= "0000000";
									  min_dec_in <= "0000000";
									  hora_uni_in <= "0000000";
									  hora_dec_in <= hora_dec_in + 1;
									end if;
								 else
									seg_uni_in <= "0000000";
									seg_dec_in <= "0000000";
									min_uni_in <= "0000000";
									min_dec_in <= "0000000";
									hora_uni_in <= hora_uni_in + 1;
								 end if;
							  else
								 seg_uni_in <= "0000000";
								 seg_dec_in <= "0000000";
								 min_uni_in <= "0000000";
								 min_dec_in <= min_dec_in + 1;
							  end if;
							else
							  seg_uni_in <= "0000000";
							  seg_dec_in <= "0000000";
							  min_uni_in <= min_uni_in + 1;
							end if;
						 else
							seg_uni_in <= "0000000";
							seg_dec_in <= seg_dec_in + 1;
						 end if;
					  else
						 seg_uni_in <= seg_uni_in + 1;
					  end if;
					else
					  count <= count + 1;
					 end if;
				else
						seg_dec_in <= seg_dec_in;
						seg_uni_in <= seg_uni_in;
						min_dec_in <= min_dec_in;
						min_uni_in <= min_uni_in;
						hora_dec_in <= hora_dec_in;
						hora_uni_in <= hora_uni_in;
					 end if;

				end if;
		end process;

process(seg_uni_in, seg_uni_in, min_uni_in, min_dec_in, hora_uni_in, hora_dec_in)
	begin
		IF (seg_uni_in = "0000") THEN
			seg_uni <= "1000000";
		ELSIF (seg_uni_in = "0001") THEN
			seg_uni <= "1111001";
		ELSIF (seg_uni_in = "0010") THEN
			seg_uni <= "0100100";
		ELSIF (seg_uni_in = "0011") THEN
			seg_uni <= "0110000";
		ELSIF (seg_uni_in = "0100") THEN
			seg_uni <= "0011001";
		ELSIF (seg_uni_in = "0101") THEN
			seg_uni <= "0010010";
		ELSIF (seg_uni_in = "0110") THEN
			seg_uni <= "0000010";
		ELSIF (seg_uni_in = "0111") THEN
			seg_uni <= "1111000";
		ELSIF (seg_uni_in = "1000") THEN
			seg_uni <= "0000000";
		ELSIF (seg_uni_in = "1001") THEN
			seg_uni <= "0010000";
		END IF;

		IF (seg_dec_in = "0000") THEN
			seg_dec <= "1000000";
		ELSIF (seg_dec_in = "0001") THEN
			seg_dec <= "1111001";
		ELSIF (seg_dec_in = "0010") THEN
			seg_dec <= "0100100";
		ELSIF (seg_dec_in = "0011") THEN
			seg_dec <= "0110000";
		ELSIF (seg_dec_in = "0100") THEN
			seg_dec <= "0011001";
		ELSIF (seg_dec_in = "0101") THEN
			seg_dec <= "0010010";
		ELSIF (seg_dec_in = "0110") THEN
			seg_dec <= "0000010";
		ELSIF (seg_dec_in = "0111") THEN
			seg_dec <= "1111000";
		ELSIF (seg_dec_in = "1000") THEN
			seg_dec <= "0000000";
		ELSIF (seg_dec_in = "1001") THEN
			seg_dec <= "0010000";
		END IF;

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

PROCESS (str_sto)
BEGIN

		IF (str_sto = '0') THEN
		   if(en = '0' ) then
				en <= '1';
			else
				en <= '0';
			end if;
		END IF;

END PROCESS;

end Projeto_relogio;
