//
//  AnaSayfaViewModel.swift
//  FilmlerApp
//
//  Created by Atilla Çıtırık on 28.05.2024.
//

import Foundation
import RxSwift

class AnaSayfaViewModel {
    
    var frepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())

    init(){
        filmlerListesi = frepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle(){
        frepo.filmleriYukle()
    }
}
