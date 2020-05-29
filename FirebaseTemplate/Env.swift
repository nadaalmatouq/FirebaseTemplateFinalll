//
//  Env.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

class Env: ObservableObject{

    @Published var lists: [Lista] = [Lista(givenName: "", budget: "", id: "", type: "travel", remaining: "")]
    @Published var currentListType: String = "travel"

    @Published var types: [String] = ["travel","celebration","shopping"]
//    @Published var currentLista : Lista = Lista(givenName: "", budget: "", id: "", type: "travel", remaining: "")
    
     // @Published var willMoveToNextScreen = false
    
    @Published var itsatravelList: Bool = false   //DONT FORGET TO TOGGLE IT
    @Published var itsaCelebrationList: Bool = false
    @Published var itsaShoppingList: Bool = false 
    //SEE HOW WE CAN INITIALIZE 
    
    //@Published var currentTravelList : TravelList = TravelList(lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel, remaining: ""), id: UUID(), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], beforetraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])
    
   // picture: UIImage(systemName: "camera.circle")
    
    //@Published var alltravelLists : [TravelList] = [TravelList(lista: Lista(givenName: "Bali", budget: "", id: UUID(), type: .travel, remaining: ""), id: UUID(), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], beforetraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])]
    
      
    
    
   
    //@Published var currentCelebrationList : CelebrationList = CelebrationList(
    //    lista: Lista(givenName: "", budget: "", id: UUID(), type: .celebration, remaining: ""), id: UUID()
    //    , gifts: [GiftsList(name: "", price: "", id: UUID())]
    //    , decoration: [DecorationList(name: "", price: "", id: UUID())]
    //    , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
    //    , other: [OtherList(name: "", price: "", id: UUID()) ])
    
//    @Published var currentCelebrationList : CelebrationList = CelebrationList(
//    lista: Lista(givenName: "", budget: "", id: "", type: "celebration", remaining: ""), id: ""
//    , gifts: []
//    , decoration: []
//    , clothesAccessories: []
//    , other: [])
   
  //@Published var allCelebrationLists : [CelebrationList] = [CelebrationList(
  //   lista: Lista(givenName: "Baby Shower", budget: "", id: UUID(), type: .celebration, remaining: "")
  //    , gifts: [GiftsList(name: "", price: "", id: UUID())]
  //    , decoration: [DecorationList(name: "", price: "", id: UUID())]
  //    , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
  //    , other: [OtherList(name: "", price: "", id: UUID()) ])]
    
//    @Published var allCelebrationLists : [CelebrationList] = []
    
    
    //@Published var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: UUID(), type: .shopping, remaining: ""), id: UUID(), listClothesAccessories: [AccessorisStruct(clothName: "t1", clothPrice: "12")], listFoodVegetables: [foodStruct(foName: "t2", foPrice: "")], listElectronicDevices: [electronicStruct(eleName: "t3", elePrice: "")], listOthers: [othersStruct(otherName: "t4", otherPrice: "")])
       
    // @Published var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: "", type: "shopping", remaining: ""), id: "", listClothesAccessories: [], listFoodVegetables: [], listElectronicDevices: [], listOthers: [])
 
    
    //@Published var allShoppingLists : [ShoppingList] = [ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: UUID(), type: .shopping, remaining: ""), listClothesAccessories: [AccessorisStruct(clothName: "t1", clothPrice: "")], listFoodVegetables: [foodStruct(foName: "t2", foPrice: "")], listElectronicDevices: [electronicStruct(eleName: "t3", elePrice: "")], listOthers: [othersStruct(otherName: "t4", otherPrice: "")])]
    
    
   // @Published var allShoppingLists : [ShoppingList] = []
      
    @Published var sheetT = false
    @Published var sheetC = false
    @Published var sheetS = false
    
     @Published var taskDone = false
    @Published var taskDone2 = false
    
    
    
    // func for firebase
  //  @Published var user: User
        
        
//        func getOneDoc() {
//            var id = user.uid
//            Networking.getSingleDocument("users/\(id)") { (Travel: userModel) in
//                self.user = Travel
//                print("Single Doc", self.user)
//            }
//        }
        
    //    func TravelGetPosts()  {
    //        Networking.getListOf(COLLECTION_NAME: "users/\(id)/Post", success: { (Travel: [TravelModel]) in
    //            self.TravelDatas = Travel
    //            print("Travel Data = ", Travel)
    //        }) { (error) in
    //            print("Error!", error)
    //        }
    //    }
    //
    //    func TravelAddPost()  {
    //        var id = UUID()
    ////        TravelData.id = "\(id)"
    //        Networking.createItem(TravelData, inCollection: "Travel", withDocumentId: "\(id)") {
    //            print("success document uploaded")
    //        }
    //    }
        
//    func DeletePost()  {
//        Networking.DeleteItem(inCollection: "users/\(user.uid)/Post", withDocumentId: "8M1etkOxpKeGb03Auyut", success: {
//            print("Deleted!")
//        }) { (err) in
//            print("error", err)
//        }
//    }
//        
//        func createItem()
//        {
//            let item = Item(name: self.name, price: Double(self.price)!)
//            Networking.createItem(item, inCollection: "shaima") {
//                self.itemCreated = true
//            }
//        }
//        
//        func createdItemAlert() -> Alert{
//            Alert(title: Text("👏🏻"), message: Text("Item has been created successfully"), dismissButton: .default(Text("Done"), action: {
//                //
//            }))
//        }
    
    @Published var allShoppingLists : [ShoppingList] = []
       @Published var allCelebrationLists : [CelebrationList] = []
     @Published var alltravelLists : [TravelList] = []
            func GetAllShoppingPosts()  {
                Networking.getListOf(COLLECTION_NAME: "Shopping", success: { (shoppingList: [ShoppingList]) in
                   // DispatchQueue.main.async {
                        self.allShoppingLists = shoppingList
                        print("Get All shopping posts", self.allShoppingLists)
                    //}
    
                }) { (error) in
                    print("Error!", error)
                }
            }
    
        func GetAllCelebrationPosts()  {
            Networking.getListOf(COLLECTION_NAME: "Celebration", success: { (celebrationList: [CelebrationList]) in
                DispatchQueue.main.async {
                                   self.allCelebrationLists = celebrationList
                    print("Get All shopping posts", self.allCelebrationLists)
            }
    
            }) { (error) in
                print("Error!", error)
            }
        }
    
    func GetAllTravelPosts()  {
            Networking.getListOf(COLLECTION_NAME: "Travel", success: { (travelList: [TravelList]) in
                DispatchQueue.main.async {
                                   self.alltravelLists = travelList
                    print("Get All shopping posts", self.alltravelLists)
            }
    
            }) { (error) in
                print("Error!", error)
            }
        }
    
}//End class Env
