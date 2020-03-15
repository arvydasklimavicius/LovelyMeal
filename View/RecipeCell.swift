

import UIKit

class RecipeCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImage.layer.cornerRadius = 10
    }

    func configureCell(recipe: Recipe) {
        recipeImage.image = UIImage(named: recipe.imageName)
    }

}
