//
//  ViewViewController.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/08/26.
//

import UIKit

class ViewViewController: UIViewController {

    private lazy var bView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow

        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        let imageConfigure = UIImage.SymbolConfiguration(scale: .large)
        let closeImage = UIImage(systemName: "xmark", withConfiguration: imageConfigure)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        btn.setImage(closeImage, for: .normal)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDetail()
    }
    
    @objc func buttonBtnTapped(_ sender: UIButton) {
        print("ButtonVcBtn")
    }
    
    @objc func closeBtnTapped(_ sender: UIButton) {
        print("closeBtn")
        dismiss(animated: true, completion: nil)
    }
    
    func setDetail() {
        self.view.backgroundColor = .white
        closeButton.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
    }
    
    func setLayout() {

        // 2 - constraints 주기 전, subView에 추가
        view.addSubview(bView)
        [ closeButton ].forEach {
            bView.addSubview($0)
        }
        
        // 3 - constraints 추가
        bView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(50)
        }

    }


}

