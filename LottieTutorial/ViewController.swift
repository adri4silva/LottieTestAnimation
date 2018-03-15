//
//  ViewController.swift
//  LottieTutorial
//
//  Created by Adrián Silva on 13/3/18.
//  Copyright © 2018 Adrián Silva. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    let strings = ["Swipe to the Left", "Sleep", "Clean", "More Clean", "Eat", "Repeat" ]

    private let animationView: LOTAnimationView = {
        let view = LOTAnimationView(name: "lottieSample")
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        view.contentMode = .scaleAspectFit
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnimationView()
        setupScrollView()
    }

    func setupAnimationView() {
        animationView.animationSpeed = 0.5
        animationView.center = self.view.center
        animationView.loopAnimation = true
        view.addSubview(animationView)
    }

    func setupScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(strings.count), height: scrollView.frame.height)

        for i in 0...5 {
            let textLabel: UILabel = {
                let label = UILabel()
                return label
            }()
            textLabel.frame = CGRect(x: scrollView.center.x + CGFloat(i) * self.view.frame.width - 130, y: 50, width: 260, height: 30)
            textLabel.font = UIFont.boldSystemFont(ofSize: 26)
            textLabel.textAlignment = .center
            textLabel.text = strings[i]
            scrollView.addSubview(textLabel)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        print(progress)
        animationView.animationProgress = progress
    }


}

