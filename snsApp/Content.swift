//
//  Content.swift
//  snsApp
//
//  Created by Yoshiki Izumi on 2019/02/02.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import Foundation
import RealmSwift

class Content: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // 内容
    @objc dynamic var contents = ""
    
    /// 日時
    @objc dynamic var date = Date()
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
