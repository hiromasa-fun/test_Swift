//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 *Chapter 3 関数、クロージャ
 */

/*
 *Section 3-1 関数を定義する
 */
//1~6の中から整数を１個選んで返す
func dice() -> Int {
    let number = 1 + arc4random_uniform(5)
    return Int(number)
}

//dice()を5回実行する
for _ in 1...5 {
    let num = dice()
    print(num)
}

//関数を定義する場所

//戻り値がない関数
//ハローと出力する関数
func hello() {
    print("ハロー")
}
func hello1() -> Void {
    print("ハロー")
}

func hello2() -> () {
    print("ハロー")
}

//関数の処理を途中で抜ける guard-else文
//guard-else文を使って中断処理を書いた場合
func half(num: Double) {
    //中断処理
    guard num>=10 else {
        //numが10以上でない時関数から抜ける
        return
    }
    //値を半分にして出力する
    let halfNum = num/2
    print("\(num)の半分は\(halfNum)")
}

//処理を抜ける前に必ず実行する defer文
//最後に必ず実行するdefer文がある関数
func half1(num: Double) {
    defer {
        print("計算終了")
    }
    //中断処理
    guard num>=10 else {
        //numが10以上でない時関数から抜ける
        return
    }
    //値を半分にして出力する
    let halfNum = num/2
    print("\(num)の半分は\(halfNum)")
}

/*
 *Section 3-2 引数がある関数
 */

//3人分の料金を計算する
func price1(ninzu: Int) -> Int {
    let tanka = 1200
    let result = tanka + ninzu
    return result
}

//人数を引数で渡す

//引数があるかんすを実行する

//price1()を定義して5人の料金を計算する

//短歌と人数を引数で指定して料金を計算する関数

//1人1300円、3人の場合の料金を計算する

//引数の個数を指定しない
//引数を合計する

//合計を求める

//引数に初期値を設定する
//引数に初期値がある関数

//greeting()を試す

//単価、人数(初期値１)、送料(初期値250)を指定して料金を計算する関数

//price3()を使って計算する

//複数の戻り値がある計算
//2つの戻り値がある関数

//3科目テスト結果

/*
 *Section3-3 外部引数名を付ける
 */
//引数に外部引数名を付ける
//外部引数名がある関数 bmi()

//bmi()を計算する

//外部引数名が_の関数

/*
 *Section3-4 関数の高度な利用
 */
//関数の多重定義(オーバーロード) 同じ関数名でも引数が異なれば違う関数と認識される
//3種類のcalc()を多重定義する
//a, bの引数
func calc(a: Int, b: Int) -> Int {
    return a + b
}
//c, dの引数
func calc(c: Int, d: Int) -> Int {
    return c * d
}
//a, b, cの引数
func calc(a: Int, b: Int, c: Int) -> Int {
    return (a + b) * c
}

//3種類のcalc()を試す
let ans1 = calc(a: 2, b: 3)
let ans2 = calc(c: 2, d: 3)
let ans3 = calc(a: 2, b: 3, c: 4)

print(ans1)
print(ans2)
print(ans3)

//ジェネリクスな関数 <T>
//作成日時を付けたタプルを作る
func makeFunc<T>(value: T) -> (id: T, data: NSDate) {
    let now = NSDate()
    return (value, now)
}

//makeTuple()でタプルを作る
let tuple1 = makeFunc(value: "abc")
let tuple2 = makeFunc(value: 123)
print(tuple1)
print(tuple2)
print(tuple1.id)
print(tuple2.data)

//変数に関数を代入する
//calc()を定義する
func calc(tanka: Int, kosu: Int) -> Int {
    return tanka * kosu
}

//calc関数を変数mycalcに代入して使う
let myCalc = calc(tanka: kosu:) //calc()と同じ関数になる
let kingaku = myCalc(280, 4)
print(kingaku)

//関数を引数にする
//関数を引数で受け取って実行する message()
func message(user: String, msgFunc: (String) -> String) -> String {
    let msg = msgFunc(user)
    return msg
}

//hello()とbye()を定義する
func hello(user: String) -> String {
    return ("\(user)さん、ハロー")
}
func bye(user: String) -> String {
    return("\(user)さん、バイ！")
}

//message()を実行する
let msg1 = message(user: "田中", msgFunc: hello)
let msg2 = message(user: "鈴木", msgFunc: bye)

//関数を関数の値として返す
//年齢で利用する関数で遊ぶ
func priceFunc(age: Int) -> (Int) -> Int {
    if age<16 {
        return kids
    } else {
        return adult
    }
}
//子供の計算
func kids(kazu: Int) -> Int {
    return 400 * kazu
}
//大人の計算
func adult(kazu: Int) -> Int {
    return 600 * kazu
}

//priceFunc()を10歳と18歳で試す
let age10 = priceFunc(age: 10) //return kids
let age18 = priceFunc(age: 18) //return adult
//それぞれの関数で人数を指定する
let kingaku1 = age10(1)
let kingaku2 = age18(2)
print(kingaku1)
print(kingaku2)

//関数のネスティング
//priceFunc()の中でkids()とadult()を定義する
func priceFunc1(age: Int) -> (Int) -> Int {
    //子供の計算
    func kids(kazu: Int) -> Int {
        return 400 * kazu
    }
    //大人の計算
    func adult(kazu: Int) -> Int {
        return 600 * kazu
    }
    
    if age<16 {
        return kids
    } else {
        return adult
    }
}
let age11 = priceFunc1(age: 18)
let kingaku11 = age11(2)

/*
 *Section3-5 クロージャ
 */
//クロージャの書式
//クロージャを変数に代入する
let myFunc = {(a: Int, b: Int) -> Int in //myFuncの型は(Int, Int) -> Int
    return a + b
}
let ans = myFunc(1, 2)
print(ans)

//クロージャを引数で受け取る関数
//map()を使って入れるの値をすべて2倍にする
let numbers = [4, 7, 2, 9]
//配列の全ての値を2倍にする
let array1 = numbers.map({(v: Int) -> Int in //map()関数は指定の配列に入っている全ての値に対してクロージャで指定した処理を実行する
    return v * 2
})
print(array1)

//接尾クロージャで書いた書式 ()から出してmapの後ろに書くことができる
let array2 = numbers.map{(v: Int) -> Int in
    return v * 2
}

//型推論を利用し、returnも省略した書式
let array3 = numbers.map{v in v*2} //一行ステートメントであればreturnも省略できる

//引数を省略した書式
let array4 = numbers.map{$0*2} //クロージャの引数の値は$0. $1. $2と順に参照できる

//map()を使った配列の値を全て小文字にする(通常)
let colors = ["Red", "Blue", "GREEN"]
//全ての文字を小文字にする
let colorSmall = colors.map{str in str.lowercased()}
print(colors)
print(colorSmall)

//map()を使って入れの値を全て小文字にする(クロージャ)
let colorSmall112 = colors.map{$0.lowercased()}
