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
        tableView.registerCells([TableCell.self])
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.allowsSelection = false
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
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableCell = tableView.dequedCell(type: TableCell.self)
        cell.label.text = "This is cell: \(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

class TableCell: UITableViewCell {
    var cellImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.backgroundColor = .red
        view.isUserInteractionEnabled = true
        return view
    }()
    var label: UILabel = {
        let view: UILabel = UILabel()
        view.numberOfLines = 0
        view.backgroundColor = .green
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadView()
        setClickListners()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func loadView() {
        cellImageView.layout(with: [.top(8),
                                    .left(8),
                                    .width(constant: 80),
                                    .height(constant: 80)],
                             parentView: contentView)
        label.layout(with: [.rightTo(cellImageView,
                                     constant: 8),
                            .right(-8),
                            .top(8),
                            .bottom(-8)],
                     parentView: contentView)
    }
    
    func setClickListners() {
        cellImageView.onClick {
            print("Clicked in the image")
        }
    }
}
