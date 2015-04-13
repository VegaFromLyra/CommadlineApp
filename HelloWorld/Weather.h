//
//  Temperature.h
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

@interface Weather: NSObject

@property CGFloat tempCurrent;
@property CGFloat tempMin;
@property CGFloat tempMax;

- (void)fetchWeatherData:(CGFloat)latitude longitude:(CGFloat)longitude;
- (void)parseResponse:(NSDictionary*)response;
- (void)getCurrentTemp:(NSDictionary*)temperatureData;

@end

