//
//  LoadingView.swift
//  TodoList
//
//  Created by Hamad Ashraf on 13/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View{
        Group {
            if isLoading{
                LoadingView()
                    .onAppear{
                        //Simulate some asynchronous task (e.g., fetching data)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            }else {
                    NavigationView {
                        ListView()
                    }
                    .environmentObject(ListViewModel)
                }
            }
        }
    }

struct LoadingView: View{
    var body: some View{
        VStack{
            ProgressView("Loading...")
                .padding()
        }
    }
}

struct ContentView_Previewa: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ListViewModel())
    }
}
