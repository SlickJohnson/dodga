//
//  Player.swift
//  Dodga
//
//  Created by Willie Johnson on 3/2/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit

enum Move {
  case up, down, left, right
}

class Player: SKSpriteNode {

  var move: Move = .up {
    
    didSet {
      if move == .up {
        // MARK: reletive position
        position.y += 65
      } else if move == .down {
        position.y -= 65
      } else if move == .right {
        position.x += 65
      } else {
        position.x -= 65
      }
    }

  }

  init() {
    super.init(texture: nil, color: .red, size: CGSize(width: 40, height: 40))
    self.name = "player"
    setupPlayerPhysics()
  }

  func setupPlayerPhysics() {
    self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
    self.physicsBody?.affectedByGravity = false
    self.physicsBody?.categoryBitMask = PhysicsCategory.Player
    self.physicsBody?.collisionBitMask = PhysicsCategory.None
    self.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Coin
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
