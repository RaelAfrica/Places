//
//  ViewController.swift
//  Places
//
//  Created by Rael Kenny on 3/28/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import MapKit

class PlacesViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView:MKMapView?
    
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        if(locationManager != nil) {
            
            locationManager!.requestAlwaysAuthorization()
            
            locationManager!.delegate = self
            locationManager!.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let newLocation = locations.last
        {
            var region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 200, 200)
            
            if mapView != nil{
                
                var adjustRegion = mapView!.regionThatFits(region)
                
                mapView!.setRegion(adjustRegion, animated: true)
            }
            
            print(newLocation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

