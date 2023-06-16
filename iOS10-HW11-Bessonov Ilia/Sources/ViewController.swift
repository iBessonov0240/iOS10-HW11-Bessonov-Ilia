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

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = .systemFont(ofSize: 27, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(UIImage(systemName: "person")!)
        textField.textColor = .systemGray
        textField.tintColor = .lightGray
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Login or email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont(name: "Arial", size: 11)!])
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(UIImage(systemName: "lock")!)
        textField.textColor = .systemGray
        textField.tintColor = .lightGray
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont(name: "Arial", size: 11)!])
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var separateLineStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .equalSpacing
            stack.spacing = 5
            stack.backgroundColor = .clear
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            stack.isLayoutMarginsRelativeArrangement = true
            stack.addArrangedSubview(separateLeftLineView)
            stack.addArrangedSubview(connectLabel)
            stack.addArrangedSubview(separateRightLineView)
            return stack
        }()

    private lazy var separateLeftLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        return view
    }()

    private lazy var connectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or connect with"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    private lazy var separateRightLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        return view
    }()

    private lazy var socialButtonsStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .equalSpacing
            stack.spacing = 10
            stack.backgroundColor = .clear
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            stack.isLayoutMarginsRelativeArrangement = true
            stack.addArrangedSubview(faceBookButton)
            stack.addArrangedSubview(twitterButton)
            return stack
        }()

    private lazy var faceBookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.setImage(UIImage(named: "ic-facebook")!, for: .normal)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        button.contentHorizontalAlignment = .center
        button.imageView?.trailingAnchor.constraint(equalTo: button.centerXAnchor, constant: -5).isActive = true
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(facebookPressed), for: .touchUpInside)
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.setImage(UIImage(named: "ic-twitter")!, for: .normal)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        button.contentHorizontalAlignment = .center
        button.imageView?.trailingAnchor.constraint(equalTo: button.centerXAnchor, constant: -15).isActive = true
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(twitterPressed), for: .touchUpInside)
        return button
    }()

    private lazy var signUpStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addArrangedSubview(haventAccountLabel)
        stack.addArrangedSubview(signUpButton)
        return stack
        }()

    private lazy var haventAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dont have account?"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor.blue.withAlphaComponent(0.5), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
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
        view.addSubviews([loginLabel, loginTextField, passwordTextField, loginButton, forgotPasswordButton, separateLineStack, socialButtonsStack, signUpStack])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.heightAnchor.constraint(equalToConstant: 35),

            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 45),
            loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 45),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),

            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 45),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),

            separateLineStack.topAnchor.constraint(lessThanOrEqualTo: forgotPasswordButton.bottomAnchor, constant: 150),
            separateLineStack.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            separateLineStack.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            separateLineStack.heightAnchor.constraint(equalToConstant: 10),

            connectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectLabel.leadingAnchor.constraint(equalTo: separateLeftLineView.trailingAnchor, constant: 10),
            connectLabel.trailingAnchor.constraint(equalTo: separateRightLineView.leadingAnchor, constant: -10),

            separateLeftLineView.heightAnchor.constraint(equalToConstant: 1),
            separateRightLineView.heightAnchor.constraint(equalToConstant: 1),

            socialButtonsStack.topAnchor.constraint(equalTo: separateLineStack.bottomAnchor, constant: 25),
            socialButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            socialButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            socialButtonsStack.heightAnchor.constraint(equalToConstant: 35),

            faceBookButton.widthAnchor.constraint(equalTo: socialButtonsStack.widthAnchor, multiplier: 0.44),
            faceBookButton.heightAnchor.constraint(equalTo: socialButtonsStack.heightAnchor),

            twitterButton.widthAnchor.constraint(equalTo: socialButtonsStack.widthAnchor, multiplier: 0.44),
            twitterButton.heightAnchor.constraint(equalTo: socialButtonsStack.heightAnchor),

            signUpStack.topAnchor.constraint(equalTo: socialButtonsStack.bottomAnchor, constant: 35),
            signUpStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpStack.heightAnchor.constraint(equalToConstant: 12),

            haventAccountLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 35),
            signUpButton.leadingAnchor.constraint(equalTo: haventAccountLabel.trailingAnchor, constant: 10)

        ])
    }

    // MARK: - Actions

    @objc func loginButtonPressed() {
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "Invalid login or password",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }

    @objc func forgotPasswordButtonPressed() {
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "Try it later...",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }

    @objc func facebookPressed() {
        let alert = UIAlertController(title: "Connect to facebook",
                                      message: "Are you sure to connect to facebook?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in

        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in

        }

        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    @objc func twitterPressed() {
        let alert = UIAlertController(title: "Connect to twitter",
                                      message: "Are you sure to connect to twitter?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in

        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in

        }

        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    @objc func signUpButtonPressed() {
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "Try it later...",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

