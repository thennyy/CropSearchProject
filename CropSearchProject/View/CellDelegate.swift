//
//  CellDelegate.swift
//  TestTableView
//
//  Created by Thenny Chhorn on 9/9/21.
//

import UIKit

protocol CellDelegate {
    func handleClickedBtn(cell: TableViewCell, indexPath: IndexPath)
    func handleCancelBtn(cell: TableViewCell, indexPath: IndexPath)
    func handleTextField(cell: TableViewCell, indexPath: IndexPath, textField: UITextField)
    func handleSegmentController( indexPath: IndexPath, segment: UISegmentedControl)
    
}
