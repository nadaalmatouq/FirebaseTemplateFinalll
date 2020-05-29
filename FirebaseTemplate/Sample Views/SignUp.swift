//
//  Authentication.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignUp: View {
    @State var user: OmarUser = OmarUser()
    @State var password: String = ""
    @State var uid: String = ""
    @State var signedUp = false // if true will show aler success , if false wil show alert failed
     @State var okAndCancel = false  // to show alert after click sign up, seccess or failed
    @State var moveToSignIn = false
     @Environment(\.presentationMode) var presentationMode // to dismiss this view and return to sign in
    var backgroundcolor = "Color"
    var body: some View {
        ZStack{
            
                   Color("Background")
               
            .edgesIgnoringSafeArea(.all)

        
            VStack{
        
                TextField("first name", text: $user.firstname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("last name", text: $user.lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("email", text: $user.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("phone number", text: $user.phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                ZStack{
                               AddButtonn()
                           
                    Button(action: {
                        self.signUp()
                    }){
                        Text("SignUp")
                           .foregroundColor(Color.black)
                    }
                               }
             
                
            }
            .alert(isPresented: $okAndCancel, content: signUpAlert)
            .padding()
            .navigationBarTitle("Sign up")
        }}
    
    func signUp(){
        Networking.signUp(user: user, password: password, success: { uid in
            self.uid = uid
            self.signedUp = true
            self.okAndCancel = true
        }) {
             self.okAndCancel = true
            self.signedUp = false
        }
    }
    
    func signUpAlert() -> Alert{
        if self.signedUp {
       return Alert(title: Text("Signed up!"), message: Text("You have signed up successfully with Email \(self.user.email)"), dismissButton: .default(Text("Done"), action: {
            // self.moveToSignIn = true
        self.presentationMode.wrappedValue.dismiss()
        }))
        }
        return Alert(title: Text("Error!"), message: Text("Couldn't sign up with email \(self.user.email)."), dismissButton: .default(Text("Done")))
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }}
struct AddButtonn: View {

@State var width : CGFloat = 60
@State var tapped : Bool = false
var body : some View {
    ZStack{
        Capsule().foregroundColor(Color.white)
            .shadow(radius: 5)
       HStack{
       Image(systemName: "Button")
           .font(.system(size:25, weight: .bold, design: .rounded))
           .foregroundColor(.white)
        
          
        }}.padding(.leading,tapped ? 20:0)
            
            .frame(width: width,height:60)
            .onTapGesture(perform: add)
    
            .animation(.interactiveSpring(response:0.4 ,dampingFraction:0.4, blendDuration:0.5))
        }
    
    func add()
    {
        tapped.toggle()
        width = tapped ? 300:60
        
    }
}
