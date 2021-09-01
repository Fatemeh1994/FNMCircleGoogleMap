//
//  GMSCircle.swift
//  googleMap
//
//  Created by Fatemeh Najafi on 6/9/1400 AP.
//

import GoogleMaps

extension GMSCircle {
    func bounds () -> GMSCoordinateBounds{
        func locationMinMax(_ positive: Bool) -> CLLocationCoordinate2D {
            let sign: Double = positive ? 1: -1
            let dx = sign * self.radius / 6387000 * (180 / .pi)
            let lat = position.latitude + dx
            let lon = position.longitude + dx / cos(position.latitude * .pi / 180)
             return CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
        }
        return GMSCoordinateBounds(coordinate: locationMinMax(true), coordinate: locationMinMax(false))
    }
}
