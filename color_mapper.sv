//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] DrawX, DrawY, PickX, PickY,
								input [2:0] currScreen,
                       output logic [7:0]  Red, Green, Blue );

	  
	  
	 int DistX, DistY, XSize, YSize;
	 assign DistX = DrawX - PickX;
    assign DistY = DrawY - PickY;
	 assign XSize = 20;
	 assign YSize = 5;
	 logic pick_on;
	 
//	 always_comb
//	 begin
//	  Red = 8'h00;
//	  Green = 8'h00;
//	 Blue = 8'h00;
//	 end


always_comb
begin
        if ( ( DistX*DistX + DistY*DistY) <= (YSize * YSize) ) 
            pick_on = 1'b1;
        else 
            pick_on = 1'b0;
end
	 
always_comb
begin

	
   case(currScreen) 
	
	3'b000:
		begin
			Red = 8'h7f - DrawX[9:3];
			Green = 8'h00;
			Blue = 8'h00;
		end
	
	
   3'b001:
		begin
				  if ((pick_on == 1'b1)) 
					  begin 
							Red = 8'h00;
							Green = 8'h7f;
							Blue = 8'h00;
					  end       
				  else 
					  begin 
							Red = 8'h70;
							Green = 8'h00;
							Blue = 8'h00;
					  end      
    end
	 
	 3'b010:
		begin
				  if ((pick_on == 1'b1)) 
					  begin 
							Red = 8'h00;
							Green = 8'h7f;
							Blue = 8'h00;
					  end       
				  else 
					  begin 
							Red = 8'h11 - DrawY[9:3];
							Green = 8'h00;
							Blue = 8'h00;
					  end      
    end
	 
	 
	 
	
	 
	 3'b111:
	 begin
			Red = 8'h00;
			Green = 8'h7f - DrawX[9:3];
			Blue = 8'h00;
	end
	 
	 default:
	 begin
	 Red = 8'h00;
	 Green = 8'h00;
	 Blue = 8'h77;
	 end
	 
 endcase
 
 end
 
endmodule
