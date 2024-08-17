currentPlayer = 'X'
board = Array(9).fill(null)
gameOver = false

cells = document.querySelectorAll('.cell')
status = document.getElementById('status')

export checkWin = (board) ->
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

export aiMove = (board) ->
  emptyIndices = (index for index, cell of board when cell is null)

  console.log("Empty Indices:", emptyIndices)

  for player in ['O', 'X']
    for index in emptyIndices
      newBoard = board.slice()
      newBoard[index] = player
      if checkWin(newBoard) is player
        return index

  if emptyIndices.length > 0
    randomIndex = emptyIndices[Math.floor(Math.random() * emptyIndices.length)]
    console.log("AI picked index:", randomIndex)
    return randomIndex
  else
    console.log("No empty indices available for AI move.")
    return null

export updateBoard = (board, index, player) ->
  newBoard = board.slice()
  newBoard[index] = player
  return newBoard

makeMove = (index) ->
  return if gameOver or index is null or board[index] isnt null

  board = updateBoard(board, index, currentPlayer)
  cells[index].textContent = currentPlayer

  winner = checkWin(board)
  if winner
    gameOver = true
    status.textContent = if winner is 'Draw' then 'It\'s a draw!' else "#{winner} wins!"
  else
    currentPlayer = if currentPlayer is 'X' then 'O' else 'X'
    if currentPlayer is 'O' and not gameOver
      aiIndex = aiMove(board)
      makeMove(aiIndex)

handleClick = (event) ->
  index = parseInt(event.target.dataset.cell)
  makeMove(index)

document.addEventListener 'DOMContentLoaded', ->
  for cell in cells
    cell.addEventListener 'click', handleClick
