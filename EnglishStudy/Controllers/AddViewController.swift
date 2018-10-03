//
//  AddViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var japaneseTextField: UITextView!
    
    @IBOutlet weak var englishTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickAddButton(_ sender: UIButton) {
        let phrase = Phrase()
        phrase.japanese = japaneseTextField.text
        phrase.english = englishTextField.text
        
        performSegue(withIdentifier: "selectCategory", sender: phrase)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let categoryViewController = segue.destination as! CategoryViewController
        categoryViewController.phrase = sender as! Phrase
    }
}
