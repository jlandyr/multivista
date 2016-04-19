//
//  Paso6InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 18/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation


class Paso6InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func Aceptar() {
        pushControllerWithName("Paso1", context: "")
    }
}
