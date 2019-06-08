//
//  GitHubNetwork.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

class GitHubNetworkServise {
    
    private init () {}
    
    static func getGitHubJobs(userSearh: String,complation: @escaping(GetGitHubResponse) -> ()) {
        
        guard let url = URL(string: "https://jobs.github.com/positions.json?description=" + userSearh) else {return}
        NetworkService.shared.getData(url: url) { (json) in
            
            do {
                let response = try GetGitHubResponse(json: json)
                complation(response)
            } catch {
                print(error)
            }
            
            
        }
    }
}
