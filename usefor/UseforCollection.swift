
import UIKit

class UseforCollection: NSObject {
    static let sharedInstance = UseforCollection()
    
    var usefors:[Usefor] = []
    
    func addUserforCollection(usefor: Usefor) {
        self.usefors.append(usefor)
        self.save()
    }
    
    func save() {
        var useforList: Array<Dictionary<String, AnyObject>> = []
        for usefor in usefors {
            let useforDic = UseforCollection.convertDictionary(usefor)
            useforList.append(useforDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(useforList, forKey: "useforList")
    }
    
    class func convertDictionary(usefor: Usefor) -> Dictionary<String, AnyObject> {
        var dic = Dictionary<String, AnyObject>()
        dic["usefor"] = usefor.usefor
        dic["price"] = usefor.price
        dic["type"] = usefor.type.rawValue
        dic["date"] = usefor.date
        return dic
    }
    
    class func convertUseforModel(attributes: Dictionary<String, AnyObject>) -> Usefor {
        let usefor = attributes["usefor"] as! String
        let price = attributes["price"] as! String
        let type = Type(rawValue: attributes["type"] as! Int)
        var typeNum:Int
        
        if type == .consumption {
            typeNum = 0
        } else if type == .investment {
            typeNum = 1
        } else {
            typeNum = 2
        }
        let date = attributes["date"] as! String
        
        let useforObject = Usefor(usefor: usefor, price: price, type: typeNum, date: date)

        return useforObject
    }
    
    func fetchUserfors() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let useforList = defaults.objectForKey("useforList") as? Array<Dictionary<String, AnyObject>> {
            for useforDic in useforList {
                let usefor = UseforCollection.convertUseforModel(useforDic)
                self.usefors.append(usefor)
            }
        }
    }
    
}
