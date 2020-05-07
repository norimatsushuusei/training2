//
//  ThirdViewController.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class ThirdViewController: BaseViewController {
    @IBOutlet weak var thirdMainView: ThirdMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var postModel: PostModel = PostModel()
}
// MARK: - Life cycle
extension ThirdViewController {
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
        setLabel()
        getModel()
    }
}
// MARK: - Protocol
extension ThirdViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.postModel = postModel
        editViewController.modalPresentationStyle = .fullScreen
        present(editViewController, animated: true, completion: nil)
    }
}
// MARK: - method
extension ThirdViewController {
    func setDelegate() {
        headerView.delegate = self
    }
    func setHeaderView() {
        headerView.setLeft(text: "<", fontSize: 18, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        headerView.setRight(text: "編集", fontSize: 18, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    }
    func setLabel() {
        thirdMainView.discriptionLabel.text = postModel.description
    }
    func getModel() {
        PostModel.readAt(id: postModel.id, success: { (postModel) in
            self.postModel = postModel
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
}
