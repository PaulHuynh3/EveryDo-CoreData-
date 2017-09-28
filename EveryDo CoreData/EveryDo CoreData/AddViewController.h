//
//  AddViewController.h
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject+CoreDataClass.h"
#import "AppDelegate.h"

@interface AddViewController : UIViewController

@property(nonatomic)TodoObject *todoObject;
@property (nonatomic,weak) AppDelegate *appDelegate;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;


- (IBAction)saveButton:(UIButton *)sender;

@end
