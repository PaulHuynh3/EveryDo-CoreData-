//
//  DisplayTableViewCell.h
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject+CoreDataClass.h"

@interface DisplayTableViewCell : UITableViewCell

@property (nonatomic) TodoObject *todoObject;



@end
