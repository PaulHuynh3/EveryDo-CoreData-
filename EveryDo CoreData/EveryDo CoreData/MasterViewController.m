//
//  MasterViewController.m
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "MasterViewController.h"
#import "TodoObject+CoreDataClass.h"
#import "AppDelegate.h"
#import "DisplayTableViewCell.h"
#import "AddViewController.h"


@interface MasterViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <TodoObject*> *todoObjectArray;
@property (weak,nonatomic) AppDelegate* appDelegate;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MasterViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.appDelegate = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    self.managedObjectContext = self.appDelegate.persistentContainer.viewContext;
    [self fetchData];

    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(fetchData) name:NSManagedObjectContextDidSaveNotification object:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.todoObjectArray.count;

}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DisplayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.todoObject = self.todoObjectArray[indexPath.row];
    
    return cell;
}



#pragma mark - Prepare for Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqual:@"addTodoSegue"]){
        AddViewController *addViewController = segue.destinationViewController;
        //set the view's appdelegate property equal to the addview controller's property
        
        addViewController.appDelegate = self.appDelegate;
        addViewController.managedObjectContext = self.managedObjectContext;
        
    }
    

}




#pragma mark - Core Data

- (void)fetchData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TodoObject"];
    NSArray <TodoObject *> *todo = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSSortDescriptor *titleDesc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    request.sortDescriptors = @[titleDesc];
    self.todoObjectArray = todo;
    [self.tableView reloadData];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}


@end
