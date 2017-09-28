//
//  DisplayTableViewCell.m
//  Everydo CoreData
//
//  Created by Paul on 2017-09-27.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "DisplayTableViewCell.h"

@interface DisplayTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *isCompleteLabel;


@end


@implementation DisplayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTodoObject:(TodoObject *)todoObject{

    _todoObject = todoObject;
    
    int16_t number = todoObject.priorityNumber;
    NSString *priorityNumber = [NSString stringWithFormat:@"%i",number];
    self.priorityNumberLabel.text = priorityNumber;
    
    self.titleLabel.text = todoObject.title;
    self.descriptionLabel.text = todoObject.todoDescription;
    
    bool complete = self.todoObject.isComplete;
    NSString *boolString = [NSString stringWithFormat:@"%d",complete];
    self.isCompleteLabel.text = boolString;
    
    
}



@end
