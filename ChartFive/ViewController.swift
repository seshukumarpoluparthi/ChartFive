//
//  ViewController.swift
//  ChartFive
//
//  Created by Pavel Bogart on 3/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableVIew: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    let bandCellId = "bandCellId"
    
    let bandsArray = [Info(image: "metallica", title: "Metallica"),
                     Info(image: "slipknot", title: "Slipknot"),
                     Info(image: "nirvana", title: "Nirvana"),
                     Info(image: "acdc", title: "AC/DC"),
                     Info(image: "system", title: "System Of A Down")]
    
    let songsArray = [Info(image: "1", title: "The Unforgiven"),
                      Info(image: "2", title: "Snuff"),
                      Info(image: "3", title: "Smells Like Teen Spirit"),
                      Info(image: "4", title: "Back In Black"),
                      Info(image: "5", title: "Chop Suey")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
    }
    
    func setupViews() {
        navigationItem.title = "ChartFive"
        navigationController?.navigationBar.barTintColor = UIColor(r: 0, g: 255, b: 198)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray,
                                                                   NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func setupTableView() {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(BandCell.self, forCellReuseIdentifier: bandCellId)
        
        view.addSubview(tableVIew)
        tableVIew.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return songsArray.count
        }
        return bandsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! BandCell
        cell.pictureImageView.image = UIImage(named: bandsArray[indexPath.item].image!)
        cell.titleLabel.text = bandsArray[indexPath.item].title
        
        if indexPath.section == 1 {
            cell.pictureImageView.image = UIImage(named: songsArray[indexPath.item].image!)
            cell.titleLabel.text = songsArray[indexPath.item].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Top Songs"
        }
        return "Top Bands"
    }

}

class BandCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
  
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        
        pictureImageView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

