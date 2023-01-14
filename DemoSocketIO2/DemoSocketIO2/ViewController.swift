//
//  ViewController.swift
//  DemoSocketIO2
//
//  Created by Iphone XR on 29/11/22.
//

import UIKit
import SocketIO

class ViewController: UIViewController{
    
    var manager : SocketManager!
    var socket : SocketIOClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       manager = SocketManager(socketURL: URL(string: "https://test.clouzer.com/login")!,config: [.log(true),.compress,.forceWebsockets(true),.reconnectWait(2),.reconnectAttempts(5),.secure(true),.path("/sync"),.selfSigned(false),.forceNew(true), .reconnects(true)])
        
        // Create a socket for the /swift namespace
        socket = manager.socket(forNamespace: "/login")
        socket.connect()
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        socket.on(clientEvent: .disconnect) {data, ack in
            print("socket disconnected")
        }
    }


}

