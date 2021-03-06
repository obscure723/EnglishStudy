//
//  SelectOneQOneAViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class SelectOneQOneAViewController: UIViewController {

    var categories = [Category]()
    
    let category = Category()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = category.findAll().reversed()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension SelectOneQOneAViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "selectCategory",
                                               for: indexPath)
        // Tag番号を使ってLabelのインスタンス生成
        let label = testCell.contentView.viewWithTag(1) as! UILabel
        label.text = categories[indexPath.row].title
        
        return testCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        performSegue(withIdentifier: "OneQOneA", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let oneQOneAViewController = segue.destination as! OneQOneAViewController
        oneQOneAViewController.category = sender as! Category
    }
}
