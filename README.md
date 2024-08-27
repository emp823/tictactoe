## Tic Tac Toe

A simple implementation of the classic Tic Tac Toe game using CoffeeScript.

### Local Development

1. Clone the repository:

   ```
   git clone https://github.com/emp823/tictactoe.git
   cd tictactoe
   ```

2. Install dependencies:

   ```
   npm install
   ```

3. Compile the CoffeeScript file:

   ```
   npm run build
   ```

4. Open the `index.html` file in your browser.

   ```
   npm run start
   ```

### Game Rules

- The game is played on a 3x3 grid.
- You (X) play against the AI (O).
- The first player to get three of their marks in a row (horizontally, vertically, or diagonally) wins.
- If all cells are filled and no player has won, the game is a draw.

### How to Play

1. After running `npm start`, the game will open in your browser.
2. Click on an empty cell to place your X.
3. The AI will automatically make its move (O) after your turn.
4. Continue until the game ends.
5. Refresh the page to start a new game.

### AI Behavior

The AI uses a simple strategy:

1. It checks for an immediate win for itself.
2. It blocks your potential winning move.
3. If neither of the above is possible, it makes a random move.

Enjoy playing Tic Tac Toe against the AI!
