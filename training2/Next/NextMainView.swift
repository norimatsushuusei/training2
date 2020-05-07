//
//  NextMainView.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
protocol NextMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt(indexPath: IndexPath)
}
extension NextMainViewDelegate {
}
// MARK: - Property
class NextMainView: BaseView {
    weak var delegate: NextMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
    
    var postModels: [PostModel] = [PostModel]()
}
// MARK: - Life cycle
extension NextMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        loadTableViewCellFromXib(tableView: tableView, cellName: "NextMainTableViewCell")
    }
}
// MARK: - Protocol
extension NextMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NextMainTableViewCell", for: indexPath)as?
            NextMainTableViewCell else {return UITableViewCell()}
        cell.updateCell(postModel: postModels[indexPath.row])
        return cell
    }
}
    
extension NextMainView :UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {delegate.didSelectRowAt(indexPath: indexPath)}
    }
}
// MARK: - method
extension NextMainView {
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    func getModel(postModels: [PostModel]){
        self.postModels = postModels
        tableView.reloadData()
    }
}
