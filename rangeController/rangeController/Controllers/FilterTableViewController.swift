//
//  FilterTableViewController.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    var model : [ValueController] = [] {
        didSet {
            validator = ValuesValidator(values: model)
        }
    }
    
    var validator : ValuesValidator!
    
    weak var delegate : FilterDataDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    @IBAction func closeButtonPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension FilterTableViewController {
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath)
            as? FilterCell else { return UITableViewCell() }
        
        if model[indexPath.section].delegate == nil {
            model[indexPath.section].delegate = self
        }
        
        cell.setupRange(values: model[indexPath.section])
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 54))
        let label = UILabel(frame: CGRect(x: 9, y: 17, width: 15, height: 20))
        
        view.addSubview(label)
        view.backgroundColor = #colorLiteral(red: 0.8506349921, green: 0.8506349921, blue: 0.8506349921, alpha: 1)
        
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        label.text = "\(section + 1)"
        
        return view
    }
}

extension FilterTableViewController {
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
}

extension FilterTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension FilterTableViewController : ValueChangedDelegate {
    
    func didChangeValue() {
        print(validator.validate())
    }
}
