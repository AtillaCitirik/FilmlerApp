//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Atilla Çıtırık on 18.05.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    var filmlerListesi = [Filmler]()
    
    var viewModel = AnaSayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        _ = viewModel.filmlerListesi.subscribe(onNext: { liste in
            self.filmlerListesi = liste
            self.filmlerCollectionView.reloadData()
        })
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.7)
        
        filmlerCollectionView.collectionViewLayout = tasarim
        
    }

}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HucreProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        cell.imageViewFilm.image = UIImage(named: "\(film.resim!)")
        cell.labelFiyat.text = "\(film.fiyat!)"
        print("Film: \(film.ad!),       Film fiyat: \(film.fiyat!)")
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }

    func sepeteEkleTikla(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) seçildi")
    }
    
    
}

