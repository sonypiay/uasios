//
//  TambahBarangController.swift
//  kooperasimercubuana
//
//  Created by macos_gue on 1/9/19.
//  Copyright © 2019 macos_gue. All rights reserved.
//

import UIKit

class TambahBarangController: UIViewController {

    @IBOutlet weak var field_namabarang: UITextField!
    @IBOutlet weak var field_merkbarang: UITextField!
    @IBOutlet weak var field_harga: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field_namabarang.delegate = self
        field_merkbarang.delegate = self
        field_harga.delegate = self
        self.labelMessage.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        field_namabarang.resignFirstResponder()
        field_merkbarang.resignFirstResponder()
        field_harga.resignFirstResponder()
    }

    @IBAction func storeBarang(sender: AnyObject) {
        let api_url = "http://202.169.53.8/api/add/items"
        let parameters = [
            "nama_barang": field_namabarang.text!,
            "merk_barang": field_merkbarang.text!,
            "harga_barang": field_harga.text!
        ]
        guard let paramBody = try? NSJSONSerialization.dataWithJSONObject(parameters, options: []) else { return }
        let url = NSURL(string: api_url)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.HTTPBody = paramBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                    self.labelMessage.hidden = false
                    self.labelMessage.text = "Data berhasil ditambah"
                    print(json["statusText"])
                    
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
    }
}

extension TambahBarangController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}