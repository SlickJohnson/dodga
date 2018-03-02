//
//  GameScene.swift
//  Dodga
//
//  Created by Willie Johnson on 2/22/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  /// The game board.
  var gameBoard: Board!
  /// The player.
  var player: Player!

  override func didMove(to view: SKView) {
    makeBoard()
    makePlayer()
  }

  /// Make a grid with 3 horizontal stripes and 3 vertical stripes.
  func makeBoard() {
    gameBoard = Board(size: size)
    addChild(gameBoard)
  }

  /// Create a player and place it at the center of the screen.
  func makePlayer() {
    player = Player()
    addChild(player)

    player.position.x = size.width / 2
    player.position.y = size.height / 2
  }
}
