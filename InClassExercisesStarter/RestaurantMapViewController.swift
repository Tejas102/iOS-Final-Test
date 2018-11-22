//
//  RestaurantMapViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit

class RestaurantMapViewController: UIViewController, MKMapViewDelegate {

    let URL = "http://opentable.herokuapp.com/api/restaurants?city=Toronto&per_page=5"
    
    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded the map screen")
        // EXAMPLE 1: Configuring what is displayed inside the map
        // ------------------------------------------------
        // set the center of the map
        let x = CLLocationCoordinate2DMake(43.68207, -79.40041)
        
        // pick a zoom level
        let y = MKCoordinateSpanMake(0.01, 0.01)
        
        // set the region property of the mapview
        let z = MKCoordinateRegionMake(x, y)
        self.mapView.setRegion(z, animated: true)
        
        
        // EXAMPLE 2:  Add a pin to the map
        // ------------------------------------------------
        
        // 1. Create a pin object
        let pin = MKPointAnnotation()
        
        // 2. Set the latitude / longitude of the pin
        pin.coordinate = x
        
        // 3. OPTIONAL: add a information popup (a "bubble")
        pin.title = "Scaramouche Restaurant"

        // 4. Show the pin on the map
        self.mapView.addAnnotation(pin)
        
        // PRACTICE: Add another pin to the map
        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2DMake(43.648033, -79.374377)
        self.mapView.addAnnotation(pin2)
        pin2.title = "The Sultan's Tent"
        
        let pin3 = MKPointAnnotation()
        pin3.coordinate = CLLocationCoordinate2DMake(43.649015, -79.420648)
        self.mapView.addAnnotation(pin3)
        pin3.title = "Salt Wine Bar"
        
        let pin4 = MKPointAnnotation()
        pin4.coordinate = CLLocationCoordinate2DMake(43.713, -79.3996)
        self.mapView.addAnnotation(pin4)
        pin4.title = "North 44"
        
        let pin5 = MKPointAnnotation()
        pin5.coordinate = CLLocationCoordinate2DMake(43.648996, -79.375032)
        self.mapView.addAnnotation(pin5)
        pin5.title = "Woods Restaurant & Bar"
        
        // EXAMPLE 3:  Add a line to the map
        // ------------------------------------------------
        
        // 1. Create the coordinates for your line
        // 2. Put these coordinates in an array
        // 3. Create an MKPolyline object
//        mapView.delegate = self
//
//        // cn tower
//        let pos1 = CLLocationCoordinate2DMake(43.68207, -79.40041)
//        // lambton in toronto
//        let pos2 = CLLocationCoordinate2DMake(43.648033, -79.374377)
//
//        var locations = [pos1, pos2]
//
     //   let polyline = MKPolyline(coordinates: &locations, count: locations.count)
        
    //    mapView.add(polyline)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: Actions

    @IBAction func zoomInPressed(_ sender: Any) {
        
        print("zoom in!")
        var r = mapView.region
        
        print("Current zoom: \(r.span.latitudeDelta)")
        
        r.span.latitudeDelta = r.span.latitudeDelta / 4
        r.span.longitudeDelta = r.span.longitudeDelta / 4
        print("New zoom: \(r.span.latitudeDelta)")
        print("-=------")
        self.mapView.setRegion(r, animated: true)
        // HINT: Check MapExamples/ViewController.swift
    }
    
    @IBAction func zoomOutPressed(_ sender: Any) {
        // zoom out
        print("zoom out!")
        var r = mapView.region
        r.span.latitudeDelta = r.span.latitudeDelta * 2
        r.span.longitudeDelta = r.span.longitudeDelta * 2
        self.mapView.setRegion(r, animated: true)
        
        // HINT: Check MapExamples/ViewController.swift
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
