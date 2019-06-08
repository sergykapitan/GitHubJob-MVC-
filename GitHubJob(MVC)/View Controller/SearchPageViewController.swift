//
//  ViewController.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController {
    
    // MARK: Outlet
    
    @IBOutlet weak var userSearch: UITextField!
    
    //MARK: Action
    
    @IBAction func userSearchButton(_ sender: Any) {
        guard userSearch.text?.isEmpty == false else { return }
    }
    
    //MARK: NAvigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dvc = segue.destination as? GitHubJobTableViewController else { return }
        dvc.userSearch = userSearch.text
    }
}

