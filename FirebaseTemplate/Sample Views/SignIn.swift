//
//  SignIn.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    var backgroundcolor = "Background"
    @State var credentials = SignInCredentials(email: "", password: "")
    @State var signedIn = false  // if true will show aler success , if false wil show alert failed
    @State var okAndCancel = false  // to show alert after click sign in , seccess or failed
    @State var moveToMain = false
     @EnvironmentObject var env: Env
    var body: some View {
        ZStack{
       Color("Background")
         
      .edgesIgnoringSafeArea(.all)
     //          .scaledToFill()
        VStack{
               NavigationLink(destination: MainList().environmentObject(self.env), isActive: $moveToMain){
               Text("") }
                TextField("Email", text: $credentials.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $credentials.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            ZStack{
                
                Button(action: {
                    self.signIn()
//                    AddButton()
                }){
                    ZStack{
                    
                   
                        Text("Sign In")
                            .foregroundColor(Color.black)
                    }
                }
//                Button("Sign In", action: signIn)
                }
                }.navigationBarTitle("Sign In")
          
        .alert(isPresented: $okAndCancel, content: signInAndfailed)
        }
        
    }
    
    func signIn(){
        Networking.signIn(user: credentials, collectionName: "users", success: { str in
            // successfully signed in
            self.okAndCancel = true
             self.signedIn = true
        })
        {
            // fail
            self.okAndCancel = true
            self.signedIn = false
        }
    }

    func signInAndfailed() -> Alert{
        if self.signedIn {
      return Alert(title: Text("Signed In Successfully"), message: Text("You have signed in successfully with email \(self.credentials.email)."), dismissButton: .default(Text("Done")){
      self.moveToMain = true
      })
        }
       
        return Alert(title: Text("Error!"), message: Text("Couldn't sign in with email \(self.credentials.email)."), dismissButton: .default(Text("Done")))
            
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
struct AddButton: View {

@State var width : CGFloat = 60
@State var tapped : Bool = false
var body : some View {
    ZStack{
                Capsule().foregroundColor(Color("pink"))
       HStack{
       Image(systemName: "Button")
           .font(.system(size:25, weight: .bold, design: .rounded))
        
          
        }}.padding(.leading,tapped ? 20:0)
            
            .frame(width: width,height:60)
            .onTapGesture(perform: add)
    
            .animation(.interactiveSpring(response:0.4 ,dampingFraction:0.4, blendDuration:0.8))
        }
    
    func add()
    {
        tapped.toggle()
        width = tapped ? 300:60
        
    }
}
