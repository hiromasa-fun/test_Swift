//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 *Chapter 4 ストリング String
 */

/*
 *Section4-1 ストリングを作る
 */
//ストリングリテラル
let message = "ハロー"
var bird: String
bird = "アマツバメ"

//ストリングを作る
let hello3 = String("ハロー") + String(2000+20)
print(hello3)

//空のストリングを作る
let emptyString = String()
var str1 = "Hello"
str1 = ""

//whoが空ならば中断する
func hello(_ who: String) {
    //whoが空かどうか調べる
    if who.isEmpty {
        return //whoが空の場合は処理を中断する
    }
    let msg = "ハロー！" + who + "さん"
    print(msg)
}

//hello()を試す
hello("")
hello("田中")

//同じ文字を繰り返したストリングを作る
let stars = String(repeating: "★", count: 10)
print(stars)

//ストリングに改行とダブルクォーテーションを入れる
let swift = "swiftとは\n\"アマツバメ\"です。" //\nで改行
print(swift)

//ストリングの文字数
let str2 = "あいうえお12345ABcde(^_^)"
let num1 = str.count //Xcode9.1から.characters.countにしなくて良くなった
print(num1)

//ストリングに変数や式を含める
let entries = 24
let staff = 3
let str3 = "参加者\(entries)人。"
let str4 = "参加者\(entries + staff)人です。"
print(str3)
print(str4)

//ストリング同士を連結する
let name1 = "海原"
let name2 = "次郎丸"
let str5 = name1 + name2 + "さん"
print(str5)

//+=演算子でストリングを連結する
let week = ["日", "月", "火", "水", "木", "金", "土"]
var oneweek = ""
for day in week {
    oneweek += day
}
print(oneweek)

//ストリングを数値に変換する
let kakaku: String = "240"
let kosu: String = "2"
//kakakuやkosuに"abc"などの文字が入るとIntに変換するときnilになる。
//Swiftではnilになる可能性がある値をオプショナルバリューとして扱うため!を付けてアンラップさせる
let kingaku3 = Int(kakaku)! * Int(kosu)!
print(kingaku3)

//ストリングを少数に変換
let r = "20"
let pai = "3.14"
let menseki = Double(r)! * Double(r)! * Double(pai)!
print("半径\(r)の面積は\(menseki)")


//数値をストリングに変換する
//数値をストリングに変換して連携する
let nakami = 135.5
let package = 12.0
let str6 = "内容量：" + String(nakami) + "g"
let str7 = "総重量：" + String(nakami + package).description + "g"
print(str6)
print(str7)


/*
 *Section4-2 ストリングから文字を取り出す
 */
//ストリングインデックス
//先頭と末尾のインデックスを調べる
let str8 = "Swift入門ノート"
let start = str8.startIndex
let end = str8.endIndex

//先頭の文字数を取り出す
let str9 = "Swift入門ノート"
let start1 = str9.startIndex
let char = str[start1]
print(char)

//取り出したCharacterをStringに変換する
let result = "先頭の文字は「" + String(char) + "」です。"
print(result)

//インデックスをsuccess()で進める
let str10 = "Swift入門ノート"
//先頭のインデックス
var index = str10.startIndex
//インデックスを１つ進める
index = str10.index(after: index)
let chr = str[index]
print(chr)

//最後の文字数を取り出す
let str11 = "Swift入門ノート"
//末尾の次のインデックス
var index1 = str11.endIndex
//インデックスを１つ戻す
index1 = str11.index(before: index1)
let chr1 = str[index1]
print(chr1)

//ストリングの途中の文字を取り出す
let str12 = "Swift入門ノート"
//先頭から5文字目
let index2 = str12.index(str.startIndex, offsetBy: 5)
//末尾から4文字目
let index3 = str12.index(str.endIndex, offsetBy: -4)
let chr2 = str[index2]
let chr3 = str[index3]
print((chr2, chr3))

//レンジ演算子を使ってストリングを取り出す
let str13 = "Swift入門ノート"
let zero = str13.startIndex
let start4 = zero.index(zero, offsetBy: 3)
let end4 = zero.index(zero, offsetBy: 6)
//ストリングを取り出す
let str14 = str[start4...end4]
let str15 = str[start4..<end4]
print((str14, str15))

//インデックスの手前/後ろのストリングを取り出す
let str16 = "Swift参考書"
//先頭から5文字目(0からカウント)
let index4 = str.index(str16.startIndex, offsetBy: 5)
//indexが指している文字
let chr4 = str[index4]
//indexより手前
let str17 = str.substring(to: index4)
//indexから後
let str18 = str.substring(to: index4)
print(chr4)
print(str17)
print(str18)

//先頭文字だけを大文字にする
func cap(_ str: String) -> String {
    //1文字目
    let start = str.startIndex
    let chr = str[start]
    let str1 = String(chr)
    //2文字目以降
    let second = str1.index(after: start)
    let str2 = str1.substring(from: second)
    //1文字目を大文字、この理を小文字にして連携する
    let capStr = str1.uppercased() + str2.lowercased()
    return capStr
}

//cap()を試す
let str20 = cap("apple")
let str21 = cap("APPLE")
print((str20, str21))

/*
 *Section4-3 ストリングの比較と検索
 */

//ストリングを比較する
let str22 = "Swift入門"
let str23 = "SWIFT入門"
let str24 = "Swift" + "入門"

if str22 == str23 {
    print("str22とstr23は同じです")
} else {
    print("str22とstr23は同じではありません")
}
if str22 == str24 {
    print("str22とstr24は同じです")
} else {
    print("str22とstr24は同じではありません")
}

//どちらのストリングが大きいか比べる
let str25 = "iPad"
let str26 = "iPhone"

if str25>str26 {
    print("\(str25)のほうが\(str26)より大きい")
} else if str26>str25 {
    print("\(str26)のほうが\(str25)より大きい")
} else {
    print("\(str25)と\(str26)は同じ")
}

//大文字小文字を区別せずに比較する
let str27 = "apple"
let str28 = "Apple"
//すべて小文字で比較する
if str27.lowercased() == str28.lowercased() {
    print("str27とstr28は同じです")
} else {
    print("str27とstr28は同じではありません")
}

//前方一致、後方一致で値を振り分ける
let itemList = ["カツ丼", "カツカレー", "親子丼", "天丼"]
//String型のからの配列を作る
var menu1 = [String]()
var menu2 = [String]()
for item in itemList {
    //"カツ"で始まるアイテム
    if item.hasPrefix("カツ") {
        menu1.append(item)
    }
    //"丼"で終わるアイテム
    if item.hasSuffix(item) {
        menu2.append(item)
    }
}
print(menu1)
print(menu2)

//"黒猫"が含まれるかどうかを調べる
let str29 = "吾輩は黒猫である。"
let str30 = "黒猫"
if str29.contains(str30) {
    print("「\(str30)」が含まれています。")
} else {
    print("「\(str30)」は含まれていません")
}

//「東京駅」より後ろの住所を取り出す
let str31 = "東京都千代田区神南1-2-3"
//str31の"東京都"の範囲を調べる
let result1 = str31.range(of: "東京都")
if let theRange = result1 {
    //resultに範囲が入っていた時、範囲より後ろのストリングを取り出す
    let afterStr = str31.substring(from: theRange.upperBound)
    print(afterStr)
} else {
    print(str30)
}

//元の住所から「東京駅」を取り除く
var str32 = "東京都千代田区神南1-2-3"
//str32の"東京都"の範囲を調べる
let result2 = str32.range(of: "東京都")
if let theRange = result2 {
    //result2に範囲が入っていた時に削除する
    str32.removeSubrange(theRange)
}
print(str32)

