//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 *Chapter 10 列挙型と構造体
 */

/*
 *Section 10-1 列挙型 enum
 */

//列挙型を定義する
//MensSize型の定義
enum MensSize {
    case S
    case M
    case L
    case XL
}

//WomensSize型の定義
enum WomensSize {
    case XS, S, M, L
}

//変数にMensSize型の値を代入する
var mySize = MensSize.M

//型推論によって.Sで値を指定できる
mySize = .S

//WomensSize型の変数を宣言し、値を代入する
var herSize: WomensSize
herSize = .XS

//列挙型の値で処理を割り振る
//WomensSize型を引数にするpacking()関数
func packing(size: WomensSize) -> String {
    var stuff: String
    switch size {
    case .XS, .S:
        stuff = "女性用XS, Sサイズ用品"
    case .M:
        stuff = "女性用Mサイズ用品"
    case .L:
        stuff = "女性用Lサイズ用品"
    }
    return stuff
}
let thestuff = packing(size: .M)
print(thestuff) //"女性用Mサイズ用品"

//列挙型を定義できる場所
//グローバルなSeasonとクラスないだけで有効なGrade
//クラス定義の外に列挙型Seasonを定義するとグローバルな列挙型となる
//クラス定義の中に列挙型Garadeを定義するとそのクラスないでのみ有効な列挙型となる

//Enum ValueにRaw Valueを割り振る
//列挙型Directionを定義する
enum Direction: Int {
    case forward = 1
    case backword //2
    case right //3
    case left //4
}

//列挙型の各値に設定されている値を調べる
let muki1 = Direction.forward
let muki2 = Direction.backword
let muki3 = Direction.right
let muki4 = Direction.left
//enumバリューに設定されているRaw Valueを調べる
print(muki1.rawValue) //muki1すなわちDirection.forwardのRaw Valueを調べている
print(muki2.rawValue)
print(muki3.rawValue)
print(muki4.rawValue)

//値からEnum Valueを割り当てる
//Raw Valueが3のDirectionを調べる
let muki5 = Direction(rawValue: 3)
if let muki = muki5 {
    print(muki)
}

//enumで型を列挙する
//Pattern型を定義する
enum Pattern {
    case Monotone(_: PColor)
    case Border(color1: PColor, color2: PColor)
    case Dots(base: PColor, dot1: PColor, dot2: PColor)
}
enum PColor: String{ //PColorには4色の値がある
    case red = "赤"
    case green = "緑"
    case yellow = "黄"
    case white = "白"
}

//Pattern型の値を作る
let shirt1 = Pattern.Monotone(.red)
let shirt2 = Pattern.Border(color1: .white, color2: .red)
let shirt3 = Pattern.Dots(base: .yellow, dot1: .white, dot2: .green)

//switch文でパターン分けする
//作った値をパターンで分類してみる
let patternList = [shirt1, shirt2, shirt3]
for thePattern in patternList {
    switch thePattern {
    case .Monotone(let c):
        print("\(c.rawValue)の無地")
    case .Border(let c1, let c2):
        print("\(c1.rawValue)と\(c2.rawValue)のボーダー")
    case let .Dots(base, dot1, dot2): //letはbase, dot1, dot2を参照するためつけている(バリューバインディング)
        let bColor = base.rawValue
        let dc1 = dot1.rawValue
        let dc2 = dot2.rawValue
        print("\(bColor)地に\(dc1)と\(dc2)のドット")
    }
}

//enumの中でenumを使う
//enum Patternの中でenum PColorを定義する
enum Pattern1 {
    case Monotone(_: PColor)
    case Border(color1: PColor, color2: PColor)
    case Dots(base: PColor, dot1: PColor, dot2: PColor)
    
    //パターンで使える色
    enum PColor1: String{ //PColorには4色の値がある
        case red = "赤"
        case green = "緑"
        case yellow = "黄"
        case white = "白"
    }
}
