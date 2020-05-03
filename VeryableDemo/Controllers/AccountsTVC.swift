//
//  Accounts.swift
//  VeryableDemo
//
//  Created by Turner Thornberry on 4/27/20.
//  Copyright © 2020 Turner Thornberry. All rights reserved.
//

import UIKit

class AccountsTVC: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tableView.backgroundColor = UIColor.vryBackground()
        
        fetchData()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsedAccounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountsCard", for: indexPath) as! AccountCell
        
        cell.backgroundColor = UIColor.vryBackground()
        
        cell.accType.text = parsedAccounts[indexPath.row].account_name
        cell.accName.text = parsedAccounts[indexPath.row].desc
        
        switch parsedAccounts[indexPath.row].account_type {
        case "bank":
            cell.desc.text = "Bank Account: ACH - Same Day"
            cell.img.image = UIImage(named: bankImgString)
            cell.img.setImageColor(color: UIColor.vryBlue())

        case "card":
            cell.desc.text = "Card: Instant"
            cell.img.image = UIImage(named: cardImgString)
            cell.img.setImageColor(color: UIColor.vryBlue())
            
        default:
            print("Error")
        }
        return cell
    }
    
    
    
    var accToPass: Account!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "AccountDetailsVC") as? AccountDetails
        vc?.account = parsedAccounts[indexPath.row]
        // print("data pass with indexpath.row = \(indexPath.row) and account: \(parsedAccounts[indexPath.row])")
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    
    // MARK: - Internal Veryables ;)
    var parsedAccounts = [Account]()

    // MARK: - Internal Functions
    func fetchData() {
        // https://www.youtube.com/watch?v=YY3bTxgxWss
        
        guard let jsonURL = URL(string: JSON_URL_STRING) else { return }
        URLSession.shared.dataTask(with: jsonURL) { (data, response, err) in
        // TODO: check Error
        // TODO: check Reponse status
            guard let data = data else { return }
            
            do {
                // return array of account objects from backend
                let accounts = try JSONDecoder().decode([Account].self, from: data)
                self.parsedAccounts = accounts
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        
            } catch let jsonErr {
                print("Error Serializing JSON:", jsonErr)
            }
        }.resume()
    }
}

