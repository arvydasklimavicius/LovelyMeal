
import UIKit

class RecipesSelectionVC: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!

    var selectedCategory: String!
    var recipes: [Recipe]!
    var data = DataSet()
    var recipeToPass: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
        let size = CGSize(width: collectionView.frame.width / 2, height: 150)
        return size
    }

    func setupCollectionView() {

        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.estimated(40)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 10

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectioView.collectionViewLayout = layout


    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailVC {
            detailsVC.selectedRecipe = recipeToPass
        }
    }


}
