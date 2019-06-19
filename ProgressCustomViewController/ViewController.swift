//
//  ViewController.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import UIKit

protocol ProgressCustomViewControllerProtocol: class {
    var currentIndex: Int? { get set }
}


final class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var progressView: UIProgressView!

    //MARK: - Properties
    private var viewControllers: [UIViewController] = [] {
        didSet {
            progressView.progress = Float(viewControllers.count) / numberOfViewController
        }
    }
    private var numberOfViewController: Float = 2.0

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
    }
    
    
    //MARK: - Methods
    private func setup() {
        setupNavigationBar()
        setupUI()
        setupFirstViewController()

    }
    
    private func setupFirstViewController() {
        let firstViewController: FirstViewController = Helper.buildFirstViewController(from: self)
        add(asChildViewController: firstViewController)
    }
    
    private func setupNavigationBar() {
        let action = #selector(backAction)
        let backButton: UIBarButtonItem = UIBarButtonItem.init(title: "Indietro", style: UIBarButtonItem.Style.plain, target: self, action: action)
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupUI() {
    }
    

    //MARK: - Actions
    @objc private func backAction() {
        
        if viewControllers.count > 1 {
            remove(asChildViewController: viewControllers.last!)
        } else {
            
        }
        
    }

}

//MARK: - Helpers
extension ViewController {
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        containerView.addSubview(viewController.view)
        
        viewController.view.frame = CGRect.init(x: containerView.bounds.width, y: containerView.bounds.origin.y, width: containerView.bounds.width, height: containerView.bounds.height)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
        let visibleView = viewControllers.last?.view
        let parentWidth = containerView.frame.size.width
        
        viewController.view.frame.origin.x = parentWidth
        visibleView?.frame.origin.x = 0

        UIView.animate(withDuration: 0.3) {
            viewController.view.frame.origin.x = 0
            visibleView?.frame.origin.x = -parentWidth
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            
            viewController.view.frame.origin.x = 0
            visibleView?.frame.origin.x = -parentWidth
            
        }, completion: { completed in
            if completed {
            }
        })
        
        viewControllers.append(viewController)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {

        let visibleView = viewController.view
        let parentWidth = containerView.frame.size.width

        viewControllers.removeLast()
        
        let lastView = viewControllers.last?.view
        
        visibleView?.frame.origin.x = 0
        lastView?.frame.origin.x = -parentWidth
        
        UIView.animate(withDuration: 0.3, animations: {
            
            visibleView?.frame.origin.x = parentWidth
            lastView?.frame.origin.x = 0
            
        }, completion: { completed in
            if completed {
                viewController.willMove(toParent: nil)
                viewController.view.removeFromSuperview()
                viewController.removeFromParent()
            }
        })
        
        
    }
}


//MARK: - FirstViewControllerDelegate
extension ViewController: FirstViewControllerDelegate {
    func confirmTapped(from firstViewController: FirstViewController) {
        let secondViewController: SecondViewController = Helper.buildSecondViewController(from: self)
        add(asChildViewController: secondViewController)
    }
}

//MARK: - SecondViewControllerDelegate
extension ViewController: SecondViewControllerDelegate {
    func confirmTapped(from scondViewController: SecondViewController) {
        let thirdViewController: ThirdViewController = Helper.buildThirdViewController(from: self)
        add(asChildViewController: thirdViewController)
    }
}

//MARK: - ThirdViewControllerDelegate
extension ViewController: ThirdViewControllerDelegate {
    func confirmTapped(from thirdViewController: ThirdViewController) {
        let fourthViewController: FourthViewController = Helper.buildFourthViewController(from: self)
        add(asChildViewController: fourthViewController)
    }
}

//MARK: - ThirdViewControllerDelegate
extension ViewController: FourthViewControllerDelegate {
    func confirmTapped(from fourthViewController: FourthViewController) {
        //
    }
}

