//
//  GameState.swift
//  RPS
//
//  Created by Nathan Price on 4/8/21.
//  Copyright © 2021 Nathan Price. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case .start:
            return "Would you like to play?"
        case .win:
            return "Victory!"
        case .lose:
            return "Defeat..."
        case .draw:
            return "🤷‍♂️"
        }
    }
    
    
}
