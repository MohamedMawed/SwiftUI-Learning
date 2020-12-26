import SwiftUI


struct DetailedView: View {
    var selectedImage: String;
    @State private var isHeaderHidden = false;
    
    var body: some View {
        ZStack
        {
            if isHeaderHidden {
                Color.gray
                    .ignoresSafeArea()
            }
            Image(selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationBarTitle(Text(selectedImage), displayMode: .inline)
                .navigationBarHidden(isHeaderHidden)
                .onTapGesture {
                    isHeaderHidden.toggle()
                }
        }
    }
}

struct ContentView: View {
    private var screens = [ "01", "02", "03"];

    var body: some View {
        NavigationView {
            List {
                ForEach(screens, id: \.self) { screen in
                    NavigationLink(
                        destination: DetailedView(selectedImage: screen),
                        label: {
                            Text(screen)
                        })
                }
            }.navigationBarTitle(Text("Storm Viewer"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
