//
//  InputViewController.swift
//  snsApp
//
//  Created by Yoshiki Izumi on 2019/02/02.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
    
    let realm = try! Realm()
    var content: Content!
    var date: Date!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        contentTextView.text = content.contents
        date = content.date
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        try! realm.write {
//            self.content.contents = self.contentTextView.text
//            self.content.date = self.date
//            self.realm.add(self.content, update: true)
//        }
        
        super.viewWillDisappear(animated)
    }
    @IBAction func sendButton(_ sender: Any) {
        try! realm.write {
            self.content.contents = self.contentTextView.text
            self.content.date = self.date
            self.realm.add(self.content, update: true)
        }
        super.viewWillDisappear(true)

    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
