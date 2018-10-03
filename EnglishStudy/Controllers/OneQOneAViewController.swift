//
//  OneQOneAViewController.swift
//  EnglishStudy
//
//  Created by yonekan on 2018/10/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import Koloda

class OneQOneAViewController: UIViewController {

    var category = Category()
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }

    @IBAction func tapGood(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }
    
    @IBAction func tapBad(_ sender: UIButton) {
        kolodaView.swipe(.left)
    }
    
}

extension OneQOneAViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
}

extension OneQOneAViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 10
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let label = UILabel()
        label.frame = CGRect(x:0, y:0, width:kolodaView.frame.width , height:kolodaView.frame.height)
        label.text = "text\(index)"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-medium", size: CGFloat(100))
        let imageView = UIImageView()
        imageView.addSubview(label)
        imageView.image = UIImage(named: "notebackground")
        return imageView
    }
    
}
