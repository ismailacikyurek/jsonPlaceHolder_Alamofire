//
//  JsonPlaceHolderViewController.swift
//  CleanPlacesTableHolder
//
//  Created by İSMAİL AÇIKYÜREK on 18.07.2022.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {
    
    @IBOutlet weak var tableViewJsonPlaceHOlder: UITableView!
    
    private let jsonTableView : JsonTableView = JsonTableView()
    private let jsonService : JsonPlaceHolderProtokol = JsonPlaceHolderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      initDelegate()
        initService()
    }
    private func initDelegate() {
        tableViewJsonPlaceHOlder.delegate = jsonTableView
        tableViewJsonPlaceHOlder.dataSource = jsonTableView
        jsonTableView.delegate = self
    }

   private func initService() {
        jsonService.fethAllPost {[weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHOlder.reloadData()
        } onFail: { (data) in
            print("---")
            print(data ?? "")
        }

    }
 

}

extension JsonPlaceHolderViewController :JsonTableViewOutPutProtocol {
    func onSelected(item: PostModel) {
        print("*******-")
        print(item.body ?? "")
    }
    
    
}
