//
//  DetailViewController.swift
//  DietPlanner
//
//  Created by user193216 on 12/12/21.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nutritionTableView: UITableView!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    lazy var results = [Nutrition]()
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceController.shared.getRecipeDetail(recipeId: recipe?.id) { resultFromAPI in
            DispatchQueue.main.async {
                self.results = resultFromAPI
                self.nutritionTableView.reloadData()
            }
        }
        
        self.recipeTitle.text = recipe?.title
        
        let imgUrl = (recipe?.image)!
        var imageUrl = URL(string: imgUrl)
        let imageData = try? Data(contentsOf: imageUrl!)
        self.recipeImg.image = UIImage(data: imageData!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "twoColCell", for: indexPath) as! TwoColTableViewCell
        
        cell.nutritionTitle?.text = self.results[indexPath.row].title
        cell.nutritionAmount?.text = self.results[indexPath.row].amount
        return cell
    }

    @IBAction func saveToFavList(_ sender: Any) {
        let btn = (sender as! UIButton)
        btn.isSelected = true
        DatabaseService.shared.addNewRecipe(id: self.recipe!.id, title:self.recipe!.title, imgUrl: self.recipe!.image, nutritions: self.results)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
