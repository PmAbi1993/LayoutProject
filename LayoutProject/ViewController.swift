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
    var greenView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.fillIn(view: view, insets: [8])
        redView.layout(with: [.centerX(to: greenView, constant: 0),
                              .centerY(to: greenView, constant: 0),
                              .height(constant: 100),
                              .width(constant: 100)], parentView: greenView)
        blueView.fillIn(view: redView, insets: [8])
    }
}
