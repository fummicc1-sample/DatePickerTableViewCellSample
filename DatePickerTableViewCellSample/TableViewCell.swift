//
//  TableViewCell.swift
//  DatePickerTableViewCellSample
//
//  Created by Fumiya Tanaka on 2021/08/05.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapActionButton(cell: UITableViewCell)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: TableViewCellDelegate?
    
    @IBAction func tapActionButton() {
        delegate?.didTapActionButton(cell: self)
    }
    
}
