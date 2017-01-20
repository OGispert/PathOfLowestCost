//
//  ViewController.swift
//  PathOfLowestCost
//
//  Created by Othmar Gispert on 1/18/17.
//  Copyright © 2017 Othmar Gispert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var rowOne: UITextField!
    @IBOutlet weak var rowTwo: UITextField!
    @IBOutlet weak var rowThree: UITextField!
    @IBOutlet weak var rowFour: UITextField!
    @IBOutlet weak var rowFive: UITextField!
    @IBOutlet weak var rowSix: UITextField!
    @IBOutlet weak var rowSeven: UITextField!
    @IBOutlet weak var rowEight: UITextField!
    @IBOutlet weak var rowNine: UITextField!
    @IBOutlet weak var rowTen: UITextField!
    
    var rowOneArray = [Int]()
    var rowTwoArray = [Int]()
    var rowThreeArray = [Int]()
    var rowFourArray = [Int]()
    var rowFiveArray = [Int]()
    var rowSixArray = [Int]()
    var rowSevenArray = [Int]()
    var rowEightArray = [Int]()
    var rowNineArray = [Int]()
    var rowTenArray = [Int]()
    
    var arrayOfMins = [Int]()
    var arrayOfIndex = [Int]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height+10
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }

    @IBAction func getResultsButton(_ sender: UIButton) {
        
        rowOneArray = getNumbers(label: rowOne) as! [Int]
        rowTwoArray = getNumbers(label: rowTwo) as! [Int]
        rowThreeArray = getNumbers(label: rowThree) as! [Int]
        rowFourArray = getNumbers(label: rowFour) as! [Int]
        rowFiveArray = getNumbers(label: rowFive) as! [Int]
        rowSixArray = getNumbers(label: rowSix) as! [Int]
        rowSevenArray = getNumbers(label: rowSeven) as! [Int]
        rowEightArray = getNumbers(label: rowEight) as! [Int]
        rowNineArray = getNumbers(label: rowNine) as! [Int]
        rowTenArray = getNumbers(label: rowTen) as! [Int]
        
        let _ = getResults(myArray: rowOneArray)
        let _ = getResults(myArray: rowTwoArray)
        let _ = getResults(myArray: rowThreeArray)
        let _ = getResults(myArray: rowFourArray)
        let _ = getResults(myArray: rowFiveArray)
        let _ = getResults(myArray: rowSixArray)
        let _ = getResults(myArray: rowSevenArray)
        let _ = getResults(myArray: rowEightArray)
        let _ = getResults(myArray: rowNineArray)
        let _ = getResults(myArray: rowTenArray)
        
        let sum = arrayOfMins.reduce(0, +)
        
        for i in 0...arrayOfMins.count {
            
            if rowOneArray.count < 5 {
                let alert = UIAlertController(title: "Error", message: "Row 1 has to contain at least 5 columns (numbers).", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                    self.arrayOfMins.removeAll()
                    self.arrayOfIndex.removeAll()
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if sum <= 50 && i == arrayOfMins.count {
                    let alert = UIAlertController(title: "Results", message: "Yes \n \(sum) \n \(arrayOfIndex)", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                        self.arrayOfMins.removeAll()
                        self.arrayOfIndex.removeAll()
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                } else if sum > 50 && i < arrayOfMins.count {
                    let alert = UIAlertController(title: "Results", message: "No \n \(sum) \n \(arrayOfIndex)", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                        self.arrayOfMins.removeAll()
                        self.arrayOfIndex.removeAll()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    func getNumbers (label: UITextField) -> Array<Any> {
        
        if label.text != nil {
            let digitsString = label.text
            let values = digitsString?.components(separatedBy: ",")
                .flatMap {
                    Int($0.trimmingCharacters(in: .whitespaces))
            }
            
            return values!
        }
        
        return []
    }
    
    func getResults (myArray: Array<Int>) -> (Array<Any>,Array<Any>) {
        
        if myArray != [] {
            let index = myArray.index(of: myArray.min()!)
            arrayOfIndex.append(index!+1)
            arrayOfMins.append(myArray.min()!)
            return (arrayOfIndex, arrayOfMins)
        }
        
        return ([],[])
    }

}

