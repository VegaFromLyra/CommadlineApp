//
//  Temperature.m
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//


#import "Weather.h"


@implementation Weather

- (void)fetchWeatherData:(CGFloat)latitude longitude:(CGFloat)longitude completionHandler:(weatherCompletionHandler)completionHandler {
    
    //api.openweathermap.org/data/2.5/weather?lat=35&lon=139
    NSString *const BASE_QUERY_URL = @"http://api.openweathermap.org/data/2.5/weather?lat=%1.2f&lon=%1.2f";
    NSString* query = [NSString stringWithFormat:BASE_QUERY_URL, latitude, longitude];
    NSURL *weatherURL = [NSURL URLWithString:query];
    NSURLRequest *weatherRequest = [NSURLRequest requestWithURL:weatherURL];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:weatherRequest];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];

    [operation setCompletionBlockWithSuccess:completionHandler
                                     failure: ^(AFHTTPRequestOperation *operation, NSError *error){
                                         NSLog(@"Error: %@", error);
                                         CFRunLoopStop(CFRunLoopGetCurrent());
                                     }];

    [[NSOperationQueue mainQueue] addOperation:operation];
}


- (double)getCurrentTemp:(NSDictionary *)response {
    
    id temperatureData = [response objectForKey:@"main"];
    
    id currentTemperatureObject = [temperatureData objectForKey:@"temp"];
    
    return [currentTemperatureObject doubleValue] - 273.15;
}


@end