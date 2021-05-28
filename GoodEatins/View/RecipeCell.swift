//
//  RecipeCell.swift
//  GoodEatins
//
//  Created by Petar Sakotic on 5/10/21.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
    }
    
    //MARK: - ConfigureUI
    
    func prepareUI(recipe: Recipe) {
        imageView.image = UIImage(named: recipe.imageName)
    }
}
