//
//  LoaderViewController.swift
//  Migration
//
//  Created by Faraz Habib on 15/09/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {

    var imageAnimatinArea : UIView!
    
    var imageView1 : UIImageView!
    var imageView2 : UIImageView!
    var imageView3 : UIImageView!
    var imageView4 : UIImageView!
    var imageView5 : UIImageView!
    var imageView6 : UIImageView!
    var imageView7 : UIImageView!
    var imageView8 : UIImageView!
    var imageView9 : UIImageView!
    
    let smallValue : CGFloat = 30
    let mediumValue : CGFloat = 60
    let largeValue : CGFloat = 90
//    let xlargeValue : CGFloat = 70
    let height : CGFloat = UIScreen.main.bounds.height
    let width : CGFloat = UIScreen.main.bounds.width
    let edge : CGFloat = 50
    
//    let leftMargin : CGFloat = 30
//    let topMargin : CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let animationAreaDimension : CGFloat = width - (leftMargin * 2)
//        imageAnimatinArea = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: animationAreaDimension, height: animationAreaDimension))
//        imageAnimatinArea.backgroundColor = UIColor(hexString: "F1F1F1")
//
//        self.view.addSubview(imageAnimatinArea)
//
//        return
        
        imageView1 = UIImageView(frame: CGRect(x: width - largeValue - edge, y: (height - largeValue) / 2 - (edge * 2), width: largeValue, height: largeValue))
        imageView1.image = UIImage(named: "1")
        
        imageView2 = UIImageView(frame: CGRect(x: edge * 3, y: ((height - smallValue) / 2) - (edge * 4), width: smallValue, height: smallValue))
        imageView2.image = UIImage(named: "1")
        
        imageView3 = UIImageView(frame: CGRect(x: edge, y: ((height - mediumValue) / 2), width: mediumValue, height: mediumValue))
        imageView3.image = UIImage(named: "1")
        
        imageView4 = UIImageView(frame: CGRect(x: width - largeValue - edge - 10, y: (height - largeValue) / 2 + (largeValue) * 2 - (edge * 2), width: largeValue, height: largeValue))
        imageView4.image = UIImage(named: "1")
        imageView4.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        imageView5 = UIImageView(frame: CGRect(x: edge - 20, y: ((height - mediumValue) / 2) + (edge * 2) + edge, width: mediumValue, height: mediumValue))
        imageView5.image = UIImage(named: "1")
        imageView5.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        imageView6 = UIImageView(frame: CGRect(x: mediumValue + edge, y: (height - mediumValue) / 2, width: mediumValue, height: mediumValue))
        imageView6.image = UIImage(named: "1")
        imageView6.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        imageView7 = UIImageView(frame: CGRect(x: (width - largeValue) / 2, y: (height - largeValue) / 2 - (edge * 3), width: largeValue, height: largeValue))
        imageView7.image = UIImage(named: "1")
        imageView7.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        imageView8 = UIImageView(frame: CGRect(x: width - mediumValue - edge, y: (height - mediumValue) / 2 - (edge * 5), width: mediumValue, height: mediumValue))
        imageView8.image = UIImage(named: "1")
        imageView8.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        imageView9 = UIImageView(frame: CGRect(x: edge - 20, y: (height - largeValue) / 2 - (edge * 4.5), width: largeValue, height: largeValue))
        imageView9.image = UIImage(named: "1")
        imageView9.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        self.view.addSubview(imageView5)
        self.view.addSubview(imageView6)
        self.view.addSubview(imageView7)
        self.view.addSubview(imageView8)
        self.view.addSubview(imageView9)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func animateViews() {
        let duration : TimeInterval = 0.4
        var delay : TimeInterval = 1.0
        
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.imageView4.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView1.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView5.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView3.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView6.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView2.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView7.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView4.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView8.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView5.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView9.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView6.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView1.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView7.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView3.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView8.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView2.transform = CGAffineTransform(scaleX: 1, y: 1)
        },  completion: { (true) in
            
        })
        
        delay += 0.3
        UIView.animate(withDuration: duration , delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.imageView9.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        },  completion: { (true) in
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
