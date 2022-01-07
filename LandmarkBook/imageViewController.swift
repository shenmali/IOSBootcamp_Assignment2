//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Muhammed Didin on 6.10.2021.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var landmarkLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    

    

}
