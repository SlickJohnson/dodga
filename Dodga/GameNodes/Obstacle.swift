//
//  Obstacle.swift
//  Dodga
//
//  Created by Willie Johnson on 3/2/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit

class Obstacle: SKSpriteNode {
  init() {
    super.init(texture: nil, color: UIColor(white: 1, alpha: 0.2), size: CGSize(width: 40, height: 40))
    self.name = "obstacle"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
