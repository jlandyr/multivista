//
//  Paso4InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 18/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation

class Paso4InterfaceController: WKInterfaceController {

    var dictionary : [String:String] = [:]
    var tieneIngredientes = false
    
    @IBOutlet var tableIngredientes: WKInterfaceTable!
    var ingredientes = ["Jamón":false,"Pepperoni":false,"Pavo":false,"Salchicha":false,"Aceituna":false,"Cebolla":false,"Pimiento":false,"Piña":false,"Anchoa":false]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        self.dictionary = context as! [String:String]
        
//        self.tableIngredientes.setNumberOfRows(self.ingredientes.count, withRowType: "NameRowControllerIdentifier")
//        loadTableData()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

//    func loadTableData() {
//        for (index, name) in self.ingredientes.enumerate() {
//            let row = self.tableIngredientes.rowControllerAtIndex(index) as! TextTableRowController
//            row.switchIngrediente.setTitle(name)
//            
//        }
//        
//    }
    
    @IBAction func activateJamon(value: Bool) {
        ingredientes["Jamón"] = value
        print("Jamón: \(ingredientes["Jamón"]!)")
    }
    @IBAction func activatePepperoni(value: Bool) {
        ingredientes["Pepperoni"] = value
    }
    @IBAction func activatePavo(value: Bool) {
        ingredientes["Pavo"] = value
    }
    @IBAction func activateSalchicha(value: Bool) {
        ingredientes["Salchicha"] = value
    }
    @IBAction func activateAceituna(value: Bool) {
        ingredientes["Aceituna"] = value
    }
    @IBAction func activateCebolla(value: Bool) {
        ingredientes["Cebolla"] = value
    }
    @IBAction func activatePimiento(value: Bool) {
        ingredientes["Pimiento"] = value
    }
    @IBAction func activatePina(value: Bool) {
        ingredientes["Piña"] = value
    }
    @IBAction func activateAnchoa(value: Bool) {
        ingredientes["Anchoa"] = value
    }
    
    @IBAction func Paso5() {
        var posicion = 1
        for index in ingredientes
        {
            if index.1
            {
                tieneIngredientes = true
                let llave = "Ingred" + String(posicion)
                self.dictionary[llave] = index.0
                posicion += 1
            }
        }
        if tieneIngredientes
        {
            pushControllerWithName("Paso5", context: self.dictionary)
        }
        else
        {
            
            
            let action = WKAlertAction(title: "OK", style: WKAlertActionStyle.Default, handler: { () -> Void in
                
            })
            self.presentAlertControllerWithTitle("Ingredientes", message: "Seleecione al menos uno.", preferredStyle:WKAlertControllerStyle.Alert , actions: [action])
//            self.presentAlertControllerWithTitle("Pizza", message: "Seleccione al menos 1 ingrediente", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [action])
        }
        
    }
}
