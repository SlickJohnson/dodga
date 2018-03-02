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
    startSpawningObstacles(on: gameBoard)
  }
}

// MARK: Private methods.
private extension GameScene {
  /// Make a grid with 3 horizontal stripes and 3 vertical stripes.
  func makeBoard() {
    gameBoard = Board(size: size)
    addChild(gameBoard)
  }
  
  /// Create a player and place it at the center of the screen.
  func makePlayer() {
    player = Player()
    addChild(player)
    // Place player at center of screen.
    player.position.x = size.width / 2
    player.position.y = size.height / 2
  }

  /// Start the game logic that handles enemy spawning and moving.
  func startSpawningObstacles(on board: Board) {
    // Create SKAction to handle spawning obstacles.
    var spawnObstaclesAction = SKAction.run {
      // Grab a random stripe.
      let stripes = board.stripes.all
      let randomIndex = Int(arc4random_uniform(UInt32(stripes.count)))
      let randomStripe = stripes[randomIndex]
      var obstacle: Obstacle!
      // Spawn an obstacle and move them to their destination.
      switch Direction.random() {
      case .up:
        obstacle = Obstacle(spawn: randomStripe.bottom)
        self.addChild(obstacle)
        let moveAction = SKAction.move(to: randomStripe.top, duration: 3.0)
        let removeAction = SKAction.run(obstacle.removeFromParent)
        obstacle.run(SKAction.sequence([moveAction, removeAction]))
      case .down:
        obstacle = Obstacle(spawn: randomStripe.top)
        self.addChild(obstacle)
        let moveAction = SKAction.move(to: randomStripe.bottom, duration: 3.0)
        let removeAction = SKAction.run(obstacle.removeFromParent)
        obstacle.run(SKAction.sequence([moveAction, removeAction]))
      }
    }
    run(SKAction.repeatForever(SKAction.sequence([spawnObstaclesAction, SKAction.wait(forDuration: 1)])))
    

  }
}
