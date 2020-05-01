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
        
        
        //let yee = Account(id: 1, accType: "bd", accName: "yee", desc: "arfff")
       // print(yee)
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total number of accounts: \(parsedAccounts.count)")
        
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
        case "card":
            cell.desc.text = "Card: Instant"
        default:
            print("Error")
        }
    
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Internal Veryables ;)
    var parsedAccounts = [Account]()

    // MARK: - Internal Functions
    func fetchData() -> () {
    
        guard let jsonURL = URL(string: JSON_URL_STRING) else { return }
        
        URLSession.shared.dataTask(with: jsonURL) { (data, response, err) in
        //check Error
        // check reponse sstatus
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

