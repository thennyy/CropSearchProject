//
//  File.swift
//  CropSearch
//
//  Created by Thenny Chhorn on 9/8/21.
//

import UIKit
class CoolerAssessmentController: UIViewController {
    
    // keep track of the selected segmentController
    var selectSegment1 = false
    var selectSegment2 = false
    var selectSegment3 = false
    var selectSegment4 = false
    var selectSegment5 = false
    
    // check if all segmentcontrollers selected
    
    var isCompleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .interactive
        
        setupNavigationBar()
        setupViews()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    fileprivate func setupViews() {
        view.addSubview(secondTitleView)
        secondTitleView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 60)
        view.addSubview(tableView)
        tableView.anchor(top: secondTitleView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 0)
        view.addSubview(footerView)
        footerView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 120)
           
    }
    fileprivate func setupNavigationBar() {
        
        navigationItem.title = "Cooler Facility Risk Assessment"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemOrange
        
    }
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        tv.bounces = false
        
        return tv
    }()
    let secondTitleView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .gray
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Areas of observation - please note concerns(s) if any, as well as corrective action(s)"
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 0, leftPadding: 15, rightPadding: 0, bottomPadding: 0, width: 0, height: 0)
        return view
        
    }()
   
    lazy var footerView: FooterView = {
        let view = FooterView()
        view.controlHandler = self
        return view
    }()
    
    // save changes button pressed
    
    func handleSaveChangesBtn() {

        let cell = TableViewCell()
        cell.controllerHander = self

        // udpate tableview when button pressed
        
        tableView.performBatchUpdates {
           
        } completion: { Bool in
            
            self.tableView.reloadData()
        }

    }

}
