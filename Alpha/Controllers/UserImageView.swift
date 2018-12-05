//
//  UserImageView.swift
//  Alpha
//
//  Created by Akash Verma on 6/6/18.
//  Copyright © 2018 Stpl. All rights reserved.
//

import UIKit

class UserImageView: UIViewController {
    
    var userImage = UIImage()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = userImage

        let navView = UIView()
        navView.frame =  CGRect(x:-350, y:-10, width:950, height:65)
        let image = UIImageView()
        image.image = UIImage(named: "DPE-Inline")
        image.frame = CGRect(x:-350, y:-10, width:950, height:65)
        navView.sizeToFit()
        image.contentMode = UIViewContentMode.scaleAspectFit
        // Add both the label and image view to the navView
        navView.addSubview(image)
        
        // Set the navigation bar's navigation item's titleView to the navView
        self.navigationItem.titleView = navView
        
        // Set the navView's frame to fit within the titleView
        navView.sizeToFit()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.init(hexString:HEX_COLOUR)
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor.init(hexString:HEX_COLOUR)
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!]
        self.navigationController?.navigationBar.tintColor = UIColor.white

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
