//
//  CategoryViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/02.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import Material
import SCLAlertView

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let category = Category()
    
    var phrase = Phrase()
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        prepareFABButton()
        
        categories = category.findAll().reversed()
    }

    func prepareFABButton() {
        let button = FABButton(image: Icon.cm.add, tintColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.red.base
        
        button.addTarget(self, action: #selector(clickedButton(button:)), for: .touchUpInside)
        
        view.layout(button)
            .width(ButtonLayout.Fab.diameter)
            .height(ButtonLayout.Fab.diameter)
            .bottomRight(bottom:  10, right: 10)
    }
    
    @objc func clickedButton(button: UIButton) -> Void {
  
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("カテゴリー名")
        alert.addButton("Show Name") {
            if let title = txt.text {
                self.category.insert(title: title)
            }
            self.reloadData()
        }
        alert.showEdit("追加", subTitle: "カテゴリー名を入力してください")
    }
    
    func reloadData() {
        categories = []
        categories = category.findAll().reversed()
        collectionView.reloadData()
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "category",
                                               for: indexPath)
        // Tag番号を使ってLabelのインスタンス生成
        let label = testCell.contentView.viewWithTag(1) as! UILabel
        label.text = categories[indexPath.row].title
        
        return testCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        phrase.insert(japanese: phrase.japanese, english: phrase.english, categoryId: category.id)
    }
}

struct ButtonLayout {
    struct Flat {
        static let width: CGFloat = 120
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -150
    }
    
    struct Raised {
        static let width: CGFloat = 150
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -75
    }
    
    struct Fab {
        static let diameter: CGFloat = 48
    }
    
    struct Icon {
        static let width: CGFloat = 120
        static let height: CGFloat = 48
        static let offsetY: CGFloat = 75
    }
}
