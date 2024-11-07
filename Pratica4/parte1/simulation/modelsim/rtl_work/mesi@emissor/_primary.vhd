library verilog;
use verilog.vl_types.all;
entity mesiEmissor is
    port(
        estado_in       : in     vl_logic_vector(1 downto 0);
        msg_in          : in     vl_logic_vector(1 downto 0);
        \shared\        : in     vl_logic;
        estado_out      : out    vl_logic_vector(1 downto 0);
        msg_out         : out    vl_logic_vector(1 downto 0);
        wb              : out    vl_logic
    );
end mesiEmissor;
