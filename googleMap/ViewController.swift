//
//  ViewController.swift
//  googleMap
//
//  Created by Fatemeh Najafi on 6/9/1400 AP.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
 
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let latitude: Float = 24.8607
    let longitud:Float = 67.0011
    var circle = GMSCircle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMap()
    }
    private func setUpMap () {
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitud), zoom: 16.0)
        mapView.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitud))
        marker.map = mapView
        let circleCenter = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitud))
        circle.position = circleCenter
        circle.fillColor = UIColor.green
        circle.strokeColor = UIColor .red
        circle.strokeWidth = 1
        circle.map = mapView
        circle.radius = 100
        
    }
    private func updateCircle (value: Int) {
        self.circle.radius = CLLocationDistance(value)
//        let update = GMSCameraUpdate.fit(self.circle.bounds())
//        self.mapView.animate(with: update)
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = Int(slider.value)
        
        print(currentValue)
        updateCircle(value: currentValue)
    }
    
    
    
}

