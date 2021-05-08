
//
//  Page2ViewController.swift
//  testapp2
//
//  Created by RVCTechBusTeacher on 5/1/21.
//
import UIKit
import MapKit

class ChooseViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()
            let authorizationStatus = CLLocationManager.authorizationStatus()
            let regionRadius: Double = 1000
        //@IBOutlet weak var map: MKMapView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
          
        }
        
    }
