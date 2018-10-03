//
//  ViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/09/30.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickAddButton(_ sender: UIButton) {
       performSegue(withIdentifier: "selectCategory", sender: nil)
    }
}
