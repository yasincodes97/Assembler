# Simple UART Communication Program

This program demonstrates basic UART communication using assembly language. It sends a predefined string through UART0.

## Macro Definitions

- `UART0`: Base address for UART0.
- `UART1`: Base address for UART1.

## Data Section

- `CHAR`: Stores the ASCII value of the character to be sent.
- `TEXT`: Stores the string "Hallo World" along with a null terminator.

## Text Section

### `main` Function

- The `main` function initiates the program execution.
- It calls the `sendString0` function to send the predefined string.

### `sendChar0` Function

- Sends a single character through UART0.
- The character to be sent is stored in register `r4`.
- The function waits until the UART is ready for the next character transmission.

### `sendString0` Function

- Sends a string through UART0 by calling `sendChar0` for each character.
- The string to be sent is stored in the `.data` section under the label `TEXT`.

### `endLoop` Label

- Marks the end of the program execution.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/uart-communication.git
