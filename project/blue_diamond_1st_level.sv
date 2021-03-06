/*
 * File Name: blue_diamond_display.sv
 * Module: blue_diamond, blue_diamond_rom
 * Usage: Display the initial blue_diamond using the VGA
 *
 */

module blue_diamond 
(
		input  logic [9:0] DrawX, DrawY,				// Current pixel coordinates
		input  logic is_diamond_eat1,
		input  logic is_diamond_eat2,
		input  logic is_diamond_eat3,
		output logic is_blue_diamond,					// Whether current pixel belongs to blue_diamond
		output logic is_blue_diamond1,
		output logic is_blue_diamond2,
		output logic [8:0] blue_diamond_address,
		output logic [8:0] blue_diamond_address1,
		output logic [8:0] blue_diamond_address2
);

always_comb
	begin
	if (is_diamond_eat1 == 1'b0) 
	begin
		 if (DrawX >= 460 && DrawX < 480 && DrawY >= 408 && DrawY < 428) 
		 begin
			is_blue_diamond = 1'b1;
			blue_diamond_address = (DrawX - 460) + (DrawY - 408) * 20;
		 end
		 else
		 begin
			 is_blue_diamond = 1'b0;
			blue_diamond_address = 18'b0;
		 end
		end
	else
		begin
			 is_blue_diamond = 1'b0;
			blue_diamond_address = 18'b0;
		 end
		 
	if (is_diamond_eat2 == 1'b0) 
	begin
		 if (DrawX >= 366 && DrawX < 386 && DrawY >= 238 && DrawY < 258) 
		 begin
			is_blue_diamond1 = 1'b1;
			blue_diamond_address1 = (DrawX - 366) + (DrawY - 238) * 20;
		 end
		 else
		 begin
			 is_blue_diamond1 = 1'b0;
			blue_diamond_address1 = 18'b0;
		 end
		end
	else
		begin
			 is_blue_diamond1 = 1'b0;
			blue_diamond_address1 = 18'b0;
		 end
		 
	if (is_diamond_eat3 == 1'b0) 
	begin
		 if (DrawX >= 38 && DrawX < 58 && DrawY >= 90 && DrawY < 110) 
		 begin
			is_blue_diamond2 = 1'b1;
			blue_diamond_address2 = (DrawX - 38) + (DrawY - 90) * 20;
		 end
		 else
		 begin
			 is_blue_diamond2 = 1'b0;
			blue_diamond_address2 = 18'b0;
		 end
		end
	else
		begin
			 is_blue_diamond2 = 1'b0;
			blue_diamond_address2 = 18'b0;
		 end
		 
	end	
	
endmodule
	
	
module blue_diamond_rom
(
		input  logic [8:0] read_address,
		output logic [23:0] color_output
);


// mem has width of 4 bits and a total of 230399 addresses
logic [3:0] mem [0:399];

// We have 6 colors for blue_diamond
logic [23:0] col [4:0];

assign col[0] = 24'hffffff; // white
assign col[1] = 24'h2db6d5;	// blue1
assign col[2] = 24'h6adefb;	// blue2
assign col[3] = 24'h38c9e1;	// blue3


assign color_output = col[mem[read_address]];

initial
begin
	 $readmemh("./sprite_bytes/blue.txt", mem);
end


endmodule

module red_diamond 
(
		input  logic [9:0] DrawX, DrawY,				// Current pixel coordinates
		input  logic is_diamond_eat1_red,
		input  logic is_diamond_eat1_red1,
		input  logic is_diamond_eat1_red2,
		output logic is_red_diamond,					// Whether current pixel belongs to blue_diamond
		output logic is_red_diamond1,
		output logic is_red_diamond2,
		output logic [8:0] red_diamond_address,		// address for color mapper to figure out what color the logo pixel should be
		output logic [8:0] red_diamond_address1,
		output logic [8:0] red_diamond_address2
);

always_comb
	begin
	if (is_diamond_eat1_red == 1'b0) 
	begin
		 if (DrawX >= 330 && DrawX < 350 && DrawY >= 408 && DrawY < 428) 
		 begin
			is_red_diamond = 1'b1;
			red_diamond_address = (DrawX - 330) + (DrawY - 408) * 20;
		 end
		 else
		 begin
			 is_red_diamond = 1'b0;
			red_diamond_address = 18'b0;
		 end
		end
	else
		begin
			 is_red_diamond = 1'b0;
			red_diamond_address = 18'b0;
		 end
		 
		 
	if (is_diamond_eat1_red1 == 1'b0) 
	begin
		 if (DrawX >= 300 && DrawX < 320 && DrawY >= 220 && DrawY < 240) 
		 begin
			is_red_diamond1 = 1'b1;
			red_diamond_address1 = (DrawX - 300) + (DrawY - 220) * 20;
		 end
		 else
		 begin
			 is_red_diamond1 = 1'b0;
			red_diamond_address1 = 18'b0;
		 end
		end
	else
		begin
			 is_red_diamond1 = 1'b0;
			red_diamond_address1 = 18'b0;
		 end
		 
	if (is_diamond_eat1_red2 == 1'b0) 
	begin
		 if (DrawX >= 190 && DrawX < 210 && DrawY >= 42 && DrawY < 62) 
		 begin
			is_red_diamond2 = 1'b1;
			red_diamond_address2 = (DrawX - 190) + (DrawY - 42) * 20;
		 end
		 else
		 begin
			 is_red_diamond2 = 1'b0;
			red_diamond_address2 = 18'b0;
		 end
		end
	else
		begin
			 is_red_diamond2 = 1'b0;
			red_diamond_address2 = 18'b0;
		 end

	end

endmodule



module red_diamond_rom
(
		input  logic [8:0] read_address,
		output logic [23:0] color_output
);


// mem has width of 4 bits and a total of 230399 addresses
logic [3:0] mem [0:399];

// We have 6 colors for blue_diamond
logic [23:0] col [4:0];

assign col[0] = 24'hffffff; // white
assign col[1] = 24'hf80504;
assign col[2] = 24'hff4c4a;
assign col[3] = 24'hfe9597;
assign col[4] = 24'hba0102;


assign color_output = col[mem[read_address]];

initial
begin
	 $readmemh("./sprite_bytes/red.txt", mem);
end


endmodule