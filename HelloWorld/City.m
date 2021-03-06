//
//  City.m
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "Weather.h"

@implementation City

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer; // Accurate to the nearest km
        self.locationManager.distanceFilter = 500; // metres
        self.geocoder = [[CLGeocoder alloc] init];
    }
    
    return self;
}

- (void)startLocationService {
    
    [self.locationManager startUpdatingLocation];
    
    CFRunLoopRun();
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    
    [self.geocoder reverseGeocodeLocation:location
                    completionHandler:^(NSArray *placemarks, NSError *error) {
         
         if ([placemarks count] > 0) {
             CLPlacemark* placemark = [placemarks objectAtIndex:0];
             
             Weather* weather = [[Weather alloc] init];
             [weather fetchWeatherData:location.coordinate.latitude
                    longitude:location.coordinate.longitude
                     completionHandler:^(AFHTTPRequestOperation *operation, id responseObject) {
                         double currentTemperarture = [weather getCurrentTemp:responseObject];
                         
                         NSLog(@"Hello %@! Right now the temperature here is %1.2f celsius!", placemark.locality, currentTemperarture);
                         
                         CFRunLoopStop(CFRunLoopGetCurrent());
                     }];
         }
     }];
}

@end

