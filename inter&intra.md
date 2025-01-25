Inter and intra-assignment delays are two important types of delays in Verilog. Let’s break them down with examples:

1. Intra-Assignment Delay
The delay is applied within a single assignment statement.
The right-hand side (RHS) is evaluated immediately, but the assignment to the left-hand side (LHS) is delayed by the specified time.
Commonly used to model delays between evaluation and assignment of values.

Syntax:
<target> = #<delay> <expression>;

Example:
reg a, b;
initial begin
    a = 1'b0;
    b = 1'b0;
    a = #5 1'b1;  // The RHS (1'b1) is evaluated immediately, but assigned to 'a' after 5 time units.
    b = 1'b1;     // This happens without delay.
end
Output:
At time 0, a = 0 and b = 0.
At time 5, a = 1 (because of the intra-assignment delay).

3. Inter-Assignment Delay
The delay is applied between two separate assignment statements.
Simulates a delay between two operations or events in a procedural block.

Syntax:
#<delay>;
<statement>;

Example:
reg a, b;
initial begin
    a = 1'b0;
    #5 a = 1'b1;  // Delay of 5 time units before assigning '1' to 'a'.
    #10 b = 1'b1; // Another delay of 10 time units before assigning '1' to 'b'.
end
Output:
At time 0, a = 0 and b = 0.
At time 5, a = 1.
At time 15, b = 1.

| **Feature**             | **Intra-Assignment Delay**             | **Inter-Assignment Delay**         |
|--------------------------|-----------------------------------------|-------------------------------------|
| **Location**             | Within a single assignment statement.  | Between two separate statements.   |
| **Usage**                | Delays the assignment to LHS.          | Delays the execution of the next statement. |
| **Example**              | `a = #5 b;`                           | `#5; a = b;`                       |
