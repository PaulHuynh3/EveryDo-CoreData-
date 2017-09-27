//
//  AppDelegate.m
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "AppDelegate.h"
#import "TodoObject+CoreDataClass.h"

@interface AppDelegate ()

@property (nonatomic,strong) NSManagedObjectContext * managedObjectContext;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //setting the managedObjectContext as the persistentContainer
    self.managedObjectContext = self.persistentContainer.viewContext;
//    [self createTodos];
//    [self fetchPersons];
    
    return YES;
}



//this is just a test dont need this.
#pragma mark Create todoObjects

-(void)createTodos{

    TodoObject *objectOne = [[TodoObject alloc]initWithContext:self.managedObjectContext];
    objectOne.title = @"Graduate";
    objectOne.priorityNumber = 1;
    objectOne.todoDescription = @"Graduate from LighthouseLabs";
    objectOne.isComplete = YES;
    
    [self saveContext];
}

#pragma mark display my object creations on nslog

- (void)fetchPersons {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TodoObject"];
    NSArray <TodoObject *>*object = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self printEntities:object];
}


- (void)printEntities:(NSArray<TodoObject *>*)entities {
    for (TodoObject *object in entities) {
        NSLog(@"%@ %@ %@ ", object.title, @(object.priorityNumber), object.todoDescription);
    }
}






#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Everydo_CoreData"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}




#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}




@end
