//
//  GitHubJobTableViewController.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class GitHubJobTableViewController: UIViewController {
    
    var userSearch: String!
    var itemArray = [Item]()
    
    
    
    @IBOutlet weak var tableGitHub: UITableView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableGitHub.register(UINib(nibName: "JobCell", bundle: nil), forCellReuseIdentifier: JobCell.reuseId)
        
        GitHubNetworkServise.getGitHubJobs(userSearh: userSearch) { (response) in
            self.itemArray = response.itemArray
            self.tableGitHub.reloadData()
            self.title = self.userSearch
        }

    }

}

// MARK: UITableViewDelegate

extension GitHubJobTableViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableGitHub.dequeueReusableCell(withIdentifier: JobCell.reuseId, for: indexPath) as! JobCell
        let itm = itemArray[indexPath.row]
        cell.configure(with: itm)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select Row")
        let vc = DetailsJobViewController()
        let comp = itemArray[indexPath.item]
      //  print (comp.company)
        vc.comonnInit(item: comp)
       // vc.comonnInit(comp.company_logo, title: comp.company)
        self.navigationController?.pushViewController(vc, animated: true)
       // self.tableGitHub.deselectRow(at: indexPath, animated: true)
        }
    }
    


//extension GitHubJobTableViewController {
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewController = segue.destination as? DetailsJobViewController, let cell = sender as? UITableViewCell {
//            let indexPath = tableGitHub.indexPath(for: cell)!
//            let listing = itemArray[indexPath.row]
//            viewController.item = listing
//        }
//
//    }
//}
