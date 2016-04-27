//
//  GoogleDataProvider.swift
//  JoggingCircuit
//
//  Created by Ryan McCollam on 4/8/15.
//  Copyright (c) 2015 Ryan McCollam. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

@objc class GoogleDataProvider:NSObject {
  
  let apiKey = "AIzaSyD5AKABs_dgz7UyvKtYPYpc8WK3e9MN87A"
  var photoCache = [String:UIImage]()
  var placesTask = NSURLSessionDataTask()
  var session: NSURLSession {
    return NSURLSession.sharedSession()
  }
  
    
  
    func fetchDirectionsFrom(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, completion: UnsafeMutablePointer<String>) -> ()
    {
    let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(from.latitude),\(from.longitude)&destination=\(to.latitude),\(to.longitude)&mode=walking"
    var encodedRoute: String = ""
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
      if let json = (try? NSJSONSerialization.JSONObjectWithData(data!, options:[])) as? [String:AnyObject] {
        if let routes = json["routes"] as AnyObject? as? [AnyObject] {
          if let route = routes.first as? [String : AnyObject] {
            if let polyline = route["overview_polyline"] as AnyObject? as? [String : String] {
              if let points = polyline["points"] as AnyObject? as? String {
                encodedRoute = points
              }
            }
          }
        }
      }
      dispatch_async(dispatch_get_main_queue()) {
        completion.memory = encodedRoute
      }
    }.resume()
  }
  
    func fetchDirectionsFrom2(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> ()
    {
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(from.latitude),\(from.longitude)&destination=\(to.latitude),\(to.longitude)&mode=walking"
        var encodedRoute: String = ""
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let json = (try? NSJSONSerialization.JSONObjectWithData(data!, options:[])) as? [String:AnyObject] {
                if let routes = json["routes"] as AnyObject? as? [AnyObject] {
                    if let route = routes.first as? [String : AnyObject] {
                        if let polyline = route["overview_polyline"] as AnyObject? as? [String : String] {
                            if let points = polyline["points"] as AnyObject? as? String {
                                encodedRoute = points
                            }
                        }
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setObject(encodedRoute, forKey: "encodedRoute")
                
            }
        }.resume()
        
    }

}
