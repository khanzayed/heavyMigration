//
//  UrlParser.swift
//  Migration
//
//  Created by Faraz Habib on 11/08/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

class UrlParser {
    
    private var appUrl : URL?
    
    init(urlStr : String) {
        appUrl = URL(string: urlStr)
        
        parseUrl()
    }
    
    
    private func parseUrl() {
        guard let url = appUrl else {
            return
        }
        
        var dict = [String:String]()
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        if let queryItems = components.queryItems {
            for item in queryItems {
                dict[item.name] = item.value!
            }
        }
        
        // switch case
    }
}
