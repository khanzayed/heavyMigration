
//
//  TabBarViewController.swift
//  Migration
//
//  Created by Faraz Habib on 08/09/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var circleImageView : UIImageView!
    var circleImageViewTwo : UIImageView!
    var circleImageViewThree : UIImageView!
    
    
    var x = UIScreen.main.bounds.width / 17 // 12
    let baseX = UIScreen.main.bounds.width / 17 // 12
    let width = UIScreen.main.bounds.width / 5 // 4
    var previousIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbarAppearance = UITabBarItem.appearance()
        tabbarAppearance.setTitleTextAttributes(
            [NSAttributedStringKey.font: UIFont(name: "Times New Roman", size: 12)!],
            for: .normal)
        tabbarAppearance.setTitleTextAttributes(
            [NSAttributedStringKey.font: UIFont(name: "Times New Roman", size: 12)!,
             NSAttributedStringKey.foregroundColor : AppColors.primaryColor],
            for: .selected)

        circleImageView = UIImageView(frame: CGRect(x: baseX + 5, y: UIScreen.main.bounds.height - 30, width: 10, height: 10))
        circleImageView.image = UIImage(named: "ic_blue_circle")
        self.view.addSubview(circleImageView)
        
        circleImageViewTwo = UIImageView(frame: CGRect(x: baseX - 2, y: UIScreen.main.bounds.height - 40, width: 5, height: 5))
        circleImageViewTwo.image = UIImage(named: "ic_blue_circle")
        self.view.addSubview(circleImageViewTwo)
        
        circleImageViewThree = UIImageView(frame: CGRect(x: baseX + 30, y: UIScreen.main.bounds.height - 43, width: 7, height: 7))
        circleImageViewThree.image = UIImage(named: "ic_blue_circle")
        self.view.addSubview(circleImageViewThree)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items!.index(of: item) {
            let floatValue = CGFloat(index)
            x = baseX + (width * floatValue)
            
            var duration : TimeInterval = 1.0
            var damping : CGFloat = 0.5
            let indexDiff = abs(previousIndex - index)
            switch indexDiff {
            case 2:
                duration = 1.2
            case 3:
                duration = 1.5
                damping = 0.6
            case 4:
                duration = 1.6
                damping = 0.6
            default:
                break
            }
        
            previousIndex = index
            
            UIView.animate(withDuration: duration , delay: 0.1, usingSpringWithDamping: damping, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.circleImageView.frame.origin.x = self.x + 5
            }, completion: nil)
            
            UIView.animate(withDuration: duration , delay: 0.2, usingSpringWithDamping: damping, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.circleImageViewTwo.frame.origin.x = self.x - 2
            }, completion: nil)
            
            UIView.animate(withDuration: duration , delay: 0.3, usingSpringWithDamping: damping, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.circleImageViewThree.frame.origin.x = self.x + 30
            }, completion: nil)
        }
    }

}
