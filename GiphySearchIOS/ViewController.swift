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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

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
            print(textField.text!)
        }
        return true
    }
}


