//
//  PhotoFilterViewController.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

final class PhotoFilterViewController: UIViewController {

    private let contentView = PhotoFilterView()
    private let viewModel = PhotoFilterViewModel(filterService: FilterService())

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        contentView.delegate = self
        contentView.setButtonsEnabled(false)

        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }

    @objc private func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let title: String
        let message: String

        if let error {
            title = "Save Error"
            message = error.localizedDescription
        } else {
            title = "Saved!"
            message = "Your edited image has been saved to your photo library."
        }

        showAlert(title: title, message: message)
    }
    
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

// MARK: - PhotoFilterViewModelDelegate
extension PhotoFilterViewController: PhotoFilterViewModelDelegate {

    func didUpdateImage(_ image: UIImage) {
        contentView.updateImage(image)
        contentView.setButtonsEnabled(true)
    }
}


// MARK: - UIImagePickerControllerDelegate
extension PhotoFilterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)

        viewModel.setImage(image)
    }
}

// MARK: - PhotoFilterViewDelegate
extension PhotoFilterViewController: PhotoFilterViewDelegate {
    
    func didChangeIntensity(_ value: Float) {
        viewModel.updateIntensity(value)
    }
    
    func didChangeRadius(_ value: Float) {
        viewModel.updateRadius(value)
    }
    
    func didTapChangeFilter() {
        let ac = UIAlertController(title: "Choose Filter", message: nil, preferredStyle: .actionSheet)

        for filter in FilterOption.allCases {
            ac.addAction(UIAlertAction(title: filter.displayName, style: .default) { [weak self] _ in
                guard let self else { return }

                viewModel.updateFilter(filter)
                contentView.updateFilterButtonTitle(viewModel.currentFilterName)
            })
        }

        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func didTapSave() {
        guard let image = viewModel.currentImage else { return }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

