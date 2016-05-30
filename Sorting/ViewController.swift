//
//  ViewController.swift
//  Sorting
//
//  Created by YANGSHENG ZOU on 2016-05-28.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var unsortedTextField: UITextField!
    @IBOutlet weak var sortAlg: UISegmentedControl!
    var array:Array<Int>?
    var resultString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sort(sender: AnyObject) {
        if(unsortedTextField.text?.characters.count>0){
            let stringArray = unsortedTextField.text?.componentsSeparatedByString(" ")
            
            array = stringArray!.map{Int($0)!}
            
            switch sortAlg.selectedSegmentIndex {
                
                
            case 0:
                resultString = "quicksort:\n"
                quickSort(0,right: array!.count-1)
                
            case 1:
                resultString = "heapsort:\n"
                heapSort()
                
            default:
                resultString = "mergesort:\n"
                mergeSort(0,right: array!.count-1)
                
            }
            resultTextView.text = resultString
        }
    }
    
    func quickSort(left:Int, right:Int) {
        
        var a = left
        var b = right
        let key = array![left]
        
        if(a==b){
            return
        }
        
        while a<b  {
            
            while (a<b) && (key <= array![b]){
                
                b = b - 1
            }
            array![a] = array![b]
            array![b] = key
            
            while (a<b) && (key >= array![a]){
                
                a = a + 1
            }
            array![b] = array![a]
            array![a] = key
        }
        
        resultString = resultString.stringByAppendingFormat("%@\n", (array?.description)!)
        
        if a>left {
            quickSort(left, right: a-1)
        }
        if a<right{
            quickSort(a+1, right: right)
        }
        
        
    }
    
    
    func mergeSort(left:Int, right:Int) {
        if(right>left){
            
            mergeSort(left, right: (left+right)/2)
            mergeSort((left+right)/2+1, right: right)
            var a1 = left
            var a2 = (left+right)/2+1
            let b1 = (left+right)/2
            let b2 = right
            var temp = Array.init(count: right-left+1, repeatedValue: 0)
            for index in 0...right-left {
                
                if (a1 > b1){
                    
                    temp[index] = array![a2]
                    a2 = a2 + 1
                    
                }
                else if (a2 > b2){
                    temp[index] = array![a1]
                    a1 = a1 + 1
                }
                    
                else if (array![a1] > array![a2]){
                    temp[index] = array![a2]
                    a2 = a2 + 1
                }
                else {
                    temp[index] = array![a1]
                    a1 = a1 + 1
                }
                
                
            }
            for index in 0...right-left{
                array![index+left] = temp[index]
                
            }
            resultString = resultString.stringByAppendingFormat("%@\n", (array?.description)!)
        }
    }
    
    func heapSort() {
        
        for i in 0...array!.count-1 {
            heapAdjust(array!.count-1-i,range: array!.count-1)
        }
        resultString = resultString.stringByAppendingFormat("%@\n", (array?.description)!)
        
        for i in 0..<array!.count-1 {
            let range = array!.count-1-i-1
            exchange(0, j:range+1)
            resultString = resultString.stringByAppendingFormat("%@\n", (array?.description)!)
            heapAdjust(0,range: range)
          //  resultString = resultString.stringByAppendingFormat("%@\n", (array?.description)!)
        }
    }

    
    func  heapAdjust(i:Int,range:Int)  {
        if(2*i+2 <= range){
            if (array![2*i+1]>=array![2*i+2]) && (array![2*i+1]>=array![i]) {
                
                exchange(i, j: 2*i+1)
                heapAdjust(2*i+1,range:range)
            }
            else if (array![2*i+2]>=array![2*i+1]) && (array![2*i+2]>=array![i]) {
                
                exchange(i, j: 2*i+2)
                heapAdjust(2*i+2,range:range)
            }
        }
        else if(2*i+1 <= range){
            if (array![2*i+1]>array![i]) {
                exchange(i, j: 2*i+1)
                heapAdjust(2*i+1,range:range)
            }
        }
        
    }
    
    func exchange(i:Int,j:Int){
        let temp = array![j]
        array![j] = array![i]
        array![i] = temp
        
    }
    
    
    
}

