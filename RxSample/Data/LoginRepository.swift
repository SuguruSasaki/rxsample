//
//  LoginRepository.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/05/07.
//  Copyright © 2018年 quad. All rights reserved.
//

import Foundation

final class LoginAPIRepository {
    private let dataStore: LoginAPIDataStore = LoginAPIDataStore()
}

extension LoginAPIRepository {
    
    func update() -> SampleModel {
        var dict = self.dataStore.update()
        var translator = Translator().tranlate(input: dict)
        return translator
    }
}
