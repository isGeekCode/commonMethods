//
//  TestViewController.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/10/12.
//

import UIKit

class TestViewController: BaseViewController {
    
    // MARK: - Properties
    
    private lazy var bView: UIView = {
        let view = UIView()

        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        let imageConfigure = UIImage.SymbolConfiguration(scale: .large)
        let closeImage = UIImage(systemName: "xmark", withConfiguration: imageConfigure)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        btn.setImage(closeImage, for: .normal)
        
        return btn
    }()
    

    // MARK: - Setup
    
    override func setupLayouts() {
        view.addSubview(bView)
        [ closeButton ].forEach {
            bView.addSubview($0)
        }
    }

    override func setupStyles() {
        self.view.backgroundColor = .white

        
    }
    
    override func setupConstraints() {
        bView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(50)
        }
        
    }
    
    override func bind() {
        closeButton.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    @objc func closeBtnTapped(_ sender: UIButton) {
        print("closeBtn")
    
        dismiss(animated: true, completion: nil)
    }
}
