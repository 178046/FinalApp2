//
//  Page3ViewController.swift
//  TESTAPP
//
//  Created by LR on 5/1/21.
//
import UIKit
import MapKit
import AVKit


class HomePageViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate  {

    var locationManager = CLLocationManager()
            let authorizationStatus = CLLocationManager.authorizationStatus()
            let regionRadius: Double = 1000
        @IBOutlet weak var map: MKMapView!
    let player = AVQueuePlayer()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            map.delegate = self
            // define audio play
            if let url = Bundle.main.url(forResource: "Bus", withExtension: "m4a") {
        
        player.insert(AVPlayerItem(url: url), after: nil)
                player.play()
            }
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
