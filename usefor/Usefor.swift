
import UIKit

enum Type: Int {
    case consumption = 0
    case investment = 1
    case waste = 2
    
    func color() -> UIColor {
        switch self {
        case .consumption:
            return UIColor(red: 152/255, green: 251/255, blue: 152/255, alpha: 1)
        case .investment:
            return UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        case .waste:
            return UIColor(red: 205/255, green: 92/255, blue: 92/255, alpha: 1)
        }
    }
}

class Usefor: NSObject {
    var usefor: String
    var price: String
    var type: Type
    var date: String

    
    init(usefor: String, price: String, type: Int, date: String) {
        self.usefor = usefor
        self.price = price
        self.type = Type(rawValue: type)!
        self.date = date
    }
    
}


