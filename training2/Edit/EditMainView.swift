//
//  EditMainView.swift
//  training2
//
//  Created by ASW-研修４ on 2020/05/07.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
protocol EditMainViewDelegate: NSObjectProtocol{
    func touchedDeleteButton()
}
extension EditMainViewDelegate {
}
// MARK: - Property
class EditMainView: BaseView {
    weak var delegate: EditMainViewDelegate? = nil
    @IBOutlet weak var textField: UITextField!
    @IBAction func touchedDeleteButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedDeleteButton()}
    }
}
// MARK: - Life cycle
extension EditMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditMainView {
}
// MARK: - method
extension EditMainView {
    func updateView(postModel: PostModel) {
        textField.text = postModel.description
    }
}
