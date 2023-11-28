//
//  ContentView.swift
//  SwiftUIApiCalls
//
//  Created by Tayami Rai on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){course in
                    
                    HStack{
                        URLImage(urlString: course.image)
                            
                        Text(course.name)
                            .bold()
                        
                    }
                    .padding(3)
                    
                }
            }
            .navigationTitle("Courses")
            .onAppear{
                viewModel.fetch()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
