//
//  PostListView.swift
//  MyFirstViperApp
//
//  Created by sebastian on 3/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit
import PKHUD

class PostListView: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var presenter: PostListPresenterProtocol?
    var postList: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Se indica que inicia el proceso de carga de la view al presenter.
        presenter?.viewDidLoad()
        //Se agrega un footer(?).
        tableView.tableFooterView = UIView()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PostListView: PostListViewProtocol {
    
    /**
     Función que permite inicializar la lista de posts y recargar la tabla para que se visualice.
     */
    func showPosts(with posts: [PostModel]) {
        
        postList = posts
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension PostListView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath) as! PostListCell
        
        let post = postList[indexPath.row]
        
        cell.set(forPost: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = postList[indexPath.row]
        presenter?.showPostDetail(forPost: post)
    }
}
