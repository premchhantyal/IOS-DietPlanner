//
//  FavCollectionViewCell.swift
//  DietPlanner
//
//  Created by user193216 on 12/13/21.
//

import UIKit

class FavCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    lazy var results = [Nutritions]()
    
    @IBOutlet weak var nutritionTableView: UITableView!
    
    override func layoutSubviews()
        {
            super.layoutSubviews()
            nutritionTableView.delegate = self
            nutritionTableView.dataSource = self
        }
    
    var recipe : RecipeDetail! {
            didSet {
                self.updateUI ()
            }
        }
        
        func updateUI() {
          
            if let recipe = recipe {
                title.text = recipe.recipeTitle
                
                let img = recipe.imageUrl
                var imageUrl = URL(string: img!)
                let imageData = try? Data(contentsOf: imageUrl!)
                photo.image = UIImage(data: imageData!)
                
                self.results = recipe.allNutritions?.allObjects as [Nutritions]
                
                self.nutritionTableView.reloadData()
            } else {
                photo.image = nil
                title.text = nil
            }
           
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell", for: indexPath) as! TwoColTableViewCell

        var n = self.results[indexPath.row]
        print(n)
        var t = n.title
        var a = n.amount
        cell.nutritionTitle?.text = n.title
        cell.nutritionAmount?.text = n.amount
        return cell
    }
}
