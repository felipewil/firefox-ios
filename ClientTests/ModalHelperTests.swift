//
//  ModalHelperTests.swift
//  ClientTests
//
//  Created by Guiche Virtual on 21/11/19.
//  Copyright © 2019 Mozilla. All rights reserved.
//

import XCTest
import AMPopTip
@testable import Client

private class PopTipMock : PopTip {
    
    var showCalls = 0
    var showView: UIView!
    var showParentView: UIView!
    override func show(customView: UIView,
                       direction: PopTipDirection,
                       in view: UIView,
                       from frame: CGRect,
                       duration: TimeInterval? = nil) {
        showCalls += 1
        showView = customView
        showParentView = view
    }
    
}

class ModalHelperTests: XCTestCase {

    var modalHelper: ModalHelper!
    
    override func setUp() {
        modalHelper = ModalHelper(tipFactory: { PopTipMock() })
    }

    override func tearDown() {
        modalHelper = nil
    }

    func testURLForSidebarDefault() {
        // Given
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        let fromView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 5.0, height: 5.0))
        let parentView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        
        // When
        let modal = modalHelper.show(view, from: fromView, in: parentView) as! PopTipMock

        // Then
        XCTAssertEqual(modal.showCalls, 1)
        XCTAssertEqual(modal.showView, view)
        XCTAssertEqual(modal.showParentView, parentView)
    }

}
