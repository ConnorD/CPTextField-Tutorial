/*
 * AppController.j
 * CPTextField
 *
 * Created by You on January 12, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPTextField label;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
    
    var textField = [CPTextField textFieldWithStringValue:@"" placeholder:@"CPTextField" width:100];
    [textField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [textField setCenter:CGPointMake([contentView center].x - 150, [contentView center].y)];
    [textField setDelegate:self];
    
    [contentView addSubview:textField];
    
    label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"Hello World!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setCenter:[contentView center]];

    [contentView addSubview:label];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)controlTextDidChange:(CPNotification)aNotification {
    var myTextField = [aNotification object];
    [label setStringValue:[myTextField stringValue]];
}

@end
