//===-- J2.td - Describe the J2 Target Machine -------------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the J2 target.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Register File, Calling Conv, Instruction Descriptions
//===----------------------------------------------------------------------===//

include "J2RegisterInfo.td"

include "J2CallingConv.td"

//===----------------------------------------------------------------------===//
// Instructions File
//===----------------------------------------------------------------------===//

include "J2InstrInfo.td"
def J2InstrInfo : InstrInfo {
  let decodePositionallyEncodedOperands = 1;
}

//===----------------------------------------------------------------------===//
// J2 processors supported.
//===----------------------------------------------------------------------===//

include "J2Schedule.td"

// FIXME: Add scheduling.
def : ProcessorModel<"j2", NoSchedModel, []>;

//===----------------------------------------------------------------------===//
// The target.
//===----------------------------------------------------------------------===//

def J2 : Target {
  let InstructionSet = J2InstrInfo;
}
