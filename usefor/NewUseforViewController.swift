

import UIKit

class NewUseforViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var typeSegument: UISegmentedControl!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var useforField: UITextField!
    let useforCollection = UseforCollection.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:")
        self.view.addGestureRecognizer(tapRecognizer)
        
        useforField.delegate = self
        priceField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 140/255, blue: 0, alpha: 1)]
        self.navigationController!.navigationBar.tintColor = UIColor(red: 255/255, green: 140/255, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 250/255, blue: 240/255, alpha: 1)
        self.navigationController?.navigationBar.translucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "check"), style: UIBarButtonItemStyle.Plain, target: self, action: "save")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: UIBarButtonItemStyle.Plain, target: self, action: "close")
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func save() {
        if useforField.text!.isEmpty {
            let alertView = UIAlertController(title: "エラー", message: "使用用途が記述されていません", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
        } else if priceField.text!.isEmpty {
            let alertView = UIAlertController(title: "エラー", message: "値段が記述されていません", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)

        } else {
            let usefor = useforField.text!
            let price = priceField.text!
            let type = Type(rawValue: typeSegument.selectedSegmentIndex)
            var typeNum:Int
            
            if type == .consumption {
                typeNum = 0
            } else if type == .investment {
                typeNum = 1
            } else {
                typeNum = 2
            }

            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
            dateFormatter.dateFormat = "yyyy/MM/dd"
            let date = dateFormatter.stringFromDate(NSDate())

            let useforObject = Usefor(usefor: usefor, price: price, type: typeNum, date: date)
            
            self.useforCollection.addUserforCollection(useforObject)
            self.dismissViewControllerAnimated(true, completion: nil)
         }

    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        useforField.resignFirstResponder()
        priceField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        useforField.resignFirstResponder()
        priceField.resignFirstResponder()
        return true
    }
    

    

}
