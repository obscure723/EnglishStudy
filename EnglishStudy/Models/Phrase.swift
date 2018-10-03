//
//  Phrase.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/02.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import Foundation
import RealmSwift

class Phrase: Object {
    
    @objc dynamic var id = -1
    @objc dynamic var japanese = ""
    @objc dynamic var english = ""
    @objc dynamic var categoryId = -1
    
    // データを保存。
    func insert(japanese: String, english: String, categoryId: Int) {
        let realm = try! Realm()
        
        let phrase = Phrase()
        phrase.id = createNewId()
        phrase.japanese = japanese
        phrase.english = english
        phrase.categoryId = categoryId
        
        try! realm.write {
            realm.add(phrase)
        }
    }
    
    func findAll()-> Results<Phrase> {
        let realm = try! Realm()
        
        // Realmに保存されてるDog型のオブジェクトを全て取得
        let phrases = realm.objects(type(of: self).self)
        return phrases
    }
    
    func findByCategoryId(categoryId: Int) -> Results<Phrase>? {
        let realm = try! Realm()
        return realm.objects(type(of: self).self).filter("categoryId == %@", categoryId)
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
