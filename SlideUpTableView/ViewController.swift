//
//  ViewController.swift
//  SlideUpTableView
//
//  Created by Shali Liu on 4/17/15.
//  Copyright (c) 2015 Shali Liu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var menuTableView: UITableView!
    
    private var headerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.layer.cornerRadius = 7
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        view.addSubview(menuTableView)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var frame = self.menuTableView.frame
        frame.origin.y += menuTableView.frame.height
        self.menuTableView.frame = frame
    }
    
    override func viewDidAppear(animated: Bool) {
        if (menuTableView.indexPathForSelectedRow() != nil) {
            menuTableView.deselectRowAtIndexPath(menuTableView.indexPathForSelectedRow()!, animated: true)
        }
        
        UIView.animateWithDuration(10, animations: {
            var frame = self.menuTableView.frame
            frame.origin.y -= self.menuTableView.frame.height
            self.menuTableView.frame = frame
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let label = UILabel(frame: CGRectMake(0, 0, 300, 40))
        label.text = "Test Cell \(indexPath.row)"
        cell.contentView.addSubview(label)
        
        return cell
    }
}
