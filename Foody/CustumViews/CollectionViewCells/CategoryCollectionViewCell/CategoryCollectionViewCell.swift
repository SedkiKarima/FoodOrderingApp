//
//  CategoryCollectionViewCell.swift
//  Foody
//
//  Created by Fatima Zahra SEDKI on 15/9/2023.
//

import UIKit
import kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var categoryImgView: UIImageView!
  
    func setup( category : DishCategory)  {
        categoryLbl.text = category.name
        categoryImgView.kf
        
    }

}
