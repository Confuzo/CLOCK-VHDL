Library ieee;
Use ieee.std_logic_1164.all;

Entity Projeto_relogio is
Port (clock : IN std_logic;
	config : IN std_logic;
  mode : IN std_logic;
  str/sto :: IN std_logic;
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
  signal hora_dec_in : std_logic_vector(6 DOWNTO 0) := '0000000';
  signal hora_uni_in : std_logic_vector(6 DOWNTO 0) := '0000000';
  signal min_dec_in : std_logic_vector(6 DOWNTO 0) := '0000000';
  signal min_uni_in : std_logic_vector(6 DOWNTO 0) := '0000000';
  signal seg_dec_in : std_logic_vector(6 DOWNTO 0) := '0000000';
  signal seg_uni_in : std_logic_vector(6 DOWNTO 0) := '0000000');
  variable count : integer := 0;
begin
  process(clock)
  begin
    if(clock'event and clock = '1') then
      if(count = 25000000) then
        count := 0;
        if(seg_uni_in = '0001001') then
          if(seg_dec_in = '0000101') then
            if(min_uni_in = '0001001') then
              if(min_dec_in = '0000101') then
                if(hora_uni_in = '0001001' or hora_uni_in = '0000011') then
                  if(hora_dec_in = '0000010') then
                    if(hora_dec_in = '0000010' and hora_uni_in = '0000011') then
                      seg_uni_in := '0000000';
                      seg_dec_in := '0000000';
                      min_uni_in := '0000000';
                      min_dec_in := '0000000';
                      hora_uni_in := '0000000';
                      hora_dec_in := '0000000';
                    end if;
                  else
                    seg_uni_in := '0000000';
                    seg_dec_in := '0000000';
                    min_uni_in := '0000000';
                    min_dec_in := '0000000';
                    hora_uni_in := '0000000';
                    hora_dec_in := hora_dec_in + 1;
                  end if;
                else
                  seg_uni_in := '0000000';
                  seg_dec_in := '0000000';
                  min_uni_in := '0000000';
                  min_dec_in := '0000000';
                  hora_uni_in := hora_uni_in + 1;
                end if;
              else
                seg_uni_in := '0000000';
                seg_dec_in := '0000000';
                min_uni_in := '0000000';
                min_dec_in := min_dec_in + 1;
              end if;
            else
              seg_uni_in := '0000000';
              seg_dec_in := '0000000';
              min_uni_in := min_uni_in + 1;
            end if;
          else
            seg_uni_in := '0000000';
            seg_dec_in := seg_dec_in + 1;
          end if;
        else
          seg_uni_in := seg_uni_in + 1;
        end if;
      else
        count := count + 1;
      end if;
    end if;
  end process;

	process(seg_uni, seg_uni, min_uni, min_dec, hora_uni, hora_dec)
	begin
		IF (seg_uni_in = "0000") THEN
			seg_uni <= "0111111";
		ELSIF (seg_uni_in = "0001") THEN
			seg_uni <= "0000110";
		ELSIF (seg_uni_in = "0010") THEN
			seg_uni <= "1011011";
		ELSIF (seg_uni_in = "0011") THEN
			seg_uni <= "1001111";
		ELSIF (seg_uni_in = "0100") THEN
			seg_uni <= "1100110";
		ELSIF (seg_uni_in = "0101") THEN
			seg_uni <= "1101101";
		ELSIF (seg_uni_in = "0110") THEN
			seg_uni <= "1111101";
		ELSIF (seg_uni_in = "0111") THEN
			seg_uni <= "0000111";
		ELSIF (seg_uni_in = "1000") THEN
			seg_uni <= "1111111";
		ELSIF (seg_uni_in = "1001") THEN
			seg_uni <= "1101111";
		END IF;

		IF (seg_dec_in = "0000") THEN
			seg_dec <= "0111111";
		ELSIF (seg_dec_in = "0001") THEN
			seg_dec <= "0000110";
		ELSIF (seg_dec_in = "0010") THEN
			seg_dec <= "1011011";
		ELSIF (seg_dec_in = "0011") THEN
			seg_dec <= "1001111";
		ELSIF (seg_dec_in = "0100") THEN
			seg_dec <= "1100110";
		ELSIF (seg_dec_in = "0101") THEN
			seg_dec <= "1101101";
		ELSIF (seg_dec_in = "0110") THEN
			seg_dec <= "1111101";
		ELSIF (seg_dec_in = "0111") THEN
			seg_dec <= "0000111";
		ELSIF (seg_dec_in = "1000") THEN
			seg_dec <= "1111111";
		ELSIF (seg_dec_in = "1001") THEN
			seg_dec <= "1101111";
		END IF;

		IF (min_uni_in = "0000") THEN
			min_uni <= "0111111";
		ELSIF (seg_uni_in = "0001") THEN
			min_uni <= "0000110";
		ELSIF (min_uni_in = "0010") THEN
			min_uni <= "1011011";
		ELSIF (min_uni_in = "0011") THEN
			min_uni <= "1001111";
		ELSIF (min_uni_in = "0100") THEN
			min_uni <= "1100110";
		ELSIF (min_uni_in = "0101") THEN
			min_uni <= "1101101";
		ELSIF (min_uni_in = "0110") THEN
			min_uni <= "1111101";
		ELSIF (min_uni_in = "0111") THEN
			min_uni <= "0000111";
		ELSIF (min_uni_in = "1000") THEN
			min_uni <= "1111111";
		ELSIF (min_uni_in = "1001") THEN
			min_uni <= "1101111";
		END IF;

		IF (min_dec_in = "0000") THEN
			min_dec <= "0111111";
		ELSIF (min_dec_in = "0001") THEN
			min_dec <= "0000110";
		ELSIF (min_dec_in = "0010") THEN
			min_dec <= "1011011";
		ELSIF (min_dec_in = "0011") THEN
			min_dec <= "1001111";
		ELSIF (min_dec_in = "0100") THEN
			min_dec <= "1100110";
		ELSIF (min_dec_in = "0101") THEN
			min_dec <= "1101101";
		ELSIF (min_dec_in = "0110") THEN
			min_dec <= "1111101";
		ELSIF (min_dec_in = "0111") THEN
			min_dec <= "0000111";
		ELSIF (min_dec_in = "1000") THEN
			min_dec <= "1111111";
		ELSIF (min_dec_in = "1001") THEN
			min_dec <= "1101111";
		END IF;

		IF (hora_uni_in = "0000") THEN
			hora_uni <= "0111111";
		ELSIF (hora_uni_in = "0001") THEN
			hora_uni <= "0000110";
		ELSIF (hora_uni_in = "0010") THEN
			hora_uni <= "1011011";
		ELSIF (hora_uni_in = "0011") THEN
			hora_uni <= "1001111";
		ELSIF (hora_uni_in = "0100") THEN
			hora_uni <= "1100110";
		ELSIF (hora_uni_in = "0101") THEN
			hora_uni <= "1101101";
		ELSIF (hora_uni_in = "0110") THEN
			hora_uni <= "1111101";
		ELSIF (hora_uni_in = "0111") THEN
			hora_uni <= "0000111";
		ELSIF (hora_uni_in = "1000") THEN
			hora_uni <= "1111111";
		ELSIF (hora_uni_in = "1001") THEN
			hora_uni <= "1101111";
		END IF;

		IF (hora_dec_in = "0000") THEN
			hora_dec <= "0111111";
		ELSIF (hora_dec_in = "0001") THEN
			hora_dec <= "0000110";
		ELSIF (hora_dec_in = "0010") THEN
			hora_dec <= "1011011";
		ELSIF (hora_dec_in = "0011") THEN
			hora_dec <= "1001111";
		ELSIF (hora_dec_in = "0100") THEN
			hora_dec <= "1100110";
		ELSIF (hora_dec_in = "0101") THEN
			hora_dec <= "1101101";
		ELSIF (hora_dec_in = "0110") THEN
			hora_dec <= "1111101";
		ELSIF (hora_dec_in = "0111") THEN
			hora_dec <= "0000111";
		ELSIF (hora_dec_in = "1000") THEN
			hora_dec <= "1111111";
		ELSIF (hora_dec_in = "1001") THEN
			hora_dec <= "1101111";
		END IF;
		
	end process;
end Projeto_relogio;
