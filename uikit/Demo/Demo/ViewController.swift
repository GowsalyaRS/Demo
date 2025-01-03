import UIKit
class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.setTitle("Show Menu", for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
        button.menu = createMenu()
        button.showsMenuAsPrimaryAction = true
        view.addSubview(button)
    }
    func createMenu() -> UIMenu
    {
        let action1 = UIAction(title: "Action 1", image: UIImage(systemName: "star"), handler: { _ in
            print("Action 1 selected")
        })
        let action2 = UIAction(title: "Action 2", image: UIImage(systemName: "heart"), handler: { _ in
            print("Action 2 selected")
        })
        let action3 = UIAction(title: "Action 3", image: UIImage(systemName: "bag"), handler: { _ in
            print("Action 3 selected")
        })
        return UIMenu(title: "Menu Title", children: [action1, action2, action3])
    }
}

