//
//  BNRCoursesViewController.m
//  Nerdfeed
//
//  Created by Marvin Labrador on 10/3/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"


@interface BNRCoursesViewController () <NSURLSessionDelegate>
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;
@end


@implementation BNRCoursesViewController

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath ];
    
    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];
    
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    
    return self;
}

- (void)fetchFeed
{
//    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
//    NSURL *url = [NSURL URLWithString:requestString];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:
                         [NSURL URLWithString:
                          @"http://bookapi.bignerdranch.com/private/courses.json"]];
    
    NSURLSessionDataTask *dataTask =
                    [self.session dataTaskWithRequest:req
                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                         NSString *json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//                         NSLog(@"%@",json);
                         
                         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:0
                                                                                      error:nil];
//                         NSLog(@"%@", jsonObject);
                         
                         self.courses = jsonObject[@"courses"];
                         NSLog(@"%@",self.courses);
                         
                         
                         dispatch_async(dispatch_get_main_queue(), ^{
                             [self.tableView reloadData];
                         });
                         
                     }];
    [dataTask resume];
    
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *course = self.courses[indexPath.row];
    NSURL *URL = [NSURL URLWithString:course[@"url"]];
    
    self.webViewController.title = course[@"title"];
    self.webViewController.URL = URL;
    if (!self.splitViewController) {
        [self.navigationController pushViewController:self.webViewController
                                             animated:YES];
         }
}

-(void) URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *cred =
    [NSURLCredential credentialWithUser:@"BigNerdRanch"
                               password:@"AchieveNerdvana"
                            persistence:NSURLCredentialPersistenceForSession];
    
    completionHandler(NSURLSessionAuthChallengeUseCredential, cred);
    
}

@end
