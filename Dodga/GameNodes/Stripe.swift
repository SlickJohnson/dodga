//
//  Stripe.swift
//  Dodga
//
//  Created by Willie Johnson on 3/2/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit

/// The orientation of the stripe on the game board.
/// - horizontal: The Stripe is oriented horizontally on the game board.
/// - vertical: The Stripe is oriented vertically on the game board.
enum Orientation {
  case horizontal, vertical
}

/// A single stripe used to by obsticles to move along the gameboard.
class Stripe: SKSpriteNode {
  /// The stripe's orientation on the game board.
  var orientation: Orientation!
  /// Intialize a SKSpriteNode with the specified size and
  init(size: CGSize, orientation: Orientation) {
    super.init(texture: nil, color: UIColor(white: 1, alpha: 0.5), size: size)
    self.name = "stripe"
    self.orientation = orientation
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
