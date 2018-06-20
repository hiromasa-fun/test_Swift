//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * chapter9 クラス
 */

/*
 *Section 9-1 クラス定義
 */

//クラスとは
//クラス定義の書式
//MyClassクラスの定義
class MyClass {
    //インスタンスプロパティ
    var msg = "ハロー"
    //インスタンスメソッド
    func hello() {
        print(msg)
    }
}

//インスタンスを作って操作する
let myObj = MyClass()
//hello()メソッドを実行する
myObj.hello()
//プロパティの値を変更する
myObj.msg = "ハーイ！元気？"
//hello()メソッドを実行する
myObj.hello()

//新規にクラス定義ファイルを作る p199-200
//別のファイルに定義してあるクラスを利用するp201

/*
 *Section 9-2 イニシャライザ
 */

//イニシャライザ init()
class MyClass1 {
    let msg: String //初期値はイニシャライザで設定します
    init(msg: String = "ハロー") {
        self.msg = msg //プロパティmsgに引数msgの値を代入します(selfはインスタンス自身を指す)
    }
    func hello() {
        print(msg)
    }
}
let myObj1 = MyClass1(msg: "こんにちは") //msgプロパティの初期値を引数で渡します
myObj1.hello()

//複数のイニシャライザを定義する
class MyClass2 {
    let msg: String
    let name: String? //イニシャライザ１では初期化されないのでnilを許可します
    //1つめのイニシャライザ
    init(msg: String = "ハロー") {
        self.msg = msg
        self.name = nil
    }
    //2つめのイニシャライザ
    init(msg: String = "ハロー", name: String) {
        self.msg = msg
        self.name = name
    }
    func hello() {
        var helloMsg: String
        if let user = name {
            //nameがnilでなければ連絡する
            helloMsg = user + "さん。" + msg
        } else {
            helloMsg = msg
        }
        print(helloMsg)
    }
}

//msgだけ指定した場合
let myObj2 = MyClass2(msg: "こんにちは") //イニシャライザ１が呼ばれる
myObj2.hello() //nameはnilなので、hello()ではelseブロックが実行されます

//msgとnameの両方とも指定した場合
let myObj3 = MyClass2(msg: "こんにちは", name: "桜子") //イニシャライザ２が呼ばれる
myObj3.hello()

//2つとも引数を省略した場合
let obj3 = MyClass2()
obj3.hello()

//nameだけ指定した場合
let obj4 = MyClass2(name: "月子")
obj4.hello()

//指定イニシャライザとコンビニエンスイニシャライザ
class MyClass3 {
    //インスタンスプロパティ
    let msg: String
    let name: String
    
    //指定イニシャライザ
    init(msg: String, name: String) {
        self.msg = msg
        self.name = name
    }
    //コンビニエンスイニシャライザ
    convenience init(msg: String = "ハロー") {
        self.init(msg: msg, name: "匿名") //指定イニシャライザを呼び出している
    }
    
    //インスタンスメソッド
    func hello() {
        let helloMsg = name + "さん。" + msg
        print(helloMsg)
    }
}
//MyClass3クラスのインスタンスを作る
let obj5 = MyClass3() //イニシャライザ２が呼ばれる
let obj6 = MyClass3(msg: "こんにちは") //イニシャライザ２が呼ばれる
let obj7 = MyClass3(msg: "やあ！", name: "山田") //イニシャライザ１が呼ばれる
//hello()メソッドを実行する
obj5.hello()
obj6.hello()
obj7.hello()
