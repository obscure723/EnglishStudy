//
//  PhraseListViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class PhraseListViewController: UIViewController {

    var phraseList = [Phrase]()
    let phrase = Phrase()
    
    var category = Category()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phraseList = phrase.findByCategoryId(categoryId: category.id)?.reversed() ?? [Phrase]()
        print(category.id)
        print(phraseList)
        print(phrase.findAll().reversed())
        tableView.dataSource = self
        tableView.delegate = self

    }
}

extension PhraseListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phraseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phrase = phraseList[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhraseCell") as! PhraseCell
        
        cell.japaneseLabel.text = phrase.japanese
        cell.englishLabel.text = phrase.english
        
        return cell
    }
    
}
