//
//  TableViewController.swift
//  musicsearch
//
//  Created by Tenizbayev Bolat on 02.02.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class TableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchbar: UISearchBar!
    
    var array1: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchMusic(term: "cat")
    }
    
    func searchMusic(term: String) {
        let parameters = ["animal_type": term]
        
        AF.request("https://cat-fact.herokuapp.com/facts", method: .get, parameters: parameters).responseData { response in
            
            SVProgressHUD.dismiss()
            
            if let data = response.data {
                let json = JSON(data)
                
                if let array = json.array {
                    for item in array {
                        if let fact = item["text"].string {
                            self.array1.append(fact)
                        }
                    }
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            array1.removeAll()
            tableView.reloadData()
            searchMusic(term: searchText)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array1[indexPath.row]
        return cell
    }
}
