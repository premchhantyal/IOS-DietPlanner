//
//  FavCollectionViewCell.swift
//  DietPlanner
//
//  Created by user193216 on 12/13/21.
//

import UIKit

class FavCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var recipe : RecipeDetail! {
            didSet {
                self.updateUI ()
            }
        }
        
        func updateUI() {
          
            if let recipe = recipe {
                var t = recipe.recipeTitle
                title.text = recipe.recipeTitle
                let img = recipe.imageUrl
                
                var imageUrl = URL(string: img!)
                let imageData = try? Data(contentsOf: imageUrl!)
                
                photo.image = UIImage(data: imageData!)

                //colorView.backgroundColor = course.color
            } else {
                photo.image = nil
                title.text = nil
                //colorView.backgroundColor = nil
            }
           
        }
}
