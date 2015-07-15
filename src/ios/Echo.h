#import <Cordova/CDV.h>

@interface Echo : CDVPlugin

- (void) echo:(CDVInvokedUrlCommand*)command;

- (void) array_object_count:(CDVInvokedUrlCommand*)command;

- (void) repeat_it:(CDVInvokedUrlCommand*)command;

- (void) build_test:(CDVInvokedUrlCommand*)command;

@end
