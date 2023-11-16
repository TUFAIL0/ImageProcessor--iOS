//
//  GrayScaleView.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 14/11/23.
//

import SwiftUI

struct GrayScaleView: View {
    @State private var grayscaleImage: Image?
    @State private var coolImage: Image?
    @State private var MonoChromaticImage: Image?
    @State private var PencilImage: Image?
    @State private var SomeFilter: Image?
    
    @State private var selectedImage: Image?
    
    //Variable to Control the Displaying Effect
    @State private var isDetailViewActive: Bool = false

    var body: some View {
        
        ScrollView(.horizontal) {
            HStack{
                VStack {
                    Text("GrayScale")
                        .font(.headline)
                        .padding()
                    grayscaleImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack {
                    Text("Cool")
                        .font(.headline)
                        .padding()
                    coolImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                VStack {
                    Text("Monochromatic")
                        .font(.headline)
                        .padding()
                    MonoChromaticImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack {
                    Text("Pencil Sketch")
                        .font(.headline)
                        .padding()

                    PencilImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                VStack {
                    Text("Some filter")
                        .font(.headline)
                        .padding()

                    SomeFilter?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                           print("The Image is selected")
                          isDetailViewActive = true
                            selectedImage = SomeFilter
    
                        }
                }
            }
        }
        .onAppear {
            // Call the function to convert the image to grayscale
            convertImageToGrayscale()
            convertImageToCool()
            convertImagetoMonoChromatic()
            convertImagetoPencilSketch()
            convertImageToSome()
        }
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
    func convertImageToCool() {
        if let originalImage = UIImage(named: "Image") {
            if let coolEffectImage = ConvertToCoolEffect.applyCoolEffect(image: originalImage) {
                coolImage = Image(uiImage: coolEffectImage)
            } else {
                print("Error applying cool effect to the image.")
            }
        } else {
            print("Error loading the original image.")
        }
    }
    func convertImagetoMonoChromatic(){
        if let original = UIImage(named: "Image"){
            if let MonoChromaticEffectImage = MonoChromatic.convertToMonochrome(image: original){
                MonoChromaticImage = Image(uiImage: MonoChromaticEffectImage)
            }else {
                print("Error applying MonoCHromatioc effect to the image.")
            }
        }
        else {
            print("Error loading the original image.")
        }
    }
    func convertImagetoPencilSketch(){
        if let original = UIImage(named: "Image"){
            if let PencilEffectImage = PencilSketchProcessor.applyPencilSketch(image: original){
                PencilImage = Image(uiImage: PencilEffectImage)
            }else {
                print("Error applying Pencil to the image.")
            }
        }
        else {
            print("Error loading the original image.")
        }
    }
    func convertImageToSome() {
        if let originalImage = UIImage(named: "Image") {
            if let coolEffectImage = SomeEffect.applySomeEffect(image: originalImage) {
                SomeFilter = Image(uiImage: coolEffectImage)
            } else {
                print("Error applying cool effect to the image.")
            }
        } else {
            print("Error loading the original image.")
        }
    }
    

}


#Preview {
    GrayScaleView()
}
 
