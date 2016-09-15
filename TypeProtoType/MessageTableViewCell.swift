//
//  MessageTableViewCell.swift
//  TypeProtoType
//
//  Created by Type Inc on 11.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit
import SnapKit


class MessageTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        label.textColor = UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1.0)
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var indiContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.10, green:0.10, blue:0.10, alpha:1.0)
        return view
    }()
    
    lazy var viewContainer:UIView = {
        let view = UIView ()
        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
    }
    
    func initWithModel(model:ChatModel){
        nameLabel.text = model.name
        bodyLabel.text = model.text
        
        
        
        
    }
    // We won’t use this but it’s required for the class to compile
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func configureSubviews() {
        self.addSubview(self.indiContainer)
        self.addSubview(self.viewContainer)
        self.viewContainer.addSubview(self.nameLabel)
        self.viewContainer.addSubview(self.bodyLabel)
        
        
        indiContainer.snp_makeConstraints { (make) in
 
            make.top.equalTo(self.self)
            make.left.equalTo(8)
            make.right.equalTo(8)
            make.width.equalTo(20)
            make.height.equalTo(self.viewContainer.snp_height)
            
        }
        
        viewContainer.snp_makeConstraints { (make) in
            make.right.equalTo(self.indiContainer)
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
        }
        
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self.indiContainer.snp_right).offset(0)
            
        }
        
        bodyLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLabel.snp_bottom).offset(1)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self.indiContainer).offset(-8)
            make.bottom.equalTo(self).offset(-10)
        }
        
        
    }
}
