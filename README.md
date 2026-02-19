# RISC-V Assembly Projects (RV64)

## Overview

This repository contains low-level RISC-V (RV64) assembly implementations focused on systems-level concepts including arithmetic processing, command-line input handling, and virtual memory address translation.

Each project demonstrates direct manipulation of registers, bitwise operations, and structured program control flow using RISC-V assembly.



## Projects Included

### RISC-V Command Line Calculator

An assembly-based calculator that:

- Accepts user input via the command line
- Parses and processes arithmetic expressions
- Performs integer-based operations
- Outputs computed results

Concepts demonstrated:
- Control flow in assembly
- Register management
- Arithmetic instruction usage
- Command-line argument handling



### RISC-V Virtual Address Translator (Sv39)

An assembly program that:

- Accepts a 64-bit virtual address as input
- Decomposes the address according to the Sv39 virtual memory format
- Extracts VPN[2], VPN[1], VPN[0], and page offset fields
- Displays results in structured output

Concepts demonstrated:
- Bit masking and shifting
- 64-bit integer manipulation
- Sv39 virtual memory structure
- Systems-level address analysis



## Technologies Used

- RISC-V RV64 Assembly
- RARS or equivalent RISC-V simulator
