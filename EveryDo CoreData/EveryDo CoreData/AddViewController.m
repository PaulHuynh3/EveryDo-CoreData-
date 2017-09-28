//
//  AddViewController.m
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *priorityNumberTextfield;

@property (weak, nonatomic) IBOutlet UITextField *titleTextfield;


@property (weak, nonatomic) IBOutlet UITextField *descriptionTextfield;

@property (weak, nonatomic) IBOutlet UITextField *completeTextfield;



@end

@implementation AddViewController

-(void)viewDidLoad{
    [super viewDidLoad];

}

- (IBAction)saveButton:(UIButton *)sender {
    int16_t priorityNumber = [self.priorityNumberTextfield.text intValue];
    NSString *title = self.titleTextfield.text;
    NSString *description = self.descriptionTextfield.text;
    TodoObject *todoObject = [[TodoObject alloc]initWithContext:self.managedObjectContext];
    todoObject.priorityNumber = priorityNumber;
    todoObject.title = title;
    todoObject.todoDescription = description;
    
    [self.appDelegate saveContext];
    
    //if you use push use this version
    [self.navigationController popViewControllerAnimated:YES];
    
    
    //if you use modal use this it doesnt pair.
//  [self dismissViewControllerAnimated:true completion:nil];
    
    
}
@end
