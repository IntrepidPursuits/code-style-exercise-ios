//
//  ColorsViewController.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/14/16.
//
//

import UIKit

final class ColorsViewController: UIViewController, UICollectionViewDataSource, UITextFieldDelegate {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var colorCountTextField: UITextField!
    
    var ct: Int? = 12
    
    class Constants {
        static let defaultColorNumber = 12
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        colorCountTextField.text = "\(Constants.defaultColorNumber)"
    }
    
    // MARK: - CollectionViewDataSource
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section : Int) -> Int {
        return ct!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorsCollectionViewCell
        c.configureCell(withColor: random_ui_color())
        return c
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count > 0 {
            if (textField.text! as NSString).replacingCharacters(in: range, with: string).characters.count <= 2 {
                let str = string.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined()
                return string == str
            }
            return false
        }
        return true
    }
    
    // MARK: IBActions
    @IBAction func userDidTapOnTheBackgroundView(_ sender: UITapGestureRecognizer) {
        colorCountTextField.resignFirstResponder()
        ct = Int(colorCountTextField.text ?? "12")
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        collectionView.reloadData()
    }
    
    // MARK: HelperFunctions
    public func random_ui_color() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255
        let green = CGFloat(arc4random_uniform(256))/255
        let blue = CGFloat(arc4random_uniform(256))/255
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
