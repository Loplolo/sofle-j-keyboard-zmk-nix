# sofle-j-keyboard-zmk-nix
For Eyelash Sofle (RGB, Bluetooth with nice!nano board).

## How to customize the keyboard layout
1. Edit the `config/eyelash_sofle.keymap` file with your layout,
2. Run `nix build .` inside the folder,
3. Connect one part of the keyboard,
4. Double press the reset button or shortcut the reset pin in your board.
5. Copy the `build/zmk-left.uf2` and `build/zmk-right.uf2` inside the board (left is the master).
6. Disconnect the board and pair with bluetooth.
7. Inside `keymap-drawer/eyelash_sofle.svg` you can check the layout.
