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
    var counter = SKLabelNode()
    var count: Int?
    
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        bottomPaddle = self.childNode(withName: "Paddle") as!
        SKSpriteNode
//        counter = self.childNode(withName: "counter") as! SKLabelNode
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        ball.speed = 20
        
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
        
        if ball.position.y <= -250
        {
            if counter.text == "3"
            {
                counter.text = "2"
                ball.position.x = 0
                ball.position.y = 0
//                self.count = 1
//                Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(getter: GameScene.ball), userInfo: nil, repeats: true)
//                Timer.init(timeInterval: 2, repeats: false, block: nil)
               
            }
            else if counter.text == "2"
            {
                counter.text = "1"
                ball.position.x = 0
                ball.position.y = 0

            }
            else if counter.text == "1"
            {
                counter.text = "0"
                ball.removeFromParent()
//                restart()
                
            }
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "Block" || bodyAName == "Block" && bodyBName == "Ball"
        {
            if bodyAName == "Block"
            {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBName == "Block"
            {
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
    
//    func restart()
//    {
//        let alert = UIAlertController(title: "Play Again?", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//        let restartAction = UIAlertAction(title: "Restart", style: UIAlertActionStyle.default)
//        alert.addAction(restartAction)
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
//        alert.addAction(cancelAction)
//        present(alert)
//    }


    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
}
