//
//  ColorsViewController.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/14/16.
//
//

import UIKit

class ColorsViewController :
    UIViewController,
    UICollectionViewDataSource,
    UITextFieldDelegate
{
    
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var colorCountTextField: UITextField!

    var colorCount = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "ColorsCollectionViewCell",
                                            bundle: nil),
                        forCellWithReuseIdentifier: "Cell")
        self.colorCountTextField.placeholder = "12"
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255
        let green = CGFloat(arc4random_uniform(256))/255
        let blue = CGFloat(arc4random_uniform(256))/255
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section : Int) -> Int {
        return colorCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorsCollectionViewCell
        cell.configureCellWithColor(color: randomColor())
        
        return cell
    }

    // MARK: UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count > 0 {
            if (textField.text! as NSString).replacingCharacters(in: range, with: string).characters.count <= 2 {
                let str = string.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined() // Filters string by removing non-decimal digits
                return string == str
            } else {
                return false
            }
        }
        else {
            return true
        }
    }

    // MARK: - IBActions

    @IBAction func userDidTapOnTheBackgroundView(_ sender: UITapGestureRecognizer) {
        colorCountTextField.resignFirstResponder()
        colorCount = Int(colorCountTextField.text!) ?? 12
    }

    @IBAction func userPressedGenerateNewColors(_ sender: UIButton) {
        collectionView.reloadData()
    }
}



