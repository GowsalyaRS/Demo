import UIKit

class SecondScreen: UIViewController {
    let slider = UISlider()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("I am viewDidLoad - SecondScreen ")
        title = "Second Screen"
        setUpSlider()
    }
    override func loadView()
    {
        super.loadView()
        print("I am loadview - SecondScreen")
    }
    func setUpSlider(){
        view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.widthAnchor.constraint(equalToConstant: 100),
            slider.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    @objc func goToNextScreen(){
        navigationController?.pushViewController(ThirdScreen(), animated: true)
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("I am viewWillAppear 2")
    }
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        print("I am viewDidLayoutSubviews 2")
    }
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        print("I am viewWillDisappear 2")
    }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        print("I am viewDidDisappear 2")
    }
}
