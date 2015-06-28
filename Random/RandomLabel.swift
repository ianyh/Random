//
//  RandomLabel.swift
//  Random
//
//  Created by Ian Ynda-Hummel on 6/28/15.
//  Copyright (c) 2015 Ian Ynda-Hummel. All rights reserved.
//

import Foundation
import UIKit

class RandomLabel: UILabel {
    override func canBecomeFirstResponder() -> Bool {
        return true
    }

    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        return (action == Selector("copy:"))
    }

    override func copy(sender: AnyObject?) {
        UIPasteboard.generalPasteboard().string = self.text
    }
}
