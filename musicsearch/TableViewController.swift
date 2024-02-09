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
    
    var array1: [Itunes] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbar.delegate = self
        
        searchbar.placeholder = "Search a singer"
        
        searchMusic(term: "abba")
        
    }
    
    func searchMusic(term: String) {
        
        let parameters = ["term" : term,
                          "limit" : 25] as [String: Any]
        
        AF.request("https://itunes.apple.com/search", method: .get, parameters: parameters).responseData { responds in
            
            SVProgressHUD.dismiss()
            
            var resultString = ""
            if let data = responds.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if responds.response?.statusCode == 200{
                let json = JSON(responds.data!)
                
                if let array = json["results"].array {
                    for i in array {
                        let music = Itunes(json: i)
                        self.array1.append(music)
                    }
                }
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        array1.removeAll()
        tableView.reloadData()
        searchMusic(term: searchBar.text!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array1.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell

        cell.setData(music: array1[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 277.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.music = array1[indexPath.row]
        
        navigationController?.show(vc, sender: self)
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

}
