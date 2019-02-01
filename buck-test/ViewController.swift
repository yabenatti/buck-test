import UIKit
import Cartography

final class ViewControllerView: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = .white
        setupStackView()
        titleLabel.text = "Hello"
    }

    private func setupStackView() {
        addSubview(verticalStackView)
        constrain(verticalStackView, self) { (stack, superview) in
            stack.edges == superview.edges
        }
        verticalStackView.addArrangedSubview(titleLabel)
    }
}

class ViewController: UIViewController {
    typealias CustomView = ViewControllerView

    required init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        title = "Buck Test"
    }

    override public func loadView() {
        view = CustomView()
    }
}

