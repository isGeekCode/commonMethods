//
//  PreviewTutorial.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/10/12.
//

import Foundation


// MARK: - 1. 서브클래스의 미리보기를 보여주는 컨벤션을 가진 클래스 구현

/*
 import UIKit
 import SwiftUI
 
 #if DEBUG
 extension UIViewController {
 private struct Preview: UIViewControllerRepresentable {
 let viewController: UIViewController
 
 func makeUIViewController(context: Context) -> UIViewController {
 return viewController
 }
 
 func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
 }
 }
 
 func toPreview() -> some View {
 Preview(viewController: self)
 }
 }
 
 extension UIView {
 private struct Preview: UIViewRepresentable {
 typealias UIViewType = UIView
 let view: UIView
 
 func makeUIView(context: Context) -> UIView {
 return view
 }
 
 func updateUIView(_ uiView: UIView, context: Context) {
 }
 }
 
 func toPreview() -> some View {
 Preview(view: self)
 }
 }
 #endif
 */

// MARK: - 2. 미리보기할 View의 하단에 구현할 코드

/*
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct <# ViewController #>Preview: PreviewProvider {
    
    static var previews: some View {
        <# ViewController #>().toPreview()
    }
}
#endif
 */


// MARK: - 3. Resume버튼 클릭하여 실시간 업데이트 활성화



// MARK: + 스니펫 세팅을 해둔다.
/** Snippet :  Shift +  Command + L */
// previews
// previewClass

// MARK: - TEST 1. 기본사용 - 레이아웃 및 컬러 수정
// 상단의 Resume을 눌러 실시간 업데이트를 활성화


/// **순서**
/// 1. Property
/// 2. SetupLayouts:  AddSubView
/// 3. SetConstraints
/// 4. SetStyle
///
/// UILabel추가
///
///
/*
 private var testLabel: UILabel = UILabel()


 [ closeButton, testLabel ].forEach {
     bView.addSubview($0)
 }

 testLabel.snp.makeConstraints {
     $0.width.equalTo(bView).multipliedBy(0.2)
     $0.height.equalTo(bView.snp.width).multipliedBy(0.1)
     $0.centerX.equalToSuperview()
     $0.top.equalToSuperview().inset(100)
 }

 
 testLabel.backgroundColor = .systemPink
 testLabel.text = "test"
// testLabel.textAlignment = .center
// testLabel.textColor = .white

 */


/// UIButton추가

/*
 
 private var testButton: UIButton = UIButton()

  [ closeButton, testLabel, testButton ].forEach {
 bView.addSubview($0)
}
   testButton.snp.makeConstraints {
     $0.centerX.equalToSuperview()
     $0.top.equalTo(testLabel.snp.bottom).offset(30)
     $0.width.height.equalTo(testLabel)
 }
 
 testButton.backgroundColor = .systemBlue
//        testButton.setTitle("testBtn", for: .normal)

 
 @objc func buttonBtnTapped(_ sender: UIButton) {
     print("ButtonVcBtn")
 }
 
 */

/// UISwitch추가
/*
 
 private var testSwitch: UISwitch = UISwitch()

 [ closeButton, testLabel, testButton, testSwitch ].forEach {
 bView.addSubview($0)
}
 testSwitch.snp.makeConstraints {
     $0.centerX.equalToSuperview()
     $0.top.equalTo(testButton.snp.bottom).offset(30)
     $0.width.height.equalTo(testButton)
 }
 
 testSwitch.thumbTintColor = UIColor.systemTeal
 testSwitch.onTintColor = .black
 */

// MARK: - TEST 2. 얼럿생성
// 동작을 확인하기 위해서는 시뮬레이터 상단의 PLAY버튼을 활성화 시킨다.
/// 클릭하면 얼럿생성, 확인을 누르면 색상이 바뀜
/*
    if let topVC = UIApplication.topViewController() {
        RDAlertViewController.alertControllerShow(WithTitle: "", message: "helloWorld", isNeedCancel: false, viewController: topVC) { isCheck in
    //        self.bView.backgroundColor = .systemTeal
        }
    }
 */

// MARK: - TEST 3. presentVC
