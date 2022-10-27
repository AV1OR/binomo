//
//  ViewController.swift
//  binomo
//
//  Created by Alexey Kamenev on 26.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var rectangleViewRight = UIView()
    var rectangleViewLeft = UIView()
    //Colors
    public let rectangleWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 252/255, alpha: 1.0)
    public let rectangleGrayColor = UIColor(red: 107/255, green: 107/255, blue: 110/255, alpha: 0.2)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createConstraints()
        rectangleViewRight = RectangleView(color: rectangleWhiteColor, isRight: true)
        rectangleViewLeft = RectangleView(color: rectangleGrayColor, isRight: false)
    }
   
    let imageLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logo-no-text")
        return imageLogo
    }()
    
    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = .systemFont(ofSize: 46)
        welcomeLabel.textColor = .white
        return welcomeLabel
    }()
    
    let binomoTextLogo: UIImageView = {
        let binomoTextLogo = UIImageView()
        binomoTextLogo.image = UIImage(named: "binomo-text")
        return binomoTextLogo
    }()
    
    let rectangleViewCenter: UIView = {
        let rectangleViewCenter = UIView()
        rectangleViewCenter.backgroundColor = UIColor(red: 197, green: 192, blue: 192, alpha: 0.5)
        return rectangleViewCenter
    }()
    
    let nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .white
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitleColor(.darkGray, for: .highlighted)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return nextButton
    }()
    //MARK: - Methods
    open func RectangleView(color: UIColor, isRight: Bool) -> UIView {
        let rectangle = UIView()
        rectangle.backgroundColor = color
        view.addSubview(rectangle)
        rectangle.snp.makeConstraints { make in
            if isRight {
                make.left.equalTo(rectangleViewCenter.snp.right).inset(-28)
            }else {
                make.right.equalTo(rectangleViewCenter.snp.left).inset(-28)
            }
            make.top.equalTo(binomoTextLogo.snp.bottom).inset(-106)
            make.width.equalTo(14)
            make.height.equalTo(7)
        }
        return rectangle
    }
    
    @objc private func nextAction() {
        let nextViewController:AboutViewController = AboutViewController()
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    //MARK: - Constraints
    private func createConstraints() {
        
        self.view.addSubview(imageLogo)
        imageLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(135)
            make.centerX.equalToSuperview()
            make.width.equalTo(216)
            make.height.equalTo(196)
        }
        self.view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(imageLogo.snp.bottom).inset(-26)
            make.centerX.equalToSuperview()
            make.width.equalTo(278)
            make.height.equalTo(72)
        }
        self.view.addSubview(binomoTextLogo)
        binomoTextLogo.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-26)
            make.centerX.equalToSuperview()
            make.width.equalTo(308)
            make.height.equalTo(67)
        }
        self.view.addSubview(rectangleViewCenter)
        rectangleViewCenter.snp.makeConstraints { make in
            make.top.equalTo(binomoTextLogo.snp.bottom).inset(-106)
            make.centerX.equalToSuperview()
            make.width.equalTo(14)
            make.height.equalTo(7)
        }
        self.view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(67)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rectangleViewCenter.layer.cornerRadius = 2
        rectangleViewRight.layer.cornerRadius = 2
        rectangleViewLeft.layer.cornerRadius = 2
        nextButton.layer.cornerRadius = 10
    }
}

