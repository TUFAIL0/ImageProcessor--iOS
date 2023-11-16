//
//  PencilSketch.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 14/11/23.
//

import Foundation
import SwiftUI
import CoreImage

class PencilSketchProcessor {
    static func applyPencilSketch(image: UIImage) -> UIImage? {
        guard let ciImage = CIImage(image: image) else {
            return nil
        }

        // Convert
        let grayscaleFilter = CIFilter(name: "CIPhotoEffectMono")
        grayscaleFilter?.setValue(ciImage, forKey: kCIInputImageKey)

        //  edge enhcement
        let edgesFilter = CIFilter(name: "CIEdges")
        edgesFilter?.setValue(grayscaleFilter?.outputImage, forKey: kCIInputImageKey)
        edgesFilter?.setValue(2.0, forKey: kCIInputIntensityKey)

        // Combine the image with the edges
        let compositeFilter = CIFilter(name: "CISourceOverCompositing")
        compositeFilter?.setValue(edgesFilter?.outputImage, forKey: kCIInputImageKey)
        compositeFilter?.setValue(ciImage, forKey: kCIInputBackgroundImageKey)

        // Get the output image
        guard let outputImage = compositeFilter?.outputImage else {
            return nil
        }

        //  CIImage to UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
