//
// Copyright (c) 2019 Adyen B.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Displays a list item.
/// :nodoc:
public final class ListItemView: UIView {
    
    /// Initializes the list item view.
    public init() {
        super.init(frame: .zero)
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        configureConstraints()
    }
    
    /// :nodoc:
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Item
    
    /// The item displayed in the item view.
    public var item: ListItem? {
        didSet {
            titleLabel.text = item?.title
            imageView.imageURL = item?.imageURL
        }
    }
    
    // MARK: - Image View
    
    private lazy var imageView: NetworkImageView = {
        let imageView = NetworkImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4.0
        imageView.layer.borderWidth = 1.0 / UIScreen.main.nativeScale
        imageView.layer.borderColor = UIColor(white: 0.0, alpha: 0.2).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Title Label
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 17.0)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    // MARK: - Layout
    
    private func configureConstraints() {
        let constraints = [
            imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 40.0),
            imageView.heightAnchor.constraint(equalToConstant: 26.0),
            
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
