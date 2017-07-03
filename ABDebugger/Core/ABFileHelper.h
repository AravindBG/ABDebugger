//
//  ABFileHelper.h
//  ABDegugger
//
//  Created by Aravind B on 03/07/17.
//  Copyright © 2017 Aravind B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABFileHelper : NSObject

+ (void)logData:(NSString *)log;
void ABLog (NSString *log);
+ (NSString *)retrieveLogData;
+ (void)removeLogFile;

@end
