//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2006-2011 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED
//   ------------------------------------------------------------------
//
//   IMPORTANT: THIS FILE IS AUTO-GENERATED BY THE LATTICEMICO SYSTEM.
//
//   Permission:
//
//      Lattice Semiconductor grants permission to use this code
//      pursuant to the terms of the Lattice Semiconductor Corporation
//      Open Source License Agreement.
//
//   Disclaimer:
//
//      Lattice Semiconductor provides no warranty regarding the use or
//      functionality of this code. It is the user's responsibility to
//      verify the user's design for consistency and functionality through
//      the use of formal verification methods.
//
//   --------------------------------------------------------------------
//
//                  Lattice Semiconductor Corporation
//                  5555 NE Moore Court
//                  Hillsboro, OR 97214
//                  U.S.A
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                         503-286-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//                         FILE DETAILS
// Project          : LatticeMico32
// File             : lm32_addsub.v
// Title            : PMI adder/subtractor.
// Version          : 6.1.17
//                  : Initial Release
// Version          : 7.0SP2, 3.0
//                  : No Change
// Version          : 3.1
//                  : No Change
// =============================================================================

`include "lm32_include.v"

/////////////////////////////////////////////////////
// Module interface
/////////////////////////////////////////////////////

module lm32_addsub 
  (
   // ----- Inputs -------
   DataA,
   DataB,
   Cin,
   Add_Sub,
   // ----- Outputs -------
   Result,
   Cout
   );

   /////////////////////////////////////////////////////
   // Inputs
   /////////////////////////////////////////////////////

   input [31:0] DataA;
   input [31:0] DataB;
   input 	Cin;
   input 	Add_Sub;

   /////////////////////////////////////////////////////
   // Outputs
   /////////////////////////////////////////////////////

   output [31:0] Result;
   wire [31:0] 	 Result;
   output 	 Cout;
   wire 	 Cout;

   /////////////////////////////////////////////////////
   // Instantiations
   /////////////////////////////////////////////////////

   // Modified for Milkymist: removed non-portable instantiated block
   wire [32:0] 	 tmp_addResult 	= DataA + DataB + Cin;
   wire [32:0] 	 tmp_subResult 	= DataA - DataB - !Cin;

   assign  Result 		= (Add_Sub == 1) ? tmp_addResult[31:0] : tmp_subResult[31:0];
   assign  Cout 		= (Add_Sub == 1) ? tmp_addResult[32] : !tmp_subResult[32];

endmodule
