//
//  ViewController.swift
//  ShimmerFB
//
//  Created by Jayant Arora on 4/9/18.
//  Copyright © 2018 Jayant Arora. All rights reserved.
//

import UIKit
import Shimmer

class ViewController: UIViewController {

    @IBOutlet var shimmerView: FBShimmeringView!
    @IBOutlet var timeLabel: UILabel!
    var updateTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial update
        initialSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initialSetup(){
        updateTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                           target: self,
                                           selector: #selector(updateTime),
                                           userInfo: nil,
                                           repeats: true)

        shimmerView?.contentView = timeLabel
        shimmerView.shimmeringPauseDuration = 0.2
        shimmerView?.isShimmering = true

    }

    @objc func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        timeLabel.text = dateFormatter.string(from: Date())
    }

}

