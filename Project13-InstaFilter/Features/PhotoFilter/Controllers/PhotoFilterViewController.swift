//
//  PhotoFilterViewController.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

final class PhotoFilterViewController: UIViewController, PhotoFilterViewModelDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let contentView = PhotoFilterView()
    private let viewModel = PhotoFilterViewModel(filterService: FilterService())

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }

    func didUpdateImage(_ image: UIImage) {
        contentView.imageView.image = image
    }
    
    @objc private func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)

        viewModel.setImage(image)
    }
}
