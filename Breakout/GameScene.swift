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
    var counter = 3
    
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
            if bodyAName == "Brick"
            {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBName == "Brick" {
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if ball.position.y <= -250
        {
            if counter == 3
            {
                counter -= 1
                ball.position.x = 0
                ball.position.y = 0
            }
            else if counter == 2
            {
                counter -= 1
                ball.position.x = 0
                ball.position.y = 0

            }
            else if counter == 1
            {
                ball.removeFromParent()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
}
