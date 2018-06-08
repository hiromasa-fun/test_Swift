//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * Chapter6 辞書 Dictionary
 */

/*
 *Section6-1 辞書を作る
 */

//辞書を作る
//辞書の例
let sizeTable = ["S": 47, "M": 52, "L":55]
let numDic = [10: "a", 20: "b", 30: "c"]
let resultDic = ["A": true, "B": false, "C": true]
let pointDic = ["p1": (10, 20), "p2": (30, 50), "p3": (20, 40)]

//値の型を限定した辞書を作る
//辞書の値を指定した辞書
let sizeTable1: [String: Int] = ["S": 47, "M": 52, "L":55]
let numDic1: [Int: String] = [10: "a", 20: "b", 30: "c"]
let resultDic1: [String: Bool] = ["A": true, "B": false, "C": true]
let pointDic1: [String: (Int, Int)] = ["p1": (10, 20), "p2": (30, 50), "p3": (20, 40)]
var theUser: [String: Any]
theUser = ["名前": "青井", "年齢": 29, "得点":[67, 82]]

//Dictionary<キーの型:値の型>を使った辞書の宣言
let sizeTable2: Dictionary<String, Int> = ["S": 47, "M": 52, "L":55]
let numDic2: Dictionary<Int, String> = [10: "a", 20: "b", 30: "c"]
let pointDic2: Dictionary<String, (Int, Int)>
pointDic2 = ["p1": (10, 20), "p2": (30, 50), "p3": (20, 40)]

//空の辞書
//値が空の辞書を作る
var sizeTable3: [String: Int] = [:]
var theUser1: [String: String]
theUser1 = [:]

//値が空の辞書を作る
var sizeTable4 = [String: Int]()
var theUser2 = Dictionary<String, String>()

//辞書が空かどうか調べる
let theDic: [String: Int] = [:]
if theDic.isEmpty {
    print("theDicは空の辞書です")
} else {
    print(theDic)
}

//辞書の要素の個数を調べる
let aDic = ["a": 333, "b": 555, "c": 999]
print(aDic.count)

//要素をタプルで作る
//要素をタプルで作る
let a = ("A", 1)
let b = ("B", 2)
let c = ("C", 3)
let abcDic = Dictionary(dictionaryLiteral: a, b, c) //dictionaryLiteralを利用すると要素をタプル形式で埋め込める
print(abcDic)

/*
 *Section6-2 辞書から値を取り出す
 */

//辞書の値にアクセスする
//辞書membersからキーが"東京"の値を取り出す
var members = ["東京": 15, "大阪": 12, "札幌": 9]
let tokyoValue = members["東京"]

//辞書からキーの値を取り出す
var members1 = ["東京": 15, "大阪": 12, "札幌": 9]
let tokyoValue1 = members["東京"]
let osakaValue1 = members["大阪"]
print(tokyoValue1, osakaValue1)
//値をアンラップして足し算する
let tokyoosaka = tokyoValue1! + osakaValue1!
print("東京と大阪の合計：\(tokyoosaka)")

//値を変更する
//キーを指定して値を変更する
var members2 = ["東京": 15, "大阪": 12, "札幌": 9]
//大阪の値を修正します
members["大阪"] = 17
print(members2)

//更新された値を知る
//更新前の値を受け取る
//辞書membersの値を追加・変更する
var members3 = [String: Int]()
func updateMembers (thekey: String, newValue: Int) {
    if let oldValue = members3.updateValue(newValue, forKey: thekey) {
        //キーがあった時は値を更新
        print("\(thekey)の値を\(oldValue)から\(newValue)に更新しました")
    } else {
        //キーがなかった時は要素を追加
        print("\(thekey):\(newValue) を追加しました")
    }
    print(members3)
}
members3 = ["東京": 15, "大阪": 12, "札幌": 9]
updateMembers(thekey: "大阪", newValue: 17) //更新
updateMembers(thekey: "沖縄", newValue: 14) //追加

//辞書の複製
//辞書から全ての要素を取り出す
var dic1 = ["a": 1, "b": 2, "c": 3]
let dic2 = dic1
dic1["b"] = 99
print("dic1は\(dic1)")
print("dic2は\(dic2)")

//辞書の要素をすべて取り出す
let tokyometoro = ["G": "銀座線", "M": "丸ノ内線", "H": "日比谷線", "T": "東西線", "C": "千代田線", "Z": "半蔵門線", "N": "南北線", "F": "副都心線", ]
for rosen in tokyometoro {
    print(rosen) //("H", "日比谷線")のようにタプルで出力される
}

//キーと値をタプルに代入する
for (rosenSign, rosenName) in tokyometoro {
    print("\(rosenSign)は\(rosenName)です。")
}

//キーをすべて取り出す
for rosenSign in tokyometoro.keys {
    print("\(rosenSign)", terminator: ", ")
}

//キーの配列を作る
let rosenSigns = Array(tokyometoro.keys)
print(rosenSigns)

//値をすべて取り出す
for rosenName in tokyometoro.values {
    print("\(rosenName)", terminator: ", ")
}

//値の配列を作る
let rosenNames = Array(tokyometoro.values)
print(rosenNames)

/*
 *Section6-3 辞書の要素の追加と削除
 */

//要素を追加する
//辞書の要素を追加する
var members4 = ["東京": 15, "大阪": 12, "札幌": 9]
//沖縄を追加します
members4["沖縄"] = 14 //存在しないキーの値を設定すると、要素が追加される
print(members4)

//要素を削除する
//指定したキーの要素を削除する
var theRace = ["short": 20, "half": 40, "full": 85]
let theKey = "short"
if let result = theRace.removeValue(forKey: theKey) {
    print("\(theKey)を削除しました。値は\(result)でした。")
} else {
    print("\(theKey)はありませんでした")
}
print(theRace)

//値をnilにして削除する
var theRace1 = ["short": 20, "half": 40, "full": 85]
theRace1["half"] = nil
print(theRace1) //halfのキーと値がありません

//すべての要素を削除する
var theRace2 = ["short": 20, "half": 40, "full": 85]
theRace2.removeAll() //=[:]でもok
print(theRace2)

