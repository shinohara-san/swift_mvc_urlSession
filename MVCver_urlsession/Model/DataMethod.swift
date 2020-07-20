//
//  DataMethod.swift
//  MVCver_urlsession
//
//  Created by Yuki Shinohara on 2020/07/20.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation
import UIKit

class DataMethod {
    var datas = [TestData]()
    
    func getData(tableView: UITableView){
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self](data, _, error) in
            guard let self = self else {return}

            guard let data = data else {return}
            let decoder = JSONDecoder()
            let tempArray = try? decoder.decode([TestData].self, from: data)
            guard let unwrappedArray = tempArray else {return}
            self.datas = unwrappedArray
            
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func count() -> Int{
        return datas.count
    }
    
    func data(at index: Int) -> TestData?{
        if datas.count > index{
            return datas[index]
        }
        return nil
    }
}
