//
//  RGBValue.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 10/11/23.
//  Gwt The RGB value 
import SwiftUI
import Foundation


class ImageProcessor {
    static func processImage(imageName: String) -> [[(red: UInt8, green: UInt8, blue: UInt8)]]? {
        if let image = UIImage(named: imageName) {
            if let cgImage = image.cgImage {
                let width = cgImage.width
                let height = cgImage.height

                // Create a bitmap context
                let colorSpace = CGColorSpaceCreateDeviceRGB()
                let bytesPerPixel = 4
                let bytesPerRow = bytesPerPixel * width
                var pixelData = [UInt8](repeating: 0, count: width * height * bytesPerPixel)

                let context = CGContext(data: &pixelData,
                                        width: width,
                                        height: height,
                                        bitsPerComponent: 8,
                                        bytesPerRow: bytesPerRow,
                                        space: colorSpace,
                                        bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)

                // Draw the image into the context
                context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

                // Access RGB values for each pixel
                var result: [[(red: UInt8, green: UInt8, blue: UInt8)]] = []
                for y in 0..<height {
                    var row = [(red: UInt8, green: UInt8, blue: UInt8)]()
                    for x in 0..<width {
                        let pixelIndex = (y * width + x) * bytesPerPixel
                        let red = pixelData[pixelIndex]
                        let green = pixelData[pixelIndex + 1]
                        let blue = pixelData[pixelIndex + 2]

                        row.append((red: red, green: green, blue: blue))
                    }
                    result.append(row)
                }
                return result
            }
        }
        print("Error processing image.")
        return nil
    }
}

