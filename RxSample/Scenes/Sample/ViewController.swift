//
//  ViewController.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/04/17.
//  Copyright © 2018年 quad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
     var presenter: SamplePresenter?
    
    lazy var button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
}


// MARK: - Lifecycle
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.button)
        self.presenter = SamplePresenter()
        
        self.setup()
    }
}

extension ViewController {
    
    func setup() {
        
        self.button.rx.tap.bind( onNext: { [weak self] in
            self?.presenter?.request(data: "from viewcontroller")
        })
    }
}


