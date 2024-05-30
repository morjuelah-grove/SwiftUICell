//
//  ViewController.swift
//  TestSwiftUICell
//
//  Created by Miguel Orjuela on 30/05/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(HostingTableViewCell<CellView>.self, forCellReuseIdentifier: "textCell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! HostingTableViewCell<CellView>

        cell.set(rootView: CellView(), parentController: self)
        return cell
    }
}

