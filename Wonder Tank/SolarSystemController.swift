//
//  SolarSystemController.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SceneKit

class SolarSystemController: UIViewController {
    
    var masterGeoNode: SCNNode = SCNNode()
    var geometryNode1: SCNNode = SCNNode()
    var geometryNode2: SCNNode = SCNNode()
    var geometryNode3: SCNNode = SCNNode()
    var geometryNode4: SCNNode = SCNNode()
    var geometryNode5: SCNNode = SCNNode()
    var geometryNode6: SCNNode = SCNNode()
    var geometryNode7: SCNNode = SCNNode()
    var geometryNode8: SCNNode = SCNNode()
    var currentAngle: Float = 0.0
    var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = view as SCNView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sceneSetup()
        
        geometryNode1 = SCNNode(geometry: Celestials.mercury())
        geometryNode2 = SCNNode(geometry: Celestials.venus())
        geometryNode3 = SCNNode(geometry: Celestials.earth())
        geometryNode4 = SCNNode(geometry: Celestials.mars())
        geometryNode5 = SCNNode(geometry: Celestials.jupiter())
        geometryNode6 = SCNNode(geometry: Celestials.saturn())
        geometryNode7 = SCNNode(geometry: Celestials.uranus())
        geometryNode8 = SCNNode(geometry: Celestials.neptune())
        
        
        geometryNode1.position = SCNVector3Make(1, 0, 0)
        geometryNode2.position = SCNVector3Make(-2, 0, 0)
        geometryNode3.position = SCNVector3Make(3, 0, 3)
        geometryNode4.position = SCNVector3Make(-4, 0, 0)
        geometryNode5.position = SCNVector3Make(5, 0, 0)
        geometryNode6.position = SCNVector3Make(6, 0, 0)
        geometryNode7.position = SCNVector3Make(-7, 0, 0)
        geometryNode8.position = SCNVector3Make(9, 0, 0)
        
        masterGeoNode.addChildNode(geometryNode1)
        masterGeoNode.addChildNode(geometryNode2)
        masterGeoNode.addChildNode(geometryNode3)
        masterGeoNode.addChildNode(geometryNode4)
        masterGeoNode.addChildNode(geometryNode5)
        masterGeoNode.addChildNode(geometryNode6)
        masterGeoNode.addChildNode(geometryNode7)
        masterGeoNode.addChildNode(geometryNode8)
        sceneView.scene!.rootNode.addChildNode(masterGeoNode)
    
    }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLightTypeOmni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(omniLightNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "panGesture:")
        sceneView.addGestureRecognizer(panRecognizer)
        
        sceneView.scene = scene
    }
    
    func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(M_PI)/180.0
        newAngle += currentAngle
        
        masterGeoNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizerState.Ended) {
            currentAngle = newAngle
        }
    }
}
