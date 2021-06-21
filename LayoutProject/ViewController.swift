//
//  ViewController.swift
//  LayoutProject
//
//  Created by admin on 20/06/21.
//

import UIKit
import Layout

class ViewController: UIViewController {
   
    var greenView: EXView = {
        
        let view: EXView = EXView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenView.layoutWith([.centerX(chained: view, constant: 0),
                              .centerY(chained: view, constant: 0),
                              .width(100),
                              .height(100) ], parent: view)
    }
}
