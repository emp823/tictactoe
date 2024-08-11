document.addEventListener 'DOMContentLoaded', ->

  currentPlayer = 'X'
  board = Array(9).fill(null)
  gameOver = false

  cells = document.querySelectorAll('.cell')
  status = document.getElementById('status')

  checkWin = ->
    winPatterns = [
      [0, 1, 2]
      [3, 4, 5]
      [6, 7, 8]
      [0, 3, 6]
      [1, 4, 7]
      [2, 5, 8]
      [0, 4, 8]
      [2, 4, 6]
    ]

    for pattern in winPatterns
      [a, b, c] = pattern
      if board[a] and board[a] is board[b] and board[a] is board[c]
        return board[a]

    if board.every((cell) -> cell isnt null)
      return 'Draw'

    return null

  handleClick = (event) ->
    index = event.target.dataset.cell

    return if gameOver or board[index]

    board[index] = currentPlayer
    event.target.textContent = currentPlayer

    winner = checkWin()
    if winner
      gameOver = true
      status.textContent = if winner is 'Draw' then 'It\'s a draw!' else "#{winner} wins!"
    else
      currentPlayer = if currentPlayer is 'X' then 'O' else 'X'

  cell.addEventListener 'click', handleClick for cell in cells
