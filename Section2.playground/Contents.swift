//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



/*
 *Section2-3 タプル
 */

//タプルを作る
let product = ("Swift", 2014)
var kingaku = (1000, 80)
var guest = ("大重", "おおしげ", 1234)

//タプルの値の型指定
let product1: (String, Int) = ("Swift", 2014)
var guest1: (String, String, Int)
guest1 = ("大重", "おおしげ", 1234)

//タプルの値エラー
var kingaku1 = (1000, 80) //型推論(Int, Int)
//kingaku1 = (1080, "内税") //エラー

//タプルの値を取り出す
//タプルの値を対応する定数に取り出す
let data = (1000, 80)
let (price, tax) = data
let kingaku2 = price + tax
print(kingaku2)

//ワイルドカードを使う(_を使って不要な値は無視し、必要な値を選んで受け取ることできる)
let data1 = (1000, 80)
let  (price1, _) = data1
print(price1)

//タプルの値にインデックス番号でアクセスする
//タプルの値をインデックス番号で取り出す
let kingaku3 = (1000, 80)
let price2 = kingaku3.0 //0番の値
let tax1 = kingaku3.1 //1番の値
print(price2 + tax1)

//タプルの値をインデックス番号で変更する
var user = ("鈴木", 29)
user.1 = 30 //29を30に変更
print(user)

//タプルの値にラベルを付ける
//タプルの値をラベルで取り出す
let kingaku4 = (price3: 1000, tax2: 80)
let seikyugaku = kingaku4.price3 * kingaku4.tax2
print(seikyugaku)

//ラベル付きのタプルが値の変数
var user1: (name: String, age: Int, isPass: Bool)
user1.name = "高田"
user1.age = 23
user1.isPass = true
print(user1)
print(user1.age)


/*
 *Section2-4 演算子
 */

//算術演算子 +, -, *, /, %
//算術演算子を使った計算
//算術演算子
let a = 1+3*2
let b = 10/(4-2)
//余り
let c = 5%3 //c = 2
let d = -11%4 //d = -3
print((a, b, c, d))

//整数だけの計算(整数だけの計算は結果も整数となる)
let ans = 3 * (10/4) //(10/4)は整数の2となる
print(ans)

//整数と浮動小数点の計算(浮動小数を含む計算の結果は浮動小数となる)
let ans1 = 3.0 * (10/4) //(10/4)は浮動小数の2.5となる
print(ans1)

//論理演算子 &&, || , !
//論理演算
let a1 = true
let b1 = false
let and = a1 && b1
let or = a1 || b1
let not = !a1
print((and, or, not)) //(false, true, false)

//比較演算子 >, < ,>=, <=, == !=

//代入演算子 =
//変数や定数に値を設定する
var a2 = 100
let b2 = a2
a2 = a2 + 1
print(a2, b2)

//複合代入演算子 +=, -=, *=, /=, %=, &&=, ||=
//変数a3に(b3+2)の値を掛けた結果をa3に代入する
var a3 = 5
let b3 = 10
a3 *= b3 + 2
print(b3)//60

//三項演算子 ?:
//a, bを比較して大きな値をbiggerに代入する
let a4 = arc4random_uniform(100) //0~99の乱数
let b4 = arc4random_uniform(100)
let bigger = (a4 > b4) ? a4 : b4 //a4の方が大きければ、a4、そうでなければb4を代入する
print("a4は\(a4) b4は\(b4) biggerは\(bigger)")

//a, bを比較して大きな値をbiggerに代入する(if文編)
let a5 = arc4random_uniform(100) //0~99の乱数
let b5 = arc4random_uniform(100)
var bigger1: UInt32
if a5>b5 {
    bigger1 = a5
}else {
    bigger1 = b5
}
print("a5は\(a5) b5は\(b5) bigger1は\(bigger1)")

//レンジ演算子 ..<, ...
//数値の範囲に値が入っているかどうか調べる
//整数の範囲
let rangeInt = -5..<5
print(rangeInt.contains(-3))
print(rangeInt.contains(2))
print(rangeInt.contains(5))
print("--------------------------")
//実数の範囲
let rangeDouble = 0.0..<1.0
print(rangeDouble.contains(0.1))
print(rangeDouble.contains(1.0))
print(rangeDouble.contains(1.5))

//for-inでレンジ演算子を利用する
//4回繰り返す
for i in (1..<5) {
    print("\(i)回目")
}

//5回繰り返す
for i in 1...5 {
    print("\(i)回目")
}

//ビット演算子
//カラー#40E0D0をRGBに分解してビューの背景色にする
//16進数RRGGBBをR, G, Bに分解
let RGB: UInt32 = 0x40E0D0 //turquoise(64, 224, 208)
let red = (RGB & 0xFF0000) >> 16 //上位2桁を取り出す
let green = (RGB & 0x00FF00) >> 8 //中央2桁を取り出す
let blue = RGB & 0x0000FF //下2桁を取り出す
print("red \(red), green \(green), blue \(blue)")

//背景色に設定
let R = CGFloat(red) //255
let G = CGFloat(green) //255
let B = CGFloat(blue) //255
//view.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1)

/*
 *Section2-5 条件で処理を分岐する if文
 */

//tokutenが80以上の時に「素晴らしい！」と出力する
let tokuten = 85
if tokuten >= 80 {
    print("素晴らしい！")
}
print("\(tokuten)点でした。")


//得点によって合否処理を分岐する
//0~100の乱数を取る
let tokuten1 = arc4random_uniform(101)
if tokuten1 >= 60 {
    print("あめでとう！合格です！")
} else {
    print("残念、不合格です。")
}
print("\(tokuten1)点でした")

//得点によって3段階に処理を分ける
let tokuten2 = arc4random_uniform(101)
if tokuten2 < 30 {
    print("がんばりましょう")
} else if tokuten2 < 80 {
    print("合格です！")
} else {
    print("素晴らしい！")
}
print("\(tokuten2)点でした。")

//数学50点以上かつ英語60点以上が合格
let sugaku = arc4random_uniform(101)
let eigo = arc4random_uniform(101)
//数学50点以上かつ英語50点以上が合格
if sugaku >= 50 {
    if eigo >= 60 {
        print("おめでとう！合格")
    } else {
        print("残念、不合格")
    }
} else {
    print("残念、不合格")
}
print("数学\(sugaku)、英語\(eigo)")

//数学または英語のどちらかが60点以上ならば合格
let sugaku1 = arc4random_uniform(101)
let eigo1 = arc4random_uniform(101)
//数学または英語のどちらかが60点以上ならば合格
if (sugaku1 >= 60) || (eigo1 >= 60) {
    print("おめでとう！合格")
} else {
    print("残念、不合格")
}
print("数学\(sugaku1)、英語\(eigo1)")

//数学、英語ともに50点以上で合格が120点以上が合格
func hantei (sugaku: UInt, eigo: UInt) {
    //複数の条件式をカンマで区切ったif文
    if sugaku >= 50, eigo >= 50, (sugaku+eigo) >= 120 {
        print("合格", terminator: "／")
    } else {
        print("不合格", terminator: "／")
    }
    print("数学\(sugaku)、英語\(eigo)、合格\(sugaku+eigo)")
}

//hantei()を試してみる
hantei(sugaku: 53, eigo: 71)
hantei(sugaku: 56, eigo: 62)
hantei(sugaku: 48, eigo: 79)


/*
 *Section2-6 値で処理を分離する switch文
 */

//theColorの値によって処理を分岐する
let theColor = "green"
switch theColor {
case "red", "yellow":
    print("赤と黄色は周注意")
case "green":
    print("緑は快適")
case "gray":
    print("グレーは停止中")
default:
    print("その他は順調")
}
print(theColor)

//レンジ演算子を利用して値を振り分ける
//20回振り返す
for _ in 1...20 {
    let num = arc4random_uniform(50)
    print("\(num)", terminator: "")
    //numで振り分ける
    switch num {
    case (10...15):
        print("：交換", terminator: "")
    case 20, (31...35), 40:
        print("：再検査", terminator: "")
    default:
        print("：合格", terminator: "")
    }
}

//タプルを使った振り分け
let size = (6, 11)
switch size {
case (0, 0):
    print("幅高さともに0です")
case (5...10, 5...10):
    print("規定サイズです")
case (_, 5...10):
    print("幅\(size.0)が規格外です")
case (5...10, _):
    print("幅\(size.0)が規格外です")
default:
    print("幅高さともに規格外です")
}

//バリューバインディング
//タプルのバリューバインディング
let size1 = (4, 10)
switch size1 {
case (0, 0):
    print("幅高さともに0です")
case (5...10, 5...10):
    print("規格外サイズです")
case (5...10, let height):
    print("高さ\(height)が規格外です")
case (let width, 5...10):
    print("幅\(width)が規格外です")
default:
    print("幅高さともに規格外です")
}

//値の振り分けに条件式を使う
//条件付きの振り分け
let size2 = (45, 40, 100)
switch size2 {
case let (width, height, _) where (width >= 60)||(height >= 60):
    print("規格外：幅高さのどちらかが60以上")
case let (_, _, weight) where (weight >= 80):
    print("規格外：重さ80以上")
default:
    print("規定サイズ内")
}

//defaultを省略したswitch文
let aPoint = (50, 100)
switch aPoint {
case (0, 0):
    print("中心点です")
case (0, _):
    print("x軸上の点です")
case (_, 0):
    print("y軸上の点です")
case let(x, y):
    print("点(\(x), \(y)です")
}

//各ケースをフォロースルーする
var abc: (a:Bool, b:Bool, c: Bool) = (false, false, false)
//bの場合を試します
let fall = "b"
switch fall {
case "a":
    abc.a = true
    fallthrough
case "b":
    abc.b = true
    fallthrough
case "c":
    abc.c = true
    fallthrough
default:
    print(abc)
}


/*
 *処理を繰り返す
 */

//5から9の値を順に取り出す
for num in 5...9 {
    let value = num * 2
    print(value, terminator: ",")
}

//15回繰り返す
for _ in 1...15 {
    let num = arc4random_uniform(100)
    print(num, terminator: ",")
}

//dor-in文をネスティングする
for i in 0...2 {
    for j in 0...2 {
        let point = (5*i, 10*j)
        print("\(i)-\(j)回目\(point)")
    }
}

//コレクションの値を順に取り出す
//配列の値の合計を求める
let numList = [3, 2, 6, 5, 8, 7, 9]
var sum = 0
for num in numList {
    sum += num
}
print("合計\(sum)")

//飛び飛びで繰り返す for-in stride()
//10から30まで3ずつ増える数値を取り出す
for num in stride (from: 10, to: 30, by: 3) {
    print(num, terminator: ",")
}

//ストリングから１文字ずつ取り出す
let message = "おもてなし"
for char in message.characters {
    print(char)
}

/*
 *条件が満たされている間繰り返す while文
 */

//繰り返し while文
//チケットがあればパワーと交換する
//パワーが100未満でチケットがあればパワーと交換する
var tickets = 5
var power = 30
while (tickets>0)&&(power<100) {
    tickets -= 1
    power += 20
}
print("power \(power), 残チケット \(tickets)")


//繰り返し repeat - while文 (do-whileと同じ)
//合計が21になる3個の数値(1~13)の組み合わせを探す
var a6: UInt32, b6: UInt32, c6: UInt32
var total: UInt32
repeat {
    a6 = arc4random_uniform(13)+1
    b6 = arc4random_uniform(13)+1
    c6 = arc4random_uniform(13)+1
    total = a6+b6+c6
} while (total != 21)
print("\(a6),\(b6),\(c6)")


//繰り返しのスキップや中断
//現在の繰り返しの残りの処理をスキップする continue
//負の値はスキップして正の値だけ足す
let v1list = [3, 5, -2, 6, -8, 2]
var total1 = 0
for v in v1list {
    //負の値はスキップする
    if v<0 {
        continue
    }
    total1 += v
    print("\(v),")
}
print("合計：\(total1)")

//繰り返しを中断する break
//70より大きな値が出るまで繰り返す
var num: UInt32 = 0
//無限に繰り返す
while true {
    num = arc4random_uniform(100)
    if num > 70 {
        break //70より大きな値が出たらブレイクする
    }
}
print(num)


//ループにラベルを付ける
//yloopループを中断してxloopループを続ける
xloop: for x in 0...3 {
    yloop: for y in 0...3 {
        if (x<y) {
            print("-----------")
            continue xloop
        }
        print((x, y))
    }
}

//内側のループから外側のループをブレイクする
let vlist: Array = [[4, 2], [5], [9, 8, 10], [6, 8, -9], [4, 2], [9, 3]]
//vlistを走査する
outloop: for alist in vlist {
    //alistを走査する
    inloop: for v in alist {
        //マイナスの値があれば出力して中断する
        if v<0 {
            print(alist)
            break outloop
        }
    }
}

