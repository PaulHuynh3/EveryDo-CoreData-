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

@end
