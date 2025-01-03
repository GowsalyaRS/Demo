import UIKit
class ThirdScreen : UIViewController
{
        private let usernameTextField = UITextField()
        private let passwordTextField = UITextField()
        private let emailTextField = UITextField()
        private let submitButton = UIButton(type: .system)
        private let errorLabel = UILabel()
        private var usernameIsValid = true
        private var passwordIsValid = true
        private var emailIsValid = true
        override func viewDidLoad()
        {
            super.viewDidLoad()
            print("I am viewDidLoad - ThirdScreen ")
            setupUI()
        }
        override func loadView()
        {
            super.loadView()
            print("I am loadview - ThirdScreen ")
        }
        private func setupUI()
        {
            usernameTextField.placeholder = "Username"
            usernameTextField.borderStyle = .roundedRect
            usernameTextField.autocapitalizationType = .none
            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(usernameTextField)
            emailTextField.placeholder = "Email"
            emailTextField.borderStyle = .roundedRect
            emailTextField.keyboardType = .emailAddress
            emailTextField.autocapitalizationType = .none
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(emailTextField)
            passwordTextField.placeholder = "Password"
            passwordTextField.isSecureTextEntry = true
            passwordTextField.borderStyle = .roundedRect
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(passwordTextField)
            submitButton.setTitle("Submit", for: .normal)
            submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
            submitButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(submitButton)
            errorLabel.textColor = .red
            errorLabel.numberOfLines = 0
            errorLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(errorLabel)
            NSLayoutConstraint.activate([
                usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
                emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
                passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                errorLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
        @objc private func handleSubmit()
        {
            usernameIsValid = validateUsername(usernameTextField.text ?? "")
            passwordIsValid = validatePassword(passwordTextField.text ?? "")
            emailIsValid = validateEmail(emailTextField.text ?? "")
            var errorMessage = ""
            if !usernameIsValid {
                errorMessage += "Username must be at least 3 characters long.\n"
            }
            if !passwordIsValid {
                errorMessage += "Password must be at least 6 characters long.\n"
            }
            if !emailIsValid {
                errorMessage += "Please enter a valid email address.\n"
            }
            if errorMessage.isEmpty
            {
                let username = usernameTextField.text ?? ""
                let password = passwordTextField.text ?? ""
                let email = emailTextField.text ?? ""
                print("Username: \(username)")
                print("Password: \(password)")
                print("Email: \(email)")
                errorLabel.text = "Form submitted successfully!"
                errorLabel.textColor = .green
            }
            else
            {
                errorLabel.text = errorMessage
                errorLabel.textColor = .red
            }
        }
        private func validateUsername(_ username: String) -> Bool
        {
            return username.count >= 3
        }
        private func validatePassword(_ password: String) -> Bool {
            return password.count >= 6
        }
        private func validateEmail(_ email: String) -> Bool
        {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("I am viewWillAppear 3")
    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        print("I am viewDidLayoutSubviews 3")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        print("I am viewWillDisappear 3")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        print("I am viewDidDisappear 3")
    }
    
}
