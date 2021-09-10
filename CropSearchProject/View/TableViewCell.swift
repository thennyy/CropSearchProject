//
//  TableViewCell.swift
//  TestTableView
//
//  Created by Thenny Chhorn on 9/9/21.
//

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {
   

    var index: IndexPath?
    var delegate: CellDelegate?
    static let id = "cell"
    var  lastIndexSelection: Int?
    
    var controllerHander: CoolerAssessmentController?
    
    var data: Data? {
        
        didSet{
            if let text = data?.text {
                print("TEXT >>>>>>>>>>", text)
            }
        }
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            backgroundColor = .brown
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        
        textField.delegate = self
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
               // textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        contentView.addSubview(stackView)
        stackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0, width: 0, height: 0)
            

        addCommentBtn.addTarget(self, action: #selector(handleAddCommentBtn), for: .touchUpInside)

        cancelBtn.addTarget(self, action: #selector(handleCancelBtn), for: .touchUpInside)
            
        segmentController.addTarget(self, action: #selector(setSegmentColor), for: .valueChanged)
            
    }
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [titleContainerView, textFieldContainerView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        return stackView
        
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
 
        return label
    }()
  
    let textField: UITextField = {
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.layer.cornerRadius = 9
        tf.layer.masksToBounds = true
        tf.returnKeyType = .done
        
        return tf
        
    }()
    
    lazy var textFieldContainerView: UIView = {
        
        let view = UIView()
        view.addSubview(textField)
        textField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 6, leftPadding: 15, rightPadding: 15, bottomPadding: 9, width: 0, height: 0)
        view.isHidden = true
        view.addSubview(commentTextLabel)
        commentTextLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 6, leftPadding: 15, rightPadding: 15, bottomPadding: 9, width: 0, height: 0)
        return view
   
    }()
    
    lazy var addCommentBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add")?.withTintColor(.systemOrange), for: .normal)
        return button
    }()
    @objc func handleAddCommentBtn(_ button: UIButton) {
        
        textFieldContainerView.isHidden = false
        switchButtons(1)
        if commentTextLabel.text?.isEmpty == false {
            switchTextDisplay(0)
        }

        guard let indexPath = index else {return}
        delegate?.handleClickedBtn(cell: self, indexPath: indexPath)
        
       // self.layoutIfNeeded()
    }
    lazy var cancelBtn: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cancel")?.withTintColor(.red), for: .normal)
        button.isHidden = true
        
        return button
    }()
    @objc func handleCancelBtn(_ button: UIButton) {
     
        textFieldContainerView.isHidden = true
        switchButtons(0)
        guard let indexPath = index else {return}
        delegate?.handleCancelBtn(cell: self, indexPath: indexPath)
        
    }
    let segmentController: UISegmentedControl = {
        
        let segment = UISegmentedControl(items: ["Acceptable", "Unacceptable", "N/A"])
        let textAttribute = [NSAttributedString.Key.foregroundColor : UIColor.white]
        segment.setTitleTextAttributes(textAttribute, for: .selected)
        
        return segment
        
    }()
    let commentTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.isHidden = true
        return label
    }()
    
    lazy var titleContainerView: UIView = {
       
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 0, leftPadding: 15, rightPadding: 15, bottomPadding: 0, width: 0, height: 0)
        view.addSubview(segmentController)
        segmentController.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, topPadding: 0, leftPadding: 0, rightPadding: 15, bottomPadding: 0, width: 0, height: 36)
        segmentController.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        view.addSubview(addCommentBtn)
        addCommentBtn.anchor(top: nil, left: nil, bottom: nil, right: segmentController.leftAnchor, topPadding: 0, leftPadding: 0, rightPadding: 30, bottomPadding: 0, width: 30, height: 30)
        addCommentBtn.centerYAnchor.constraint(equalTo: segmentController.centerYAnchor).isActive = true
        
        view.addSubview(cancelBtn)
        cancelBtn.anchor(top: nil, left: nil, bottom: nil, right: segmentController.leftAnchor, topPadding: 0, leftPadding: 0, rightPadding: 30, bottomPadding: 0, width: 30, height: 30)
        cancelBtn.centerYAnchor.constraint(equalTo: segmentController.centerYAnchor).isActive = true
        
        return view
    }()
    
    @objc fileprivate func setSegmentColor(_ segment: UISegmentedControl) {
        
        guard let indexPath = index else {return}
        
        delegate?.handleSegmentController(indexPath: indexPath, segment: segment)
        
        switch segment.selectedSegmentIndex {
        case 0 :
            segment.selectedSegmentTintColor = .systemGreen
            self.commentTextLabel.textColor = .black
            
            lastIndexSelection = segment.selectedSegmentIndex
        case 1:
            segment.selectedSegmentTintColor = .red
            lastIndexSelection = segment.selectedSegmentIndex
            self.commentTextLabel.textColor = .red
        default:
            segment.selectedSegmentTintColor = .lightGray
            lastIndexSelection = segment.selectedSegmentIndex
            self.commentTextLabel.textColor = .black
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.textField {
            
            if textField.text?.isEmpty == false {
                //self.commentTextLabel.text = textField.text
                switchButtons(1)
       
            }else {
               
                switchTextDisplay(0)
                delegate?.handleCancelBtn(cell: self, indexPath: index!)
                print(" HANDLE CANCEL")
            }
           
            self.textField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if self.textField.text?.isEmpty == false {
            switchTextDisplay(1)
            switchButtons(0)
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let setDate = dateFormatter.string(from: date)
            let text = self.textField.text ?? ""
            self.commentTextLabel.text = "Username on \(setDate): \(text)"

        }else {
            guard let indexPath = index else {return}
            delegate?.handleCancelBtn(cell: self, indexPath: indexPath)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
       print("FRAME SIZE >>>>>>", contentView.frame.height)
   
    }
    
    // switch add comment button and cancel comment
    
    fileprivate func switchButtons(_ num: Int) {
        if num == 0 {
            self.addCommentBtn.isHidden = false
            self.cancelBtn.isHidden = true
            self.textField.resignFirstResponder()
        }else {
            self.addCommentBtn.isHidden = true
            self.cancelBtn.isHidden = false
        }
    }
    
    // switch between textField and comment text display
    
    fileprivate func switchTextDisplay( _ num: Int){
        if num == 0 {
            self.textField.isHidden = false
            self.commentTextLabel.isHidden = true
        }else {
            self.textField.isHidden = true
            self.commentTextLabel.isHidden = false
        }
    }

    
    
}

