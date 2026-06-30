//
//  PhotoFilterView.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

protocol PhotoFilterViewDelegate: AnyObject {
    func didChangeIntensity(_ value: Float)
    func didChangeRadius(_ value: Float)
    func didTapChangeFilter()
    func didTapSave()
}

final class PhotoFilterView: UIView {
    
    weak var delegate: PhotoFilterViewDelegate?

    private let imageView = UIImageView()
    
    private let intensityLabel = UILabel()
    private let intensitySlider = UISlider()
    
    private let radiusLabel = UILabel()
    private let radiusSlider = UISlider()
    
    private let changeFilterButton = UIButton(type: .system)
    private let saveButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func updateFilterButtonTitle(_ title: String) {
        changeFilterButton.setTitle(title, for: .normal)
    }
    
    func setButtonsEnabled(_ isEnabled: Bool) {
        changeFilterButton.isEnabled = isEnabled
        saveButton.isEnabled = isEnabled
    }
}


private extension PhotoFilterView {

    func setupView() {
        backgroundColor = .systemBackground

        configureImageView()
        configureLabels()
        configureIntensitySlider()
        configureRadiusSlider()
        configureButtons()
        setupHierarchy()
        setupConstraints()
    }

    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLabels() {
        intensityLabel.text = "Intensity"
        radiusLabel.text = "Radius"

        intensityLabel.font = .preferredFont(forTextStyle: .caption1)
        radiusLabel.font = .preferredFont(forTextStyle: .caption1)

        intensityLabel.translatesAutoresizingMaskIntoConstraints = false
        radiusLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureIntensitySlider() {
        intensitySlider.minimumValue = 0
        intensitySlider.maximumValue = 1
        intensitySlider.value = 0
        intensitySlider.translatesAutoresizingMaskIntoConstraints = false
        intensitySlider.addTarget(self, action: #selector(intensityChanged), for: .valueChanged)
    }
    
    func configureRadiusSlider() {
        radiusSlider.minimumValue = 0
        radiusSlider.maximumValue = 200
        radiusSlider.value = 0
        radiusSlider.translatesAutoresizingMaskIntoConstraints = false
        radiusSlider.addTarget(self, action: #selector(radiusChanged), for: .valueChanged)
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

        addSubview(intensityLabel)
        addSubview(intensitySlider)

        addSubview(radiusLabel)
        addSubview(radiusSlider)

        addSubview(changeFilterButton)
        addSubview(saveButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),

            intensityLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            intensityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            intensitySlider.topAnchor.constraint(equalTo: intensityLabel.bottomAnchor, constant: 8),
            intensitySlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            intensitySlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            radiusLabel.topAnchor.constraint(equalTo: intensitySlider.bottomAnchor, constant: 16),
            radiusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            radiusSlider.topAnchor.constraint(equalTo: radiusLabel.bottomAnchor, constant: 8),
            radiusSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            radiusSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            changeFilterButton.topAnchor.constraint(equalTo: radiusSlider.bottomAnchor, constant: 24),
            changeFilterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            saveButton.centerYAnchor.constraint(equalTo: changeFilterButton.centerYAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    @objc func intensityChanged() {
        delegate?.didChangeIntensity(intensitySlider.value)
    }
    
    @objc func radiusChanged() {
        delegate?.didChangeRadius(radiusSlider.value)
    }

    @objc func changeFilterTapped() {
        delegate?.didTapChangeFilter()
    }

    @objc func saveTapped() {
        delegate?.didTapSave()
    }
}
