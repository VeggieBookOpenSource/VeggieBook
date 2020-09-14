//
//  FetchingViewController.swift
//  VeggieBook
//
//  Created by Matthew Flickner on 10/20/17.
//  Copyright © 2017 DiPasquo Consulting. All rights reserved.
//

import UIKit

class FetchingViewController: UIViewController {
    
    @IBOutlet weak var fetchingLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nextButton: UIButton!
    
    var bookBuilder: BookBuilder!

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = bookBuilder.availableBook.bookType == "RECIPE_BOOK" ?
            Logo.getNegativeLogo() : Logo.getSecretsLogo()
        navigationItem.titleView = UIImageView(image: image)
        let bookTitle = bookBuilder.availableBook.title()
        if LanguageCode.appLanguage.isSpanish() {
            let bookType = bookBuilder.availableBook.bookType == "RECIPE_BOOK" ? "receta" : "Secreto"
            fetchingLabel.text = bookBuilder.availableBook.bookType == "RECIPE_BOOK" ?
                "Estamos adquiriendo sus recetas." : "Estamos adquiriendo Secretos para \(bookTitle)."
            instructionsLabel.text = "Usted puede revisar cada \(bookType) e indicar si LO QUIERE o NO LO QUIERE."
            continueLabel.text = "Pulse SIGUIENTE abajo para continuar."
            nextButton.setTitle("SIGUIENTE", for: .normal)
        } else {
            let bookType = bookBuilder.availableBook.bookType == "RECIPE_BOOK" ? "recipe" : "Secret"
            fetchingLabel.text = bookBuilder.availableBook.bookType == "RECIPE_BOOK" ?
                "We are getting your recipes." : "We are getting \(bookTitle)."
            instructionsLabel.text = "You can review each \(bookType) and KEEP or DROP it."
        }
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.activityIndicator.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "fetchingToSelectables", sender: self)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "fetchingToSelectables" {
            guard let selectablesViewController = segue.destination as? RecipeViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            selectablesViewController.bookBuilder = bookBuilder
        }
    }
}