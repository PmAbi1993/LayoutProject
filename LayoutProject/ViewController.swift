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
        greenView.layoutWith([.centerX(chained: view,
                                       constant: 0),
                              .centerY(chained: view,
                                       constant: 0),
                              .width(100), .height(100)], parent: view)
        greenView.onClick { [unowned self] in
            greenView.deactivateAllConstraints()
            
            self.view.addSubview(greenView)
            greenView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
            greenView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//            greenView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            greenView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            UIView.animate(withDuration: 0.3, delay: 0,
                           options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}

extension UIView {

    func removeConstraints() { removeConstraints(constraints) }
    func deactivateAllConstraints() { NSLayoutConstraint.deactivate(getAllConstraints()) }
    func getAllSubviews() -> [UIView] { return UIView.getAllSubviews(view: self) }

    func getAllConstraints() -> [NSLayoutConstraint] {
        var subviewsConstraints = getAllSubviews().flatMap { $0.constraints }
        if let superview = self.superview {
            subviewsConstraints += superview.constraints.compactMap { (constraint) -> NSLayoutConstraint? in
                if let view = constraint.firstItem as? UIView, view == self { return constraint }
                return nil
            }
        }
        return subviewsConstraints + constraints
    }

    class func getAllSubviews(view: UIView) -> [UIView] {
        return view.subviews.flatMap { [$0] + getAllSubviews(view: $0) }
    }
}
