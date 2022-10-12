//
//  TestResultVC.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/10/12.
//

import UIKit

class TestResultVC: BaseViewController {
    
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
    
    private var testLabel: UILabel = UILabel()
    private var testButton: UIButton = UIButton()
    private var testSwitch: UISwitch = UISwitch()
    

    // MARK: - Setup
    
    override func setupLayouts() {
        view.addSubview(bView)
        [ closeButton, testLabel, testButton, testSwitch ].forEach {
            bView.addSubview($0)
       }

    }

    override func setupStyles() {
        self.view.backgroundColor = .white
        testLabel.backgroundColor = .systemPink
        testLabel.text = "test"
        testLabel.textAlignment = .center
        testLabel.textColor = .white

        testButton.backgroundColor = .systemBlue
        testButton.setTitle("testBtn", for: .normal)

        testSwitch.thumbTintColor = UIColor.systemTeal
        testSwitch.onTintColor = .black

    }
    
    override func setupConstraints() {
        bView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(50)
        }
        
        testLabel.snp.makeConstraints {
            $0.width.equalTo(bView).multipliedBy(0.2)
            $0.height.equalTo(bView.snp.width).multipliedBy(0.1)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }

        testButton.snp.makeConstraints {
          $0.centerX.equalToSuperview()
          $0.top.equalTo(testLabel.snp.bottom).offset(30)
          $0.width.height.equalTo(testLabel)
      }
        
        testSwitch.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(testButton.snp.bottom).offset(30)
            $0.width.height.equalTo(testButton)
        }
    }
    
    override func bind() {
        closeButton.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        
        testButton.addTarget(self, action: #selector(buttonBtnTapped), for: .touchUpInside)

    }
    
    // MARK: - Functions
    
    @objc func closeBtnTapped(_ sender: UIButton) {
        print("closeBtn")
        if let topVC = UIApplication.topViewController() {
            RDAlertViewController.alertControllerShow(WithTitle: "", message: "helloWorld", isNeedCancel: false, viewController: topVC) { isCheck in
                self.bView.backgroundColor = .systemTeal
            }
        }
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonBtnTapped(_ sender: UIButton) {
        print("ButtonVcBtn")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if testSwitch.isOn {
            if let topVC = UIApplication.topViewController() {
                RDAlertViewController.alertControllerShow(WithTitle: "", message: "helloWorld", isNeedCancel: false, viewController: topVC) { isCheck in
//                    self.bView.backgroundColor = .systemTeal
                    
                }
            }
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct TestResultVCPreview: PreviewProvider {
    
    static var previews: some View {
        TestResultVC().toPreview()
    }
}
#endif
