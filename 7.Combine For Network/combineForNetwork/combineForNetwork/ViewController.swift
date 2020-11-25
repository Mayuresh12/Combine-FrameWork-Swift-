//
//  ViewController.swift
//  combineForNetwork
//
//  Created by Mayuresh Rao on 11/24/20.
//

import UIKit
import Combine


class ViewController: UITableViewController {
     
    private var webservice = WebService()
    private var cancellable: AnyCancellable?
    
    private var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.getPosts()
            .catch { _ in Just([Post]())}
            .assign(to: \.posts, on: self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = self.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
}

