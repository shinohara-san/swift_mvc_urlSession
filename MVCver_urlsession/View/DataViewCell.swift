//
//  DataViewCell.swift
//  MVCver_urlsession
//
//  Created by Yuki Shinohara on 2020/07/20.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    var titleLabel: UILabel!
    var bodyLabel: UILabel!
    
    var testData: TestData?{
        didSet {
            guard let t = testData else { return }
            titleLabel.text = t.title
            bodyLabel.text = t.body
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(titleLabel)
        
        bodyLabel = UILabel()
        bodyLabel.textColor = .black
        bodyLabel.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(bodyLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: contentView.bounds.origin.x + 15.0,
                                  y: contentView.bounds.origin.y + 15.0,
                                  width: contentView.frame.width - (15.0 * 2),
                                  height: 15)
        bodyLabel.frame = CGRect(x: titleLabel.frame.origin.x,
                                 y: titleLabel.frame.maxY + 8.0,
                                 width: titleLabel.frame.width,
                                 height: 15)
    }
    
}

