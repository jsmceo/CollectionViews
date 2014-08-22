//
//  ViewController.m
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickFlag:(id)sender
{
    UICollectionViewController * flagPicker = [[FlagPickerViewController alloc] initWithDelegate:self];
    
    [self presentViewController:flagPicker animated:YES completion:NULL];
}


-(void)flagPicker:(FlagPickerViewController *)flagPicker didPickFlag:(Flag *)flag
{
    self.flagImageView.image = flag.image;
    self.countryLabel.text = flag.name;
    [self dismissViewControllerAnimated:YES completion:NULL];
}




@end
