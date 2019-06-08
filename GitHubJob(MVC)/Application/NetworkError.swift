//
//  NetworckError.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
}
