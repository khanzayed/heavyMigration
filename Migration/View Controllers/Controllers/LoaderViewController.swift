//
//  LoaderViewController.swift
//  Migration
//
//  Created by Faraz Habib on 15/09/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var loadingLbl: UILabel!
    @IBOutlet weak var imageAnimatinArea: UIView!
    
    var imageView1 : UIImageView!
    var imageView2 : UIImageView!
    var imageView3 : UIImageView!
    var imageView4 : UIImageView!
    var imageView5 : UIImageView!
    var imageView6 : UIImageView!
    var imageView7 : UIImageView!
    var imageView8 : UIImageView!
    var imageView9 : UIImageView!
    
    let smallValue : CGFloat = 40
    let mediumValue : CGFloat = 60
    let largeValue : CGFloat = 70
    let xlargeValue : CGFloat = 90
    let height : CGFloat = UIScreen.main.bounds.height
    let width : CGFloat = UIScreen.main.bounds.width
    let edge : CGFloat = 50
    
    let leftMargin : CGFloat = 30
    let topMargin : CGFloat = 100
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let editButtonn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(LoaderViewController.setupController))
        navigationItem.rightBarButtonItem = editButtonn
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.barStyle = .black
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.showsCancelButton = true
        self.definesPresentationContext = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func setupController() {
        UIView.animate(withDuration: 0.3) {
            self.navigationItem.searchController = self.searchController
            self.searchController.searchBar.becomeFirstResponder()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension LoaderViewController: UISearchBarDelegate
{
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
//    {
//        //Show Cancel
//        searchBar.setShowsCancelButton(true, animated: true)
////        searchBar.tintColor = .white
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
//    {
//        //Filter function
////        self.filterFunction(searchText: searchText)
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
//    {
//        //Hide Cancel
////        searchBar.setShowsCancelButton(false, animated: true)
//        searchBar.resignFirstResponder()
//
////        guard let term = searchBar.text , term.trim().isEmpty == false else {
////
////            //Notification "White spaces are not permitted"
////            return
////        }
////
//        //Filter function
////        self.filterFunction(searchText: term)
//    }
//
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
        self.navigationItem.searchController = nil
        
//        UIView.animate(withDuration: 0.3) {
//            self.navigationItem.searchController = nil
//        }
    }
}
