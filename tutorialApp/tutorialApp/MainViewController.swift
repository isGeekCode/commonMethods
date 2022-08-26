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
    
    private lazy var buttonVcBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor =  .systemYellow
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private lazy var viewVcBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor =  .systemYellow
        button.setTitle("View", for: .normal)
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
        let buttonVC = ButtonViewController()
        buttonVC.modalPresentationStyle = .fullScreen
        present(buttonVC, animated: true, completion: nil)
    }
    
    @objc func viewBtnTapped(_ sender: UIButton) {
        print("ViewVcBtn")
        let viewVC = ViewViewController()
        viewVC.modalPresentationStyle = .fullScreen
        present(viewVC, animated: true, completion: nil)
    }
    
    func setDetail() {
        buttonVcBtn.addTarget(self, action: #selector(buttonBtnTapped(_:)), for: .touchUpInside)
        viewVcBtn.addTarget(self, action: #selector(viewBtnTapped(_:)), for: .touchUpInside)

    }
    
    func setLayout() {
        view.addSubview(bView)
        [ label, buttonVcBtn, viewVcBtn ].forEach {
            bView.addSubview($0)
        }
        
        // 3 - constraints 추가
        bView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        buttonVcBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.width.equalTo(label).multipliedBy(1.5)
            $0.height.equalTo(label.snp.width).multipliedBy(0.6)
        }
        
        viewVcBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(buttonVcBtn.snp.bottom).offset(30)
            $0.width.height.equalTo(buttonVcBtn)
        }
    }

}

