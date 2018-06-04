Library ieee;
Use ieee.std_logic_1164.all;

Entity Projeto_relogio is
Port (clock : IN std_logic;
	config : IN std_logic;
  mode : IN std_logic;
  str/sto :: IN std_logic;
	set : IN std_logic;
	reset : IN std_logic;
  hora_dec : OUT  std_logic_vector(3 DOWNTO 0);
  hora_uni : OUT std_logic_vector(3 DOWNTO 0);
  min_dec : OUT std_logic_vector(3 DOWNTO 0);
  min_uni : OUT std_logic_vector(3 DOWNTO 0);
  seg_dec : OUT std_logic_vector(3 DOWNTO 0);
  seg_uni : OUT std_logic_vector(3 DOWNTO 0));
End  Projeto_relogio;

Architecture Projeto_relogio of Projeto_relogio is
  signal hora_dec_in : std_logic_vector(3 DOWNTO 0) := '0000';
  signal hora_uni_in : std_logic_vector(3 DOWNTO 0) := '0000';
  signal min_dec_in : std_logic_vector(3 DOWNTO 0) := '0000';
  signal min_uni_in : std_logic_vector(3 DOWNTO 0) := '0000';
  signal seg_dec_in : std_logic_vector(3 DOWNTO 0) := '0000';
  signal seg_uni_in : std_logic_vector(3 DOWNTO 0) := '0000');
  variable count : integer := 0;
begin
  process(clock)
  begin
    if(clock'event and clock = '1') then
      if(count = 25000000) then
        count := 0;
        if(seg_uni_in = '1001') then
          if(seg_dec_in = '0101') then
            if(min_uni_in = '1001') then
              if(min_dec_in = '0101') then
                if(hora_uni_in = '1001' or hora_uni_in = '0011') then
                  if(hora_dec_in = '0010') then
                    if(hora_dec_in = '0010' and hora_uni_in = '0011') then
                      seg_uni_in := '0000';
                      seg_dec_in := '0000';
                      min_uni_in := '0000';
                      min_dec_in := '0000';
                      hora_uni_in := '0000';
                      hora_dec_in := '0000';
                      seg_uni <= seg_uni_in;
                      seg_dec <= seg_dec_in;
                      min_uni <= min_uni_in;
                      min_dec <= min_dec_in;
                      hora_uni <= hora_uni_in;
                      hora_dec <= hora_dec_in;
                    end if;
                  else
                    seg_uni_in := '0000';
                    seg_dec_in := '0000';
                    min_uni_in := '0000';
                    min_dec_in := '0000';
                    hora_uni_in := '0000';
                    hora_dec_in := hora_dec_in + 1;
                    seg_uni <= seg_uni_in;
                    seg_dec <= seg_dec_in;
                    min_uni <= min_uni_in;
                    min_dec <= min_dec_in;
                    hora_uni <= hora_uni_in;
                    hora_dec <= hora_dec_in;
                  end if;
                else
                  seg_uni_in := '0000';
                  seg_dec_in := '0000';
                  min_uni_in := '0000';
                  min_dec_in := '0000';
                  hora_uni_in := hora_uni_in + 1;
                  seg_uni <= seg_uni_in;
                  seg_dec <= seg_dec_in;
                  min_uni <= min_uni_in;
                  min_dec <= min_dec_in;
                  hora_uni <= hora_uni_in;
                  hora_dec <= hora_dec_in;
                end if;
              else
                seg_uni_in := '0000';
                seg_dec_in := '0000';
                min_uni_in := '0000';
                min_dec_in := min_dec_in + 1;
                seg_uni <= seg_uni_in;
                seg_dec <= seg_dec_in;
                min_uni <= min_uni_in;
                min_dec <= min_dec_in;
                hora_uni <= hora_uni_in;
                hora_dec <= hora_dec_in;
              end if;
            else
              seg_uni_in := '0000';
              seg_dec_in := '0000';
              min_uni_in := min_uni_in + 1;
              seg_uni <= seg_uni_in;
              seg_dec <= seg_dec_in;
              min_uni <= min_uni_in;
              min_dec <= min_dec_in;
              hora_uni <= hora_uni_in;
              hora_dec <= hora_dec_in;
            end if;
          else
            seg_uni_in := '0000';
            seg_dec_in := seg_dec_in + 1;
            seg_uni <= seg_uni_in;
            seg_dec <= seg_dec_in;
            min_uni <= min_uni_in;
            min_dec <= min_dec_in;
            hora_uni <= hora_uni_in;
            hora_dec <= hora_dec_in;
          end if;
        else
          seg_uni_in := seg_uni_in + 1;
          seg_uni <= seg_uni_in;
          seg_dec <= seg_dec_in;
          min_uni <= min_uni_in;
          min_dec <= min_dec_in;
          hora_uni <= hora_uni_in;
          hora_dec <= hora_dec_in;
        end if;

      else
        count := count + 1;
      end if;
    end if;
  end process;
end Projeto_relogio;
