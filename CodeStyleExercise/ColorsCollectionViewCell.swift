//
//  ColorsViewController.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/19/16.
//
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hexColorLbl: UILabel!

    override var isSelected: Bool {
        didSet {
            hexColorLbl.isHidden = !isSelected
        }
    }

    func configureCellWithColor(color: UIColor) -> () {
        backgroundColor = color
        hexColorLbl.textColor = color.val > 0.5 ? UIColor.black : UIColor.white
        hexColorLbl.text = "#\(color.colorConvertedToHexStringOfLengthSix())"
    }
}

extension UIColor {

    func colorConvertedToHexStringOfLengthSix() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: nil)

        return String(format: "%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
    }

    // This val represents the constrast score of the UIColor. If it is over 0.5, it is lighter, and if it is under, it is darker
    var val: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: nil)

        return ((red * 299) + (green * 587) + (blue * 114)) / 1000
    }
}
