//
//  ViewController.swift
//  DatePickerTableViewCellSample
//
//  Created by Fumiya Tanaka on 2021/08/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var isExpandArray: [Bool] = [false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isExpandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.delegate = self
        
        if isExpandArray[indexPath.row] == true {
            cell.datePicker.isHidden = false
        } else {
            cell.datePicker.isHidden = true
        }
        
        return cell
    }
    
    func didTapActionButton(cell: UITableViewCell) {
        let indexPath = tableView.indexPath(for: cell)!
        isExpandArray[indexPath.row] = !isExpandArray[indexPath.row]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
