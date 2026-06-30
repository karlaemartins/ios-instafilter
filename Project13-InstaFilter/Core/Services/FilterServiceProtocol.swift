//
//  FilterServiceProtocol.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 25/06/26.
//

import UIKit

protocol FilterServiceProtocol {
    func applyFilter(to image: UIImage, filter: FilterOption, parameters: FilterParameters) -> UIImage?
}
