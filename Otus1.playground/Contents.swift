import Foundation
/// Отличия между объектами в ООП
print("Отличия между объектами в ООП:")
print("")
print("""
Класс - это некий шаблон, который предоставляет абстрактный вид любого объекта. Например, телефон. Он может звонить, заряжаться,
слать смс и т.п.
Объект или Экземпляр класса - это уже конкретная сущность которая сделана по шаблону класса. Например, конкретно ваш телефон.
""")
print("")

/// Придумать пример полиморфизма, и реализовать его.
print("Придумать пример полиморфизма, и реализовать его:")
print("")

class Phone {
    
    var model: String
    var yearOfIssue: Double
    var operatingSystem: String
    
    init(model: String, yearOfIssue: Double, operatingSystem: String) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.operatingSystem = operatingSystem
    }
    
    func call() {
        print("Call from: \(model)")
    }
}

class Iphone: Phone {
    
    func sendSms(text: String) {
        print("SMS: \(text)")
    }
}

class Galaxy: Phone {
    
    override func call() {
        print("Call from: \(model) by \(operatingSystem)")
    }
    
    func sendMms() {
        print("sendMms")
    }
}

class GalaxyS6: Galaxy {
    
    override func sendMms() {
        print("send MMS from: \(model)")
    }
}

let phone = Phone(model: "OnePlus", yearOfIssue: 2010, operatingSystem: "Android 6")
phone.call()
let iphone = Iphone(model: "6+", yearOfIssue: 2012, operatingSystem: "IOS 7")
iphone.call()
print("")

// Создать очередь выполнения используя замыкания.
print("Создать очередь выполнения используя замыкания:")
print("")

func printOne(completion: @escaping () -> Void) {
    print("1")
    completion()
}

func printTwo(completion: @escaping () -> Void) {
    sleep(1)
    print("2")
    completion()
}

func printThree(completion: @escaping () -> Void) {
    sleep(1)
    print("3")
    sleep(1)
    completion()
}

printOne {
    printTwo {
        printThree {
            print("Done 😃")
        }
    }
}
