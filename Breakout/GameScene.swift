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
    var Ball = SKSpriteNode()
    var counter = SKLabelNode()
    var brickCounter: Int = 0
    var youWinLabel = SKLabelNode()
    
    
    
    override func didMove(to view: SKView) {
        
        Ball = self.childNode(withName: "Ball") as! SKSpriteNode
        bottomPaddle = self.childNode(withName: "Paddle") as!
        SKSpriteNode
        youWinLabel = self.childNode(withName: "youWin!") as! SKLabelNode
        counter = self.childNode(withName: "counter") as! SKLabelNode
        Ball.physicsBody?.applyImpulse(CGVector(dx: 25, dy: 25))
        Ball.speed = 20
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        border.restitution = 1
        
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
    
    
    override func update(_ currentTime: TimeInterval) {
        //        if brickCounter == 10
        //        {
        //            youWinLabel.text = "You Win!"
        //            Ball.removeFromParent()
        //        }
        
        if Ball.position.y <= -250
        {
            if counter.text == "3"
            {
                counter.text = "2"
                Ball.position.x = 0
                Ball.position.y = 0
                
                
                
                
            }
            else if counter.text == "2"
            {
                counter.text = "1"
                Ball.position.x = 0
                Ball.position.y = 0
                
            }
            else if counter.text == "1"
            {
                counter.text = "0"
                Ball.removeFromParent()
                //                youWinLabel.text = "You Lost!"
                
            }
        }
        if Ball.position.x == 0 || Ball.position.y == 0
        {
            let wait = DispatchTime.now() + 0.09
            DispatchQueue.main.asyncAfter(deadline: wait) {
                
                self.youWinLabel.text = "Get Ready"
                
            }
            
            let when = DispatchTime.now() + 0.1
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                
                sleep(2)
            }
        }
        else if counter.text == "0"
        {
            youWinLabel.text = "You Lost!"
        }
            
        else if brickCounter == 10
        {
            youWinLabel.text = "You Win!"
            Ball.removeFromParent()
        }
            
            
        else
        {
            let stahp = DispatchTime.now() + 0.1
            DispatchQueue.main.asyncAfter(deadline: stahp) {
                
                
                self.youWinLabel.text = ""
            }
            
        }
        
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "Brick" || bodyAName == "Brick" && bodyBName == "Ball"
        {
            if bodyAName == "Brick"
            {
                contact.bodyA.node?.removeFromParent()
                brickCounter += 1
            }
                
            else if bodyBName == "Brick"
            {
                contact.bodyB.node?.removeFromParent()
                brickCounter += 1
            }
            
        }
        
        
    }
}
