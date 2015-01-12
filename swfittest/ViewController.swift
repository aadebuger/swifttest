//
//  ViewController.swift
//  swfittest
//
//  Created by Robert Qiu on 1/9/15.
//  Copyright (c) 2015 Robert Qiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ctrl3 = SwiftViewController(dataItems: ["Item1","Item2"],cellStyle: UITableViewCellStyle.Default);
        self.view.addSubview(ctrl3.view);
        if ctrl3.tableView != nil {
            ctrl3.tableView.reloadData();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



public class SwiftViewController : UITableViewController {
    
    public var _dataItems : [String]?;
    public var _cellStyle : UITableViewCellStyle?;
    
    public init(dataItems aDataItems:[String], cellStyle aCellStyle:UITableViewCellStyle)
    {
        
        super.init(style:UITableViewStyle.Plain);
        
        self._dataItems = aDataItems;
        self._cellStyle = aCellStyle;
    }
    
    public override init(style aStyle: UITableViewStyle) {
        super.init(style: aStyle);
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    public required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
        _dataItems = [];
        self._cellStyle = UITableViewCellStyle.Default;
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var c = self._dataItems!.count;
        return c;
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let rowId = "cellId";
        var cell = tableView.dequeueReusableCellWithIdentifier(rowId) as UITableViewCell?;
        if (cell == nil)
        {
            cell = UITableViewCell(style: self._cellStyle!, reuseIdentifier: rowId)
        }
        
        var item = _dataItems![indexPath.row];
        
        cell?.textLabel.text = item;
        
        return cell!;
    }
    
}

