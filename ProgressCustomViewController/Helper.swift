//
//  Helper.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import Foundation
import UIKit

final class Helper {
    
    
    class func buildFirstViewController(from viewController: UIViewController) -> FirstViewController {
        let firstViewController: FirstViewController = FirstViewController.instantiate()
        firstViewController.delegate = viewController as? FirstViewControllerDelegate
        firstViewController.currentIndex = 0
        return firstViewController
    }
    
    class func buildSecondViewController(from viewController: UIViewController) -> SecondViewController {
        let secondViewController: SecondViewController = SecondViewController.instantiate()
        secondViewController.currentIndex = 1
        return secondViewController
    }
    
    class func buildThirdViewController(from viewController: UIViewController) -> ThirdViewController {
        let thirdViewController: ThirdViewController = ThirdViewController.instantiate()
        thirdViewController.currentIndex = 2
        return thirdViewController
    }
    
    class func buildFourthViewController(from viewController: UIViewController) -> FourthViewController {
        let fourthViewController: FourthViewController = FourthViewController.instantiate()
        fourthViewController.currentIndex = 3
        return fourthViewController
    }
    
    
    
    
    
}
