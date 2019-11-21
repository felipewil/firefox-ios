//
//  AdditionalInformationView.swift
//  Client
//
//  Created by Guiche Virtual on 19/11/19.
//  Copyright © 2019 Mozilla. All rights reserved.
//

import UIKit
import WebKit

class LumosModalView : UIView {
    
    // MARK: Consts
    
    struct Consts {
        static let viewHeight: CGFloat = 80.0
        static let sideMargin: CGFloat = 16.0
    }
    
    // MARK: Subviews
    
    private var webView = WKWebView(frame: .zero, configuration: .init())
    private var activityIndicator = UIActivityIndicatorView(style: .gray)
    
    // MARK: Properties
    
    private var navigationComplete: ((LumosModalView) -> Void)?
    
    // MARK: Initialization
    
    convenience init() {
        let viewWidth = UIScreen.main.bounds.size.width - Consts.sideMargin
        let frame = CGRect(x: 0.0, y: 0.0, width: viewWidth, height: Consts.viewHeight)
        
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: Public methods
    
    func load(urlString: String, completionHandler: ((LumosModalView) -> Void)?) {
        guard let url = URL(string: urlString) else { return }
        navigationComplete = completionHandler
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        activityIndicator.startAnimating()
    }
    
    // MARK: Helpers
    
    private func configure() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = false
        webView.navigationDelegate = self
        
        addSubview(webView)
        addSubview(activityIndicator)
        
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

extension LumosModalView : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        navigationComplete?(self)
        navigationComplete = nil
    }
    
}

extension LumosModalView: WKUIDelegate {
    
    
    
}
