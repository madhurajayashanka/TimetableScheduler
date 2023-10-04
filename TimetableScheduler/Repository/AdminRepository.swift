//
//  AdminRepository.swift
//  TimetableScheduler
//
//  Created by Hiago Chagas on 04/10/23.
//

import Foundation

protocol AdminRepositing {
    func login(email: String, password: String) -> Bool
    func signUp(name: String, email: String, password: String) -> Bool
}

final class AdminRepository {
    private var admins: [Admin] = [
        .init(
            name: "Instituto Federal do Ceará",
            email: "admin@ifce.edu.br",
            password: "123456")
    ]
}

extension AdminRepository: AdminRepositing {
    func login(email: String, password: String) -> Bool {
        guard let foundUser = admins.first(where: { admin in
            admin.email == email && admin.password == password
        }) else {
            return false
        }
        return true
    }
    
    func signUp(name: String, email: String, password: String) -> Bool {
        guard !admins.contains(where: { $0.email == email }) else { return false }
        admins.append(
            Admin(name: name, email: email, password: password)
        )
        return true
    }
    
}
