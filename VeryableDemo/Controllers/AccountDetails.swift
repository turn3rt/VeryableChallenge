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
    
    // MARK: - INTERNAL VARS
    var account = Account(id: nil, account_type: nil, account_name: nil, desc: nil)
    
    // MARK: - INTERNAL FUNCS
    func showSelectedAcc() {
        self.accType.text = self.account.account_name
        self.accName.text = self.account.desc
        
        switch self.account.account_type {
            
        case "bank":
            self.accImg.image = UIImage(named: bankImgString)
            self.accImg.setImageColor(color: UIColor.vryBlue())
                    
        case "card":
            self.accImg.image = UIImage(named: cardImgString)
            self.accImg.setImageColor(color: UIColor.vryBlue())
                
        default:
            print("Error")
        }
    }
    
    func setupUI() {
        accType.textColor = UIColor.vryGreyDark()
        accName.textColor = UIColor.vryGrey()
        doneButton.backgroundColor = UIColor.vryBlue()
        accImg.setImageColor(color: UIColor.vryBlue())
    }

    

    
    // MARK: - IB Actions
    @IBAction func doneClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(account)
        setupUI()
        showSelectedAcc()
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
