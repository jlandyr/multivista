//
//  ConfirmacionViewController.swift
//  pizza
//
//  Created by Juan Landy on 3/4/16.
//  Copyright © 2016 eureka. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem?.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func GoBackToPaso1(sender: AnyObject) {
        self.performSegueWithIdentifier("unwindToPaso1", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
