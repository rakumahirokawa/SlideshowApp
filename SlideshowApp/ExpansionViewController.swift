//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by hirokawa rakuma on 2021/09/27.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var expansionImage: UIImageView!
    
    
    var x: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expansionImage.image = x


    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
