//
//  GameScene.swift
//  Breakout
//
//  Created by student3 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var bottomPaddle = SKSpriteNode()
    var ball = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        bottomPaddle = self.childNode(withName: "bottomPaddle") as!
        SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        self.physicsWorld.contactDelegate = self
        
        
//        let bottomLeft = CGPoint(x: frame.origin.x, y: frame.origin.y)
//        let bottomRight = CGPoint(x: -frame.origin.x, y: frame.origin.y)
//        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
//        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
//        
//        let bottom = SKNode()
//        bottom.name = "bottom"
//        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: bottomRight)
//        addChild(bottom)
//        
//        
//        let top = SKNode()
//        top.name = "top"
//        bottom.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
//        addChild(top)
//        
//        
//        let left = SKNode()
//        left.name = "left"
//        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: topLeft)
//        addChild(left)
//        
//        let right = SKNode()
//        right.name = "right"
//        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomRight, to: topRight)
//        addChild(right)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            bottomPaddle.position.x = touchLocation.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            bottomPaddle.position.x = touchLocation.x
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "Brick" || bodyAName == "Brick" && bodyBName == "Ball" {
            if bodyAName == "Brick" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBName == "Brick" {
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
