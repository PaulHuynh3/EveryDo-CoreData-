//
//  TodoObject+CoreDataProperties.m
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "TodoObject+CoreDataProperties.h"

@implementation TodoObject (CoreDataProperties)

+ (NSFetchRequest<TodoObject *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TodoObject"];
}

@dynamic title;
@dynamic todoDescription;
@dynamic priorityNumber;
@dynamic isComplete;

@end
