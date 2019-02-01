import UIKit

protocol CustomViewController {
    associatedtype CustomView: UIView
}

extension CustomViewController where Self: UIViewController {
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected this view controller's view to be of type \(CustomView.self) but got \(type(of: view))")
        }
        return customView
    }
}
