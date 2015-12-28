//
//  GameViewController.swift
//  RWCCG
//
//  Created by Brian Broom on 7/1/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
  class func unarchiveFromFile(file : NSString) -> SKNode? {
    
    let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks")
    let sceneData: NSData?
    var scene = GameScene()
    
    do {
      
      sceneData = try NSData.init(contentsOfFile: path!, options: .DataReadingMappedIfSafe)
      let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData!)
      
      archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
      scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
      archiver.finishDecoding()
      
      
    } catch {
      
    }
    
    return scene
  }
}

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
      // Configure the view.
      let skView = self.view as! SKView
      skView.showsFPS = false
      skView.showsNodeCount = false
      
      /* Sprite Kit applies additional optimizations to improve rendering performance */
      skView.ignoresSiblingOrder = true
      
      /* Set the scale mode to scale to fit the window */
      scene.scaleMode = .AspectFill
      scene.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
      
      skView.presentScene(scene)
    }
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return UIInterfaceOrientationMask.AllButUpsideDown
    } else {
      return UIInterfaceOrientationMask.All
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
}
