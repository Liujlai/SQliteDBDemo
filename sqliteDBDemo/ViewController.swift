//
//  ViewController.swift
//  sqliteDBDemo
//
//  Created by idea on 2017/11/9.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db: SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
//        获取数据库实例
        db = SQLiteDB.shared
//        打开数据库
        _  = db.openDB()
//        如果表不存在则创建表 -> uid为自增主键
        let result = db.execute(sql: "create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        print(result)
        saveUser()
        initUser()
        deleteUser()
        // Do any additional setup after loading the view, typically from a nib.
    }
//    查询数据
        func initUser(){
            let data = db.query(sql: "select * from t_user")
            print(data)
            if data.count > 0{
                let user = data[data.count - 1]
                let name = user["uname"] as? String
                let mobile = user["mobile"] as? String
                print(name!,mobile!)
                
            }
    }
//    插入数据
    func saveUser()  {
        let uname = "里斯本"
        let moblie = "Apple"
        let sql = "insert into t_user(uname,mobile) values ('\(uname)','\(moblie)')"
        print("sql: \(sql)")
        
        let result  = db.execute(sql: sql)
        print(result)
    }
//    删除数据
    func deleteUser() {
        let sql = "delete from t_user where uid = 3 "
        print(sql)
        let result = db.execute(sql: sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

