//
//  ViewController.h
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlagPickerViewController.h"

@interface ViewController : UIViewController <FlagPickerViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

- (IBAction)pickFlag:(id)sender;


@end
