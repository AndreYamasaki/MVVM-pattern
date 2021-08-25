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
        
        tablewView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        
        tablewView.delegate = self
        tablewView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let model = data[indexPath.row]
        let viewModel = CellViewModel(firstName: model.firstName, lastName: model.lastName)
        
//        cell.textLabel?.text = "\(viewModel.firstName) \(viewModel.lastName)"
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




