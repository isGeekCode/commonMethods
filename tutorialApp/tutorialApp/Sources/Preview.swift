//
//  Preview.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/10/12.
//

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
