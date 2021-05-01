
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
        @IBOutlet weak var map: MKMapView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            map.delegate = self
                   locationManager.delegate = self
                   configureLocationServices()
            // Do any additional setup after loading the view.
        }
        
        func centerMapOnUserLocation() {
              guard let coordinate = locationManager.location?.coordinate else {return}
              let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            map.setRegion(coordinateRegion, animated: true)
          }

          func configureLocationServices() {
              if authorizationStatus == .notDetermined {
                  locationManager.requestAlwaysAuthorization()
              } else {
                  return
              }
          }

          func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
              centerMapOnUserLocation()
          }

    }
