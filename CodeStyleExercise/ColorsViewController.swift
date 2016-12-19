//
//  ColorsViewController.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/14/16.
//
//

import UIKit

class ColorsViewController: UIViewController, UICollectionViewDataSource, UITextFieldDelegate {

    private struct Constants {
        static let defaultColorsCount = 12
    }

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var colorCountTextField: UITextField!

    private var colorsCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: String(describing: ColorsCollectionViewCell.self), bundle: nil),
            forCellWithReuseIdentifier: ColorsCollectionViewCell.defaultIdentifier
        )

        colorCountTextField.placeholder = "\(Constants.defaultColorsCount)"
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsCount ?? Constants.defaultColorsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorsCollectionViewCell.defaultIdentifier, for: indexPath)

        guard let colorCell = cell as? ColorsCollectionViewCell else {
            fatalError("Cell must be of type ColorsCollectionViewCell")
        }

        colorCell.configure(with: UIColor.random)
        return colorCell
    }

    // MARK: - UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string.characters.count > 0 else { return true }
        guard
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string),
            newText.characters.count <= 2
            else { return false }

        let filteredString = string.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined()
        return string == filteredString
    }

    // MARK: - IBActions

    @IBAction func handleBackgroundTap(_ sender: UITapGestureRecognizer) {
        colorCountTextField.resignFirstResponder()
        colorsCount = Int(colorCountTextField.text ?? "")
    }

    @IBAction func generateButtonPressed(_ sender: Any) {
        collectionView.reloadData()
    }
}

extension UIColor {
    static var random: UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255
        let green = CGFloat(arc4random_uniform(256)) / 255
        let blue = CGFloat(arc4random_uniform(256)) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
