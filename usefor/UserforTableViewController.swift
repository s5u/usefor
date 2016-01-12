

import UIKit

class UserforTableViewController: UITableViewController {
    let userforCollection = UseforCollection.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        userforCollection.fetchUserfors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 140/255, blue: 0, alpha: 1)]
        self.navigationController!.navigationBar.tintColor = UIColor(red: 255/255, green: 140/255, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 250/255, blue: 240/255, alpha: 1)
        self.navigationController?.navigationBar.translucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "note"), style: UIBarButtonItemStyle.Plain, target: self, action: "newUsefor")
        self.tableView.reloadData()
    }
    
    func newUsefor() {
        self.performSegueWithIdentifier("NewUseforViewController", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.userforCollection.usefors.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "reuseIdentifier")
        let usefor = self.userforCollection.usefors[indexPath.row]
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("UseforTableViewCell", forIndexPath: indexPath) as! UseforTableViewCell
//        let usefor = self.userforCollection.usefors[indexPath.row]
//        cell.useforField.text = usefor.usefor 
//        cell.dateField.text = usefor.date
//        cell.priceField.text = usefor.price
//        cell.backgroundColor = usefor.type.color()
        
        cell.textLabel?.text = usefor.usefor
        cell.detailTextLabel?.text = usefor.price + "円" + " " + usefor.date
        cell.detailTextLabel?.textColor = UIColor.blackColor()
        cell.textLabel?.font = UIFont(name: "HirakakuProN-W3", size: 15)
        cell.detailTextLabel?.font = UIFont(name: "HirakakuProN-W3", size: 12)
        cell.backgroundColor = usefor.type.color()




        return cell
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let usefor = self.userforCollection.usefors[sourceIndexPath.row]
        self.userforCollection.usefors.removeAtIndex(sourceIndexPath.row)
        self.userforCollection.usefors.insert(usefor, atIndex: destinationIndexPath.row)
        self.userforCollection.save()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            self.userforCollection.usefors.removeAtIndex(indexPath.row)
            self.userforCollection.save()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        default:
            return
        }
    }


}
