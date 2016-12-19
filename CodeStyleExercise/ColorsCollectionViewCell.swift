//
//  ColorsCollectionViewCell.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/19/16.
//
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {

    public static let defaultIdentifier = String(describing: ColorsCollectionViewCell.self)

    @IBOutlet weak var hexColorLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            hexColorLabel.isHidden = !isSelected
        }
    }

    func configure(with color: UIColor) {
        backgroundColor = color
        hexColorLabel.textColor = color.contrastValue > 0.5 ? UIColor.black : UIColor.white
        hexColorLabel.text = "#\(color.hexString)"
    }
}

private extension UIColor {

    var hexString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: nil)

        return String(format: "%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
    }

    /// The lightness or darkness of a color on a scale from 0 (darkest) to 1 (lightest)
    var contrastValue: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: nil)

        return ((red * 299) + (green * 587) + (blue * 114)) / 1000
    }
}
