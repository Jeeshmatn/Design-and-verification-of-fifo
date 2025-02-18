# Design-and-verification-of-fifo
Design and verification of fifo

# FIFO Design

## Overview
This project implements a **First-In-First-Out (FIFO) buffer** in Verilog. The FIFO stores 8-bit data values and supports simultaneous read and write operations.

## Specifications
- **Data Width**: 8 bits
- **FIFO Depth**: 16 entries (4-bit address pointer)
- **Read and Write Pointers**: 4-bit `wptr` and `rptr`
- **Counter for tracking elements**: 5-bit `cnt`
- **Control Signals**:
  - `wr`: Write enable
  - `rd`: Read enable
  - `rst`: Reset
  - `clk`: Clock
- **Status Signals**:
  - `empty`: FIFO is empty
  - `full`: FIFO is full

## Functional Description
- **Write Operation (`wr = 1`)**:
  - Data from `din` is written to the FIFO memory at `wptr`.
  - `wptr` is incremented after each write.
  - `cnt` is updated to track the number of stored elements.
  - If FIFO is full, further writes are ignored.

- **Read Operation (`rd = 1`)**:
  - Data from `rptr` is read into `dout`.
  - `rptr` is incremented after each read.
  - `cnt` is updated to track stored elements.
  - If FIFO is empty, further reads are ignored.

- **FIFO Full Condition**:
  ```verilog
  assign full = (cnt == 16);
  ```
- **FIFO Empty Condition**:
  ```verilog
  assign empty = (cnt == 0);
  ```

## Testbench (FIFO_tb.v)
A testbench is provided to verify FIFO functionality:
1. **Reset the FIFO**
2. **Write data into FIFO**
3. **Read data back**
4. **Check `full` and `empty` conditions**

   ```

## Expected Output
```
Writing data into FIFO...
Written: 42
Written: 156
...
Reading data from FIFO...
Read: 42
Read: 156
...
FIFO is empty again
Test completed.
```



