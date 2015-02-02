

// TODO: Create the TicTacToeGame class

class TicTacToeGame : Printable{
    enum MarkType: String {
        case None = "-"
        case X = "X"
        case O = "O"
    }
    enum GameState : String {
        case XTurn = "X's Turn"
        case OTurn = "O's Turn"
        case XWon = "X Wins!"
        case OWon = "O Wins!"
        case Tie = "Cats Game"
    }
    
    var gameBoard : [MarkType]
    
    var gameState : GameState
    
    var description : String {
        return "\(gameState.rawValue)  Board: \(getGameString())"
    }
    
    init() {
        gameBoard = [MarkType](count: 9, repeatedValue: .None)
        gameState = GameState.XTurn
    }
    
    func getGameString(indexes : [Int] = [0,1,2,3,4,5,6,7,8]) -> String {
        var returnString = ""
        for index in indexes {
            returnString += gameBoard[index].rawValue
        }
        return returnString
    }
    
    func pressedSquare(index : Int) {
        // check to see if this square is open (.None)
        if gameBoard[index] != .None {
            return
        }
        
        // If the stae is XTurn put an X there
        // Set to OTurn
        if gameState == .XTurn {
            gameBoard[index] = .X
            gameState = .OTurn
            checkForGameOver()
            
            //If the state is OTurn put an 0 there
            // Set to XTurn
        } else if gameState == .OTurn {
            gameBoard[index] = .O
            gameState = .XTurn
            checkForGameOver()
        }
        
    }
    func checkForGameOver() {
        // check for Tie Game
        if !contains(gameBoard, .None) {
            gameState = .Tie
        }
        
        // Create an array of all the possible win paths
        var linesOf3 = [String]()
        linesOf3.append(getGameString(indexes: [0,1,2]))
        linesOf3.append(getGameString(indexes: [3,4,5]))
        linesOf3.append(getGameString(indexes: [6,7,8]))
        
        linesOf3.append(getGameString(indexes: [0,3,6]))
        linesOf3.append(getGameString(indexes: [1,4,7]))
        linesOf3.append(getGameString(indexes: [2,5,8]))
        
        linesOf3.append(getGameString(indexes: [0,4,8]))
        linesOf3.append(getGameString(indexes: [2,4,6]))
        
        for lineOf3 in linesOf3 {
            if lineOf3 == "XXX" {
                gameState = .XWon
            } else if lineOf3 == "OOO" {
                gameState = .OWon
            }
        }
    }
}


///* ----------------- Official Playground testing ----------------- */
//var game = TicTacToeGame()
//game.description
//game.description
//game.pressedSquare(0)
//game.description
//game.pressedSquare(1)
//game.description
//game.pressedSquare(3)
//game.description
//game.pressedSquare(2)
//game.description
//game.pressedSquare(6)
//game.description

