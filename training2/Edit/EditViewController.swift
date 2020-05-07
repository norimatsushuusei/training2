//
//  EditViewController.swift
//  training2
//
//  Created by ASW-研修４ on 2020/05/07.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class EditViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var editMainView: EditMainView!
    
    var postModel: PostModel = PostModel()
}
// MARK: - Life cycle
extension EditViewController {
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
        giveModel()
    }
}
// MARK: - Protocol
extension EditViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        if let text = editMainView.textField.text {
            postModel.description = text
        }
        PostModel.update(request: postModel)  {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
extension EditViewController :EditMainViewDelegate {
    func touchedDeleteButton() {
        PostModel.delete(id: postModel.id) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - method
extension EditViewController {
    func setDelegate() {
        headerView.delegate = self
        editMainView.delegate = self
    }
    func setHeaderView() {
        headerView.setLeft(text: "キャンセル")
        headerView.setRight(text: "完了")
    }
    func giveModel() {
        editMainView.updateView(postModel: postModel)
    }
}
