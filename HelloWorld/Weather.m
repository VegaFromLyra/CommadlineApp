//
//  Temperature.m
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "AFNetworking.h"

@implementation Weather

- (void)fetchWeatherData:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    //api.openweathermap.org/data/2.5/weather?lat=35&lon=139
    NSString *const BASE_QUERY_URL = @"http://api.openweathermap.org/data/2.5/weather?lat=%1.2f&lon=%1.2f";
    NSString* query = [NSString stringWithFormat:BASE_QUERY_URL, latitude, longitude];
    NSURL *weatherURL = [NSURL URLWithString:query];
    NSURLRequest *weatherRequest = [NSURLRequest requestWithURL:weatherURL];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:weatherRequest];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,
                                               id responseObject) {
        [self parseResponse:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];
}

- (void)parseResponse:(NSDictionary *)response {

    id value = [response objectForKey:@"main"];
    [self getCurrentTemp:value];
}

- (void)getCurrentTemp:(NSDictionary *)temperatureData {
    
    id currentTemperatureObject = [temperatureData objectForKey:@"temp"];
    
    double tempInCelsius = [currentTemperatureObject doubleValue] - 273.15;
    
    NSLog(@"The current temperature is %1.2f Celsius", tempInCelsius);
    
    CFRunLoopStop(CFRunLoopGetCurrent());
}



@end