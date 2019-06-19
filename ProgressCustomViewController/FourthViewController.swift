//
//  FourthViewController.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import UIKit

protocol FourthViewControllerDelegate: class {
    func confirmTapped(from fourthViewController: FourthViewController)
}

class FourthViewController: UIViewController, ProgressCustomViewControllerProtocol {
    
    var currentIndex: Int?
    
    weak var delegate: FourthViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func confirmAction() {
        self.delegate?.confirmTapped(from: self)

    }

    
}

//MARK: - StoryboardInstantiable
extension FourthViewController: StoryboardInstantiable {
    static var sceneStoryboardName: String {
        return "Main"
    }
}

