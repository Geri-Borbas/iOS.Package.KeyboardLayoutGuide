//
//  OrientationListenerViewController.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 03/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit
import Combine


class OrientationListenerViewController: UIViewController {
    
    static let shared = OrientationListenerViewController()
    
    typealias ViewTransitionParameters = (size: CGSize, coordinator: UIViewControllerTransitionCoordinator)
    let viewWillTransition: PassthroughSubject<ViewTransitionParameters, Never> = .init()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        UIApplication.firstWindow?.rootViewController?.addChild(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        viewWillTransition.send((size: size, coordinator: coordinator))
    }
}
