//
//  Paso4TableViewController.swift
//  pizza
//
//  Created by Juan Landy on 3/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import UIKit

class Paso4TableViewController: UITableViewController {

    @IBOutlet weak var labelCaracteristicas: UILabel!
    var tamanioPizza:String = ""
    var tipoMasa:String = ""
    var tipoQueso:String = ""
    
    @IBOutlet weak var buttonSiguiente: UIBarButtonItem!
    let ingredientesArray = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var ingredientesSeleccionados = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.labelCaracteristicas.text = "Tamaño: " + tamanioPizza + ". Masa: " + tipoMasa + ". Queso: " + tipoQueso
        
        self.buttonSiguiente.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredientesArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cells", forIndexPath: indexPath)

        if indexPath.row == 0
        {
            
        }
        cell.textLabel?.text = ingredientesArray[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        //><
        
       
        
        if (cell?.accessoryType == UITableViewCellAccessoryType.Checkmark){
            
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            let myArray = ingredientesSeleccionados
            ingredientesSeleccionados = myArray.arrayRemovingObject(ingredientesArray[indexPath.row])
            
        }else{
            ingredientesSeleccionados.append(ingredientesArray[indexPath.row])
            
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark;
            
        }
        
        if ingredientesSeleccionados.count >= 1
        {
            self.buttonSiguiente.enabled = true
        }
        else
        {
            self.buttonSiguiente.enabled = false
        }
    }
    
    @IBAction func SiguienteEtapa(sender: AnyObject) {
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if ingredientesSeleccionados.count <= 5
        {
            if segue.identifier == "Paso5"{
                if let view = segue.destinationViewController as? ViewController{
                    view.tamanioPizza = tamanioPizza
                    view.tipoMasa = tipoMasa
                    view.tipoQueso = tipoQueso
                    view.ingredientes = ingredientesSeleccionados
                }
            }
        }
        else
        {
            let alert = UIAlertController(title: "Alerta", message: "Seleccione máximo 5 ingredientes.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    

}
extension Array where Element: Equatable {
    func arrayRemovingObject(object: Element) -> [Element] {
        return filter { $0 != object }
    }
}
