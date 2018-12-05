//
//  TermsVC.swift
//  Alpha
//
//  Created by Razan Nasir on 05/07/18.
//  Copyright © 2018 Stpl. All rights reserved.
//

import UIKit
import SVProgressHUD


class TermsVC: UIViewController,UIWebViewDelegate{
    @IBOutlet var accetpBtn: UIButton!
    
    var userparams : NSMutableDictionary!
    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = UserDefaults.standard.value(forKey:URL_TERMS) as! String
        let url = URL (string:urlString)
        let requestObj = URLRequest(url: url!)
        webView.delegate = self
        webView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finished")
    }
    override func viewWillAppear(_ animated: Bool) {
        let navView = UIView()
        
        navView.frame =  CGRect(x:-350, y:-10, width:950, height:65)
        let image = UIImageView()
        image.image = UIImage(named: "DPE-Inline")
        image.frame = CGRect(x:-350, y:-10, width:950, height:65)
        
        // Add both the label and image view to the navView
        navView.addSubview(image)
        
        // Set the navigation bar's navigation item's titleView to the navView
        self.navigationItem.titleView = navView
        image.contentMode = UIViewContentMode.scaleAspectFit
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
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    @IBAction func declineAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func acceptAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: SUBSCRIPTION_PLAN) as! MasterViewController
        vc.userparams = userparams
        show(vc, sender: self)
        navigationController?.navigationBar.isHidden = false
        UserDefaults.standard.set(false, forKey: UPDATE_SUBSCRIPTION_USER)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
