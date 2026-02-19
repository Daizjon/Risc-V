# RISC-V Virtual Address Translator (Sv39)

## Overview

This project implements a RISC-V assembly program that analyzes a 64-bit virtual address provided via the command line. The program dissects the address according to the Sv39 virtual memory format and outputs its component fields.

## Project Description

The program:

- Accepts a 64-bit virtual address as input
- Extracts the Virtual Page Number (VPN) fields:
  - VPN[2]
  - VPN[1]
  - VPN[0]
- Extracts the 12-bit page offset
- Prints each VPN index and the final page offset in hexadecimal format

The implementation follows the Sv39 virtual memory scheme used in 64-bit RISC-V systems.

## Files Included

- `virtual_address_translator.S`  
  RISC-V assembly source file implementing the address parsing and bit extraction logic.

## Concepts Demonstrated

- RISC-V RV64 Assembly Programming
- Bit masking and shifting
- 64-bit integer manipulation
- Virtual memory addressing (Sv39)
- Command-line argument handling

## Tools Used

- RISC-V Assembly (RV64)
- RARS or equivalent RISC-V simulator

