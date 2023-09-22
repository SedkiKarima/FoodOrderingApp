//
//  OnboardingViewController.swift
//  Foody
//
//  Created by Fatima Zahra SEDKI on 10/9/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides = [onbordingSlides]()
    var currentpage = 0 {
        didSet{
            pageCtrl.currentPage = currentpage
            if currentpage ==  slides.count - 1 {
                nextBtn.setTitle("Get started", for: .normal)
            }else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        slides = [onbordingSlides(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "slide1")!),
            onbordingSlides(title: "World-Class Chiefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide2")!),
            onbordingSlides(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")!)
        ]
        
        pageCtrl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        if currentpage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller , animated: true)
        }else{
            currentpage += 1
           let index = IndexPath(item: currentpage, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
}


extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width, height: collectionView.frame.height)
    }
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentpage = Int(scrollView.contentOffset.x/width)

    }
     
}
