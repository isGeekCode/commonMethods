//
//  CommonMethod.swift
//  tutorialApp
//
//  Created by bang_hyeonseok on 2022/08/18.
//

import UIKit

// MARK: - AlertViewController
public struct GCAlertViewController {
    
    public init() {}
    
    public func alertControllerShow(WithTitle titl: String, message msg: String, isNeedCancel cancel: Bool, viewController vc: UIViewController, completeHandler complete: @escaping (_ isCheck: Bool) -> Void) -> Void {
        
        let alertController = UIAlertController.init(title: titl, message: msg, preferredStyle: .alert)
        if cancel {
            let cancelAction = UIAlertAction.init(title: GCMessage().buttonFalse, style: .cancel) { (cancelAct) in
                complete(false)
            }
            alertController.addAction(cancelAction)
        }
        
        let btnAction = UIAlertAction.init(title: GCMessage().buttonTrue, style: .default) { (alertAct) in
            complete(true)
        }
        
        alertController.addAction(btnAction)
        
        // main thread 문제 발생으로 timing으로 제어
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    public func alertControllerShowWithTextField(WithPrompt prompt: String?, defaultTxt defaultText: String?, viewController vc: UIViewController, completeHandler: @escaping (_ resultString: String?) -> Void) -> Void {
        
        let alertController = UIAlertController.init(title: "", message: defaultText, preferredStyle: .alert)
        alertController.addTextField { (txtField) in
            txtField.text = defaultText
        }
        let cancelAction = UIAlertAction.init(title: GCMessage().buttonFalse, style: .cancel) { (canceled) in
            completeHandler(nil)
        }
        let defaultAction = UIAlertAction.init(title: GCMessage().buttonTrue, style: .default) { (defaultAciton) in
            let textFt = alertController.textFields?.first?.text
            completeHandler(textFt)
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    public func basicAlertControllerShow(WithTitle titl: String, message msg: String, isNeedCancel cancel: Bool, viewController vc: UIViewController, completeHandler complete: @escaping (_ isCheck: Bool) -> Void) -> Void {
        
        let alertController = UIAlertController.init(title: titl, message: msg, preferredStyle: .alert)
        if cancel {
            let cancelAction = UIAlertAction.init(title: GCMessage().buttonFalse, style: .cancel) { (cancelAct) in
                complete(false)
            }
            alertController.addAction(cancelAction)
        }
        
        let btnAction = UIAlertAction.init(title: GCMessage().buttonTrue, style: .default) { (alertAct) in
            complete(true)
        }
        
        alertController.addAction(btnAction)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
}
