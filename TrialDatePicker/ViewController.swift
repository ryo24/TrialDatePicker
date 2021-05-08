//
//  ViewController.swift
//  TrialDatePicker
//
//  Created by RYO YAMAMOTO on 2021/02/17.
//

import UIKit

class ViewController: UIViewController {
    
    var todayDate: Date = Date()
    var targetDate: Date = Date()

    
    @IBOutlet var diffLabel:UILabel!
    @IBOutlet var todayDateLabel: UILabel!
    @IBOutlet var selectedDateLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
                
        formatter.dateFormat = "yyyy-MM-dd"
        
        todayDateLabel.text = formatter.string(from: Date())
    }
    
    
    @IBAction func calcDateDiff(){
        var diff : DateInterval
        if todayDate > targetDate {
            diff = DateInterval(start: targetDate,end: todayDate)

        }else{
            diff = DateInterval(start: todayDate,end: targetDate)

        }
        //表示
        print(diff)
        diffLabel.text = String(format: "%.0f" ,(diff.duration)/(60*60*24))
    }
    
    @objc func dateChange(){
        targetDate = datePicker.date
        selectedDateLabel.text = String(formatter.string(from: datePicker.date))
    }

}

