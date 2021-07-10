import UIKit
import PlaygroundSupport



//MARK:- View Controller 1

class ViewController1: UIViewController {
    
    
    
    //MARK:- Private Properties
    
    private let label = UILabel()
    
    
    
    //MARK:- Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLabel()
    }
    
    
    
    //MARK:- Private Methods
    
    private func setup() {
        view.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 500))
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
            let viewController = ViewController2()
            let navigationController = UINavigationController(rootViewController: viewController)
            viewController.modalPresentationStyle = .automatic
            self?.present(navigationController, animated: true)
        }
    }
    
    private func setupLabel() {
        label.backgroundColor = .systemPink
        label.frame = CGRect(x: 50, y: 210, width: 200, height: 80)
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.text = "View Controller 2 will open in 3 … 2 … 1 …"
        label.textAlignment = .center
        label.textColor = .white
        view.addSubview(label)
    }
    
}



//MARK:- View Controller 2


class ViewController2: UIViewController {
    
    
    
    //MARK:- Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
    
    
    
    //MARK:- Private Methods
    
    private func setup() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        view = blurEffectView
    }
    
    private func setupNavigationBar() {
        title = "Swipe to dismiss"
    }
    
}



//MARK:- Live View

PlaygroundPage.current.liveView = ViewController1()

