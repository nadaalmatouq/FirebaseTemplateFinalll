//
//  ContentView.swift
//  shoppinglistshaikha
//
//  Created by shaikha alqhtane on 5/20/20.
//  Copyright © 2020 shaikha. All rights reserved.
//

//

import SwiftUI
import Combine
import UIKit
struct ShoppingList : Codable, Hashable, Identifiable {
    var lista : Lista
   // var picture : UIImage? = UIImage(systemName: "camera.circle")
    //var id = UUID()
      var id : String
    var listClothesAccessories : [AccessorisStruct]
    var listFoodVegetables : [foodStruct]
    var listElectronicDevices : [electronicStruct]
    var listOthers : [othersStruct]
}

struct AccessorisStruct : Codable, Hashable, Identifiable{
    var clothName : String
    var clothPrice : String = ""
   // var id = UUID()
      var id : String
}

struct foodStruct : Codable, Hashable, Identifiable{
    var foName : String
    var foPrice : String = ""
  //  var id = UUID()
      var id : String
}


struct electronicStruct : Codable, Hashable, Identifiable{
    var eleName : String
    var elePrice : String = ""
      var id : String
  //  var id = UUID()
}

struct othersStruct : Codable, Hashable, Identifiable{
    var otherName : String
    var otherPrice : String = ""
   // var id = UUID()
      var id : String
}

enum whenClick123 {
    case plus
    case minus
    mutating func toggleClick(){
        switch self {
        case .plus : self = .minus
        case .minus : self = .plus
        }
    }
    func textNameClick() -> String {
        switch self {
        case .plus : return "plus.circle"
        case .minus : return "minus.circle"
        }
    }
}

struct ShoppingListDetail: View {
    @EnvironmentObject var env: Env
    
    @State var whenClickAccessoris = whenClick123.plus
    @State var whenClickFood = whenClick123.plus
    @State var whenClickelectronic = whenClick123.plus
    @State var whenClickOthers = whenClick123.plus
    @State var isClickAccessoris = false
    @State var isClickFood = false
    @State var isClickelectronic = false
    @State var isClickOthers = false
    @State var listFoandVe : String = ""
    @State var listCAndA : String = ""
    @State var listelectronic: String = ""
    @State var listOthers: String = ""
    @State var newNameFo : String = ""
    @State var newPriceFo : String = ""
    @State var newNameCloth : String = ""
    @State var newPriceCloth : String = ""
    @State var newNameele : String = ""
    @State var newPriceele : String = ""
    @State var newNameOth : String = ""
    @State var newPriceOth : String = ""
    @State var refreshNow = false
    @State private var showingAlert = false
    @State var moveToMain = false
    
    // second new picture : from github
    @State private var image1: UIImage? = UIImage(systemName: "camera.circle")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    @Binding var isEdit : Bool // this var will be passed from main list, to make the save as edit array , not new one
    
    @Environment(\.presentationMode) var presentationMode // to dismiss the sheet after update only . only for update view : for now
    
    @State var changeSaveToUpdate = "Save"  // this var for change save button text to update
    @State var changeAlertSaveToUpdate = "Your List is saved successfully" // this var for change alert save text to update
    
    // for firebase
    @Binding var currentShoppingList : ShoppingList
  @Binding var currentLista : Lista
    var body: some View {
        
        ZStack{
       Color("Background")
                .edgesIgnoringSafeArea(.all)
//            NavigationLink(destination: MainList(), isActive: $moveToMain){
//                Text("")
//            }
            ScrollView{
                VStack{
                    // the bellow z,v,hstack for list picture
                    //                ZStack{
//                    HStack{
//                        Spacer()
//                        Image(uiImage: image1!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 70, height: 70)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color("blue"), lineWidth: 5))
//                            .shadow(radius: 10)
//                            .padding(.horizontal)
//                            .onTapGesture { self.shouldPresentActionScheet = true }
//                            .sheet(isPresented: $shouldPresentImagePicker) {
//                                SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image1, isPresented: self.$shouldPresentImagePicker)
//                        }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
//                            ActionSheet(title: Text("Take a photo or select from photo library"), message: Text(""), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
//                                self.shouldPresentImagePicker = true
//                                self.shouldPresentCamera = true
//                            }), ActionSheet.Button.default(Text("Photo Library"), action: {
//                                self.shouldPresentImagePicker = true
//                                self.shouldPresentCamera = false
//                            }), ActionSheet.Button.cancel()])
//                        }
//                    }
                    Spacer()
                    VStack{
                        VStack{
                            Text(currentShoppingList.lista.givenName)
                             .foregroundColor(Color.black).font(.system(size: 40, weight: .bold, design: .rounded)).padding(.vertical,20)
                        }
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("Budget")
                            .font(.system(size: 30))
                            Text(self.currentShoppingList.lista.budget)
                                 .font(.system(size: 40))
                        }
                        Spacer()
                        VStack{
                            Text("Remaining")
                                .font(.system(size: 30))
                            if self.currentShoppingList.lista.remaining == ""{
                                                                       Text(currentShoppingList.lista.budget)
                                                                           .font(.system(size: 40))
                                                                           .foregroundColor(Color.gray)
                                                                   }
                            else{
                                Text(self.currentShoppingList.lista.remaining)
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("red"))
                            }
                        }
                    }.padding(.horizontal, 20)
                }
                
                                HStack{
                    Button(action: {
                        self.whenClickAccessoris.toggleClick()
                        self.isClickAccessoris.toggle()
                    }){
                        VStack{
                            HStack{
                                Image(systemName:whenClickAccessoris.textNameClick())
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(Color("blue"))
                                Text("Clothes & Accessories")
                                .modifier(blueColorForAddTitles())
                                Spacer()
                            }
                        }
                    }
                }.padding(.horizontal)
                if self.isClickAccessoris {
                    VStack{
                        Group{
                            if self.currentShoppingList.listClothesAccessories.count >= 0 {
                                ForEach(self.currentShoppingList.listClothesAccessories, id: \.self){ i in
                                    HStack{
                                        Text(i.clothName)
                              .modifier(blueColorForAddTitles())
                                    .modifier(blueColorForAddTitles())
                                            .frame(width: 190, height: 30, alignment: .center)
                                        Spacer()
                                        Text(i.clothPrice)
                                    .modifier(blueColorForAddTitles())
                                     .frame(width: 100, height: 30, alignment: .center)

                                    }.padding(.vertical,5)
                                    .frame(width: 370, height: 40)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 10)
                                }
                                if refreshNow{
                                    Text(newNameCloth)
                                    .modifier(blueColorForAddTitles())
                                }
                            }
                        }.padding(.horizontal, 15)
                        HStack{
                            TextField("Clothes & Accessories", text: self.$newNameCloth)
                                .frame(width: 140, height: 30, alignment: .leading)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Enter price", text: self.$newPriceCloth)
                                .frame(width: 140, height: 30, alignment: .leading)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Image(systemName: "plus").imageScale(.large)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color(.white))
                            .frame(width: 30, height: 30)
                            .background(Color("blue"))
                            .clipShape(Circle())
                            .padding(.vertical,10)
                            .shadow(radius: 5)
                                .onTapGesture {
                                    if (self.newNameCloth == "" && self.newPriceCloth == "")
                                    { }
                                    else if (self.newNameCloth == ""){
                                    }  // only name empty
                                    else{
                                        if (self.newPriceCloth == ""){
                                            self.newPriceCloth = "0.0"
                                        }
                                        self.refreshNow = true
                                        self.currentShoppingList.listClothesAccessories.append(AccessorisStruct(clothName: self.newNameCloth, clothPrice: self.newPriceCloth, id: ""))
                                        self.calculateTheRemainig(prc: self.newPriceCloth)
                                        print(self.currentShoppingList.listClothesAccessories)
                                        self.newNameCloth = ""
                                        self.newPriceCloth = ""
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        self.refreshNow = false
                                    }
                            }
                        }
                    }
                }
                Group{
                    HStack{
                        Button(action: {
                            self.whenClickFood.toggleClick()
                            self.isClickFood.toggle()
                            if self.isClickFood {
                                print("test open Food")
                            }
                        }){
                            Image(systemName:whenClickFood.textNameClick())
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color("blue"))
                            Text("Food & Vegetables").modifier(blueColorForAddTitles())
                            Spacer()
                        }
                    }.padding(.horizontal)
                    if self.isClickFood {
                        VStack{
                            Group{
                                if self.currentShoppingList.listFoodVegetables.count >= 0 {
                                    ForEach(currentShoppingList.listFoodVegetables, id: \.self){ i in
                                        HStack{
                                            Text(i.foName)
                                                .modifier(blueColorForAddTitles())
                                                .frame(width: 190, height: 30, alignment: .center)
                            
                                            Spacer()
                                            Text(i.foPrice)
                                                .modifier(blueColorForAddTitles())
                                                .frame(width: 100, height: 30, alignment: .center)
                           
                                        }.padding(.vertical,5)
                                        .frame(width: 370, height: 40)

                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .padding(.bottom, 10)
                                    }
                                    if refreshNow{
                                        Text(newNameFo)
                                        //.modifier(blueColorForAddTitles())
                                    }
                                }
                            }.padding(.horizontal, 15)
                            HStack{
                                TextField("Enter Item ", text: self.$newNameFo)
                                    .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("Enter price", text: self.$newPriceFo)
                                    .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Image(systemName: "plus").imageScale(.large)
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Color(.white))
                                .frame(width: 30, height: 30)
                                .background(Color("blue"))
                                .clipShape(Circle())
                                .padding(.vertical,10)
                                .shadow(radius: 5)
                                    .onTapGesture {
                                        if (self.newNameFo == "" && self.newPriceFo == "")
                                        { }  // if both field empty
                                        else if (self.newNameFo == ""){
                                        }  // only name empty
                                        else{
                                            if (self.newPriceFo == ""){
                                                self.newPriceFo = "0.0"
                                            } // only price empty will continue
                                            self.refreshNow = true
                                            self.currentShoppingList.listFoodVegetables.append(foodStruct(foName: self.newNameFo, foPrice: self.newPriceFo, id: ""))
                                            self.calculateTheRemainig(prc: self.newPriceFo)
                                            print(self.currentShoppingList.listFoodVegetables)
                                            self.newNameFo = ""
                                            self.newPriceFo = ""
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            self.refreshNow = false
                                        }
                                }
                            }
                        }
                    }
                }
                Group{
                    HStack{
                        Button(action: {
                            self.whenClickelectronic.toggleClick()
                            self.isClickelectronic.toggle()
                            if self.isClickelectronic {
                                print("Electronic Devices")
                            }
                        }){
                            Image(systemName:whenClickelectronic.textNameClick())
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color("blue"))
                            Text("Electronic Devices")
                            .modifier(blueColorForAddTitles())
                            Spacer()
                        }
                    }.padding(.horizontal)
                    if self.isClickelectronic {
                        VStack{
                            Group{
                                if self.currentShoppingList.listElectronicDevices.count >= 0 {
                                    ForEach(self.currentShoppingList.listElectronicDevices, id: \.self){ i in
                                        HStack{
                                            Text(i.eleName)
                                                .modifier(blueColorForAddTitles())
                                                .frame(width: 190, height: 30, alignment: .center)
                                            Spacer()
                                            Text(i.elePrice)
                                               .modifier(blueColorForAddTitles())
                                                .frame(width: 100, height: 30, alignment: .center)
                                        }.padding(.vertical,5)
                                        .frame(width: 370, height: 40)

                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .padding(.bottom, 10)
                                    }
                                    if refreshNow{
                                        Text(newNameele)
                                        .modifier(blueColorForAddTitles())
                                    }
                                }
                            }.padding(.horizontal, 15)
                            HStack{
                                TextField("Food & Vegetables ", text: self.$newNameele)
                                    .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("Enter price", text: self.$newPriceele)
                                    .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Image(systemName: "plus")
                                .imageScale(.large)
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.white))
                                    .frame(width: 30, height: 30)
                                    .background(Color("blue"))
                                    .clipShape(Circle())
                                    .padding(.vertical,10)
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        if (self.newNameele == "" && self.newPriceele == "")
                                        { }  // if both field empty
                                        else if (self.newNameele == ""){
                                        }  // only name empty
                                        else{
                                            if (self.newPriceele == ""){
                                                self.newPriceele = "0.0"
                                            } // only price empty will continue
                                            self.refreshNow = true
                                            self.currentShoppingList.listElectronicDevices.append(electronicStruct(eleName: self.newNameele, elePrice: self.newPriceele, id: ""))
                                            self.calculateTheRemainig(prc: self.newPriceele)
                                            print(self.currentShoppingList.listElectronicDevices)
                                            self.newNameele = ""
                                            self.newPriceele = ""
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            self.refreshNow = false
                                        }
                                }
                            }
                        }
                    }
                }
                Group{
                    HStack{
                        Button(action: {
                            self.whenClickOthers.toggleClick()
                            self.isClickOthers.toggle()
                            if self.isClickOthers {
                                print("test open other")
                            }
                        }){
                            Image(systemName:whenClickOthers.textNameClick())
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color("blue"))
                            Text("Others")
                            .modifier(blueColorForAddTitles())
                            Spacer()
                        }
                    }.padding(.horizontal)
                    if self.isClickOthers {
                        VStack{
                            Group{
                                if self.currentShoppingList.listOthers.count >= 0 {
                                    ForEach(self.currentShoppingList.listOthers, id: \.self){ i in
                                        HStack{
                                            Text(i.otherName)
                                             .modifier(blueColorForAddTitles())
                                                .frame(width: 190, height: 30, alignment: .center)
                                                Spacer()
                                            Spacer()
                                            Text(i.otherPrice)
                                                .modifier(blueColorForAddTitles())
                                                .frame(width: 100, height: 30, alignment: .center)
                                                
                                        }.padding(.vertical,5)
                                        .frame(width: 370, height: 40)

                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .padding(.bottom, 10)
                                    }
                                    if refreshNow{
                                        Text(newNameOth)
                                        .modifier(blueColorForAddTitles())
                                    }
                                }
                            }.padding(.horizontal, 15)
                            HStack{
                                TextField("Enter other", text: self.$newNameOth)
                                    .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("Enter price", text: self.$newPriceOth)
                              .frame(width: 140, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Image(systemName: "plus")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.white))
                                    .frame(width: 30, height: 30)
                                    .background(Color("blue"))
                                    .clipShape(Circle())
                                    .padding(.vertical,10)
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        if (self.newNameOth == "" && self.newPriceOth == "")
                                        { }  // if both field empty
                                        else if (self.newNameOth == ""){
                                        }  // only name empty
                                        else{
                                            if (self.newPriceOth == ""){
                                                self.newPriceOth = "0.0"
                                            } // only price empty will continue
                                            self.refreshNow = true
                                            self.currentShoppingList.listOthers.append(othersStruct(otherName: self.newNameOth, otherPrice: self.newPriceOth, id: ""))
                                            self.calculateTheRemainig(prc: self.newPriceOth)
                                            print(self.currentShoppingList.listOthers)
                                            self.newNameOth = ""
                                            self.newPriceOth = ""
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            self.refreshNow = false
                                        }
                                }
                            }
                            Spacer()
                        }
                      
                    }
                 
                     Spacer()
                    Group{
                        HStack{
                            // save
                            Button(action: {
                                if self.isEdit {
                                    // func edit array .. done
                                    self.shoppingEditPost()
                                   // var theIndexHere = 0
                                    //theIndexHere = self.editArray()
                                 //   self.env.currentShoppingList.picture = self.image1
                                  //  print(" Updated!!!! \(self.currentShoppingList) end")
 self.env.GetAllShoppingPosts()
                                }
                                else {
                              //      self.env.currentShoppingList.picture = self.image1
                              //      self.env.currentShoppingList.id = UUID()
                              //      self.env.allShoppingLists.append(self.env.currentShoppingList)
                               //     print(self.env.allShoppingLists)
                                   // self.moveToMain = true
                                    self.shoppingAddPost()
                                     self.env.taskDone = true
                                    self.env.sheetS = false
                                    self.env.itsaShoppingList.toggle()
                                self.presentationMode.wrappedValue.dismiss()
                                    self.currentShoppingList.listClothesAccessories = []
                                       self.currentShoppingList.listFoodVegetables = []
                                        self.currentShoppingList.listElectronicDevices = []
                                        self.currentShoppingList.listOthers = []
                                    self.currentShoppingList.lista = Lista(givenName: "", budget: "", id: "", type: self.env.types[2], remaining: "")
                                    self.env.GetAllShoppingPosts()
                                }
                                self.showingAlert = true
                            })
                            {
                                Text(changeSaveToUpdate)
                              .fontWeight(.bold)
                                    .font(.custom("Georgia Regular", size: 25))
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 8)
                                    .foregroundColor(Color(.white))
                                    .background(Color("orange button"))
                                    .cornerRadius(20)
                                
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text(changeAlertSaveToUpdate), message: Text(""), dismissButton: .default(Text("Back to main list")){
                                    if self.isEdit {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    })
                            }
                            Button(action: {
                                self.env.taskDone = true
                            self.presentationMode.wrappedValue.dismiss()
                                //print(self.env.allShoppingLists)
                            })
                            {
                                Text("Cancel")
                                 .fontWeight(.semibold)
                                    .font(.custom("Georgia Regular", size: 25))
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 8)
                                    .foregroundColor(Color(.white))
                                    .background(Color("red"))
                                    .cornerRadius(20)
                            }
                        }.padding()
                    }
                }
            }
        }.onAppear {  // this on apper to change save button text to update
            if self.isEdit{
                self.changeSaveToUpdate = "Update"
                self.changeAlertSaveToUpdate = "Your List is updated successfully"
            //    self.image1 = self.env.currentShoppingList.picture
            }
        }
    }
    
    func calculateTheRemainig(prc : String) {
        var theRemain : Double = 0.0
        var theNewPrice : Double = 0.0
        theNewPrice = Double(prc) ?? 0.0
        if (self.currentShoppingList.lista.budget != "" && self.currentShoppingList.lista.remaining == ""){
            self.currentShoppingList.lista.remaining = self.currentShoppingList.lista.budget
            theRemain = Double(self.currentShoppingList.lista.remaining) ?? 0.0
            self.currentShoppingList.lista.remaining = String(theRemain-theNewPrice)
            print(theNewPrice)
        }
        else if (self.currentShoppingList.lista.budget != "" && self.currentShoppingList.lista.remaining != ""){
            theRemain = Double(self.currentShoppingList.lista.remaining) ?? 0.0
            self.currentShoppingList.lista.remaining = String(theRemain-theNewPrice)
            print(theNewPrice)
            print(self.currentShoppingList.lista.remaining)
        }
    }
    
    // function for local use :
    
//    func editArray() -> Int{
//        var theIndex : Int = 0
//        if let i = env.allShoppingLists.firstIndex(where: { $0.lista.id == self.currentShoppingList.lista.id }) {
//            print(" this is teeeeeest ... \(env.allShoppingLists[i]) ! with index \(i) ... yes end")
//            theIndex = i
//        }
//        return theIndex
//    }
//
//    func editUsingIndex (indexx : Int) {
//        env.allShoppingLists[indexx] = self.currentShoppingList
//        print("test for update the array ... \(env.allShoppingLists))")
//    }
    

      // for firebase
    
    func shoppingEditPost()  {
    let id : String
         id =  self.currentShoppingList.id
       Networking.createItem(self.currentShoppingList, inCollection: "Shopping", withDocumentId: id) {
               print("success document updated")
           }
       }
    
    func shoppingAddPost()  {
        let id = UUID()
            self.currentShoppingList.id = "\(id)"
        Networking.createItem(self.currentShoppingList, inCollection: "Shopping", withDocumentId: "\(id)") {
                print("success document uploaded")
            }
        }
}




//
//struct ShoppingList_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingListDetail()
//    }
//}
