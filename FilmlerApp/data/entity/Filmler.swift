//
//  Filmler.swift
//  FilmlerApp
//
//  Created by Atilla Çıtırık on 18.05.2024.
//

import Foundation

class Filmler {
    
    
    var id:Int?
    var ad:String?
    var resim:String?
    var fiyat:Int?
    
    init(){
        
    }
    
    
    internal init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
