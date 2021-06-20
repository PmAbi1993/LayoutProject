//
//  ViewController.swift
//  LayoutProject
//
//  Created by admin on 20/06/21.
//

import UIKit
import Layout

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.registerCells([UITableViewCell.self])
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.fillIn(view: view)
    }
}

extension ViewController: UITableViewDelegate,
                           UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequedCell(type: UITableViewCell.self)
        cell.textLabel?.text = "bvc"
        return cell
    }
}
