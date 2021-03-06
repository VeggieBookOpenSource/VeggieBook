//
//  QuestionViewController.swift
//  VeggieBook
//
//  Created by Daniel DiPasquo on 6/14/17.
//  Copyright © 2017 DiPasquo Consulting. All rights reserved.
//  Copyright © 2020 Quick Help For Meals, LLC. All rights reserved.
//  Software developed at the University of Southern California.
//
//  This file is part of VeggieBook.
//
//  VeggieBook is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, version 3 of the license only.
//
//  VeggieBook is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or fitness for a particular purpose. See the
//  GNU General Public License for more details.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var question : Question? = nil
    var pageViewController : InterviewPageViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = question?.questionText
        nextButton.setTitle(LanguageCode.appLanguage.isSpanish() ? "SIGUIENTE" : "NEXT", for: .normal)
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        pageViewController?.goToNextPage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "QuestionChoicesSegue" {
            let choicesController = segue.destination as? QuestionChoiceTableViewController
            choicesController?.question = question
        }
    }
    

}
