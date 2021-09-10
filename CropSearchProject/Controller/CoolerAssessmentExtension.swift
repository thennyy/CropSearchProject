//
//  CoolerAssessmentExtension.swift
//  TestTableView
//
//  Created by Thenny Chhorn on 9/9/21.
//

import UIKit

extension CoolerAssessmentController: UITableViewDataSource, UITableViewDelegate, CellDelegate {
  
    
    func handleSegmentController(indexPath: IndexPath, segment: UISegmentedControl) {
        
         switch indexPath.row {
         
         case 0:
             self.selectSegment1 = true

         case 1:
             self.selectSegment2 = true

         case 2:
             self.selectSegment3 = true

         case 3:
             self.selectSegment4 = true

         default:
             self.selectSegment5 = true
 
         }
         checkSegmentController()
    }
    
    // check all segmentcontrollers selected
    
    func checkSegmentController() {
        
        guard selectSegment1 == true,selectSegment2 == true,
              selectSegment3 == true, selectSegment4 == true ,
              selectSegment5 == true else {return}
      
        secondTitleView.backgroundColor = .systemGreen
        isCompleted = true
        print("COMPLETTING ", isCompleted)
        
    }
   
    func handleTextField(cell: TableViewCell, indexPath: IndexPath, textField: UITextField) {
    
    
        
    }
   
    func handleCancelBtn(cell: TableViewCell, indexPath: IndexPath) {
      
         tableView.performBatchUpdates {
           
        } completion: { Bool in

            self.view.layoutIfNeeded()
        }
        
    }
    
    func handleClickedBtn(cell: TableViewCell, indexPath: IndexPath) {

        tableView.performBatchUpdates {

            tableView.estimatedRowHeight = UITableView.automaticDimension
        } completion: { Bool in

            self.view.layoutIfNeeded()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.index = indexPath
        
        // set cell background
        
        if indexPath.row % 2 == 0 {
            
            cell.backgroundColor = UIColor(white: 0, alpha: 0.2)
            
        }else {
            cell.backgroundColor = .white
        }
      
        cell.selectionStyle = .none
        cell.titleLabel.text = titleArray[indexPath.row]

        cell.addCommentBtn.tag = indexPath.row
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print(" TEXT +++++ >>>>>", tableView.contentSize.height)
   
    }
    
}

