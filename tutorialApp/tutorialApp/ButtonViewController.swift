//
//  ButtonViewController.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/08/26.
//

import UIKit

class ButtonViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDetail()
    }
    
    @objc func buttonBtnTapped(_ sender: UIButton) {
        print("ButtonVcBtn")
    }
    func setDetail() {
        self.view.backgroundColor = .white
        //        ButtonVcBtn.addTarget(self, action: #selector(buttonBtnTapped(_:)), for: .touchUpInside)
    }
    
    
    func setLayout() {
        // 2 - constraints 주기 전, subView에 추가
//        [bView, label, ButtonVcBtn].forEach {
//            view.addSubview($0)
//        }
//
//        // 3 - constraints 추가
//        bView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        label.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//        }
//
//        ButtonVcBtn.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(label.snp.bottom).offset(30)
//            $0.width.equalTo(label).multipliedBy(1.5)
//            $0.height.equalTo(label.snp.width).multipliedBy(0.6)
//        }
    }


}
