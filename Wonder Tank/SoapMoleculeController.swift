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
        
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
    }
    
    func driveBehaviour() {
        geometryNode1.runAction(SCNAction.moveTo(SCNVector3Make(0, 0, 0), duration: NSTimeInterval(10)))
        geometryNode3.runAction(SCNAction.moveTo(SCNVector3Make(0, 0, 0), duration: NSTimeInterval(10)))
    }
    
    @IBAction func ActivateMolecules(sender: AnyObject) {
        driveBehaviour()
    }
    
    @IBAction func showAmmonia(sender: AnyObject) {
        geometryNode1.removeFromParentNode()
        geometryNode2.removeFromParentNode()
        geometryNode3.removeFromParentNode()
        geometryNode1 = Molecules.ammoniaMolecule()
        masterGeoNode.addChildNode(geometryNode1)
    }
    
    @IBAction func showAcids(sender: AnyObject) {
        geometryNode1.removeFromParentNode()
        geometryNode2.removeFromParentNode()
        geometryNode3.removeFromParentNode()
        geometryNode1 = Molecules.acidMolecule()
        masterGeoNode.addChildNode(geometryNode1)
    }
    
    
    @IBAction func showSugar(sender: AnyObject) {
        geometryNode1.removeFromParentNode()
        geometryNode2.removeFromParentNode()
        geometryNode3.removeFromParentNode()
        geometryNode1 = Molecules.sugarMolecule()
        masterGeoNode.addChildNode(geometryNode1)
    }
    
    @IBAction func showSalt(sender: AnyObject) {
        geometryNode1.removeFromParentNode()
        geometryNode2.removeFromParentNode()
        geometryNode3.removeFromParentNode()
        geometryNode1 = Molecules.saltMolecule()
        masterGeoNode.addChildNode(geometryNode1)
    }
    
    @IBAction func showSoap(sender: AnyObject) {
        geometryNode1.removeFromParentNode()
        geometryNode2.removeFromParentNode()
        geometryNode3.removeFromParentNode()
        
        
        geometryNode1 = Molecules.longChainHydroCarbon()
        geometryNode1.position = SCNVector3Make(0, 0, 0)
        geometryNode2 = Molecules.waterMolecule()
        geometryNode2.position = SCNVector3Make(12, 0, 0)
        geometryNode3 = Molecules.oilParticle()
        geometryNode3.position = SCNVector3Make(-12, 0, 0)
        masterGeoNode.addChildNode(geometryNode1)
        masterGeoNode.addChildNode(geometryNode2)
        masterGeoNode.addChildNode(geometryNode3)
    }
}

