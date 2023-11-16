import SwiftUI

struct ContentView: View  {
   @State  private var originalImage: Image?
    

    var body: some View {
        VStack {
            // Display the original image
            originalImage?
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 400)
                .aspectRatio(contentMode: .fit)
            
   
            NavigationView {
                NavigationLink(destination: GrayScaleView()) {
                    Text("Apply filter")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }.navigationBarTitle("First Screen")
                
            }
           
            .padding()
            
        }
            .onAppear {
            
            originalImage = Image("Image")
        }
        
    }
    


    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

