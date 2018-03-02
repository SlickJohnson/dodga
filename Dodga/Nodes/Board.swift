//
//  Board.swift
//  Dodga
//
//  Created by Willie Johnson on 3/2/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import SpriteKit

/// The stripes of a board held in arrays that describe the stripes orientation.
class Stripes {
  /// Stripes that are oriented horizontally.
  var horizontal = [Stripe]()
  /// Stripes that are oriented vertically.
  var vertical = [Stripe]()
  /// The total number of stripes.
  var count: Int {
    get {
      return all.count
    }
  }
  /// All the stripes.
  var all: [Stripe] {
    get {
      return horizontal + vertical
    }
  }
}

/// The game board that provides Stripe nodes for Obstacles nodes to travel.
class Board: SKNode {
  /// The horizontal and vertical stripes that makeup the board.
  var stripes: Stripes!
  /// The size of the board which will determine how long the stripes are.
  var size: CGSize!

  /// Creates a SKNode with Stripe nodes as its children.
  ///
  /// - Paremeter size: The size of the board which determiens the size of the stripes.
  init(size: CGSize) {
    super.init()
    self.size = size
    self.name = "board"
    make()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: Useful public methods
extension Board {
  /// Create the stripes for the board and places them in a grid layout.
  func make() {
    stripes = Stripes()
    // Make rows
    for row in -1 ... 1 {
      let stripe = Stripe(size: CGSize(width: size.width, height: 60), orientation: .horizontal)
      addChild(stripe)
      stripes.horizontal.append(stripe)
      stripe.position.x = size.width / 2
      stripe.position.y = size.height / 2 - CGFloat(65 * row)
    }

    // Make columns
    for column in -1 ... 1 {
      let stripe = Stripe(size: CGSize(width: 60, height: size.height), orientation: .vertical)
      addChild(stripe)
      stripes.vertical.append(stripe)
      stripe.position.x = size.width / 2  - CGFloat(65 * column)
      stripe.position.y = size.height / 2
    }
  }
}

