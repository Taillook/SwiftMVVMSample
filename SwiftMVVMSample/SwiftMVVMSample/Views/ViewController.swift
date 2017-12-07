//
//  ViewController.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let viewModel = ViewModel()
    let disposeBag   = DisposeBag()
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var lon: UITextField!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func bindViewAndViewModel() {
        Observable.combineLatest(lat.rx.text.orEmpty.asObservable(), lon.rx.text.orEmpty.asObservable()){
            ($0.count > 0 && $1.count > 0)
            }
            .bind(onNext: { _ in
                self.viewModel.getWeather(lat: self.lat.text!, lon: self.lon.text!)
            })
            .disposed(by: disposeBag)
        viewModel.data.asObservable()
            .bind(onNext: { data in
                if data.mainItem.count > 0 {
                    self.weatherLabel.text = "Weather is \(data.mainItem[0].main)."
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

