//
//  CategoryModel.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/02.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var id = -1
    @objc dynamic var title = ""
    
    // データを保存。
    func insert(title: String) {
        let realm = try! Realm()
        
        let category = Category()
        category.id = createNewId()
        category.title = title
        
        try! realm.write {
            realm.add(category)
        }
    }
    
    
    func findAll()-> Results<Category> {
        let realm = try! Realm()
        
        // Realmに保存されてるDog型のオブジェクトを全て取得
        let categories = realm.objects(type(of: self).self)
        return categories
    }
    
    // 新しいIDを採番します。
    private func createNewId() -> Int {
        let realm = try! Realm()
        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
    }
    
    // プライマリーキーの設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
