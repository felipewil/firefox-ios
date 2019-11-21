//
//  ModalHelper.swift
//  Client
//
//  Created by Guiche Virtual on 21/11/19.
//  Copyright © 2019 Mozilla. All rights reserved.
//

import UIKit
import AMPopTip

class ModalHelper {
    
    // MARK: Dependencies
    
    var tipFactory: (() -> PopTip)!
    
    // MARK: Initialization
    
    class func defaultHelper() -> ModalHelper {
        return ModalHelper(tipFactory: { PopTip() })
    }
    
    init(tipFactory: @escaping (() -> PopTip)) {
        self.tipFactory = tipFactory
    }
    
    // MARK: Public methods
    
    /// Shows the given view in a modal pop up.
    /// - Parameter view: the view to be shown in the modal.
    /// - Parameter fromView: a view whose pop up arrow will point to.
    /// - Parameter parentView: a parent view to hold the pop up.
    /// - Parameter direction: direction of the pop up.
    func show(_ view: UIView,
              from fromView: UIView,
              in parentView: UIView,
              direction: PopTipDirection = .up) -> PopTip {
        let tipView = tipFactory()
        tipView.entranceAnimation = .fadeIn
        tipView.shouldDismissOnTap = true
        tipView.padding = 0.0
        tipView.shadowOpacity = 0.5
        tipView.shadowRadius = 4
        tipView.shadowColor = .black
        tipView.shadowOffset = CGSize(width: 0.0, height: 4.0)
        tipView.bubbleColor = .white
        
        tipView.show(
            customView: view,
            direction: direction,
            in: parentView,
            from: fromView.frame)
        
        return tipView
    }
    
}
