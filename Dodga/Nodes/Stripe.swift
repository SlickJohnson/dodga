//
//  Stripe.swift
//  Dodga
//
//  Created by Willie Johnson on 3/2/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit

/// The orientation of the stripe on the game board.
///
/// - horizontal: The Stripe is oriented horizontally on the game board.
/// - vertical: The Stripe is oriented vertically on the game board.
enum Orientation {
  case horizontal, vertical
}

/// A single stripe used to by obsticles to move along the gameboard.
class Stripe: SKSpriteNode {
  /// The stripe's orientation on the game board.
  var orientation: Orientation!
  /// A CGPoint placed at the center of the stripe's top edge.
  var top: CGPoint! {
    get {
      switch orientation {
      case .horizontal:
        let xPos = position.x + (size.width / 2)
        return CGPoint(x: xPos, y: position.y)
      case .vertical:
        let yPos = position.y + (size.height / 2)
        return CGPoint(x: position.x, y: yPos)
      default:
        return .zero
      }
    }
  }
  /// A CGPoint placed at the center of the stripe's bottom edge.
  var bottom: CGPoint! {
    get {
      switch orientation {
      case .horizontal:
        let xPos = position.x + (size.width / 2)
        return CGPoint(x: -xPos, y: position.y)
      case .vertical:
        let yPos = position.y + (size.height / 2)
        return CGPoint(x: position.x, y: -yPos)
      default:
        return .zero
      }
    }
  }

  /// Intialize a SKSpriteNode with the specified size and orientation.
  ///
  /// Parameters:
  ///   - size: The dimensions of the stripe.
  ///   - orientation: The orientaiton of the stripe on a Board.
  init(size: CGSize, orientation: Orientation) {
    super.init(texture: nil, color: UIColor(white: 1, alpha: 0.3), size: size)
    self.name = "stripe"
    self.orientation = orientation
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
