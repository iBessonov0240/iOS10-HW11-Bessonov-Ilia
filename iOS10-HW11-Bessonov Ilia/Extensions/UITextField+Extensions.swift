//
//  UITextField+Extensions.swift
//  iOS10-HW11-Bessonov Ilia
//
//  Created by i0240 on 15.06.2023.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 40, y: 0, width: 60, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
