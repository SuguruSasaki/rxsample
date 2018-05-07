//
//  ReactorView.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/04/23.
//  Copyright © 2018年 quad. All rights reserved.
//

import RxSwift


protocol ReactorView: class {
    
    associatedtype Reactor: _Reactor
    
    var disposeBag: DisposeBag { get set }
    var reactor: Reactor? { get set }
    
    func bind(reactor: Reactor)
}

// MARK: - Implements
extension ReactorView {
    
    public var reactor: Reactor? {
        get { return self.reactor }
        set {
            self.reactor = newValue
            self.disposeBag = DisposeBag()
            if let reactor = self.reactor {
                self.bind(reactor: reactor)
            }
            
        }
    }
}
