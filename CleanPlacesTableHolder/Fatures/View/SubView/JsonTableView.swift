//
//  JsonTableView.swift
//  CleanPlacesTableHolder
//
//  Created by İSMAİL AÇIKYÜREK on 18.07.2022.
//

import Foundation
import UIKit


protocol JsonTableViewProtocol {
    func update(items : [PostModel])
}

protocol JsonTableViewOutPutProtocol : class {
    func onSelected(item : PostModel)
}



/// <#Description#>
final class JsonTableView: NSObject {
    
 private lazy  var items : [PostModel] = []
    
    weak  var delegate : JsonTableViewOutPutProtocol?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
    
    
}
extension JsonTableView :  UITableViewDelegate,UITableViewDataSource {}
extension JsonTableView : JsonTableViewProtocol {
    func update(items: [PostModel]) {
        self.items = items
        
    }
    
    
}
