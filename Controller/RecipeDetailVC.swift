
import UIKit

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!

    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImage.image = UIImage(named: selectedRecipe.imageName)
        recipeTitle.text = selectedRecipe.title
        recipeDescription.text = selectedRecipe.instructions


    }
    
}
