//
//  Utilities.swift
//  Raulandsappen
//
//  Created by Tony Chhabada on 06/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import Foundation
import MBProgressHUD
class Utilities{
    static let sharedInstance = Utilities()
    
    
    
    func showProgresDialog(message:String,view:UIView){
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
                    loadingNotification.mode = MBProgressHUDMode.indeterminate
                    loadingNotification.labelText = message
        
    }
    
    func hideProgressDialog(view:UIView){
            MBProgressHUD.hideAllHUDs(for: view, animated: true)
        
    }
    
    func alertBox(message:String,viewController:UIViewController){
        
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
    }
    
  
}
