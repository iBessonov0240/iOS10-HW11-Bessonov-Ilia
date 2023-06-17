//
//  UIView+Extensions.swift
//  iOS10-HW11-Bessonov Ilia
//
//  Created by i0240 on 15.06.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
