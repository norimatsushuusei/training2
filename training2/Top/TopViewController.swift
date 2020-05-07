//
//  TopViewController.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class TopViewController: BaseViewController{
    @IBOutlet weak var mainView: TopMainView!
    @IBOutlet weak var headerView: HeaderView!
    
}
// MARK: - Life cycle
extension TopViewController {
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
    }
}
// MARK: - Protocol
extension TopViewController: TopMainViewDelegate{
    func touchedButton() {
        let postModel: PostModel = PostModel()
        if let text = mainView.textField.text {
            postModel.description = text
        }
        
        PostModel.create(request: postModel){
        let nextViewController = NextViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
            self.animatorManager.navigationType = .slide_push
        }
    }
}
extension TopViewController: HeaderViewDelegate {
    func touchedRightButton(_ sender: UIButton) {
        let nextViewController = NextViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension TopViewController {
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
    func setHeaderView() {
        headerView.setRight(text: "投稿一覧", fontSize: 18, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    }
}
