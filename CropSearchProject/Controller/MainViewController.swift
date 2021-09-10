//
//  MainViewController.swift
//  CropSearchProject
//
//  Created by Thenny Chhorn on 9/4/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
        
    }
    fileprivate func setupView() {
              
        view.addSubview(logoImage)
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, topPadding: 6, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 120, height: 120)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(assessmentBtn)
        assessmentBtn.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topPadding: 30, leftPadding: 30, rightPadding: 30, bottomPadding: 0, width: 0, height: 60)
        assessmentBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        assessmentBtn.layer.cornerRadius = 9
        assessmentBtn.addTarget(self, action: #selector(handleAssesmentBtn), for: .touchUpInside)
   
    }
    override func viewWillAppear(_ animated: Bool) {
        
        setNavigationView()
        
    }

    fileprivate func setNavigationView() {
      
        navigationItem.title = "Document"
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        navigationController?.navigationBar.titleTextAttributes = textAttribute
        
    }
    private var assessmentBtn: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitle("Cooler Facility Risk Assessment", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    private let logoImage: UIImageView = {
        
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
        
    }()
 
    @objc private func handleAssesmentBtn() {
       // let layout = UICollectionViewFlowLayout()
        let controler = CoolerAssessmentController()
        navigationController?.pushViewController(controler, animated: true)
        
    }
 

}
