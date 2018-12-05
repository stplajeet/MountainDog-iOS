//
//  QandADetail.swift
//  Alpha
//
//  Created by Monika Tiwari on 10/05/18.
//  Copyright © 2018 Stpl. All rights reserved.
//

import UIKit

class QandADetail: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAnswer: UILabel!
    
    var dictQustn = NSDictionary()

    @IBAction func btnBack(_ sender: Any)
    {
        
    self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("dict :,\(dictQustn)")
   
        let strAnswer = "A: "
        let stringQuest = "Q:"
        
        
        let appendStringQusert = "\(stringQuest) \(String(describing: dictQustn.value(forKey:"question") as! String))"
        lblQuestion.text = appendStringQusert
        
        let appendAnswer = "\(strAnswer)\(String(describing: dictQustn.value(forKey:"answer") as! String))"
        
        let string_to_color = strAnswer
        
        let range = (appendAnswer as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: appendAnswer)
      //  attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.bt_color(fromHex: "#3C77BD", alpha: 1.0) , range: range)
        
         attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(hexString: HEX_COLOUR).withAlphaComponent(1.0), range: range)
        
        
        lblAnswer.attributedText = attribute
        
        if((dictQustn.value(forKey:"name") as? String) != nil)
        {
            lblName.text = dictQustn.value(forKey: "name") as? String
        }
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor.init(hexString:HEX_COLOUR)
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.init(hexString:HEX_COLOUR),
             NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!]
        self.tabBarController?.tabBar.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
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
