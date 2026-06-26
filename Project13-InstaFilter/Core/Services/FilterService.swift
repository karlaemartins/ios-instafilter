//
//  FilterService.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 25/06/26.
//

import UIKit
import CoreImage

final class FilterService: FilterServiceProtocol {

    private let context = CIContext()

    func applyFilter(to image: UIImage, filter: FilterOption, intensity: Float) -> UIImage? {

        guard let beginImage = CIImage(image: image) else {
            return nil
        }
        
        guard let currentFilter = CIFilter(name: filter.coreImageName) else {
            return nil
        }
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        let inputKeys = currentFilter.inputKeys
        
        
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(intensity * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: beginImage.extent.midX, y: beginImage.extent.midY), forKey: kCIInputCenterKey)
        }
        
        guard let outputImage = currentFilter.outputImage else {
            return nil
        }

        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
