//
//  ViewController.swift
//  LayoutProject
//
//  Created by admin on 20/06/21.
//

import UIKit
import Layout

class ViewController: UIViewController {
    var redView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .red
        return view
    }()
    var blueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .blue

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layout(with: [.centerX(to: view, constant: 0),
                              .centerY(to: view, constant: 0),
                              .height(constant: 100),
                              .width(constant: 100)], parentView: view)
        blueView.layout(with: [.topTo(redView, constant: 8),
                               .centerX(to: view, constant: 0),
                               .width(constant: 100),
                               .height(constant: 100)], parentView: view)
    }
}
