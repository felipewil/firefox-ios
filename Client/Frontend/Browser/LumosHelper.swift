//
//  LumosHelper.swift
//  Client
//
//  Created by Guiche Virtual on 21/11/19.
//  Copyright © 2019 Mozilla. All rights reserved.
//

import Foundation

struct LumosHelper {
    
    // MARK: Enums & Consts
    
    enum SidebarType {
        case `default`, small
        
        var path: String {
            switch self {
            case .default: return "sidebar"
            case .small: return "sidebarsmall"
            }
        }
    }
    
    private struct API {
        static let baseURL = "https://www.trylumos.com/"
    }
    
    // MARK: Public methods
    
    /// Returns a URL from Lumos with the given source URL and SidebarType.
    /// - Parameter source: the URL source to be checked on Lumos.
    /// - Parameter sidebarType: either `default` or `small`.
    static func lumosURL(fromSourceURL source: String,
                         forSidebar sidebarType: SidebarType) -> String {
        return "\(API.baseURL)\(sidebarType.path)/?mode=consumer&src=\(source)"
    }
    
}
