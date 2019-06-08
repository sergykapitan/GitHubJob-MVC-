//
//  GetGitHubResponse.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

struct GetGitHubResponse {
    
    let itemArray: [Item]
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
        
        var itemArray = [Item]()
        for dictionary in array {
            guard let comment = Item(dict: dictionary) else {continue}
            itemArray.append(comment)
            
        }
        self.itemArray = itemArray
    }
    
}

