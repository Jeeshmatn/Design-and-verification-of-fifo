module tb_fifo;
    reg clk,rst,wr,rd;
    reg [7:0]din;
    wire [7:0]dout;
    wire empty;
    wire full;
   
    
    fifo uut( .clk(clk), .rst(rst) , .wr(wr), .rd(rd) ,  .din(din), .dout(dout), .empty(empty), .full(full)  );
    
    always #5 clk = ~clk;
    
   initial begin 
    
        clk=0;
        rst=1;
        wr=0;
        
        
        #10; rst=0;
        @(posedge clk);
            wr = 1; din = 5; $display("Written: %d", din);
        @(posedge clk);
           // wr = 1; din = 5; $display("Written: %d", din);
        @(posedge clk);
            //wr = 1; din = $random % 256; $display("Written: %d", din);
        @(posedge clk);
            wr = 1; din = $random % 256; $display("Written: %d", din);
//        @(posedge clk);
//            wr = 1; din = $random % 256; $display("Written: %d", din);
        
        
        @(posedge clk);
            rd = 1; #1 $display("Read: %d", dout);
        @(posedge clk);
            rd = 1; #1 $display("Read: %d", dout);
        @(posedge clk);
            rd = 1; #1 $display("Read: %d", dout);
        @(posedge clk);
            rd = 1; #1 $display("Read: %d", dout);
        @(posedge clk);
            rd = 1; #1 $display("Read: %d", dout);
            rd = 0;
      
       #200;
       $finish(); 
         
 end
    
    
endmodule
