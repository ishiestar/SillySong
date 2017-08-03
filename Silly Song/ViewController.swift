//
//  ViewController.swift
//  Silly Song
//
//  Created by Ishita Sinha on 30/07/17.
//  Copyright © 2017 Ishita Sinha. All rights reserved.
//

import UIKit

var vowels = ["a", "e", "i", "o", "u"]
// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortenedName(fromName: String) -> String {
    var fromName = fromName.lowercased()
    for (char) in fromName.characters {
        let char = String(char)
        if(!vowels.contains(char)){
            fromName.remove(at: fromName.startIndex)
        } else {
            break
        }
    }
    return fromName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var lyricsTemplate = lyricsTemplate
    lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortenedName(fromName: fullName))
    return lyricsTemplate
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    @IBAction func displayLyrics(_ sender: Any) {
        if(!(nameField.text?.isEmpty)!) {
            lyricsText.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsText.text = ""
    }
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

