//
//  SoapMoleculeController.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SceneKit

class SoapMoleculeController: UIViewController {
    
    var masterGeoNode: SCNNode = SCNNode()
    var geometryNode1: SCNNode = SCNNode()
    var geometryNode2: SCNNode = SCNNode()
    var geometryNode3: SCNNode = SCNNode()
    var currentAngle: Float = 0.0
    var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = view as SCNView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sceneSetup()
        geometryNode1 = Molecules.longChainHydroCarbon()
        geometryNode1.position = SCNVector3Make(0, 0, 0)
        geometryNode2 = Molecules.waterMolecule()
        geometryNode2.position = SCNVector3Make(12, 0, 0)
        geometryNode3 = Molecules.oilParticle()
        geometryNode3.position = SCNVector3Make(-12, 0, 0)
        masterGeoNode.addChildNode(geometryNode1)
        masterGeoNode.addChildNode(geometryNode2)
        masterGeoNode.addChildNode(geometryNode3)
        sceneView.scene!.rootNode.addChildNode(masterGeoNode)
        
    }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLightTypeOmni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
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

