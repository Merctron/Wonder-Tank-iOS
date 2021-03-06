//
//  Molecules.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SceneKit

class Molecules {
    
    class func methaneMolecule() -> SCNNode {
        var methaneMolecule = SCNNode()
        
        // 1 Carbon
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0))
        
        // 4 Hydrogen
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(-2, 0, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(+2, 0, 0))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, -2, 0))
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +2, 0))
        
        return methaneMolecule
    }
    
    class func ethanolMolecule() -> SCNNode {
        var ethanolMolecule = SCNNode()
        
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: ethanolMolecule, position: SCNVector3Make(0, 0, 0))
        let carbonNode2 = nodeWithAtom(Atoms.carbonAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+2, 0, 0))
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(-2, 0, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(0, +2, 0))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(0, -2, 0))
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+2, +2, 0))
        let hydrogenNode5 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+2, -2, 0))
        let hydrogenNode6 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+6, 0, 0))
        let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+4, 0, 0))
        
        return ethanolMolecule
    }
    
    class func longChainHydroCarbon() -> SCNNode {
        var longChainHydroCarbon = SCNNode()
        
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(0, 0, 0))
        let carbonNode2 = nodeWithAtom(Atoms.carbonAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+2, 0, 0))
        let carbonNode3 = nodeWithAtom(Atoms.carbonAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+4, 0, 0))
        
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(-2, 0, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(0, +2, 0))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(0, -2, 0))
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+2, +2, 0))
        let hydrogenNode5 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+2, -2, 0))
        
        let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+6, 0, 0))
        let oxygenNode2 = nodeWithAtom(Atoms.oxygenAtom(), molecule: longChainHydroCarbon, position: SCNVector3Make(+4, -2, 0))
        
        
        return longChainHydroCarbon
    }
    
    class func waterMolecule() -> SCNNode {
        var waterMolecule = SCNNode()
        
        let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: waterMolecule, position: SCNVector3Make(0, 0, 0))
        
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: waterMolecule, position: SCNVector3Make(+2, 1, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: waterMolecule, position: SCNVector3Make(-2, 1, 0))
        
        return waterMolecule
    }
    
    class func ammoniaMolecule() -> SCNNode {
        var ammoniaMolecule = SCNNode()
        let nitrogenNode1 = nodeWithAtom(Atoms.nitrogenAtom(), molecule: ammoniaMolecule, position: SCNVector3Make(0, 0, 0))
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ammoniaMolecule, position: SCNVector3Make(+2, 0, 1))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ammoniaMolecule, position: SCNVector3Make(-2, 0, 1))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ammoniaMolecule, position: SCNVector3Make(0, 0, -2))
        return ammoniaMolecule
    }
    
    class func saltMolecule() -> SCNNode {
        var saltMolecule = SCNNode()
        let sodiumNode1 = nodeWithAtom(Atoms.sodiumAtom(), molecule: saltMolecule, position: SCNVector3Make(1.5, 0, 0))
        let chlorineNode1 = nodeWithAtom(Atoms.chlorineAtom(), molecule: saltMolecule, position: SCNVector3Make(-1.5, 0, 0))
        return saltMolecule
    }
    
    class func sugarMolecule() -> SCNNode {
        var sugarMolecule = SCNNode()
        
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(-6, 0, 0))
        let carbonNode2 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(-3, 0, 0))
        let carbonNode3 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(0, 0, 0))
        let carbonNode4 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(3, 0, 0))
        let carbonNode5 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(6, 0, 0))
        let carbonNode6 = nodeWithAtom(Atoms.carbonAtom(), molecule: sugarMolecule, position: SCNVector3Make(9, 0, 0))
        
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(0, 0, 2))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(3, -2, 0))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-3, 0, 2))
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-6, 2, 0))
        let hydrogenNode5 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-6, 0, 2))
        let hydrogenNode6 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(6, 2, 0))
        let hydrogenNode7 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(9, -2, 0))
        let hydrogenNode8 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-6, 0, -4))
        let hydrogenNode9 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-3, -4, -2))
        let hydrogenNode10 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(0, 4, -2))
        let hydrogenNode11 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(3, 2, 4))
        let hydrogenNode12 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: sugarMolecule, position: SCNVector3Make(6, -4, -2))
        
        let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-6, 0, -2))
        let oxygenNode2 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(-3, -2, -2))
        let oxygenNode3 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(0, 2, -2))
        let oxygenNode4 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(3, 2, 2))
        let oxygenNode5 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(6, -2, -2))
        let oxygenNode6 = nodeWithAtom(Atoms.oxygenAtom(), molecule: sugarMolecule, position: SCNVector3Make(9, 2, 2))
        
        return sugarMolecule
    }
    
    class func acidMolecule() -> SCNNode {
        var acidMolecule = SCNNode()
        
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: acidMolecule, position: SCNVector3Make(+5, 0, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: acidMolecule, position: SCNVector3Make(-5, 0, 0))
        
        let sulfurMolecule1 = nodeWithAtom(Atoms.sulfurAtom(), molecule: acidMolecule, position: SCNVector3Make(0, 0, 0))
        
        let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: acidMolecule, position: SCNVector3Make(+3, 0, 0))
        let oxygenNode2 = nodeWithAtom(Atoms.oxygenAtom(), molecule: acidMolecule, position: SCNVector3Make(-3, 0, 0))
        let oxygenNode3 = nodeWithAtom(Atoms.oxygenAtom(), molecule: acidMolecule, position: SCNVector3Make(0, +3, 0))
        let oxygenNode4 = nodeWithAtom(Atoms.oxygenAtom(), molecule: acidMolecule, position: SCNVector3Make(0, -3, 0))
        
        return acidMolecule
    }
    
    class func oilParticle() -> SCNNode {
        var oilParticle = SCNNode()
        let oilNode = nodeWithAtom(Atoms.oilMolecule(), molecule: oilParticle, position: SCNVector3Make(0, 0, 0))
        return oilParticle
    }
    
    class func nodeWithAtom(atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
        return node
    }


}

class Atoms {
    
    class func carbonAtom() -> SCNGeometry {
        let carbonAtom = SCNSphere(radius: 1.70)
        carbonAtom.firstMaterial!.diffuse.contents = UIColor.darkGrayColor()
        carbonAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return carbonAtom
    }
    
    class func hydrogenAtom() -> SCNGeometry {
        let hydrogenAtom = SCNSphere(radius: 1.20)
        hydrogenAtom.firstMaterial!.diffuse.contents = UIColor.lightGrayColor()
        hydrogenAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return hydrogenAtom
    }
    
    class func oxygenAtom() -> SCNGeometry {
        let oxygenAtom = SCNSphere(radius: 1.52)
        oxygenAtom.firstMaterial!.diffuse.contents = UIColor.redColor()
        oxygenAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return oxygenAtom
    }
    
    class func fluorineAtom() -> SCNGeometry {
        let fluorineAtom = SCNSphere(radius: 1.47)
        fluorineAtom.firstMaterial!.diffuse.contents = UIColor.yellowColor()
        fluorineAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return fluorineAtom
    }
    
    class func sulfurAtom() -> SCNGeometry {
        let sulfurAtom = SCNSphere(radius: 2.25)
        sulfurAtom.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        sulfurAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return sulfurAtom
    }
    
    class func chlorineAtom() -> SCNGeometry {
        let chlorineAtom = SCNSphere(radius: 2.18)
        chlorineAtom.firstMaterial!.diffuse.contents = UIColor.cyanColor()
        chlorineAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return chlorineAtom
    }
    
    class func sodiumAtom() -> SCNGeometry {
        let sodiumAtom = SCNSphere(radius: 3.14)
        sodiumAtom.firstMaterial!.diffuse.contents = UIColor.blueColor()
        sodiumAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return sodiumAtom
    }
    
    class func kAtom() -> SCNGeometry {
        let kAtom = SCNSphere(radius: 4.87)
        kAtom.firstMaterial!.diffuse.contents = UIColor.grayColor()
        kAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return kAtom
    }
    
    class func nitrogenAtom() -> SCNGeometry {
        let nitrogenAtom = SCNSphere(radius: 1.52)
        nitrogenAtom.firstMaterial!.diffuse.contents = UIColor.greenColor()
        nitrogenAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
        return nitrogenAtom
    }
    
    class func oilMolecule() -> SCNGeometry {
        let oilMolecule = SCNSphere(radius: 5.00)
        oilMolecule.firstMaterial!.diffuse.contents = UIColor.brownColor()
        oilMolecule.firstMaterial!.specular.contents = UIColor.whiteColor()
        return oilMolecule
    }
    
    class func allAtoms() -> SCNNode {
        let atomsNode = SCNNode()
        
        let carbonNode = SCNNode(geometry: carbonAtom())
        carbonNode.position = SCNVector3Make(-6, 0, 0)
        atomsNode.addChildNode(carbonNode)
        
        let hydrogenNode = SCNNode(geometry: hydrogenAtom())
        hydrogenNode.position = SCNVector3Make(-2, 0, 0)
        atomsNode.addChildNode(hydrogenNode)
        
        let oxygenNode = SCNNode(geometry: oxygenAtom())
        oxygenNode.position = SCNVector3Make(+2, 0, 0)
        atomsNode.addChildNode(oxygenNode)
        
        let fluorineNode = SCNNode(geometry: fluorineAtom())
        fluorineNode.position = SCNVector3Make(+6, 0, 0)
        atomsNode.addChildNode(fluorineNode)
        
        return atomsNode
    }
}
