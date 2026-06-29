//
//  PhotoFilterView.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

protocol PhotoFilterViewDelegate: AnyObject {
    func didChangeIntensity(_ value: Float)
    func didTapChangeFilter()
    func didTapSave()
}

final class PhotoFilterView: UIView {
    
    weak var delegate: PhotoFilterViewDelegate?

    let imageView = UIImageView()
    let intensitySlider = UISlider()

    let changeFilterButton = UIButton(type: .system)
    let saveButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PhotoFilterView {

    func setupView() {
        backgroundColor = .systemBackground

        configureImageView()
        configureSlider()
        configureButtons()
        setupHierarchy()
        setupConstraints()
    }

    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureSlider() {
        intensitySlider.translatesAutoresizingMaskIntoConstraints = false
        intensitySlider.addTarget(self, action: #selector(intensityChanged), for: .valueChanged)
    }

    func configureButtons() {
        changeFilterButton.setTitle("Change Filter", for: .normal)
        saveButton.setTitle("Save", for: .normal)

        changeFilterButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        changeFilterButton.addTarget(self, action: #selector(changeFilterTapped), for: .touchUpInside)
        
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }

    func setupHierarchy() {
        addSubview(imageView)
        addSubview(intensitySlider)
        addSubview(changeFilterButton)
        addSubview(saveButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),

            
            intensitySlider.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            intensitySlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            intensitySlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            
            changeFilterButton.topAnchor.constraint(equalTo: intensitySlider.bottomAnchor, constant: 24),
            changeFilterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            
            saveButton.centerYAnchor.constraint(equalTo: changeFilterButton.centerYAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    @objc func intensityChanged() {
        delegate?.didChangeIntensity(intensitySlider.value)
    }

    @objc func changeFilterTapped() {
        delegate?.didTapChangeFilter()
    }

    @objc func saveTapped() {
        delegate?.didTapSave()
    }
}
