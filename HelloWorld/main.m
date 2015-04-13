//
//  main.m
//  HelloWorld
//
//  Created by Asha Balasubramaniam on 4/10/15.
//  Copyright (c) 2015 Asha Balasubramaniam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        City* city = [[City alloc] init];
        [city startLocationService];
    }
    return 0;
}
