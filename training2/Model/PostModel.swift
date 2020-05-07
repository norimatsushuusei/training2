//
//  PostModel.swift
//  training2
//
//  Created by ASW-研修４ on 2020/04/24.
//  Copyright © 2020 ASW-研修４. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase

class PostModel {
    fileprivate static let PATH: String = "post"
    var description: String = String()
    var id: String = String()
    var post_user_name: String = String()
    var image_path :String = String()
}

extension PostModel {
    static func parse(data: [String: Any]) -> PostModel{
        let model: PostModel = PostModel()
        if let description = data["description"] as? String {model.description = description}
         if let id = data["id"] as? String {model.id = id}
        if let post_user_name = data["post_user_name"] as? String {model.post_user_name = post_user_name}
        if let image_path = data["image_path"] as? String {model.image_path = image_path}
        return model
    }
    
    static func setParameter(request: PostModel) -> [String: Any]{
        var parameter: [String: Any] = [:]
        parameter["description"] = request.description
        parameter["id"] = request.id
        parameter["post_user_name"] = request.post_user_name
        parameter["image_path"] = request.image_path
        return parameter
    }
}

//MARK: - Create
extension PostModel {
    static func create(request: PostModel, success:@escaping() -> Void){
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key {
            request.id = key
        }
        let parameter = setParameter(request: request)
        dbRef.setValue(parameter)
        
        success()
    }
    
    
}
//MARK: - Read
extension PostModel {
    static func reads(success:@escaping ([PostModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: { snapshot in
            var models: [PostModel] = [PostModel]()
            for item in (snapshot.children) {
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: PostModel = parse(data: data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        })
    }
    static func readAt(id :String ,success:@escaping (PostModel) -> Void, failure: @escaping () -> Void) {
           let dbRef = Database.database().reference().child(PATH).child(id)
           dbRef.observe(.value) { (snapshot) in
               guard let data = snapshot.value as? [String: Any] else {
                  failure()
                   return
               }
               let model: PostModel = parse(data: data)
               success(model)
           }
       }
}
//MARK: - Update
extension PostModel {
    static func update(request: PostModel, success:@escaping () -> Void) {
           let id = request.id
           let dbRef = Database.database().reference().child(PATH).child(id)
           let parameter = setParameter(request: request)
           dbRef.updateChildValues(parameter) { (error, dbRef) in
               if error != nil {
                   print("updateエラー", error)
               } else {
                   success()
               }
           }
       }
}
//MARK: - Delete
extension PostModel {
    static func delete(id: String, success:@escaping () -> Void) {
           let dbRef = Database.database().reference().child(PATH).child(id)
           dbRef.removeValue { (error, dbRef) in
               if error != nil {
                   print("Deleteエラー", error)
               }else {
                   success()
               }
           }
       }
}
