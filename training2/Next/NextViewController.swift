//
//  NextViewController.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class NextViewController: BaseViewController{
    @IBOutlet weak var nextMainView: NextMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var postModels: [PostModel] = [PostModel]()
}
// MARK: - Life cycle
extension NextViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getModel()
    }
}
// MARK: - Protocol
extension NextViewController :NextMainViewDelegate{
    func didSelectRowAt(indexPath: IndexPath) {
        let thirdViewController = ThirdViewController()
        thirdViewController.postModel = postModels[indexPath.row]
        navigationController?.pushViewController(thirdViewController, animated: true)
        animatorManager.navigationType = .slide_push
        
    }
}
extension NextViewController :HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension NextViewController {
    func setDelegate() {
        nextMainView.delegate = self
        headerView.delegate = self
    }
    func setHeaderView() {
        headerView.setLeft(text: "<", fontSize: 18)
    }
    func getModel() {
        PostModel.reads { (postModels) in
            self.postModels = postModels
            self.nextMainView.getModel(postModels: postModels)
        }
    }
}
