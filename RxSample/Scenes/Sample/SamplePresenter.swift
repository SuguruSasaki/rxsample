//
//  SamplePresenter.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/05/07.
//  Copyright © 2018年 quad. All rights reserved.
//

import Foundation

final class SamplePresenter {
    //private let sample: SampleServic = SampleServic()
    private let apiService: APIService = APIService();
    
}


// MARK: - I/F
extension SamplePresenter {
    
    func request(data: String) -> Void {
        self.apiService.requestMessage(str: data)
    }
    
}
