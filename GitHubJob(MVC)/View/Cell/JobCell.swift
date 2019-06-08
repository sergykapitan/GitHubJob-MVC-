//
//  JobCell.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation
import UIKit


class JobCell: UITableViewCell {
    
    @IBOutlet weak var companyLogo: UIImageView!    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
     static let reuseId = "JobCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with itm: Item) {
        self.companyLogo?.downloadedFrom(link: itm.company_logo)
        self.companyNameLabel.text = itm.company
        self.titleLabel.text = itm.title
    }
    
}
extension UIImageView {
    func downloadedFrom(link:String) {
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
            guard let data = data , error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { () -> Void in
                self.image = image
            }
        }).resume()
    }
    
}
