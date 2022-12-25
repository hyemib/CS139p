//
//  MyPageView.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/25.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image("profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                }
                Text("ena")
                
            }
            
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
