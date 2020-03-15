
import UIKit

class RecipesSelectionVC: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!

    var selectedCategory: String!
    var recipes: [Recipe]!
    var data = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.delegate = self
        collectioView.dataSource = self
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)

    }

}

extension RecipesSelectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell {
            let recipe = recipes[indexPath.item]
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = view.bounds.width
//        let cellSize = (width / 2) - 100
        return CGSize(width: 200, height: 200)
    }


}
