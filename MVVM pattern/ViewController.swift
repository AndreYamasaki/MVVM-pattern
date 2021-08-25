//
//  ViewController.swift
//  MVVM pattern
//
//  Created by user on 25/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tablewView: UITableView!
    
    var data = [
        Person(firstName: "name1", lastName: "lastName1", gender: "Male", age: 25, heigth: 144),
        Person(firstName: "name2", lastName: "lastName2", gender: "Female", age: 35, heigth: 134),
        Person(firstName: "name3", lastName: "lastName2", gender: "Female", age: 15, heigth: 94)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablewView.delegate = self
        tablewView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Person {
    
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let heigth: Double
}

struct CellViewModel {
    
}
