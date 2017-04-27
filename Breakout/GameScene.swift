//
//  GameScene.swift
//  Breakout
//
//  Created by student3 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Paddle = SKSpriteNode()
    var ball = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        Paddle = self.childNode(withName: "bottomPaddle") as!
        SKSpriteNode
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
