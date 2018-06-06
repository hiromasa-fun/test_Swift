//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * Chapter5 配列 Array
 */

/*
 *Section5-1 配列を作る
 */

//配列を作る
let strArray = ["a", "b", "c", "d", "e"]
let intArray = [1, 2, 3, 4, 5]
var boolArray = [true, true, false, false]
var tupleArray = [(0, 0), (100, 120), (180, 200)]
//trueを追加する
boolArray.append(true)
//先頭の値を(1, 1)に変更する
tupleArray[0] = (1, 1)
print(strArray)
print(intArray)
print(boolArray)
print(tupleArray)

//値の方を限定した配列を作る
//array:[値の型]で型指定した配列
let color: [String] = ["red", "blue", "green"]
let numList: [Int] = [12, 34, 56, 78, 90]
var resultList: [Bool]
resultList = [true, false, true, false]

//array:Array<値の型>で型指定した配列
let color1 :Array<String> = ["red", "blue", "green"]
var numList1 :Array<Int> = [12, 34, 56, 78, 90]
var resultList1: Array<Bool>
resultList1 = [true, false, true, false]

//型推論で型が設定されている配列
//idListは型推論で[String]に設定される
var idList = ["a1", "a2", "a3"]
idList = [1, 2, 3] //エラー

//空の配列
//値が空の配列を作る
var strArray2 = [String]()
var intArray2 = [Int]()
var doubleArray = Array<Double>()
//値を設定する
strArray2 = ["a", "b", "c"]
intArray2 = [1, 2, 3]
doubleArray = ["a", "b", "c"] //エラー

//配列が空かどうか調べる
var theArray = [1, 2, 3]
theArray = [] //配列を空にする
if theArray.isEmpty {
    print("theArrayは空の配列です")
}

//配列の値の個数を調べる
let aArray = [11, 22, 33, 44, 55]
print(aArray.count)

//配列を同じ値で初期化する
//配列の値を同じ値で埋めて初期化する
let zeroList = [Double](repeating: 0.0, count: 10)
let xList = [String](repeating: "未設定", count: 5)
print(zeroList)
print(xList)

//連続番号が入った配列を作る
//-3~3が入った配列を作る
let numList2 = [Int](-3...3)
print(numList2)

//5~9が入った配列を作る
let numbers = Array<Int>(5..<10)
print(numbers)

//配列と配列を連結する
let basicCourse = ["ラン", "スイム"]
let fullCourse = basicCourse + ["バイク", "カヌー"]
print(basicCourse)
print(fullCourse)

/*
 *Section5-2 配列から値を取り出す
 */

//配列の値にアクセスする
//配列の値を位置を示して取り出す
let abcArray = ["a", "b ", "c", "d", "e", "f", "g", "h", "i"]
let str1 = abcArray[0]
let str2 = abcArray[2]
let newArray = abcArray[4...6] //配列[インデックス番号]のように位置を指してアクセスする書式をsubscriptと呼ぶ
print(str1)
print(str2)
print(newArray)

//配列の値を入れ替える
var theArray1 = ["a", "b ", "c", "d", "e", "f", "g", "h", "i"]
theArray1[0] = "あ"
theArray1[2] = "いう"
theArray1[4...6] = ["赤", "白", "黄色", "青", "緑"] //e, f, gと置き換わる

//多次元配列(配列のネスティング)
//2次元配列の値を操作する
var nestArray = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
let theValue = nestArray[1][2] // = "b3"
nestArray[2][0] = "Hello" //"c1" → "Hello"
print(nestArray)

//配列からすべての値を取り出す
//配列の値の合計、平均値、最小値、最大値
let numArray = [53, 45, 67, 81, 77]
var sum = 0
var min = Int.max //Int最大値
var max = Int.min //Int最小値
//numArrayからすべての値を1個ずつ取り出す
for item in numArray {
    sum += item //合計する
    if item < min {
        min = item //小さい方に置き換える
    } else if item > max {
        max = item
    }
}
//平均を求める
let ave = Double(sum)/Double(numArray.count)
print("合計\(sum), 平均\(ave), 最小\(min), 最大\(max)")

//配列からインデックス番号を取り出す
let colorList = ["bulew", "yellow", "red", "green"]
for (index, value) in colorList.enumerated() { //eunmerated()を利用すると、同時にindex番号をタプルに取り出すことができる
    print((index, value))
}

//配列の最初の値と最後の値を取り出す
//最初の値と最後の値を取り出す
let emptyArray = [Int]()
let abcArray1 = ["a", "b", "c", "d"]
print("先頭は\(emptyArray.first), 最後は\(emptyArray.last)") //emptyArray[0]だとインデックスエラーになるが、.firstはエラーにならずnilが返る
print("先頭は\(abcArray1.first!), 最後は\(abcArray1.last!)")

//値をソートする sort(), sorted()
//配列の値を大きさで並べ換える
var ageArray = [34, 23, 31, 26, 28, 22]
ageArray.sort()
print(ageArray)

//配列fruitをソートして配列fruitSortedを作る
let fruit = ["orange", "apple", "pineapple", "banana"]
let fruitSorted = fruit.sorted() //ソート済みの新しい配列が作られます(ABC順)
print(fruit)
print(fruitSorted)

/*
 *Section5-3 配列の値の追加と削除
 */

//配列の値を追加・挿入する
//配列の最後に値を追加する
var colors = ["red", "green"]
colors.append("yellow")
print(colors)

//配列の途中に値を挿入する
var aList = ["a", "b", "c", "d"]
aList.insert("XYZ", at: 2) //"c"の手前に挿入
print(aList)

//配列の値を削除する
//配列からインデックス番号2の値を取り除く
var colorArray = ["red", "blue", "green", "black", "white"]
let delColor = colorArray.remove(at: 2)
print("\(delColor)を削除しました。\(colorArray)")

//配列から最初の値を取り除く
var colorArray1 = ["red", "blue", "green", "black", "white"]
let delColor1 = colorArray.removeFirst()
print("\(delColor1)を削除しました。\(colorArray1)")

//配列から最後の値を取り除く
var colorArray2 = ["red", "blue", "green", "black", "white"]
let delColor2 = colorArray.removeLast()
print("\(delColor2)を削除しました。\(colorArray2)")

//配列からすべての値を取り除く
var colorArray3 = ["red", "blue", "green", "black", "white"]
colorArray.removeAll() //配列そのものが消されるわけではない
print(colorArray2)

//配列の複製
//配列のコピー渡しを確認する
var array1 = [1, 2, 3]
let array2 = array1 //配列の複製
array1[0] = 99
print("array1\(array1)")
print("array2\(array2)")
