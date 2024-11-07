library verilog;
use verilog.vl_types.all;
entity mesiReceptor is
    port(
        estado_in       : in     vl_logic_vector(1 downto 0);
        msg_in          : in     vl_logic_vector(1 downto 0);
        estado_out      : out    vl_logic_vector(1 downto 0);
        wb              : out    vl_logic;
        abt_mem_acs     : out    vl_logic
    );
end mesiReceptor;
