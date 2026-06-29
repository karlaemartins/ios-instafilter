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
    private var selectedFilter: FilterOption = .sepia
    private var intensity: Float = 0.5
    private var processedImage: UIImage?
    
    init(filterService: FilterServiceProtocol) {
        self.filterService = filterService
    }
    
    func setImage(_ image: UIImage) {
        originalImage = image
        processedImage = filterService.applyFilter(to: image, filter: selectedFilter, intensity: intensity)
        
        if let processedImage {
            delegate?.didUpdateImage(processedImage)
        }
    }
    
    

}
