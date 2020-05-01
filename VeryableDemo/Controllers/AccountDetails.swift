//
//  AccountDetails.swift
//  VeryableDemo
//
//  Created by Turner Thornberry on 5/1/20.
//  Copyright © 2020 Turner Thornberry. All rights reserved.
//

import UIKit

class AccountDetails: UIViewController {

    
    // MARK: - IB Outlets
    @IBOutlet weak var accImg: UIImageView!
    @IBOutlet weak var accType: UILabel!
    @IBOutlet weak var accName: UILabel!

    @IBOutlet weak var doneButton: UIButtonX!
    

    
    // MARK: - IB Actions
    @IBAction func doneClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accType.textColor = UIColor.vryGreyDark()
        accName.textColor = UIColor.vryGrey()
        doneButton.backgroundColor = UIColor.vryBlue()
        
        accImg.setImageColor(color: UIColor.vryBlue())
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
