library verilog;
use verilog.vl_types.all;
entity ula is
    port(
        op              : in     vl_logic_vector(2 downto 0);
        in1             : in     vl_logic_vector(15 downto 0);
        in2             : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end ula;
