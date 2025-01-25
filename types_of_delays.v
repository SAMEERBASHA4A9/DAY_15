module types_of_delays;

reg [2:0] a,b,c;

initial

begin 
a=#10 3'b001;
#10 b=3'b010;
#10 c=#10 3'b011;
end

initial
$monitor("a=%0b,b=%0b,c=%0b", a,b,c, $time);

endmodule