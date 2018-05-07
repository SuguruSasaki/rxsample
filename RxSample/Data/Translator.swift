//
//  Translator.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/05/07.
//  Copyright © 2018年 quad. All rights reserved.
//

import Foundation


struct SampleModel {
    let id: String
    let message: String
    let date: Date
}


struct Translator {
    
    func tranlate(input:[ String : String]) -> SampleModel {
        // translate
        
        return SampleModel(id: input["id"]!, message: input["message"]!, date: Date()) //
    }
}
