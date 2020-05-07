//
//  NextMainTableViewCell.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
protocol NextMainTableViewCellDelegate: NSObjectProtocol{
}
extension NextMainTableViewCellDelegate {
}
// MARK: - Property
class NextMainTableViewCell: BaseTableViewCell {
    weak var delegate: NextMainTableViewCellDelegate? = nil
    @IBOutlet weak var descriptionLabel: UILabel!
}
// MARK: - Life cycle
extension NextMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension NextMainTableViewCell {
}
// MARK: - method
extension NextMainTableViewCell {
    func updateCell(postModel: PostModel) {
        descriptionLabel.text = postModel.description
    }
}
