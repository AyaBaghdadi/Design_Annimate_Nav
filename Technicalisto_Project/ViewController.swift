//
//  ViewController.swift
//
//  Created by Technicalisto.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView2Height: NSLayoutConstraint!
    @IBOutlet weak var tableView1Height: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Start()
        
    }
    
    func Start(){
        self.tableView1.tableFooterView = UIView()
        self.tableView2.tableFooterView = UIView()
        
        self.tableView1.isHidden = false
        self.tableView2.isHidden = true
        
        self.barView.isHidden = true
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {

       print("scrollViewWillBeginDecelerating")

       let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
       if (actualPosition.y > 0){
           // Dragging down
        print("Aya" , actualPosition.y)

              //Change the color of view
            
            if self.detailsView.frame.origin.y == 0 {
                UIView.animate(withDuration: 3, animations: {
                self.barView.isHidden = true
                self.imageView.isHidden = false
                
                self.imageView.frame.origin.y = 0
                })
            }

       }else{
           // Dragging up
        print("Aya 2" , actualPosition.y , self.detailsView.frame.origin.y , self.tabView.frame.origin.y)

               //Change the color of view
//            if actualPosition.y <= 20 {
        UIView.animate(withDuration: 3, animations: {

            if self.detailsView.frame.origin.y >= 250 {
                self.barView.isHidden = false
                self.imageView.isHidden = true
            }
        })

            if self.tabView.frame.origin.y == 50 {
                print("Howa dh")
            }
       }
   }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        DispatchQueue.main.async {
            
        self.tableView1Height.constant = self.tableView1.contentSize.height

        self.tableView2Height.constant = self.tableView2.contentSize.height

        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    @IBAction func btn1Tapped(_ sender: Any) {
        self.btn1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        self.btn1.backgroundColor = #colorLiteral(red: 1, green: 0.8265505433, blue: 0, alpha: 1)
        
        self.btn2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.btn2.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        self.tableView1.isHidden = false
        self.tableView2.isHidden = true
    }
    
    @IBAction func btn2Tapped(_ sender: Any) {
        self.btn2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        self.btn2.backgroundColor = #colorLiteral(red: 1, green: 0.8265505433, blue: 0, alpha: 1)
        
        self.btn1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.btn1.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        self.tableView1.isHidden = true
        self.tableView2.isHidden = false
    }
}
