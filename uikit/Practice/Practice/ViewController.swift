import UIKit
class ViewController: UIViewController
{
    let nextButton = UIButton()
    let silder = UISlider()
    override func loadView()
    {
        super.loadView()
        print("I am loadview - ViewController")
    }
    override func viewDidLoad()
    {
        print("I am viewDidLoad - ViewController")
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .white
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("I am viewWillAppear 1 ")
    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        print("I am viewDidLayoutSubviews 1")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        print("I am viewWillDisappear 1")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        print("I am viewDidDisappear 1")
    }
    func setupButton()
    {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .red
        nextButton.configuration?.title = "Next"
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor) ,
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    @objc func goToNextScreen()
    {
        let next = SecondScreen()
        navigationController?.pushViewController(next, animated: true)
    }
}
