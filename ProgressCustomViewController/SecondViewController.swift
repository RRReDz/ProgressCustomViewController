//
//  SecondViewController.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func confirmTapped(from scondViewController: SecondViewController)
}


class SecondViewController: UIViewController, ProgressCustomViewControllerProtocol {
    
    var currentIndex: Int?
    
    weak var delegate: SecondViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func confirmAction() {
        self.delegate?.confirmTapped(from: self)

    }

}

//MARK: - StoryboardInstantiable
extension SecondViewController: StoryboardInstantiable {
    static var sceneStoryboardName: String {
        return "Main"
    }
}

