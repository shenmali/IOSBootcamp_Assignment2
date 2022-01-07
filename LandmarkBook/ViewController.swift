//
//  ViewController.swift
//  LandmarkBook
//
//  Created by malishen on 7.10.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        
        landmarkImages.append(UIImage(named: "hp1.jpg")!)
        landmarkImages.append(UIImage(named: "hp2.jpg")!)
        landmarkImages.append(UIImage(named: "hp3.jpg")!)
        landmarkImages.append(UIImage(named: "hp4.jpg")!)
        landmarkImages.append(UIImage(named: "hp5.jpg")!)
        landmarkImages.append(UIImage(named: "hp6.jpg")!)
        landmarkImages.append(UIImage(named: "hp7.jpg")!)
        
        landmarkNames.append("Harry Potter Felsefe Tasi")
        landmarkNames.append("Harry Potter Sirlar Odasi")
        landmarkNames.append("Harry Potter Azkaban Tutsagi")
        landmarkNames.append("Harry Potter Ates Kadehi")
        landmarkNames.append("Harry Potter Zumrudu Anka Yoldasligi")
        landmarkNames.append("Harry Potter Melez Prens")
        landmarkNames.append("Harry Potter Olum Yadigarlari")
        
        navigationItem.title = "Harry Potter Films"
        

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 7
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 0, bottom: 1.0, right: 1.0)
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:260)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarkImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        // 2
        cell.cellImage.image = landmarkImages[indexPath.row]
        // 3
        cell.cellLabel.text = landmarkNames[indexPath.row]
        // 4
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
   
}
