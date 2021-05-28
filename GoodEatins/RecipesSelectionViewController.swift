//
//  RecipesSelectionViewController.swift
//  GoodEatins
//
//  Created by Petar Sakotic on 5/10/21.
//

import UIKit

class RecipesSelectionViewController: UIViewController {
    
    //MARK: - Properties
    
    var selectedCategory: String!
    var recipes: [Recipe]!
    let data = DataSet()
    var recipeToPass: Recipe!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)
    }
    
    //When click on collectionView item this preperation will be triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeDetailViewController = segue.destination as? RecipeDetailViewController {
            recipeDetailViewController.recipeDetail = recipeToPass
        }
    }
}

//MARK: - CollectionViewDataSource Methods and Delegate Methods

extension RecipesSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell {
            cell.prepareUI(recipe: recipes[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeDetail", sender: self)
    }
}

