//
//  TableViewController.swift
//  YoutubeApi
//
//  Created by Yuan-Che Chang on 2020/9/6.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private let reuseIdentifier = "TableViewCell"
    var youtube:Youtube?
    var item = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func youtubeList(){
     let url = URL(string: "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UUnksRRifsSCGUZpQukUKAyg&key=AIzaSyD5ZgGEBVowhRzU6ERfbqNsgd6jA5k89GI&maxResults=50")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                let youtubes = try? JSONDecoder().decode(Youtube.self, from: data)
               
                self.youtube = youtubes
                self.item = self.youtube!.items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }.resume()
    }
    

    
    
    
   // 有幾個 cell
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//有多少table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return item.count
    }

    //得到要顯⽰的cell ,可從參數 indexPath 得到 section & row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as? TableViewCell else { return TableViewCell() }

        // Configure the cell...
        let youtubeCell = item[indexPath.row]
        print(youtubeCell.snippet.channelTitle)
        cell.autherLabel?.text = youtubeCell.snippet.channelTitle
        cell.viewLabel?.text = youtubeCell.snippet.publishedAt
        cell.titleLabel?.text = youtubeCell.snippet.title
//        cell.coveImageView.image = ""
        
        let url = URL(string: youtubeCell.snippet.thumbnails.default.url)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.coveImageView.image = image
                }
                
            }
        }.resume()
        
        
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let youtubeDetail = item[indexPath.row]
        detailVC.item = youtubeDetail
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

    
//    func getYoutube() -> [Youtube]{
//        youtube.append(Youtube(title: "Swift 5: Custom CollectionView Cells (Programmatically) Xcode 11 - 2020 iOS", auther: "iOS Academy", view: "100,000views", image: UIImage(named: "1")!))
//        youtube.append(Youtube(title: "Swift: Create Tab Bar Controller Programmatically (Swift 5, Xcode 11) - 2020 iOS", auther: "iOS Academy", view: "100,453views", image: UIImage(named: "2")!))
//        youtube.append(Youtube(title: "Pass Data from TableView and ViewController (Swift 5, Xcode 11) - 2020 iOS Development", auther: "iOS Academy", view: "988,990views", image: UIImage(named: "3")!))
//        youtube.append(Youtube(title: "Swift 5: Navigation Controller Programmatically (in code) (Xcode 11, 2020) - iOS Development", auther: "iOS Academy", view: "5000views", image: UIImage(named: "4")!))
//        youtube.append(Youtube(title: "Swift 5: Anonymous Closures & Closures (Xcode 11) - 2020 - iOS Developer", auther: "iOS Academy", view: "54644353views", image: UIImage(named: "5")!))
//        youtube.append(Youtube(title: "Build Instagram App: Part 15 (Swift 5) - 2020 - Xcode 11 - iOS Development", auther: "iOS Academy", view: "100000views", image: UIImage(named: "6")!))
//        youtube.append(Youtube(title: "Build Instagram App: Part 14 (Swift 5) - 2020 - Xcode 11 - iOS Development", auther: "iOS Academy", view: "5,677,557views", image: UIImage(named: "7")!))
//        youtube.append(Youtube(title: "Build Instagram App: Part 13 (Swift 5) - 2020 - Xcode 11 - iOS Development", auther: "iOS Academy", view: "100234views", image: UIImage(named: "8")!))
       
//        return youtube
//}



    
}
