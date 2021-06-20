//
//  ViewController.swift
//  LayoutProject
//
//  Created by admin on 20/06/21.
//

import UIKit
import Layout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layout([.left, .right], parentView: view)
    }
}
