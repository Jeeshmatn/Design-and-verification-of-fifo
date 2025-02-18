module fifo(
    input clk,rst,wr,rd,
    input [7:0]din,
    output reg [7:0]dout,
    output empty,full
    );
    
    reg [7:0] mem [15:0];
    reg [3:0] wrptr =0 , rdptr=0;
    
    reg [4:0] cnt=0;
    
//    always @(posedge clk && (din || wr))begin
       always @(posedge clk )begin

    
        if(rst)begin
            wrptr =0;
            cnt=0;
            end
        else 
            if(wr && !full)begin
                mem[wrptr]<=din;
                $display("Written2: %d", din);
                wrptr=wrptr+1;
                cnt=cnt+1;          
             end      
   
        else 
            if(rd && !empty)
                begin
                dout<=mem[rdptr];
                $display("Read2: %d", dout);
                rdptr=rdptr+1;
                cnt=cnt+1;          
             end
          
end      
   assign empty=(cnt==0) ? 1'b1 :1'b0 ;
   assign full=(cnt==16) ? 1'b1 :1'b0;   
       
endmodule
