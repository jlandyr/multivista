//
//  ViewController.swift
//  pizza
//
//  Created by Juan Landy on 28/3/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTamanio: UILabel!
    @IBOutlet weak var labelMasa: UILabel!
    @IBOutlet weak var labelQueso: UILabel!
    @IBOutlet weak var labelIngredientes: UILabel!
    
    var tamanioPizza:String = ""
    var tipoMasa:String = ""
    var tipoQueso:String = ""
    var ingredientes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelTamanio.text = "Tamaño: " + tamanioPizza
        self.labelMasa.text = "Masa: " + tipoMasa
        self.labelQueso.text = "Queso: " + tipoQueso
        if ingredientes.count > 1
        {
            for item in ingredientes {
                self.labelIngredientes.text = self.labelIngredientes.text! + item + ". "
            }
        }
        else
        {
            self.labelIngredientes.text = ingredientes.first
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RealizarPedido(sender: AnyObject) {
        let alert = UIAlertController(title: "Pedido", message: "¿Desea confirmar su pizza?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .Destructive, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
                let ViewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("ConfirmacionViewController") as? ConfirmacionViewController
                self.navigationController?.pushViewController(ViewControllerObj!, animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
    }

}

