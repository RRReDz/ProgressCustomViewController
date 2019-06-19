//
//  Utils.swift
//  ProgressCustomViewController
//
//  Created by Michele Amato on 18/06/2019.
//  Copyright © 2019 Michele Amato. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryboardInstantiable {
    static var sceneStoryboardName: String { get }
    static var sceneIdentifier: String { get }
}

public extension StoryboardInstantiable {
    static var sceneIdentifier: String {
        return String(describing: self)
    }
}

public extension StoryboardInstantiable where Self: UIViewController {
    static func instantiate() -> Self {
        let bundle = Bundle(for: self)
        return UIStoryboard(name: sceneStoryboardName, bundle: bundle)
            .instantiateViewController(withIdentifier: sceneIdentifier) as! Self
    }
}
