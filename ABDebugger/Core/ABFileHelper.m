//
//  ABFileHelper.m
//  ABDegugger
//
//  Created by Aravind B on 03/07/17.
//  Copyright © 2017 Aravind B. All rights reserved.
//

#import "ABFileHelper.h"

#define DEBUGDATAFILE @"/ABDebugData.txt"

@implementation ABFileHelper

//+ (instancetype)sharedInstance {
//    
//    static ABFileHelper *helper = nil;
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        helper = [[ABFileHelper alloc] init];
//    });
//    
//    return helper;
//}


+ (NSString *)debugFilePath {
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:DEBUGDATAFILE];
    return filePath;
}

// Write logs in string format

void ABLog (NSString *log) {
    // Append date in log
    [ABFileHelper createFileIfDontExist];
    NSString *dateLog = [NSString stringWithFormat:@"\n%@: %@",[NSDate date], log];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[ABFileHelper debugFilePath]];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[dateLog dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
}

+ (void)logData:(NSString *)log {
    
    // Append date in log
    [ABFileHelper createFileIfDontExist];
    NSString *dateLog = [NSString stringWithFormat:@"\n%@: %@",[NSDate date], log];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[ABFileHelper debugFilePath]];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[dateLog dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
}

+ (void)createFileIfDontExist {
    
    NSError *error = nil;
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[ABFileHelper debugFilePath]];
    
    if (!fileExists) {
        [@"" writeToFile:[ABFileHelper debugFilePath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
}

//Retrieve logs in string

+ (NSString *)retrieveLogData {
    
    NSError *error = nil;
    NSString *logs = [NSString stringWithContentsOfFile:[ABFileHelper debugFilePath] encoding:NSUTF8StringEncoding error:&error];
    return logs;
}

// Delete logs

+ (void)removeLogFile {
    
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[ABFileHelper debugFilePath] error:&error];
}

@end
