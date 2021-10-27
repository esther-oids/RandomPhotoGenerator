//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Esther Laudier on 25/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let colors: [UIColor] = [
        .systemPink,
        .systemOrange,
        .systemBlue,
        .systemCyan,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemRed,
        .systemGray,
        .systemTeal
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting background color
        view.backgroundColor = .systemPink
        
        //adding photo to the screeen
        view.addSubview(imageView)
        
        //setting a frame size and position for the photo
        imageView.frame = CGRect(x:0, y:0, width:300, height:300)
        imageView.center = view.center
        
        // adding the button to the screen
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
          
      }
      
      @objc func didTapButton(){
          getRandomPhoto()
          view.backgroundColor = colors.randomElement()
      }
      
      
      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)
          
       
    }
    
    
    
    func getRandomPhoto(){
        let urlString = "https://picsum.photos/600"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

