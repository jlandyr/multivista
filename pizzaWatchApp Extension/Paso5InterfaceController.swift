//
//  Paso5InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 18/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation


class Paso5InterfaceController: WKInterfaceController {
var dictionary : [String:String] = [:]
    
    @IBOutlet var table: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.dictionary = context as! [String:String]
        print("detalles pizza: \(self.dictionary)")
        table.setNumberOfRows(self.dictionary.count, withRowType: "NameRowControllerIdentifier")
        loadTable()
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadTable()
    {
        for (index, name) in self.dictionary.enumerate() {
            let row = table.rowControllerAtIndex(index) as! TextTableRowController
            let texto = name.0 + ": " + name.1
            row.nameLabel.setText(texto)
        }
    }
    @IBAction func confirmarPedido() {
        let cancel = WKAlertAction(title: "No", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            
        })
        
        let action = WKAlertAction(title: "Si", style: WKAlertActionStyle.Default, handler: { () -> Void in
            self.pushControllerWithName("Paso6", context: "")
        })
        
        self.presentAlertControllerWithTitle("Pizza", message: "Confirmar pedido?", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
        
        
    }
}
