//
//  DietViewController.swift
//  DietPlanner
//
//  Created by user193216 on 12/11/21.
//

import UIKit

class DietViewController: UIViewController {
    var selectedCuisine: String?
    var mealType: String?
    var intolerancesArray: [String] = []
    
    @IBOutlet weak var mtMaincourse: UIButton!
    @IBOutlet weak var mtSnack: UIButton!
    @IBOutlet weak var mtBreakfast: UIButton!
    @IBOutlet weak var mtSoup: UIButton!
    @IBOutlet weak var mtSalad: UIButton!
    @IBOutlet weak var mtDesert: UIButton!
    
    @IBOutlet weak var intGluten: UIButton!
    @IBOutlet weak var intEgg: UIButton!
    @IBOutlet weak var intPeanut: UIButton!
    @IBOutlet weak var intSoy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func mealTypeSelected(_ sender: Any) {
        let btnTag = (sender as! UIButton).tag
            
        switch(btnTag) {
            case 1 :
                self.mealType = "main course"
                self.mtMaincourse.isSelected = true
                self.mtSnack.isSelected = false
                self.mtBreakfast.isSelected = false
                self.mtSoup.isSelected = false
                self.mtSalad.isSelected = false
                self.mtDesert.isSelected = false
                break
            case 2 :
                self.mealType = "breakfast"
                self.mtMaincourse.isSelected = false
                self.mtSnack.isSelected = false
                self.mtBreakfast.isSelected = true
                self.mtSoup.isSelected = false
                self.mtSalad.isSelected = false
                self.mtDesert.isSelected = false
                break
            case 3 :
                self.mealType = "salad"
                self.mtMaincourse.isSelected = false
                self.mtSnack.isSelected = false
                self.mtBreakfast.isSelected = false
                self.mtSoup.isSelected = false
                self.mtSalad.isSelected = true
                self.mtDesert.isSelected = false
                break
            case 4 :
                self.mealType = "snack"
                self.mtMaincourse.isSelected = false
                self.mtSnack.isSelected = true
                self.mtBreakfast.isSelected = false
                self.mtSoup.isSelected = false
                self.mtSalad.isSelected = false
                self.mtDesert.isSelected = false
                break
            case 5 :
                self.mealType = "soup"
                self.mtMaincourse.isSelected = false
                self.mtSnack.isSelected = false
                self.mtBreakfast.isSelected = false
                self.mtSoup.isSelected = true
                self.mtSalad.isSelected = false
                self.mtDesert.isSelected = false
                break
            case 6 :
                self.mealType = "dessert"
                self.mtMaincourse.isSelected = false
                self.mtSnack.isSelected = false
                self.mtBreakfast.isSelected = false
                self.mtSoup.isSelected = false
                self.mtSalad.isSelected = false
                self.mtDesert.isSelected = true
                break
            default :
            break;
        }
        
    }
    
    
    @IBAction func intoleranceSelected(_ sender: Any) {
        let btnTag = (sender as! UIButton).tag
        switch(btnTag) {
            case 1:
                if (self.intGluten.isSelected) {
                    self.intGluten.isSelected = false;
                } else {
                    self.intGluten.isSelected = true;
                }
                break
            case 2:
                if (self.intEgg.isSelected) {
                    self.intEgg.isSelected = false;
                } else {
                    self.intEgg.isSelected = true;
                }
                break
            case 3:
                if (self.intPeanut.isSelected) {
                    self.intPeanut.isSelected = false;
                } else {
                    self.intPeanut.isSelected = true;
                }
                break
            case 4:
                if (self.intSoy.isSelected) {
                    self.intSoy.isSelected = false;
                } else {
                    self.intSoy.isSelected = true;
                }
                break
            default:
                break
        }
    }
    
    func getSelectedIntolerance() -> String {
        var selectedIntolerances = ""
        if (self.intGluten.isSelected) {
            self.intolerancesArray.append("gluten")
        }
        if (self.intEgg.isSelected) {
            self.intolerancesArray.append("egg")
        }
        if (self.intPeanut.isSelected) {
            self.intolerancesArray.append("peanut")
        }
        if (self.intSoy.isSelected) {
            self.intolerancesArray.append("soy")
        }
        
        if(!self.intolerancesArray.isEmpty) {
            selectedIntolerances = intolerancesArray.joined(separator: ",")
        }
        
        return selectedIntolerances
        
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass manager data to managerViewController
        let recipeVC = segue.destination as? RecipeTableViewController
        recipeVC!.selectedCuisine = self.selectedCuisine
        recipeVC!.mealType = self.mealType
        recipeVC!.intolerances = self.getSelectedIntolerance()
    }

}
