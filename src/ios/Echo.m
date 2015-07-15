#import "Echo.h"
#import <Cordova/CDV.h>

@implementation Echo

- (void) echo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSString* echo = [command.arguments objectAtIndex:0];

        if (echo != nil && [echo length] > 0) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
            javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            javaScript = [pluginResult toErrorCallbackString:command.callbackId];
        }
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

- (void) array_object_count:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSUInteger c = [command.arguments count];
        NSMutableArray * r = [NSMutableArray arrayWithCapacity:0];
        NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:0];
        [d setObject:[NSNumber numberWithInt:c] forKey: @"count"];
        [r addObject:d];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:r];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

- (void) repeat_it:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSObject * o = [command.arguments objectAtIndex:0];
        NSMutableDictionary * d = [command.arguments objectAtIndex:1];
        int count = [[d valueForKey:@"count"] integerValue];

        NSMutableArray * r = [NSMutableArray arrayWithCapacity:0];
        for (int i=0; i < count; ++i) [r addObject:o];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:r];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

- (void) build_test:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSMutableDictionary * arg = [command.arguments objectAtIndex:0];
        int count = [[arg valueForKey:@"count"] integerValue];

        NSMutableArray * r = [NSMutableArray arrayWithCapacity:0];
        for (int i=0; i < count; ++i) {
            NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:0];
            [d setObject:@"v1" forKey: @"p1"];
            [d setObject:[NSNumber numberWithInt:2] forKey: @"p2"];
            [d setObject:[NSNumber numberWithInt:i] forKey: @"p3"];
            [r addObject:d];
        }

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:r];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

@end
