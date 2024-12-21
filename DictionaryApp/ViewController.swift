//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Ilya Grishanov on 20.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sectionHeaderHeight = 35
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let words = [
        ["Apple", "Pear", "Banana"],
        ["Carrot", "Pickle", "Potato", "Tomato"],
        ["Blueberry", "Strawberry", "Blackberry"]
    ]
    
    let headers = ["Fruits", "Vegetables", "Berries"]
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section] // получили массив по номеру секции
        return vegOrFruitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil,
                                      message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
