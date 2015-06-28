//
//  ViewController.swift
//  Random
//
//  Created by Ian Ynda-Hummel on 6/28/15.
//  Copyright © 2015 Ian Ynda-Hummel. All rights reserved.
//

import UIKit
import Cartography
import CryptoSwift

class ViewController: UIViewController {
    var label: UILabel?
    var string: String? {
        didSet {
            if let label = self.label {
                label.text = self.string
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = RandomLabel()
        let reloadButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton

        label.userInteractionEnabled = true
        label.textColor = UIColor.blackColor()
        label.textAlignment = NSTextAlignment.Center

        reloadButton.setTitle("Reload", forState: UIControlState.Normal)
        reloadButton.addTarget(self, action: Selector("reload:"), forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(label)
        self.view.addSubview(reloadButton)

        layout(label, reloadButton, self.view) { label, reloadButton, view in
            label.height == 30.0
            label.left == view.left
            label.right == view.right
            label.centerY == view.centerY

            reloadButton.top == label.bottom
            reloadButton.centerX == label.centerX
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        label.addGestureRecognizer(tapGestureRecognizer)

        self.label = label
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let string = self.string {} else {
            self.reloadString()
        }
    }

    func reload(sender: UIButton) {
        self.reloadString()
    }

    func reloadString() {
        if let randomString = NSUUID().UUIDString.sha1() {
            self.string = randomString.substringToIndex(advance(randomString.startIndex, 20))
        }
    }

    func handleTap(recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view, let superview = view.superview {
            let menuController = UIMenuController.sharedMenuController()

            view.becomeFirstResponder()

            menuController.setTargetRect(view.frame, inView: superview)
            menuController.setMenuVisible(true, animated: true)
        }
    }
}
