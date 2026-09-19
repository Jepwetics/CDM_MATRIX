`default_nettype none

// Glyph ROM for the scrolling message:
//   "COLEGIO DE MUNTINLUPA MICROELECTRONICS 2026! "
// The input c is the position in the message (0 to 44). Repeated letters
// share one bitmap by listing every position they appear at.
module glyphs_rom(
    input  wire [5:0] c, input  wire [3:0] y, input  wire [2:0] x, output reg pixel
);
    reg [7:0] rb; 

    always @(*) begin
        case (c) 
            0, 24, 30, 36:      case(y) 2,10:rb=8'h7E; 3,9:rb=8'hC3; 4,5,6,7,8:rb=8'hC0; default:rb=0; endcase // C
            1, 6, 26, 33:       case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            2, 17, 28:          case(y) 2,3,4,5,6,7,8,9:rb=8'hC0; 10:rb=8'hFE; default:rb=0; endcase // L
            3, 9, 27, 29:       case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // E
            4:                  case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // G
            5, 15, 23, 35:      case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            7, 10, 21, 38, 44:  rb = 8'h00; // SPACE
            8:                  case(y) 2,10:rb=8'hF8; 3,4,5,6,7,8,9:rb=8'hC6; default:rb=0; endcase // D
            11, 22:             case(y) 2:rb=8'hC3; 3:rb=8'hE7; 4:rb=8'hFF; 5:rb=8'hDB; 6,7,8,9,10:rb=8'hC3; default:rb=0; endcase // M
            12, 18:             case(y) 2,3,4,5,6,7,8,9:rb=8'hC6; 10:rb=8'h7E; default:rb=0; endcase // U
            13, 16, 34:         case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            14, 31:             case(y) 2:rb=8'hFF; 3,4,5,6,7,8,9,10:rb=8'h18; default:rb=0; endcase // T
            19:                 case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9,10:rb=8'hC0; default:rb=0; endcase // P
            20:                 case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            25, 32:             case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9:rb=8'hD8; 10:rb=8'hC6; default:rb=0; endcase // R
            37:                 case(y) 2:rb=8'h3E; 3:rb=8'h63; 4:rb=8'h60; 5:rb=8'h7C; 6,7:rb=8'h06; 8:rb=8'h63; 9:rb=8'h3E; default:rb=0; endcase // S
            39, 41:             case(y) 2:rb=8'h3E; 3:rb=8'h63; 4:rb=8'h03; 5:rb=8'h06; 6:rb=8'h1C; 7:rb=8'h30; 8,9:rb=8'h60; 10:rb=8'hFF; default:rb=0; endcase // 2
            40:                 case(y) 2,10:rb=8'h3C; 3,4,5,6,7,8,9:rb=8'h66; default:rb=0; endcase // 0
            42:                 case(y) 2:rb=8'h3E; 3,4:rb=8'h60; 5:rb=8'h7C; 6,7,8,9:rb=8'h66; 10:rb=8'h3C; default:rb=0; endcase // 6
            43:                 case(y) 2,3,4,5,6,7:rb=8'h18; 9,10:rb=8'h18; default:rb=0; endcase // !
            default: rb = 8'h00; 
        endcase
        pixel = rb[7-x];
    end
endmodule
