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

        return nil
    }
}
