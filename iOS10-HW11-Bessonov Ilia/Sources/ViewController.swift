//
//  ViewController.swift
//  iOS10-HW11-Bessonov Ilia
//
//  Created by i0240 on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        return gradient
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.layer.insertSublayer(gradient, at: 0)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

        ])
    }

    // MARK: - Actions


}

