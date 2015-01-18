//
//  Celestials.swift
//  Wonder Tank
//
//  Created by Murtuza Kainan on 1/17/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import SceneKit

class Celestials {
    class func mercury() -> SCNGeometry {
        let mercury = SCNSphere(radius: 0.2)
        mercury.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        mercury.firstMaterial!.specular.contents = UIColor.whiteColor()
        return mercury
    }
    
    class func venus() -> SCNGeometry {
        let venus = SCNSphere(radius: 0.6)
        venus.firstMaterial!.diffuse.contents = UIColor.brownColor()
        venus.firstMaterial!.specular.contents = UIColor.whiteColor()
        return venus
    }
    
    class func earth() -> SCNGeometry {
        let earth = SCNSphere(radius: 0.6)
        earth.firstMaterial!.diffuse.contents = UIColor.blueColor()
        earth.firstMaterial!.specular.contents = UIColor.whiteColor()
        return earth
    }
    
    class func mars() -> SCNGeometry {
        let mars = SCNSphere(radius: 0.4)
        mars.firstMaterial!.diffuse.contents = UIColor.redColor()
        mars.firstMaterial!.specular.contents = UIColor.whiteColor()
        return mars
    }
    
    class func jupiter() -> SCNGeometry {
        let jupiter = SCNSphere(radius: 2.0)
        jupiter.firstMaterial!.diffuse.contents = UIColor.brownColor()
        jupiter.firstMaterial!.specular.contents = UIColor.whiteColor()
        return jupiter
    }
    
    class func saturn() -> SCNGeometry {
        let saturn = SCNSphere(radius: 1.5)
        saturn.firstMaterial!.diffuse.contents = UIColor.brownColor()
        saturn.firstMaterial!.specular.contents = UIColor.whiteColor()
        return saturn
    }
    
    class func uranus() -> SCNGeometry {
        let uranus = SCNSphere(radius: 1.7)
        uranus.firstMaterial!.diffuse.contents = UIColor.brownColor()
        uranus.firstMaterial!.specular.contents = UIColor.whiteColor()
        return uranus
    }
    
    class func neptune() -> SCNGeometry {
        let neptune = SCNSphere(radius: 1.8)
        neptune.firstMaterial!.diffuse.contents = UIColor.brownColor()
        neptune.firstMaterial!.specular.contents = UIColor.whiteColor()
        return neptune
    }
    
    class func pluto() -> SCNGeometry {
        let pluto = SCNSphere(radius: 0.1)
        pluto.firstMaterial!.diffuse.contents = UIColor.cyanColor()
        pluto.firstMaterial!.specular.contents = UIColor.whiteColor()
        return pluto
    }
    
    class func sun() -> SCNGeometry {
        let sun = SCNSphere(radius: 5.00)
        sun.firstMaterial!.diffuse.contents = UIColor.yellowColor()
        sun.firstMaterial!.specular.contents = UIColor.whiteColor()
        return sun
    }
    
    class func asteroid() -> SCNGeometry {
        let asteroid = SCNSphere(radius: 0.05)
        asteroid.firstMaterial!.diffuse.contents = UIColor.yellowColor()
        asteroid.firstMaterial!.specular.contents = UIColor.whiteColor()
        return asteroid
    }
}
