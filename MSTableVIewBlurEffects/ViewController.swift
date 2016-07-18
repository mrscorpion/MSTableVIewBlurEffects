//
//  ViewController.swift
//  MSTableVIewBlurEffects
//
//  Created by mr.scorpion on 16/7/18.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurBackground = BlurBackgroundView(frame:.zero)
        tableView.backgroundView = blurBackground
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: blurBackground.blurView.effect as! UIBlurEffect)
//        tableView.userInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(_:)))
        //设置手势点击数,双击：点2下
        tapGesture.numberOfTapsRequired = 2
        self.tableView.addGestureRecognizer(tapGesture)
    }
    
    var words: [String] = "Doesn't this look awesome by mr scorpion".componentsSeparatedByString(" ")
    
    //双击屏幕时会调用此方法,放大和缩小图片
    func handleTapGesture(sender: UITapGestureRecognizer){
        let msTVC = MSTableViewController()
        self .presentViewController(msTVC, animated: false, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = words[indexPath.row]
        cell.textLabel?.textAlignment = .Center
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let msTVC = MSTableViewController()
//        self .presentViewController(msTVC, animated: false, completion: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class BlurBackgroundView: UIView {
    let imageView : UIImageView
    let blurView: UIVisualEffectView
    
    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .Dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        imageView = UIImageView(image: UIImage.gorgeousImage())
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(blurView)
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        blurView.frame = bounds
    }
}

extension UIImage {
    class func gorgeousImage() -> UIImage {
        return UIImage(named: "gorgeousimage")!
    }
}
