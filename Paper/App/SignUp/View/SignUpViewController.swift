//
//  SignUpViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/21.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import Lottie

class SignUpViewController: BaseViewController<SignUpViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.logoImage()
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.glogGradient()
    }

    lazy var idTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "사용하실 아이디를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.addLeftImage(UIImage(systemName: "person.fill")!, x: 13, y:7)
        $0.layer.cornerRadius = 10
    }
    
    let signUpEmoji = LottieAnimationView(name: "SignUpEmoji").then {
        $0.loopMode = .loop
        $0.play()
    }
    
    lazy var nextButton = UIButton().then {
        let text = NSAttributedString(string: "다음")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    override func addView() {
        [idTextField,nextButton,signUpEmoji].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 2.411)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 16.23)
            $0.trailing.leading.equalToSuperview().inset(12)
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        signUpEmoji.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 4.99)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(134)
            $0.width.equalTo(134)
        }
    }
    
}
