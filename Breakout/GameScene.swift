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
        
        let bottomLeft = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let bottomRight = CGPoint(x: -frame.origin.x, y: frame.origin.y)
        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        
        let bottom = SKNode()
        bottom.name = "bottom"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: bottomRight)
        addChild(bottom)
        
        
        let top = SKNode()
        top.name = "top"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        addChild(top)
        
        
        let left = SKNode()
        left.name = "left"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: topLeft)
        addChild(left)
        
        let right = SKNode()
        right.name = "right"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomRight, to: topRight)
        addChild(right)

        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        self.physicsBody = border
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let touch = touches.first!
        let location = touch.location(in: self)
        Paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        Paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        
        
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
