//
//  RecipeDetailViewController.swift
//  GoodEatins
//
//  Created by Petar Sakotic on 5/10/21.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLable: UILabel!
    @IBOutlet weak var recipeInstructionsLabel: UILabel!
    
    var recipeDetail: Recipe!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    //MARK: - Configure UI
    
    func prepareUI() {
        recipeImageView.image = UIImage(named: recipeDetail.imageName)
        recipeTitleLable.text = recipeDetail.title
        recipeInstructionsLabel.text = recipeDetail.instructions
    }
}
