//
//  Person.swift
//  ContactsApp
//
//  Created by Ngoc on 8/29/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import Foundation


class Person {
    static var arrFirstNameMen: [String]!
    static var arrFirstNameWomen: [String]!
    static var arrLastName: [String]!
    static var arrMiddleNameMen: [String]!
    static var arrMiddleNameWomen: [String]!
    static var viettelBeginNumbers: [String]!
    static var mobiBeginNumbers: [String]!
    static var vinaBeginNumbers: [String]!
    
    
    var fullName: String!
    var lastName: String!
    var firstName: String!
    var middleName: String!
    var beginNumber: String!
    var phoneNumber: String!
    
    
    static var isCheck: Bool = true
    
    init(){
        if Person.isCheck{
            
            Person.arrFirstNameMen = ["Anh", "Bắc", "Tưởng", "Biên", "Chung", "Chiến", "Chính", "Công", "Duy", "Dương", "Dũng", "Điệp", "Đạo", "Điền", "Đạt", "Kiên", "Kiểm", "Long", "Mạnh", "Nam", "Nhân", "Phúc", "Phuớc", "Phú", "Quảng", "Quân", "Sáng", "Trung", "Tú", "Cần", "Minh", "Phương", "Thế", "Duy", "Cường", "Huy", "Thắng", "Tiến", "Tùng", "Bình"]
            
            Person.arrFirstNameWomen = ["An", "Anh", "Ánh", "Dung", "Giang", "Hằng", "Hương", "Khánh", "Liên", "Linh", "Liễu", "Mai", "Nhi", "Nhung", "Oanh", "Phúc", "QUyên", "Quỳnh", "Thuỷ", "Thảo", "Tú", "Phương", "Hoa", "Huệ", "Uyên", "Yến"]
            
            Person.arrLastName = ["Nguyễn", "Trần", "Lê", "Phạm", "Hoàng","Phan", "Vũ", "Đặng", "Bùi", "Đỗ", "Hồ", "Ngô", "Dương", "Lý"]
            
            Person.arrMiddleNameWomen = ["Đặng", "Thị", "Ngọc", "Thuỳ", "Tú"]
            
            Person.arrMiddleNameMen = ["Bá", "Văn", "Đăng", "Bảo", "Đình", "Minh", "Vĩnh", "Hữu", "Công", "Khắc", "Duy", "Kim", "Thế", "Xuân"]
            
            Person.viettelBeginNumbers = [ "098", "097", "096", "0169", "0168", "0167", "0166", "0165", "0164", "0163", "0162"]
            
            Person.mobiBeginNumbers = ["090" , "093" , "0120" , "0121" , "0122" , "0126" , "0128" ]
            
            Person.vinaBeginNumbers = ["091", "094", "0123", "0124", "0125", "0127", "0129"]
            
            Person.isCheck = false
        }
        
        let genderIndex = arc4random_uniform(2)
        
        if(genderIndex == 0 ){
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
        
        }else{
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrFirstNameMen.count)))]
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
        
        }
        
        
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        
        fullName = lastName + " " + middleName + " " + firstName
        
        let telecomIndex = arc4random_uniform(3)
        
        if (telecomIndex == 0){
            beginNumber = Person.viettelBeginNumbers[Int(arc4random_uniform(UInt32(Person.viettelBeginNumbers.count)))]
        }
        
        else if(telecomIndex == 1){
            beginNumber = Person.mobiBeginNumbers[Int(arc4random_uniform(UInt32(Person.mobiBeginNumbers.count)))]
        }
        
        else{
            beginNumber = Person.vinaBeginNumbers[Int(arc4random_uniform(UInt32(Person.vinaBeginNumbers.count)))]
        }
        
        phoneNumber = beginNumber + String(arc4random_uniform(8999999) + 1000000)
    }
}