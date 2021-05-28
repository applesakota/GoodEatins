//
//  CategoryCell.swift
//  GoodEatins
//
//  Created by Petar Sakotic on 5/10/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageView.layer.cornerRadius = 10
    }

    //MARK: - Configure UI
    
    func prepareUI(category: FoodCategory) {
        categoryImageView.image = UIImage(named: category.imageName)
        categoryLabel.text = category.title
    }
}
