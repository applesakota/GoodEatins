//
//  ViewController.swift
//  GoodEatins
//
//  Created by Petar Sakotic on 5/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    let data = DataSet()
    var categoryToPass: String!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Prepare segue, when click on tableviewcell this segue will be triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? RecipesSelectionViewController? {
            destinationViewController?.selectedCategory = categoryToPass
        }
    }
}

//MARK: - TableViewDataSource Delegate, TableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            cell.prepareUI(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipesSelection", sender: self)
    }
}
