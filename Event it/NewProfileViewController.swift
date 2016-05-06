//
//  NewProfileViewController.swift
//  Event it
//
//  Created by Luis Felipe Salazar on 10/10/15.
//  Copyright © 2015 Luis Felipe Salazar. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class NewProfileViewController: UIViewController {

    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textApellido: UITextField!
    @IBOutlet weak var textCorreo: UITextField!
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet var contra: UITextField!
    
    @IBOutlet weak var sexSelector: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        (FBSDKProfile.enableUpdatesOnAccessTokenChange(true))
        navigationItem.title = "Registro de cuenta"
        
        textNombre.becomeFirstResponder()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sexAction(sender: UISegmentedControl) {
        switch sexSelector.selectedSegmentIndex {
        case 0:
            EMPTY
        case 1:
            EMPTY
        default:
            break;
        }
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
