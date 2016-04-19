//
//  Paso2InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 18/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation


class Paso2InterfaceController: WKInterfaceController {
    
    var itemList: [(String, String)] = [
        ("Delgada", "Delgada"),
        ("Crujiente", "Crujiente"),
        ("Gruesa", "Gruesa") ]
    var tamanioPizza:String = ""
    var tipoMasa = "Delgada"
    
    @IBOutlet var pickerTipoMasa: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        
        pickerTipoMasa.setItems(pickerItems)
        // Configure interface objects here.
        self.tamanioPizza = String(context!)
        print("Tamaño Pizza: \(tamanioPizza)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seleccionarTipoMasa(value: Int) {
        self.tipoMasa = itemList[value].1
    }
    @IBAction func Paso3() {
        let dictionary : [String:String] = ["Tamaño":tamanioPizza, "Masa":tipoMasa]
        print(dictionary)
        pushControllerWithName("Paso3", context: dictionary)
    }
}
