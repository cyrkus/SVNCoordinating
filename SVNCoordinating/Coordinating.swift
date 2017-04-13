//
//  Coordinating.swift
//  OurStreets
//
//  Created by Aaron Dean Bikis on 3/28/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit

protocol Coordinating: class {
    associatedtype RootViewController: UIViewController
    associatedtype ViewController: UIViewController
    
    var root: RootViewController { get }
    var viewController: ViewController? { get set }
    
    /**
     The only Coordinating method without default implementation
     */
    func createViewController() -> ViewController
    func configure(_ viewController: ViewController)
    func show(_ viewController: ViewController)
    func dismiss()
}


extension Coordinating {
    
    func configure(_ viewController: ViewController) {}
    
    func show(_ viewController: ViewController) {
        root.show(viewController, sender: self)
    }
    
    func dismiss() {
        root.dismiss(animated: true, completion: nil)
    }
}


extension Coordinating {
    
    func start() {
        let vc = createViewController()
        viewController = vc
        configure(vc)
        show(vc)
    }
    
    
    func stop() {
        dismiss()
        viewController = nil
    }
}
