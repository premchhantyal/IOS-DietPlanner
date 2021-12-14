//
//  FavViewController.swift
//  DietPlanner
//
//  Created by user193216 on 12/13/21.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var favCollectionView: UICollectionView!
    
    var recipes = DatabaseService.shared.fetchAllRecipeDetails()
    var cellScale : CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.favCollectionView.dataSource = self
        // Do any additional setup after loading the view.
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

extension FavViewController : UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as! FavCollectionViewCell
        
        let recipe = recipes[indexPath.item]
        cell.recipe = recipe
        
        return cell
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
}
