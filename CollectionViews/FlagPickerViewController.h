//
//  FlagPickerViewController.h
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flag.h"

@class FlagPickerViewController;

@protocol FlagPickerViewControllerDelegate <NSObject>

-(void)flagPicker:(FlagPickerViewController *)flagPicker didPickFlag:(Flag *)flag;

@end

@interface FlagPickerViewController : UICollectionViewController
{
    @private
    NSArray * africanFlags;
    NSArray * asianFlags;
    NSArray * austrailianFlags;
    NSArray * europeanFlags;
    NSArray * northAmericanFlags;
    NSArray * southAmericanFlags;
}

-(id)initWithDelegate:(id<FlagPickerViewControllerDelegate>)delegate;

@property (weak,nonatomic)id<FlagPickerViewControllerDelegate>delegate;

@end
