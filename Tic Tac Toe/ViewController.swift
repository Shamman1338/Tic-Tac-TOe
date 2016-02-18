//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Student on 11/19/15.
//  Copyright © 2015 Shamman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var label0: GridLabel!
    @IBOutlet weak var label1: GridLabel!
    @IBOutlet weak var label2: GridLabel!
    @IBOutlet weak var label3: GridLabel!
    @IBOutlet weak var label4: GridLabel!
    @IBOutlet weak var label5: GridLabel!
    @IBOutlet weak var label6: GridLabel!
    @IBOutlet weak var label7: GridLabel!
    @IBOutlet weak var label8: GridLabel!
    var labelsArray = [GridLabel]()
    var xTurn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(label0)
        labelsArray.append(label1)
        labelsArray.append(label2)
        labelsArray.append(label3)
        labelsArray.append(label4)
        labelsArray.append(label5)
        labelsArray.append(label6)
        labelsArray.append(label7)
        labelsArray.append(label8)
    }
    
    @IBAction func onTappedLabel(sender: UITapGestureRecognizer) {
        var catsGame = true
        for label in labelsArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(backgroundView)) {
                if label.canTap {
                    if xTurn {
                        label.text = "X"
                    }
                    else {
                        label.text = "O"
                    }
                    xTurn = !xTurn
                    label.canTap = false
                    checkForWinner()
                }
            }
            else {
                if label.canTap {
                    catsGame = false
                }
            }
        }
        if catsGame {
            presentWinningAlert("Cat's Game!")
        }
    }
    
    func checkForWinner() {
        checkLine(0, b: 1, c: 2)
        checkLine(3, b: 4, c: 5)
        checkLine(6, b: 4, c: 8)
        checkLine(0, b: 3, c: 6)
        checkLine(1, b: 4, c: 7)
        checkLine(2, b: 5, c: 8)
        checkLine(0, b: 4, c: 8)
        checkLine(2, b: 4, c: 6)
    }
    
    func checkLine(a: Int, b: Int, c: Int) {
        if labelsArray[a].text == labelsArray[b].text &&
            labelsArray[b].text == labelsArray[c].text &&
            labelsArray[a].text != ""{
                presentWinningAlert("\(labelsArray[a].text!) wins!")
        }
    }
    func presentWinningAlert(winner: String) {
        let alert = UIAlertController(title: winner, message: nil, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Reset", style: .Default) {  (action) -> Void in
            self.resetGame()
        }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetGame() {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
    }
}
