//
//  ContentView.swift
//  ApiCall
//
//  Created by stefano.spinelli on 13/09/22.
//

import SwiftUI

//https://www.youtube.com/watch?v=B00z5lmtLGI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        
        VStack{
            
            
            List{
                ForEach(viewModel.users, id:\.self){ user in
                    HStack{
                        Text("Name: \(user.name.lowercased().capitalizingFirstLetter()), surname: \(user.surnamme.lowercased().capitalizingFirstLetter()),  gender: \(user.gender)")
                            .foregroundColor((user.gender == "M") ? .blue : .purple)
                        
                        Spacer()
                        Text(user.gender == "M" ? "🙎‍♂️" : "🙎‍♀️")
                    }
                }
                
                
            }
            
            
            Button(action: {
                viewModel.users.shuffle()
            }, label: {
                Text("Ordine Random")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(Color.green)
                    .cornerRadius(15)
                    .padding()
            }).frame(height:44)
            
 
        }.onAppear {viewModel.fetch()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
