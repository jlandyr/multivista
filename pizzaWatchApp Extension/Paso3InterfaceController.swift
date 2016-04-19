//
//  Paso3InterfaceController.swift
//  pizza
//
//  Created by Pedro Jose on 18/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import WatchKit
import Foundation


class Paso3InterfaceController: WKInterfaceController {
    
    var itemList: [(String, String)] = [
        ("mozarela", "mozarela"),
        ("cheddar", "cheddar"),
        ("parmesano", "parmesano"),
        ("sin queso", "sin queso")]
    var tipoQueso = "mozarela"
    var dictionary : [String:String] = [:]
    
    @IBOutlet var pickerTipoQueso: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        
        pickerTipoQueso.setItems(pickerItems)
        // Configure interface objects here.
        self.dictionary = context as! [String:String]
        print(dictionary)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func selectTipoQueso(value: Int) {
        tipoQueso = itemList[value].1
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func Paso4() {
        
      dictionary["Queso"] = tipoQueso
        print(dictionary)
        pushControllerWithName("Paso4", context: dictionary)
    }
}
