/*****************************************
 *  ColorsCollectionViewCell.swift       *
 *  CodeStyleExercise                    *
 *                                       *
 *  Created by Maya Saxena on 12/19/16.  *
 *****************************************/

import UIKit

final class ColorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var hexColorLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            hexColorLabel.isHidden = !isSelected
        }
    }
    
    func configureCell(withColor: UIColor) -> () {
        backgroundColor = withColor
        hexColorLabel.textColor = withColor.val > 0.5 ? UIColor.black : UIColor.white
        hexColorLabel.text = "#\(withColor.colorConvertedToHexStringOfLengthSix())"
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
    
    var val: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return ((red * 299) + (green * 587) + (blue * 114)) / 1000
    }
}
