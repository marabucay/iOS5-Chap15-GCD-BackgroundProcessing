//
//  main.m
//  State Lab
//
//  Created by Maria Alice C. Lim on 9/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BIDAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        @try{
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BIDAppDelegate class]));
        }@catch (NSException *e) {
            NSLog(@"Catch: %@", e);
            NSLog(@"Stack Trace: %@", [e callStackSymbols]);
        }   
    }
}
