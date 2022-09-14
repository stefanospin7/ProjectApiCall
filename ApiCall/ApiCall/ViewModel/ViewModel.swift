//
//  ViewModel.swift
//  ApiCall
//
//  Created by stefano.spinelli on 13/09/22.
//

import Foundation


class ViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetch() {
        guard let url = URL(string:"http://demo7578280.mockable.io/nomi") else {
            
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _ , error in
            
            guard let data = data, error == nil else {
                
                return
            }
            //Converting Json
            do{
                
                let users = try  JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                }  
                
            }
            catch{
                
                print(error)
                
            }
            
        }
        task.resume()
    }
}

