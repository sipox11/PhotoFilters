//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Jose Carlos Montero Gómez on 21/10/2017.
//  Copyright © 2017 sipox11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    // Create a place to render the filtered image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(_ sender: Any) {
        
        // Create an image to filter
        guard let img = photoImageView.image else { return }
        let inputImage = CIImage(image: img)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the image
        let filteredImage = inputImage!.applyingFilter("CIHueAdjust", parameters: randomColor)
        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, from: filteredImage.extent)
        
        // Reflect the change back in the interface
        photoImageView.image = UIImage(cgImage: renderedImage!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

