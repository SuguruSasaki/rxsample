//
//  APIService.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/05/07.
//  Copyright © 2018年 quad. All rights reserved.
//

import Foundation

final class APIService {
    private let repository: LoginAPIRepository = LoginAPIRepository()
}

extension APIService {
    
    func requestMessage(str: String) -> Void {
        // connect api ....
        
        let model = self.repository.update()
        
    }
    
    
}


extension APIService {
    
    
}
