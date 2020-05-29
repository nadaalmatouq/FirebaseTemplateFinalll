//
//  ContentView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack{
//           Text("")
//        }
//       // TabView{
////            CreateItem()
////                .tabItem {
////                    VStack{
////                        Image(systemName: "plus.circle.fill")
////                        Text("Create Item")
////                    }
////            }.tag(1)
////
////            ItemsList()
////                .tabItem {
////                    VStack{
////                        Image(systemName: "list.bullet")
////                        Text("Items list")
////                    }
////            }.tag(2)
////
////            SignIn()
////                .tabItem {
////                    VStack{
////                        Image(systemName: "person.circle.fill")
////                        Text("Sign in")
////                    }
////            }.tag(3)
////
////            SignUp()
////                .tabItem {
////                    VStack{
////                        Image(systemName: "person.crop.circle.badge.plus")
////                        Text("Sign Up")
////                    }
////            }.tag(4)
////
//    //    }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


import SwiftUI

struct ContentView: View {
    @State var moveToSigUp = false
    var backgroundcolor = "Background"
    var body: some View {
        NavigationView{
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
        VStack{
          NavigationLink(destination: SignUp(), isActive: $moveToSigUp){
            Text("") }
            SignIn()
            Button(action: {
                self.moveToSigUp = true
            }){
 Text("Sign Up")
     .foregroundColor(Color.black)
               .frame(width: 100, height: 40)
    .background(Color.white)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }.offset(y: -200)
            }
                
            }        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
