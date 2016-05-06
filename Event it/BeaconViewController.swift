//
//  BeaconViewController.swift
//  Event it
//
//  Created by Luis Felipe Salazar on 10/11/15.
//  Copyright © 2015 Luis Felipe Salazar. All rights reserved.
//

import UIKit

class BeaconViewController: UIViewController, ProximityContentManagerDelegate {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    
    var proximityContentManager: ProximityContentManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.proximityContentManager = ProximityContentManager(
            beaconIDs: [
                BeaconID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 18012, minor: 47752)
            ],
            beaconContentFactory: EstimoteCloudBeaconDetailsFactory())
        self.proximityContentManager.delegate = self
        self.proximityContentManager.startContentUpdates()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func proximityContentManager(proximityContentManager: ProximityContentManager, didUpdateContent content: AnyObject?) {
        self.activityIndicator?.removeFromSuperview()
        if let _ = content as? EstimoteCloudBeaconDetails {
            self.view.backgroundColor = UIColor(red: 126.0/255.0, green: 211.0/255.0, blue: 33.0/255.0, alpha: 1.0)
            self.label.text = "Bienvenido a Epic Hack"
            self.image.hidden = false
            self.activityIndicator?.stopAnimating()
        } else {
            /*
            self.view.backgroundColor = UIColor.redColor()
            self.label.text = "Favor de pagar el evento"
            self.image.hidden = true
            */
            self.activityIndicator?.stopAnimating()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
