//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * Chapter7 集合
 */

/*
 *Section7-1 セットを作る
 */

//集合とは
//セットを作る
//配列からセットを作る
let colorSetA: Set<String> = ["red", "green", "blue"]
let colorSetB: Set = ["yellow", "pink", "green"]

//空のセットを作る
var numSetA: Set<Int> = []
var charaSetB = Set<Character>()

//空のセットに値を追加する
var numSetA1: Set<Int> = []
numSetA.insert(3)
numSetA.insert(5)
numSetA.insert(7)
numSetA.insert(3) //重複したものは無視される
print(numSetA)

//セットの値を削除する
//セットから値を取り除く
var colorSet: Set = ["red", "yellow", "black", "green"]
if let theColor = colorSet.remove("black") {
    print("\(theColor)を取り除きました。")
} else {
    print(colorSet)
}

//セットの値の個数を調べる
//セットの値の個数を調べる
let numSet: Set<Int> = [10, 20, 30, 40]
if numSet.isEmpty {
    print("numSetは空です。")
} else {
    print("numSetには\(numSet.count)個の値が入っています。")
}

//値がセットに入っているかどうか調べる (帰属関係)
//セットlunchSetに"チャイ"が含まれているか
let lunchSet: Set = ["カレー", "ナン", "チャイ"]
let member = "チャイ"
if lunchSet.contains(member) {
    print("セットには\(member)が含まれています。")
} else {
    print("セットには\(member)は含まれていません。")
}

//セットから全ての値を取り出す
//セットから値が小さい順に取り出す
let numSet1: Set<Double> = [3.2, 5.8, 1.4, 9.6, 5.5, 2.7]
//numSetから値が小さい順に取り出す
for num in numSet.sorted() {
    print(num, terminator: "点, ")
}

//インデックスで値に参照する
//セットの先頭の値
let colorSet1: Set = ["yellow", "blue", "red", "green"]
//値の並びの確認
print(colorSet1) //セットの並びは配列で作成した際の順番にはならないが、参照するたびに変化するわけでもない。
//セットの最初の値
print(colorSet1[colorSet1.startIndex])

/*
 *Section7-2 セットの集合演算
 */

//基本的な集合演算
//aSetとbSetの要素を組み合わせたセットで作る
let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]
let cSet = aSet.union(bSet)
print(cSet) //["リンゴ", "みかん", "桃", "イチゴ", "スイカ", "バナナ"] ←並び順は適当

//aSetとbSetで共通した要素のセットを作る
let cSet1 = aSet.intersection(bSet)
print(cSet1) //["みかん", "イチゴ"] ←並び順は適当

//aSetからbSetの要素を取り除いたセットを作る
let cSet2 = aSet.subtracting(bSet)
print(cSet2) //["リンゴ", "桃"] ←並び順は適当

//aSet, bSetの一方のみに含まれている要素のセットを作る
let cSet3 = aSet.symmetricDifference(bSet)
print(cSet3) //["リンゴ", "桃", "スイカ", "バナナ"] ←並び順は適当

//セットの比較と包含関係
//セットに含まれている要素が同じかどうか比較する
let aSet1: Set<Int> = [5, 6, 7, 8]
let bSet1: Set<Int> = [7, 8, 5, 6]
let cSet4: Set<Int> = [4, 5, 6, 7]
print(aSet1 == bSet1) //true
print(aSet1 != cSet4) //true

//aSetとbSetに共通した値があるかどうか調べる
let aSet2: Set<Int> = [5, 6, 7, 8]
let bSet2: Set<Int> = [1, 8, 2, 5]
if aSet2.isDisjoint(with: bSet2) {
    print("aSetとbSetには共通した値が１つもありません。")
} else {
    print("aSetとbSetには共通した値があります。")
    print(aSet2.intersection(bSet2)) //共通している値を取り出す
}

//bSetがaSetのサブセット(部分集合)かどうか調べる
let aSet3: Set<String> = ["a", "b", "c", "d"]
let bSet3: Set<String> = ["a", "c"]
if bSet3.isSubset(of: aSet3) {
    print("bSetはaSetのサブセットです")
} else {
    print("bSetはaSetのサブセットではありません")
}

//aSetがbSetのスーパーセット(上位集合)かどうか調べる
if aSet3.isSuperset(of: bSet3) {
    print("aSetはbSetのスーパーセットです")
} else {
    print("aSetはbSetのスーパーセットではありません")
}
