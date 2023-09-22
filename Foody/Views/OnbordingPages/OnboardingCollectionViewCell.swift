//
//  OnboardingCollectionViewCell.swift
//  Foody
//
//  Created by Fatima Zahra SEDKI on 11/9/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionSlideLbl: UILabel!
    @IBOutlet weak var titleSlideLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    func setup(slide : onbordingSlides) {
        imgView.image = slide.image
        titleSlideLbl.text = slide.title
        descriptionSlideLbl.text = slide.description
    }
}
