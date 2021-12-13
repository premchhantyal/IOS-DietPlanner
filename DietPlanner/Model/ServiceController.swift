//
//  ServiceController.swift
//  DietPlanner
//
//  Created by user193216 on 12/5/21.
//

import Foundation
class ServiceController {
    
    static var shared = ServiceController()
    
    func getRecipes(mealType: String?,cuisine: String?,intolerances: String?,handler: @escaping ([Recipe])->Void) {
        var urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=b0d236fe41e24f61ae16b51110f97c67"
        
        if(mealType != nil) {
            urlString = urlString + "&type=" + mealType!
        }
        if(cuisine != nil) {
            urlString = urlString + "&cuisine=" + cuisine!
        }
        if(intolerances != nil) {
            urlString = urlString + "&intolerances=" + intolerances!
        }
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let urlObj = URL(string: urlString)!
        
        var task = URLSession.shared.dataTask(with: urlObj){ data, apiresponse, error in
            if let error = error {
                print(error)
            }
            else if let correctData = data {
                print("API Data")
                print(correctData)
                do{
                    let decoder = JSONDecoder()
                    var resultFromAPI = try?
                        decoder.decode(result.self,from: correctData)
                    handler(resultFromAPI!.results)
                }catch {
                    print(error)
                }
               
            }
        }
        
        task.resume()
    }
    
    func getRecipeDetail(recipeId: Int?,handler: @escaping ([Nutrition])->Void) {
        var urlString = "https://api.spoonacular.com/recipes/"+String(recipeId!)+"/nutritionWidget.json?apiKey=b0d236fe41e24f61ae16b51110f97c67"
        
        let urlObj = URL(string: urlString)!
        
        var task = URLSession.shared.dataTask(with: urlObj){ data, apiresponse, error in
            if let error = error {
                print(error)
            }
            else if let correctData = data {
                print("API Data2")
                print(correctData)
                do{
                    let decoder = JSONDecoder()
                    var nutritionResultFromAPI = try?
                        decoder.decode(nutritionResult.self,from: correctData)
                    var bad = nutritionResultFromAPI!.bad
                    var good = nutritionResultFromAPI!.good
                    
                    handler(bad+good)
                }catch {
                    print(error)
                }
               
            }
        }
        
        task.resume()
    }
}
