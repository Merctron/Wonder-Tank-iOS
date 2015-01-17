//
//  FishTank.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SpriteKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Bound     : UInt32 = 0b100
    static let Fish      : UInt32 = 0b1       // 1
    static let Food      : UInt32 = 0b10      // 2
}

class FishTank: SKScene, SKPhysicsContactDelegate {
    
    var fishes: [fish] = []
    var foodCount = 0
    
    var water: SKSpriteNode!
    var lights: SKLightNode!
    
    var initialTime = CFTimeInterval(0)
    var simulationTime = CFTimeInterval(0)
    
    var addFood = false
    var addFish = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        self.physicsWorld.gravity = CGVectorMake(0.0, -0.2)
        self.physicsWorld.contactDelegate = self
        
        let bottomBoundSprite = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: self.size.width*2, height: 10))
        bottomBoundSprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.size.width*2, height: 10))
        bottomBoundSprite.physicsBody?.dynamic = false
        
        let leftBoundSprite = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: 10, height: self.size.height*2))
        leftBoundSprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 10, height: self.size.height*2))
        leftBoundSprite.physicsBody?.dynamic = false
        leftBoundSprite.position = CGPoint(x: 0, y: 0)
        
        let rightBoundSprite = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: 10, height: self.size.height*2))
        rightBoundSprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 10, height: self.size.height*2))
        rightBoundSprite.physicsBody?.dynamic = false
        rightBoundSprite.position = CGPoint(x: self.size.width, y: self.size.height)
        
        water = SKSpriteNode(color: UIColor.cyanColor(), size: CGSize(width: self.size.width, height: self.size.height - 25))
        water.position = CGPoint(x: self.size.width/2.0, y: water.size.height/2.0)
        water.alpha = 0.5
        
        self.addChild(bottomBoundSprite)
        self.addChild(leftBoundSprite)
        self.addChild(rightBoundSprite)
        self.addChild(water)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            
            if addFood == true {
                let location = touch.locationInNode(self)
                let spriteObject = food(color: UIColor.brownColor(), size: CGSize(width: 10, height: 10))
                
                spriteObject.position = location
                spriteObject.physicsBody = SKPhysicsBody(circleOfRadius: spriteObject.size.height / 2.75)
                spriteObject.physicsBody?.dynamic = true
                spriteObject.physicsBody?.categoryBitMask = PhysicsCategory.Food
                spriteObject.physicsBody?.contactTestBitMask = PhysicsCategory.Fish
                spriteObject.physicsBody?.collisionBitMask = PhysicsCategory.Bound
                self.foodCount++
                swimToFood(fdlocation: location)
                self.addChild(spriteObject)
            }
            else if addFish == true {
                let location = touch.locationInNode(self)
                let spriteObject = fish(color: UIColorFromRGB(0x209624), size: CGSize(width: 100, height: 50))
                spriteObject.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 100, height: 50))
                spriteObject.physicsBody?.dynamic = true
                spriteObject.physicsBody?.categoryBitMask = PhysicsCategory.Fish
                spriteObject.physicsBody?.contactTestBitMask = PhysicsCategory.Food
                spriteObject.physicsBody?.collisionBitMask = PhysicsCategory.Bound
                spriteObject.position = location
                self.fishes.append(spriteObject)
                
                self.addChild(spriteObject)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        driveBehaviour()
        self.simulationTime = currentTime - self.initialTime
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody

        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if secondBody.categoryBitMask == PhysicsCategory.Food {
            fishDidCollideWithFood(secondBody.node as SKSpriteNode)
        }
        
//        if ((firstBody.categoryBitMask & PhysicsCategory.Fish != 0) &&
//            (secondBody.categoryBitMask & PhysicsCategory.Food != 0)) {
//                fishDidCollideWithFood(secondBody.node as SKSpriteNode)
//        }
    }
    
    func fishDidCollideWithFood(foodsp:SKSpriteNode) {
        foodsp.removeFromParent()
        self.foodCount--
    }
    
    func driveBehaviour() {
        for fishObj: fish in self.fishes {
            
            if foodCount == 0 {
                if fishObj.moved > fishObj.movementBound {
                    fishObj.moved = CGFloat(0.0)
                    
                    if randVal(min: 0.0, max: 10.0) > 5.0 {
                        fishObj.movementRateX = -fishObj.movementRateX
                    }
                    else {
                        
                    }
                    
                    if randVal(min: 0.0, max: 10.0) > 5.0 {
                        fishObj.movementRateY = CGFloat(1.8)
                        
                    }
                    else {
                        fishObj.movementRateY = CGFloat(-0.8)
                    }
                }
            }
            
            if fishObj.position.x >= self.size.width {
                fishObj.movementRateX = CGFloat(-1.0)
            }
            else if fishObj.position.x <= 0 {
                fishObj.movementRateX = CGFloat(1.0)
            }
            
            if fishObj.position.y >= self.size.height {
                fishObj.movementRateY = CGFloat(-0.9)
            }
            else if fishObj.position.y <= 0 {
                fishObj.movementRateY = CGFloat(1.8)
            }
            
            fishObj.position.x += fishObj.movementRateX
            fishObj.position.y += fishObj.movementRateY
            fishObj.moved++
        }
    }
    
    func swimToFood(#fdlocation: CGPoint) {
        for fishObj: fish in self.fishes {
            if fishObj.position.x > fdlocation.x {
                fishObj.movementRateX = CGFloat(-2.0)
            }
            else {
                fishObj.movementRateX = CGFloat(2.0)
            }
            
            if fishObj.position.y > fdlocation.y {
                fishObj.movementRateY = CGFloat(-2.0)
            }
            else {
                fishObj.movementRateY = CGFloat(2.0)
            }
        }
    }
    
    func rand() -> CGFloat {
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func randVal(#min: CGFloat, max: CGFloat) -> CGFloat {
        return rand() * (max - min) + min
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func setFoodToTrue() {
        self.addFish = false
        self.addFood = true
    }
    
    func setFishToTrue() {
        self.addFood = false
        self.addFish = true
    }
}

class fish: SKSpriteNode {
    var movementRateX = CGFloat(1.0)
    var movementRateY = CGFloat(1.8)
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

