//
//  Temperature.h
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface Weather: NSObject

@property CGFloat tempCurrent;
@property CGFloat tempMin;
@property CGFloat tempMax;

typedef void (^weatherCompletionHandler)(AFHTTPRequestOperation *operation, id responseObject);

- (void)fetchWeatherData:(CGFloat)latitude
               longitude:(CGFloat)longitude
               completionHandler: (weatherCompletionHandler)completionHandler;
- (double)getCurrentTemp:(NSDictionary*)response;

@end