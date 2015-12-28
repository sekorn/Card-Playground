//
//  GameScene.swift
//  RWCCG
//
//  Created by Brian Broom on 7/1/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {

      let wolf = Card(imageNamed: "card_creature_wolf.png")
      wolf.position = CGPointMake(100, 200)
      addChild(wolf)
      
      let bear = Card(imageNamed: "card_creature_bear.png")
      bear.position = CGPointMake(300, 200)
      addChild(bear)
      
      wolf.addChild(newDamageLabel())
      bear.addChild(newDamageLabel())
    }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches {
      let location = touch.locationInNode(self)
      let touchNode = nodeAtPoint(location)
      touchNode.zPosition = 15
      
      let liftUp = SKAction.scaleTo(1.2, duration: 0.2)
      touchNode.runAction(liftUp)
      touchNode.runAction(rotate(), withKey: "wiggle")
    }
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches {
      let location = touch.locationInNode(self)
      let touchNode = nodeAtPoint(location)
      touchNode.zPosition = 0
      
      let dropdown = SKAction.scaleTo(1.0, duration: 0.2)
      touchNode.runAction(dropdown)
      
      touchNode.removeActionForKey("wiggle")
      touchNode.runAction(SKAction.rotateToAngle(0, duration: 0.2), withKey: "rotate")
    }
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches {
      let location = touch.locationInNode(self)
      let touchNode = nodeAtPoint(location)
      touchNode.position = location
    }
  }
  
  func wiggle() -> SKAction {
    
    let wiggleIn = SKAction.scaleXTo(1.0, duration: 0.2)
    let wiggleOut = SKAction.scaleXTo(1.2, duration: 0.2)
    let wiggle = SKAction.sequence([wiggleIn, wiggleOut])
    let wiggleRepeat = SKAction.repeatActionForever(wiggle)
    
    return wiggleRepeat
  }
  
  func rotate() -> SKAction {
    let rotateRight = SKAction.rotateByAngle(0.25, duration: 0.2)
    let rotateLeft = SKAction.rotateByAngle(-0.25, duration: 0.2)
    let rotate = SKAction.sequence([rotateRight, rotateLeft, rotateLeft, rotateRight])
    let rotateRepeat = SKAction.repeatActionForever(rotate)
    
    return rotateRepeat
    
  }
  
  func newDamageLabel() -> SKLabelNode {
    
    let damageLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
    damageLabel.name = "damageLabel"
    damageLabel.fontSize = 12
    damageLabel.fontColor = UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
    damageLabel.text = "0"
    damageLabel.position = CGPointMake(25, 40)
    
    return damageLabel
  }
}
