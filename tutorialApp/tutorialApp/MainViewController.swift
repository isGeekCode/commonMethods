//
//  ViewController.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/08/18.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private lazy var bView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal

        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "UIView"

        return label
    }()
    
    private lazy var ButtonVcBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor =  .systemYellow
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDetail()
    }
    
    @objc func buttonBtnTapped(_ sender: UIButton) {
        print("ButtonVcBtn")
    }
    func setDetail() {
        ButtonVcBtn.addTarget(self, action: #selector(buttonBtnTapped(_:)), for: .touchUpInside)
    }
    
    func setLayout() {
        // 2 - constraints 주기 전, subView에 추가
        [bView, label, ButtonVcBtn].forEach {
            view.addSubview($0)
        }
        
        // 3 - constraints 추가
        bView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        ButtonVcBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.width.equalTo(label).multipliedBy(1.5)
            $0.height.equalTo(label.snp.width).multipliedBy(0.6)
        }
    }

}

