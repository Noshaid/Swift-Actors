//
//  BankAccount.swift
//  Swift Actors
//
//  Created by Noshaid Ali on 26/10/2024.
//


actor BankAccount {
    
    private var balance: Int
    private var accountName: String
    
    init(balance: Int, acountName: String) {
        self.balance = balance
        self.accountName = acountName
    }
    
    func deposit(amount: Int) {
        balance += amount
        print("Amount: \(amount) deposit successfully! to account: \(accountName)")
    }
    
    func withdraw(amount: Int) -> Int {
        if balance == 0 {
            print("Balance is nil")
            return 0
        } else if balance >= amount {
            balance -= amount
            print("Amount: \(amount) withdraw successfully! from account: \(accountName)")
            return amount
        } else {
            let available = balance
            balance = 0
            print("\(amount) greater than available balance")
            print("Availble amount: \(available) withdraw successfully! from account: \(accountName)")
            return available
        }
    }
    
    func balanceConfig() -> String {
        return "Acccount Name: \(accountName) ... Availble balance: \(balance)"
    }
}
