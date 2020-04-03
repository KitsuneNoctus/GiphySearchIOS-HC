//
//  ViewController.swift
//  GiphySearchIOS
//
//  Created by Henry Calderon on 4/1/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var network = GifNetwork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.gifs: [Gif] = ()
        setup()
    }
    /// Setup tableview delegates.
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
//         Search bar
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "Whats your favorite gif?"
        searchBar.returnKeyType = .search
        
    }
    /**
    Fetches gifs based on the search term and populates tableview
    - Parameter searchTerm: The string to search gifs of
    */
    func searchGifs(for searchText: String) {
        network.fetchGifs(searchTerm: searchText){ results in
            if results != nil{
                print(results!.gifs.count)
                self.gifs = results!.gifs
                self.tableView.reloadData()
            }
        }
    }
}
///=============================================================================
// MARK: - Tableview functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell") as! GifCell
        return cell
    }
}

// MARK: - Search bar functions
extension ViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil {
            searchGifs(for: textField.text!)
        }
        return true
    }
}


