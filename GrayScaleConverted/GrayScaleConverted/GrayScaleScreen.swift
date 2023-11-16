//
//  GrayScaleScreen.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 14/11/23.
// Display GrayScreen

import SwiftUI

struct GrayScaleScreen: View {
    @State private var grayscaleImage: Image?
    var body: some View {
        grayscaleImage?
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fit)
    }
    
    func convertImageToGrayscale() {
        // Perform grayscale conversion when the button is pressed
        if let result = ImageProcessor.processImage(imageName: "Image") {
            let grayscaleData = GrayscaleConverter.convertToGrayscale(result)
            grayscaleImage = Image(uiImage: GrayscaleConverter.createImageFromGrayscale(result: grayscaleData)!)
        } else {
            print("Error processing image.")
        }
    }

}

 struct GrayScaleScreen_Previews: PreviewProvider {
    static var previews: some View {
        GrayScaleScreen()
    }
}
