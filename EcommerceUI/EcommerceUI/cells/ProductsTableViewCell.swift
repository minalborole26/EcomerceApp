//
//  ProductsTableViewCell.swift
//  EcommerceUI
//
//  Created by Minal Wani on 25/04/23.
//

import UIKit

//typealias SeeAllClosure = ((_ index: Int?) -> Void)?

class ProductsTableViewCell: UITableViewCell {
    var index: Int?
    var onClickSeeAllClosure: ((_ index: Int?) -> Void)?
    var didSelectClosure :((_ tableIndex: Int?, _ collectionIndex: Int?) -> Void)?
    
    var products: Product? {
             didSet {
                 categoryName.text = products?.categoryName
                 collectionView.reloadData()
             }
         }

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickSeeAll(_ sender: UIButton) {
        onClickSeeAllClosure? (index)
      
    }
}

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.products?.count ?? 0
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.productName.text = products?.products?[indexPath.row].name
                cell.img.image = UIImage(named: products?.products?[indexPath.row].imageName ?? "")
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(index, indexPath.row)
    }
    
    
}
