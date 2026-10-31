# 8-Bit Accumulator-Based CPU Data Path

## Overview
This repository contains the Verilog implementation of an 8-bit custom CPU data path. The design features a simple accumulator-based architecture where the ALU performs operations between the current state of a register (Accumulator) and an immediate 8-bit value fetched from the Instruction Memory.

## Repository Structure
```text
├── src/                  # Verilog source files (RTL)
│   ├── alu.v
│   ├── instruction_memory.v
│   ├── pc.v
│   ├── register.v
│   └── top.v
├── tb/                   # Testbenches for simulation
│   ├── alu_tb.v
│   ├── pc_tb.v
│   ├── register_tb.v
│   └── top_tb.v
├── .gitignore
└── README.md 
```


## Architecture
The system consists of the following core modules:
*   **Program Counter (`pc.v`):** An 8-bit counter pointing to the current instruction in memory, featuring an asynchronous active-high reset.
*   **Instruction Memory (`instruction_memory.v`):** Stores 11-bit instructions. It outputs the instruction based on the Program Counter (PC) address.
*   **ALU (`alu.v`):** An 8-bit Arithmetic Logic Unit supporting basic arithmetic, logical, and shift operations.
*   **Register (`register.v`):** An 8-bit accumulator with an asynchronous active-high reset.
*   **Top Module (`top.v`):** Integrates the PC, Instruction Memory, ALU, and Register into a cohesive data path.

### Instruction Format
The system uses an 11-bit instruction format fetched from memory:
*   **Bits [10:8]:** 3-bit Opcode (ALU operation)
*   **Bits [7:0]:** 8-bit Immediate Data (Input A for the ALU)

*Note: The ALU takes the 8-bit Immediate Data as Input A, and the current Register output as Input B.*

### Supported Operations (ALU Opcodes)
| Opcode | Operation | Description |
| :---: | :---: | :--- |
| `000` | ADD | A + B |
| `001` | SUB | A - B |
| `010` | AND | A & B |
| `011` | OR  | A \| B |
| `100` | XOR | A ^ B |
| `101` | NOT | ~A |
| `110` | SHL | Logical Shift Left (A << 1) |
| `111` | SHR | Logical Shift Right (A >> 1) |

## Simulation
The modules are verified using **Icarus Verilog** and **GTKWave**. 
Testbenches (`*_tb.v`) are provided for individual module verification (`alu`, `register`) as well as the integrated `top` system.

**To run the top-level simulation:**
```bash
# 1. Compile the Verilog files
iverilog -o sim_top tb/top_tb.v src/top.v src/alu.v src/register.v src/instruction_memory.v src/pc.v

# 2. Execute the compiled file
vvp sim_top

# 3. View the waveforms
gtkwave waveform_top.vcd