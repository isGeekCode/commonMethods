//
//  ViewViewController.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/08/26.
//

import UIKit

class ViewViewController: BaseViewController {

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
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Setup
    
    override func setupLayouts() {
        view.addSubview(bView)
        [ closeButton ].forEach {
            bView.addSubview($0)
        }
    }

    override func setupStyles() {
        self.view.backgroundColor = .white
        view.backgroundColor = .systemYellow

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
    @objc func buttonBtnTapped(_ sender: UIButton) {
        print("ButtonVcBtn")
    }
    
    @objc func closeBtnTapped(_ sender: UIButton) {
        print("closeBtn")
        
        if let topVC = UIApplication.topViewController() {
            RDAlertViewController.alertControllerShow(WithTitle: "", message: "helloWorld", isNeedCancel: false, viewController: topVC) { isCheck in
                self.bView.backgroundColor = .systemTeal
            }
        }
//        dismiss(animated: true, completion: nil)
    }
}

// 클래스 외부에 선언
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewVCPreview: PreviewProvider {
    
    static var previews: some View {
        ViewViewController().toPreview()

    }
}
#endif
