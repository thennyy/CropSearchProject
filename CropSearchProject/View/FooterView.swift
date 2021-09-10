//
//  FooterView.swift
//  CropSearch
//
//  Created by Thenny Chhorn on 9/6/21.
//

import UIKit

protocol FooterViewDelegate {
    func saveChangesBtn(_ button: UIButton)
}
class FooterView: UIView {

    var controlHandler: CoolerAssessmentController?
    var delegate: FooterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(footerStackView2)
        footerStackView2.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 60)
        
        addSubview(footerStackView1)
        footerStackView1.anchor(top: nil, left: leftAnchor, bottom: footerStackView2.topAnchor, right: rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 45)
        
        let topLineView = UIView()
        topLineView.backgroundColor = .lightGray
        
        addSubview(topLineView)
        topLineView.anchor(top: nil, left: leftAnchor, bottom: footerStackView1.topAnchor, right: rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 0.6)
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = .lightGray
        
        addSubview(bottomLineView)
        bottomLineView.anchor(top: footerStackView1.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 0.6)
        
        finalSubmitBtn.addTarget(self, action: #selector(handleFinalSubmitBtn), for: .touchUpInside)
        
        saveChangesBtn.addTarget(self, action: #selector(handleSaveChangeBtn), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var saveChangesBtn: UIButton = {
        
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitle("Save Changes", for: .normal)
        
        return button
        
    }()
    let finalSubmitBtn: UIButton = {
        
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitle("Final Submit", for: .normal)
        return button
    }()
    lazy var footerStackView1: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [saveChangesBtn, finalSubmitBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var footerStackView2: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [dashBoardView, foodSaftyView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
        
    }()
    let dashBoardView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "Dashboard"
        let image = UIImageView()
        image.image = UIImage(named: "layers")?.withTintColor(.gray)
        image.widthAnchor.constraint(equalToConstant: 27).isActive = true
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 9
        stackView.axis = .horizontal
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 30)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
        
    }()
    
    let foodSaftyView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemOrange
        label.text = "Food Safty"
        let image = UIImageView(image: UIImage(named: "caution")?.withTintColor(.systemOrange))
        image.widthAnchor.constraint(equalToConstant: 27).isActive = true
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 9
        stackView.axis = .horizontal
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 30)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
        
    }()
    
    @objc fileprivate func handleSaveChangeBtn() {
        
        print("footer view saved data")
        controlHandler?.handleSaveChangesBtn()
        delegate?.saveChangesBtn(saveChangesBtn)
        
    }
    @objc fileprivate func handleFinalSubmitBtn() {
        
        print("SAVED FINAL SUBMIT BUTTON PRESSED")
        
    }
    
}
