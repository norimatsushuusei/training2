//
//  TopMainView.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
protocol TopMainViewDelegate: NSObjectProtocol{
    func touchedButton()
}
extension TopMainViewDelegate {
}
// MARK: - Property
class TopMainView: BaseView {
    weak var delegate: TopMainViewDelegate? = nil
    @IBAction func touchedButton(_ sender: UIButton) {
        if let delegate = delegate{
        delegate.touchedButton()
        }
    }
    @IBOutlet weak var textField: UITextField!
}
// MARK: - Life cycle
extension TopMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
// MARK: - Protocol
extension TopMainView {
}
// MARK: - method
extension TopMainView {
}
