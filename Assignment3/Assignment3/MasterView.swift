//
//  MasterView.swift
//  Assignment3
//
//  Created by Maya Mistry on 3/16/21.
//

import SwiftUI

struct MasterView: View {
    
    @State private var masterPass: String = ""
    let s = StorageHandler()
    
    var body: some View {
        VStack {
            Text("Enter your master password: ")
            TextField("Master password", text: $masterPass)
                .padding()
            
            
            Button(action: {
                //if passphrase is equal to passphrase from JSON then move to the next screen
                //otherwise keep looping until they enter the right passphrase
                //let actualMaster = StorageHandler
//                if masterPass != StorageHandler.getMasterPass() {
//
//                }
            }, label: {
                Text("Add task")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .border(Color.black, width: 1)
                    .foregroundColor(.black)
            })
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
