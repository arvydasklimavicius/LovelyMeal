//
//  CategoryCell.swift
//  LovelyMeal
//
//  Created by Arvydas Klimavicius on 2020-03-13.
//  Copyright © 2020 Arvydas Klimavicius. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryTitleLbl: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        categoryImage.layer.cornerRadius = 10

    }
    func configureCell(category: FoodCategory) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitleLbl.text = category.title 
    }


}
