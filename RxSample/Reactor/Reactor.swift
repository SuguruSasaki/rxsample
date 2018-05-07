//
//  Reactor.swift
//  RxSample
//
//  Created by SuguruSasaki on 2018/04/18.
//  Copyright © 2018年 quad. All rights reserved.
//

import RxSwift

///  Typealiase
public typealias _Reactor = Reactor

// class プロトコルとして定義する
public protocol Reactor: class {
    
    associatedtype Action
    associatedtype Mutation
    associatedtype State
    
    var initialState: State { get }
    var currentState: State { get set }
    var state: Observable<State> { get }
    var action: PublishSubject<Action>{ get }
    
    func mutate(action: Action ) -> Observable<Mutation>
    func reduce(state: State, mutation: Mutation) -> State
    
    func transform(action: Observable<Action>) -> Observable<Action>
   
}

// MARK: - Implements
extension Reactor {

    func transform(action: Observable<Action>) -> Observable<Action> {
        return self.action
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        return .empty()
    }
    
    public func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        return mutation
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
    
    public func transform(state: Observable<State>) -> Observable<State> {
        return state
    }
    
    
    func createStateStream() -> Observable<State> {
        
        // Action
        let action = self.action.asObserver()
        let transformedAction = self.transform(action: action)
    
        
        // Mutation
        let mutate = transformedAction
            .flatMap { [weak self] action -> Observable<Mutation> in
                guard let `self` = self else { return .empty() }
                return self.mutate(action: action).catchError { _ in .empty() }
        }
        let transformedMutation = self.transform(mutation: mutate)
        
        // State
        let state = transformedMutation
            .scan(self.initialState) { [weak self] state, mutation -> State in
                guard let `self` = self else { return state }
                return self.reduce(state: state, mutation: mutation)
            }
            .catchError { _ in .empty() }
            .startWith(self.initialState)
            .observeOn(MainScheduler.instance)
        
        let transformedState = self.transform(state: state)
            .do(onNext: { [weak self] state in
                self?.currentState = state
            })
            .replay(1)
        
        transformedState.connect()
        return transformedState
    }
}
