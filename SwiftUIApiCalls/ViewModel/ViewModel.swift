//
//  ViewModel.swift
//  SwiftUIApiCalls
//
//  Created by Tayami Rai on 28/11/2023.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var courses: [Course] = []
    
    func fetch(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php")
        else{
            return
        }
        
        //performing an api call
        
        let task = URLSession.shared.dataTask(with: url){[weak self]data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
            
            
            // convert to JSON
            
            do{
                let course = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = course;
                }
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
