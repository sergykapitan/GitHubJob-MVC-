//
//  Item.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation



struct Item {
    
    var company: String
    var company_logo: String
    var company_url: String
    var created_at: String
    var description: String
    var how_to_apply: String
    var id: String
    var location: String
    var title: String
    var type: String
    var url: String
    
    init?(dict: [String: AnyObject]) {
        guard let company = dict["company"] as? String,
            let company_logo = dict["company_logo"] as? String,
            let company_url = dict["company_url"] as? String,
            let created_at = dict["created_at"] as? String,
            let description = dict["description"] as? String,
            let how_to_apply = dict["how_to_apply"] as? String,
            let id = dict["id"] as? String,
            let location = dict["location"] as? String,
            let title = dict["title"] as? String,
            let type = dict["type"] as? String,
            let url = dict["url"] as? String else { return nil }
        
        self.company = company
        self.company_logo = company_logo
        self.company_url = company_url
        self.created_at = created_at
        self.description = description
        self.how_to_apply = how_to_apply
        self.id = id
        self.location = location
        self.title = title
        self.type = type
        self.url = url
    }
}
