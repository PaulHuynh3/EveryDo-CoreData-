//
//  TodoObject+CoreDataProperties.h
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "TodoObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TodoObject (CoreDataProperties)

+ (NSFetchRequest<TodoObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *todoDescription;
@property (nonatomic) int16_t priorityNumber;
@property (nonatomic) BOOL isComplete;

@end

NS_ASSUME_NONNULL_END
