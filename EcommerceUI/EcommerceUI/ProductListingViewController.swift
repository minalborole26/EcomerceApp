//
//  ProductListingViewController.swift
//  EcommerceUI
//
//  Created by Minal Wani on 26/04/23.
//

import UIKit

class ProductListingViewController: UIViewController {
    
    var productsListing: Product?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productsListing?.categoryName
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    

    

}

extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListing?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else{
            return UITableViewCell()
        }
        cell.productName.text = productsListing?.products?[indexPath.row].name
        cell.productPrice.text = productsListing?.products?[indexPath.row].price
        cell.productDescription.text = productsListing?.products?[indexPath.row].description
        cell.productImage.image = UIImage(named: productsListing?.products?[indexPath.row].imageName ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController else{
            return
        }
        vc.productDetails = productsListing?.products?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
