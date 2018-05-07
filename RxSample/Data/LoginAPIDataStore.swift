//
//  LoginAPIDataStore.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/05/07.
//  Copyright © 2018年 quad. All rights reserved.
//

import Foundation

final class LoginAPIDataStore {
    
}

extension LoginAPIDataStore {
    
    func update() -> [String: String] {
        // do somthing maybe connect the API
        
        let dict = [
            "id" : "1",
            "message": "hello world",
            "date": "2018/04/30"
        ]
        
        return dict
        
    }
    
}
