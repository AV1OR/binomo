//
//  AboutViewController.swift
//  binomo
//
//  Created by Alexey Kamenev on 27.10.2022.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createConstraints()
    }
    let aboutLabel: UILabel = {
        let aboutLabel = UILabel()
        //Paragrath style
        let attributedString = NSMutableAttributedString(string: "About the \ngame")
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 26
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range:NSMakeRange(0, attributedString.length))
        
        aboutLabel.attributedText = attributedString
        aboutLabel.textAlignment = .center
        aboutLabel.font = .systemFont(ofSize: 46, weight: .medium)
        aboutLabel.textColor = .white
        aboutLabel.numberOfLines = 2
        return aboutLabel
    }()
    let welcomeText: UILabel = {
        let welcomeText = UILabel()
        
        return welcomeText
    }()
    private func createConstraints() {
        self.view.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(76)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(144)
        }
    }
}
