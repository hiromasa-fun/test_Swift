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


/*
 *Section 9-3 Computedプロパティとプロペティオブザーバー
 */

//Computedプロパティ
//ComputedプロパティareaをもったCircleクラス
class Circle {
    //半径
    var radius: Double = 1.0
    //面積
    var area: Double {
        get {
            //M_PIは警告が出るのでDouble.pi
            return radius * radius * Double.pi //areaの値を計算して返す
        }
        //面積を設定する（半径を設定する）
        set (menseki) {
            radius = sqrt(menseki / Double.pi) //areaの値を設定すると見せて、実際はradiusの値を設定する
        }
    }
}

//Circleクラスで円を作って面積を２倍に設定する
//円を作る
let myCircle = Circle()
//初期値の半径と面積
print("半径\(myCircle.radius)") //radiusからareaを計算した値が返ってくる
print("面積\(myCircle.area)")
//面積を２倍にする
myCircle.area *= 2
print("半径\(myCircle.radius)") //areaからradiusが計算されて設定される
print("面積\(myCircle.area)")
//半径を3.0にする
myCircle.radius = 3.0
print("半径\(myCircle.radius)")
print("面積\(myCircle.area)")

//リードオンリーのareaプロパティがあるCircleクラス
class Circle1 {
    //半径
    var radius: Double = 1.0
    //面積
    var area: Double {
        return radius * radius * Double.pi //setブロックがない場合は、値をreturnで返すだけでリードオンリーになる
    }
}

//Circle1クラスの面積を求める
let myCircle1 = Circle1()
myCircle1.radius = 10
let menseki = myCircle1.area
print(menseki)
//areaプロパティはリードオンリーなので、値を設定するコードを書くとエラーになる
//myCircle1.area = 300

//プロパティオブザーバー
//levelが変更された回数を数える
class Player {
    var times = 0
    var level: Int {
        willSet { //levelの更新直前に実行される
            print("----------------")
            print("willSet \(newValue)")
        }
        didSet { //levelの更新直後に実行される
            if oldValue != level {
                times += 1
                print("\(times)回目の更新")
                print("\(oldValue) → \(level)")
            } else {
                print("値は変化無し")
            }
        }
    }
    //イニシャライザ
    init() {
        level = 0
    }
}

//プロパティを更新して試す
var thePlayer = Player()
thePlayer.level = 10
thePlayer.level = 10 //値が変化しないのでカウントしない
thePlayer.level = 15


/*
 *Section 9-4 クラスメンバー
 */

//クラスメンバーとインスタンスメンバー
//クラスプロパティ（タイププロパティ）を定義する
//クラスプロパティを宣言する
class Car {
    //クラスプロパティ
    static var count = 0
    
    //インスタンスプロパティ
    var moving = false
    
    //インスタンスメソッド
    func start() {
        Car.count += 1
        moving = true
    }
    
    func stop() {
        if Car.count > 0 {
            Car.count -= 1
            moving = false
        }
    }
}

//クラスプロパティを参照する
let car1 = Car()
let car2 = Car()
print("動いている車は \(Car.count)台")
car1.start()
car1.start()
print("動いている車は \(Car.count)台")
car1.stop()
print("動いている車は \(Car.count)台")

//Computedクラスプロパティ
//radiusクラスプロパティとComputedのdegreeクラスプロパティがるMyCalssクラス
class MyClass4 {
    static var radian: Double = 0.0
    
    //Computedクラスプロパティdegree
    class var degree: Double {
        get {
            //radianをディグリに変換して返す
            let dosu = radian * 90/Double.pi
            return dosu
        }
        //値の設定
        set(dosu) {
            //設定値をラジアンに変換してradianに設定する
            radian = dosu * Double.pi/90
        }
    }
}

//degreeクラスプロパティを18度に設定する
//傾きを18度に設定する
MyClass4.degree = 18
let katamuki = MyClass4.degree
print("\(katamuki)度")

//radiusクラスプロパティをπ/2に設定する
MyClass4.radian = Double.pi / 2
let katamuki1 = MyClass4.degree
print("\(katamuki1)度")

//クラスメソッド（タイプメソッド）を定義する
//Messageクラスのhelloクラスメソッド
class Message {
    //クラスメソッド
    class func hello() -> String {
        return "こんにちは"
    }
}

//Messageクラスのhelloクラスメソッドを実行する
let msg = Message.hello()
print(msg)

/*
 *Section 9-5 アクセス権 internal private open public
 */

//internalのアクセス権が省略されている状態がデフォルト
//privateは同一ファイルからのみアクセスできるメンバーとなる
//openは継承、オーバーライド可能
//publicはオーバーライド可能

//privateのプロパティを持ったクラスの例
//Gameクラスファイルを作る
class Game {
    //他のクラスからアクセス不可
    private var point = 0.0 //他クラスからは見えない
    private(set) var level = 0 //他クラスからは取得のみできる
    
    //得点を追加する
    func addPoint(value: Double) {
        point += value
        level = Int(floor(point/3)) //pointを3で割った値の小数点を切り捨てて整数かする
    }
}

//Gameクラスのインスタンスを作って操作する
//Gameクラスのプレーヤを作る
let player1 = Game()
let player2 = Game()

//プレーヤが得点を獲得する
player1.addPoint(value: 5)
player2.addPoint(value: 7)

//プレーヤのレベルを確認する
print("player1：レベル\(player1.level)")
print("player2：レベル\(player2.level)")

//他クラスから参照するとprivateなのでアクセス権がないというエラーが起きる
//player1.point = 10
//player1.level = 5

/*
 *Section 9-6 クラスの拡張
 */

//エクステンションを使ったクラス拡張
//Playerクラス
class Player3 {
    var name: String = ""
    
    func hello() {
        print("やあ！" + name)
    }
}

//Playerクラスを拡張する
extension Player3 {
    //nameをwhoでもアクセスできるようにする
    var who: String {
        get {
            return name
        }
        set (value) {
            name = value
        }
    }
    //新しいメソッドを追加する
    func bye() {
        print("またね！" + name)
    }
}

//Playerクラスに拡張したプロパティメソッドを使う
let obj = Player3()
obj.who = "海子"
obj.hello()
obj.bye()

//標準のUIColorクラスにクラスプロパティを追加する
extension UIColor {
    //若草色
    class var wakakusa: UIColor {
        //#ABC900
        return UIColor(red: 0.6706, green: 0.7882, blue: 0.0, alpha: 1)
    }
    //紅赤色
    class var beniaka: UIColor {
        return UIColor(red: 0.898, green: 0.0, blue: 0.3098, alpha: 1)
    }
}
//標準の色
let color1 = UIColor.red
//拡張した色
let color2 = UIColor.wakakusa
let color3 = UIColor.beniaka

//クラスの継承（スーパークラスとサブクラス）
//クラス継承を使った例
//UIViewControllerクラスを継承したViewControllerクラス

//スーパークラスのメソッドをオーバーライドする override
//ViewControllerクラスでオーバーライドしているメソッド
//viewDidLoad()とdidReceiveMemoryWarning()の２つのメソッドはUIViewControllerクラスで定義済みのメソッドをオーバーライドしている

//スーパークラスのメソッドを実行する super
//super.viewDidLoad()というのは、スーパークラス(UIViewController)で定義されているviewDidLoad()を先に実行している

//継承やオーバーライドを制限する final
//他のクラスから継承を禁止しているMyClassクラス
final class MyClass5 { //MyClass5クラスを継承したクラスを作ることを禁止する
    func hello() {
        print("ハロー")
    }
}

//サブクラスからオーバーライドできないhello()メソッド
class Message1 {
    //オーバーライドを禁止
    final func hello() { //サブクラスでhello()をオーバーライドすることを禁止する
        print("ハロー")
    }
}

//プロトコルとは
//プロトコルを定義する
//GmaeProtocolプロトコルの定義
protocol GameProtocol {
    var gamePoint: Int { get }
    func hit()
    func miss()
}

//プロトコルを採用する
//GameProtocolプロトコルを採用しているMyGameクラス
class MyGame: GameProtocol {
    private var total = 0
    //プロトコルに従って実装するプロパティ
    var gamePoint: Int {
        get {
            return total
        }
    }
    //プロトコルに従って実装するメソッド
    func hit() {
        total += 10
        print("ヒットしました。 +10")
    }
    func miss() {
        total /= 2
        print("ミスった！半減")
    }
}

//MyGameクラスのインスタンスを試す
let myGameObj = MyGame()
//ゲーム開始
myGameObj.hit()
print(myGameObj.gamePoint)
myGameObj.gamePoint
print(myGameObj.gamePoint)
myGameObj.hit()
print(myGameObj.gamePoint)

