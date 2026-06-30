//
//  PhotoFilterViewModel.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 26/06/26.
//

import UIKit

protocol PhotoFilterViewModelDelegate: AnyObject {
    func didUpdateImage(_ image: UIImage)
}

final class PhotoFilterViewModel {
    
    private let filterService: FilterServiceProtocol
    weak var delegate: PhotoFilterViewModelDelegate?
    
    private var originalImage: UIImage?
    private var processedImage: UIImage?

    private var selectedFilter: FilterOption?
    private var parameters = FilterParameters()
    
    var currentImage: UIImage? {
        processedImage
    }
    
    var currentFilterName: String {
        selectedFilter?.displayName ?? "Change Filter"
    }
    
    init(filterService: FilterServiceProtocol) {
        self.filterService = filterService
    }
    
    
    func setImage(_ image: UIImage) {
        originalImage = image
        processedImage = image

        delegate?.didUpdateImage(image)
    }
    
    func updateIntensity(_ value: Float) {
        parameters.intensity = value
        applyCurrentFilter()
    }
    
    func updateRadius(_ value: Float) {
        parameters.radius = value
        applyCurrentFilter()
    }
    
    func updateFilter(_ filter: FilterOption) {
        selectedFilter = filter
        applyCurrentFilter()
    }
    
    private func applyCurrentFilter() {
        guard let originalImage else { return }
        guard let selectedFilter else { return }

        processedImage = filterService.applyFilter(to: originalImage, filter: selectedFilter, parameters: parameters)

        if let processedImage {
            delegate?.didUpdateImage(processedImage)
        }
    }
}
