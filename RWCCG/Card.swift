//
//  Card.swift
//  RWCCG
//
//  Created by Brian Broom on 7/22/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import Foundation
import SpriteKit

class Card : SKSpriteNode {
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  init(imageNamed: String) {
    let cardTexture = SKTexture(imageNamed: imageNamed)
    super.init(texture: cardTexture, color: UIColor.clearColor(), size: cardTexture.size())
    
    userInteractionEnabled = true
  }
}