//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * Chapter8 オプショナル
 */

/*
 * Section8-1 オプショナル
 */

//変数にnilを代入する
//変数にnilを代入するとエラーになる
var msg: String = "ハロー"
//msg = nil してしまうとエラーになります

//オプショナルなString型にする
var msg1: String? = "ハロー"
msg1 = nil //nilを代入してもエラーになりません

//オプショナルバリューの値を確かめる
let msg2: String? = "ハロー"
print(msg2)

//String型をOptional型にラップする
var msg3: Optional<String> = "ハロー" //String?で宣言と同じ
msg3 = nil

//オプショナルバリューを無条件にアンラップする !
//オプショナルバリューなのでストリングの連結ができない
let msg4: String? = "ハロー"
let newMsg = msg4 + "ワールド" //msgがStringではないのでエラーとなる

//オプショナルバリューをアンラップして連結する
let msg5: String? = "ハロー"
let newMsg1 = msg5! + "ワールド"
print(newMsg1)
//→msgがnilだった場合msg!は実行時にエラーとなるのでオプショナルバインディングを推奨する

/*
 * Section8-2 オプショナルバリューがnilの場合に対応する
 */

//オプショナルバリューがnilの時の初期値 ??
//変数countがnilの場合の指定をする
var count: Int?
var price: Int
price = 250 * (count ?? 2) //countがnilなので、代わりに2で計算します
print("\(price)円です") //countに2は代入されません(countはnilのまま)

count = 3
price = 250 * (count ?? 2) //countがnilではなく3なので、3で計算します
print("\(price)円です")

//配列が空のときの値を指定する
var nameArray: [String] = []
let userName: String = nameArray.first ?? "名無し"
print(userName)

//オプショナルバインディングで安全にアンラップする
//変数がnilでなければストリングを連結する
var str1: String?
str1 = "Swift"
//str1がnilかどうか調べる
if let msg = str1 { //msgには値がアンラップされて入ります
    // str1がnilでなければ、その値をmsgに代入して出力する
    print(msg + "ワールド")
} else { //str1がnilの場合はelseブロックを実行
    //str1がnilのとき出力する
    print("ハローワールド")
}

//辞書の値のうちで数値だけを合算する
var sum = 0
let dic: [String: Int?] = ["a": 23, "b": nil, "c": 10, "d": nil]
//値が数値の場合だけ合算する
for (_, value) in dic {
    if let num = value {
        sum += num
    }
}
print("数値の合計は\(sum)")

//値がnilでなければ変数に入っていた文字を連結する
var str2: String? = "★☆"
var repeatString: String = ""
var i = 0
//str2がnilでなければアンラップしてstampに代入して連結する
while let stamp = str2 {
    repeatString += stamp
    i += 1
    if(i >= 10) {
        break
    }
}
print(repeatString)

//guard-else分でオプショナルバインディングする
let who = "サクラ"
var level: Int?

func hello() {
    //levelをtheLevelにオプショナルバインディングする
    guard let theLevel = level else {
        return //levelがnilのときは処理を中断する
    }
    if theLevel < 10 {
        print("ハロー、" + who + "隊員")
    } else {
        print("ハロー、" + who + "上級隊員")
    }
}
//levelが未設定のまま実行する
hello() //guard-else文で中断されている

//levelを設定する
level = 12
hello()

//オプショナルバインディングに条件式を組み合わせる
let year1: String = "2001"
let year2: String = "2016"
//複数のオプショナルバインディングと条件の組み合わせ
if let startYear = Int(year1), let endYear = Int(year2), startYear < endYear { //Int(year1),Int(year1)共にnilでない且つ"startyear < endYear"の場合の式
    let years = endYear - startYear
    print("\(years)年間です")
}

//オプショナルチェーン
//空の配列の値にアクセスする
var balls: [(size: Int, color: String)] = []
var ballSize = balls.first.size //balls.firstがnilなのでsizeを参照するとエラーになる
print(ballSize)

//オプショナルチェーンを使って配列の値にアクセスする
//ballsが空のとき
var balls1: [(size: Int, color: String)] = []
var ballSize1 = balls.first?.size
print(ballSize1) //nil
//ballsに値があるとき
balls = [(size: 2, color: "red"), (size: 4, color: "green")]
ballSize1 = balls.first?.size
print(ballSize1) //Optional(2)

//オプショナルチェーンとオプショナルバインディングを組み合わせる
var balls2: [(size: Int, color: String)] = []
balls2 = [(size: 2, color: "red"), (size: 4, color: "green")]
//オプショナルバインディングと組み合わせる
if let ballSize2 = balls2.first?.size {
    print(ballSize2)
}
