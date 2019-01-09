//
//  LihatBarangController.swift
//  kooperasimercubuana
//
//  Created by macos_gue on 1/10/19.
//  Copyright © 2019 macos_gue. All rights reserved.
//

import UIKit

class LihatBarangController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://202.169.53.8/#/listitems")
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
