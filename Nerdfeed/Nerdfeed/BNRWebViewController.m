//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Marvin Labrador on 10/7/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

- (void) loadView
{
    
    UIWebView *webView = [[UIWebView alloc]init];
    
    webView.scalesPageToFit = YES;
    self.view = webView;
    
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if(_URL){
        
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        NSLog(@"loadRequest: %@", req);
        [(UIWebView *)self.view loadRequest:req];
    }
    
}



@end
