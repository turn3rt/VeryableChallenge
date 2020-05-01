//
//  Account.swift
//  VeryableDemo
//
//  Created by Turner Thornberry on 5/1/20.
//  Copyright © 2020 Turner Thornberry. All rights reserved.
//

import Foundation
import UIKit

let JSON_URL_STRING = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"


// MUST MATCH THE JSON STRING NAMES ON BACKEND
// https://www.youtube.com/watch?v=YY3bTxgxWss

struct Account: Decodable {
    let id: Int?
    let account_type: String?
    let account_name: String?
    let desc: String?
    
//    init(id: Int, account_type: String, account_name: String, desc: String) {
//        self.id = id
//        self.account_type = account_type
//        self.account_name = account_name
//        self.desc = desc
//    }
}


// MARK: - GLOBAL VARS
let bankImgString = "baseline_account_balance_black_48pt_3x.png"
let cardImgString = "baseline_credit_card_black_48pt_3x.png"



// MARK: - GLOBAL EXTENSIONS
extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
