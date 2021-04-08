//
//  ViewController.swift
//  RPS
//
//  Created by Nathan Price on 4/8/21.
//  Copyright © 2021 Nathan Price. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet weak var opponentSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
        
    }

    // MARK: - IB Actions
    @IBAction func rockChosen(_ sender: Any) {
        player(userSign: .rock)
    }
    @IBAction func paperChosen(_ sender: Any) {
        player(userSign: .paper)
    }
    @IBAction func scissorsChosen(_ sender: Any) {
        player(userSign: .scissors)
    }
    @IBAction func playAgainButton(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    // MARK: - Instance Methods
    
    func updateUI(forState state: GameState){
        gameStatus.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .lightGray
            
            opponentSign.text = "📺"
            playAgain.isHidden = true
            
            rock.isHidden = false
            paper.isHidden = false
            scissors.isHidden = false
            
            rock.isEnabled = true
            paper.isEnabled = true
            scissors.isEnabled = true
            
        case .win:
            view.backgroundColor = .green
            
        case .lose:
            view.backgroundColor = .red

        case .draw:
            view.backgroundColor = .blue

        }
    }
    // game choice management
    func player (userSign: Sign){
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        opponentSign.text = computerSign.emoji
        
        rock.isHidden = true
        paper.isHidden = true
        scissors.isHidden = true
        
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isEnabled = false
        
        switch userSign {
        case .rock:
            rock.isHidden = false
        case .paper:
            paper.isHidden = false
        case .scissors:
            scissors.isHidden = false
        }
        
        playAgain.isHidden = false
        
    }
}

