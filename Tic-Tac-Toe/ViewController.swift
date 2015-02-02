//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 1/5/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    @IBOutlet weak var gameBoardImageView: UIImageView!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet var gameBoardButtons: [UIButton]!
    
    @IBOutlet weak var gameBoard: UIView!
    
    var game = TicTacToeGame();
    let xImage = UIDevice.currentDevice().userInterfaceIdiom == .Phone ? UIImage(named: "iPhone_X.png") : UIImage(named: "iPad_X.png")
    let oImage = UIDevice.currentDevice().userInterfaceIdiom == .Phone ? UIImage(named: "iPhone_O.png") : UIImage(named: "iPad_O.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [ NSFontAttributeName: UIFont.boldSystemFontOfSize(34)]
        gameBoardImageView.image = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? UIImage(named: "iPhone_board.png") : UIImage(named: "ipad_board.png")
        println(game)
        updateView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedNewGame(sender: AnyObject) {
        println("new game")
        label.text = "X's Turn"
        titleLabel.title = "X's Turn Title"
        game = TicTacToeGame()
        println(game)
        updateView()
    }

    @IBAction func pressedButton(sender: AnyObject) {
        var button = sender as UIButton
        println("hit button with tag\(button.tag)")
        game.pressedSquare(button.tag-1);
        println(game)
        updateView()
    }
    
    func updateView() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            label.text = game.getGameStateString()
        }
        else {
            gameStateNavBar.topItem?.title = game.getGameStateString()
        }
        for button in gameBoardButtons {
            switch game.getMarkTypeAtIndex(button.tag-1) {
            case .None:
                button.setImage(nil, forState: .Normal)
            case .X:
            button.setImage(xImage, forState: .Normal)
            case .O:
            button.setImage(oImage, forState: .Normal)
            }
        }
    }

}

