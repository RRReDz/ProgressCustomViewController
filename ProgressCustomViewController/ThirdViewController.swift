//
//  ThirdViewController.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import UIKit

protocol ThirdViewControllerDelegate: class {
    func confirmTapped(from thirdViewController: ThirdViewController)
}

class ThirdViewController: UIViewController, ProgressCustomViewControllerProtocol {
    
    var currentIndex: Int?
    
    weak var delegate: ThirdViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func confirmAction() {
        self.delegate?.confirmTapped(from: self)

    }
}

//MARK: - StoryboardInstantiable
extension ThirdViewController: StoryboardInstantiable {
    static var sceneStoryboardName: String {
        return "Main"
    }
}

