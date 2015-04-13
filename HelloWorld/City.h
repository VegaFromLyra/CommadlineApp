//
//  City.h
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface City : NSObject<CLLocationManagerDelegate>

@property CLLocationManager* locationManager;
@property CLGeocoder* geocoder;

- (void)startLocationService;
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
@end