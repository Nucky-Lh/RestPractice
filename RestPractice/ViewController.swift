//
//  ViewController.swift
//  RestPractice
//
//  Created by Николай Лахов on 16.05.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var textGet: UITextView!
    
    @IBOutlet weak var textSearch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
  
    }


    
    @IBAction func search(_ sender: UIButton) {
           
        let textField: String = textSearch.text!
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(textField)")
       

        func getPost () {

                guard let requestUrl = url else { return }

                var request = URLRequest(url: requestUrl)

                request.httpMethod = "GET"

                request.addValue("application/json", forHTTPHeaderField: "Content-Type")

                let task = URLSession.shared.dataTask(with: request) { (data, responce, error) in
                    guard let data = data,
                    let dataString = String(data: data, encoding: .utf8),
                    (responce as? HTTPURLResponse)?.statusCode == 200,
                    error == nil else { return }

                    print(dataString)
        
                }
            task.resume()
            }
          getPost()
        
        
       
        }

}
