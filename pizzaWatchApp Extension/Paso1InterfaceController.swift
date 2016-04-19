//
//  Paso1InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 11/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation


class Paso1InterfaceController: WKInterfaceController {

    @IBOutlet var pickerTamaniosPizza: WKInterfacePicker!
    
    var itemList: [(String, String)] = [
        ("Pequeña", "Pequeña"),
        ("Mediana", "Mediana"),
        ("Grande", "Grande") ]
    var tamanioSeleccionado:String = "Pequeña"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        pickerTamaniosPizza.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerChanged(value: Int) {
        self.tamanioSeleccionado = itemList[value].1
        print(self.tamanioSeleccionado)
    }
    @IBAction func Paso2() {
        pushControllerWithName("Paso2", context: tamanioSeleccionado)
        
    }
    
    
    
}

