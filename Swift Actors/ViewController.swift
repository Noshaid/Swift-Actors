//
//  ViewController.swift
//  Swift Actors
//
//  Created by Noshaid Ali on 26/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let account1 = BankAccount(balance: 100, acountName: "Noshaid")
    let account2 = BankAccount(balance: 50, acountName: "Junaid")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            await update()
            await config()
        }
    }
    
    func config() async {
        Task {
            let balance1 = await account1.balanceConfig() // actor method
            let balance2 = await account2.balanceConfig() // actor method
            
            print(balance1)
            print(balance2)
        }
    }
    
    func update() async {
        Task {
            print("********************************************")
            try await transfer(amount: 75, from: account2, to: account1)
            print("Transfer complete: account2 => account1: 75")
            print("New Balance: \(await account1.balanceConfig())")
            print("New Balance: \(await account2.balanceConfig())")
            print("********************************************\n")
        }
        
        Task {
            print("********************************************")
            try await transfer(amount: 30, from: account1, to: account2)
            print("Transfer complete: account1 => account2: 30")
            print("New Balance: \(await account1.balanceConfig())")
            print("New Balance: \(await account2.balanceConfig())")
            print("********************************************\n")
        }
    }
    
    func transfer(amount: Int, from: BankAccount, to: BankAccount) async throws {
        let availabe = await from.withdraw(amount: amount)
        await to.deposit(amount: availabe)
    }
}

