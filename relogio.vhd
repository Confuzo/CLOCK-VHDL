Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;
Use ieee.numeric_std.all;

Entity Projeto_relogio is
Port (clock : IN std_logic;
	config : IN std_logic;
  mode : IN std_logic;
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
  signal aux : std_logic_vector(6 DOWNTO 0);
  signal count : integer := 0;
	signal c_mode : integer := 0;
	signal c_config : integer := 0;
begin
  process( mode, config)
  begin
		if(mode'event and mode = '0') then
			if(c_mode = 2) then
				c_mode <= 0;
			else
				c_mode <= c_mode + 1;
			end if;
		end if;

		if(config'event and config = '1') then
			if(c_config = 3) then
				c_config <= 0;
			else
				c_config <= c_config +1;
			end if;
		end if;
  end process;

	process(seg_uni_in, seg_uni_in, min_uni_in, min_dec_in, hora_uni_in, hora_dec_in, c_mode)
	begin
		case c_mode is
			when 0 =>
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

			when 1 =>
			when 2 =>
			when others =>
		end case;
	end process;
	
	process(clock, str_sto)
	begin
	case c_config is
	when 0 =>
			if(clock'event and clock = '1') then
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
	    end if;
		 
	when 1 =>
		if(str_sto'event and str_sto='1') then
		--	if(clock'event and clock = '1') then
			if(seg_uni_in = "0001001") then
				aux <= seg_uni_in + 1;
			end if;
		end if;
	when 2 => 
	when 3 =>
	when others =>
	end case;
	end process;
end Projeto_relogio;
