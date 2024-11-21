import SwiftUI

struct ContentView: View {
    @Environment(Store.self) var store
    var body: some View {
        @Bindable var store = store
        VStack {
            Text("Here...")
                .font(.largeTitle)
            TextEditor(text: $store.displayedText1)
                .border(Color.secondary)
                .frame(height: 200)
            CounterView(count: $store.displayedCount1)
            
            Spacer().frame(height: 20)

            Text("There...")
                .font(.largeTitle)
            TextEditor(text: $store.displayedText2)
                .border(Color.secondary)
                .frame(height: 200)
            CounterView(count: $store.displayedCount2)
            
            Spacer().frame(height: 20)
            
            Button {
                store.merge()
            } label: {
                Text("Everywhere")
                    .font(.largeTitle)
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(Store())
}
