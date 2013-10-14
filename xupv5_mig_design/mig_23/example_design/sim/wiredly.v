//*****************************************************************************
// DISCLAIMER OF LIABILITY
// 
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a 
// license to use this text/file solely for design, simulation, 
// implementation and creation of design files limited 
// to Xilinx devices or technologies. Use with non-Xilinx 
// devices or technologies is expressly prohibited and 
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information 
// "as-is" solely for use in developing programs and 
// solutions for Xilinx devices, with no obligation on the 
// part of Xilinx to provide support. By providing this design, 
// code, or information as one possible implementation of 
// this feature, application or standard, Xilinx is making no 
// representation that this implementation is free from any 
// claims of infringement. You are responsible for 
// obtaining any rights you may require for your implementation. 
// Xilinx expressly disclaims any warranty whatsoever with 
// respect to the adequacy of the implementation, including 
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied 
// warranties of merchantability or fitness for a particular 
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are 
// done at the user's sole risk and will be unsupported.
//
// Copyright (c) 2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part 
// of this text at all times.
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor             : Xilinx
// \   \   \/    Version            : 2.3
//  \   \        Application        : MIG
//  /   /        Filename           : wiredly.v
// /___/   /\    Date Last Modified : $Date: 2008/05/14 14:11:14 $
// \   \  /  \   Date Created       : Thu Feb 21 2008
//  \___\/\___\
//
// Device      : Virtex-5
// Design Name : DDR2
// Description: This module provide
//   the definition of a zero ohm component (A, B).
//
//   The applications of this component include:
//     . Normal operation of a jumper wire (data flowing in both directions)
//
//   The component consists of 2 ports:
//      . Port A: One side of the pass-through switch
//      . Port B: The other side of the pass-through switch

//   The model is sensitive to transactions on all ports.  Once a
//   transaction is detected, all other transactions are ignored
//   for that simulation time (i.e. further transactions in that
//   delta time are ignored).
//
// Model Limitations and Restrictions:
//   Signals asserted on the ports of the error injector should not have
//   transactions occuring in multiple delta times because the model
//   is sensitive to transactions on port A, B ONLY ONCE during
//   a simulation time.  Thus, once fired, a process will
//   not refire if there are multiple transactions occuring in delta times.
//   This condition may occur in gate level simulations with
//   ZERO delays because transactions may occur in multiple delta times.
//*****************************************************************************

`timescale 1ns / 1ps

module WireDelay # (
  parameter Delay_g = 0,
  parameter Delay_rd = 0
)
(
  inout A,
  inout B,
  input reset
);  

  reg A_r;
  reg B_r;
  reg line_en;

  assign A = A_r;
  assign B = B_r;

  always @(*) begin
    if (!reset) begin
      A_r <= 1'bz;
      B_r <= 1'bz;
      line_en <= 1'b0;
    end else begin 
      if (line_en) begin
        A_r <= #Delay_rd B;
	B_r <= 1'bz;
      end else begin
        B_r <= #Delay_g A;
	A_r <= 1'bz;
      end
    end
  end

  always @(A or B) begin
    if (!reset) begin
      line_en <= 1'b0;
    end else if (A !== A_r) begin
      line_en <= 1'b0;
    end else if (B_r !== B) begin
      line_en <= 1'b1;
    end else begin
      line_en <= line_en;
    end
  end
endmodule
