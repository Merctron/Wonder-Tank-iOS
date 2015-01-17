//
//  FishTank.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SpriteKit

class FishTank: SKScene {
    
    var fishes: [fish] = []
    var foodInTank: [food] = []
    var initialTime = CFTimeInterval(0)
    var simulationTime = CFTimeInterval(0)    
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let spriteObject = fish(color: UIColor.brownColor(), size: CGSize(width: 100, height: 50))
                
            spriteObject.position = location
            self.fishes.append(spriteObject)
                
            self.addChild(spriteObject)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        driveBehaviour()
        self.simulationTime = currentTime - self.initialTime
        
    }
    
    func driveBehaviour() {
        for fishObj: fish in self.fishes {
            
            if fishObj.moved > fishObj.movementBound {
                fishObj.moved = CGFloat(0.0)
                
                if randVal(min: 0.0, max: 10.0) > 5.0 {
                    fishObj.movementRateX = -fishObj.movementRateX
                }
                else {
                    
                }
                
                if randVal(min: 0.0, max: 10.0) > 5.0 {
                    
                }
                else {
                    fishObj.movementRateY = -fishObj.movementRateY
                }
            }
            
            if fishObj.position.x >= self.size.width {
                fishObj.movementRateX = CGFloat(-1.0)
            }
            else if fishObj.position.x <= 0 {
                fishObj.movementRateX = CGFloat(1.0)
            }
            
            if fishObj.position.y >= self.size.height {
                fishObj.movementRateY = CGFloat(-1.0)
            }
            else if fishObj.position.y <= 0 {
                fishObj.movementRateY = CGFloat(1.0)
            }
            
            fishObj.position.x += fishObj.movementRateX
            fishObj.position.y += fishObj.movementRateY
            fishObj.moved++
        }
    }
    
    func rand() -> CGFloat {
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func randVal(#min: CGFloat, max: CGFloat) -> CGFloat {
        return rand() * (max - min) + min
    }
}

class fish: SKSpriteNode {
    var movementRateX = CGFloat(1.0)
    var movementRateY = CGFloat(1.0)
    let movementBound = CGFloat(100.0)
    var moved = CGFloat(0.0)
    //var namestr = ""
    //var agression = 0
    //var appetite = 10
    //var currentlyConsumed = 0
}

class food: SKSpriteNode {
    
}

class environment {
    var upperBound = CGFloat(1.0)
}

