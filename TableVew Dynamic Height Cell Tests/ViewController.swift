//
//  ViewController.swift
//  TableVew Dynamic Height Cell Tests
//
//  Created by Stanislav Sidelnikov on 10/13/16.
//  Copyright © 2016 Yandex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNib(UINib(nibName: "TestCell1", bundle: nil), forCellReuseIdentifier: "TestCell1")
            tableView.registerNib(UINib(nibName: "TestCell2", bundle: nil), forCellReuseIdentifier: "TestCell2")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func forceReloadData(sender: UIButton) {
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableView cellForRowAtIndexPath.row: \(indexPath.row)")
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TestCell2", forIndexPath: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TestCell1", forIndexPath: indexPath)
            
            if let cell = cell as? TestCell1 {
                cell.mainLabel.text = generateRandomSentence(minLength: 500)
            }
            
            return cell
        }
    }
    
    private func generateRandomSentence(minLength minLength: Int) -> String {
        var sentence = ""
        while sentence.characters.count < minLength {
            sentence += randomWord(Int(arc4random_uniform(19)) + 1) + " "
        }
        return sentence
    }
    
    private func randomWord(length: Int) -> String {
        
        let base = "abcdefghijklmnopqrstuvwxyz"
        var randomString: String = ""
        
        for _ in 0..<length {
            
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.startIndex.advancedBy(Int(randomValue))])"
        }
        
        return randomString
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        print("tableView heightForRowAtIndexPath.row: \(indexPath.row)")
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        print("tableView estimatedHeightForRowAtIndexPath.row: \(indexPath.row)")
        return 60
    }
}

