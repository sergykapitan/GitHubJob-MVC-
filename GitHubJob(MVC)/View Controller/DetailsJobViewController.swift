//
//  DetailsJobViewController.swift
//  GitHubJob(MVC)
//
//  Created by Sergey Koriukin on 08/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class DetailsJobViewController: UIViewController {
    
     var item: Item!
   
    
    
    

    @IBOutlet weak var stackView: UIStackView!
    
   
    @IBOutlet weak var companyLogoDetail: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var urlCompanyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
}

extension DetailsJobViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(size: view.bounds.size)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(size: size)
    }

    func comonnInit (item: Item) {
         self.item = item
        }
    }


extension DetailsJobViewController {
    func updateUI(size: CGSize) {
        
        let isVertical = size.width < size.height
        stackView.axis = isVertical ? .vertical : .horizontal
        
        companyLogoDetail?.downloadedFrom(link: item.company_logo)
        locationLabel.text = item.location
        urlCompanyLabel.text = item.company_url
        descriptionLabel.attributedText = item.description.html2Attributed
        title = item.company
       
    }
}
extension String {
    
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {return nil}
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
