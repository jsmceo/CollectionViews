//
//  FlagPickerViewController.m
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import "FlagPickerViewController.h"
#import "FlagCell.h"
#import "ContinentHeader.h"


@interface FlagPickerViewController ()

@end

@implementation FlagPickerViewController

-(id)initWithDelegate:(id<FlagPickerViewControllerDelegate>)delegate
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        self.delegate = delegate;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    africanFlags = [NSArray arrayWithObjects:
                    [[Flag alloc] initWithName:@"Ghana" imageName:@"Ghana"],
                    [[Flag alloc] initWithName:@"Kenya" imageName:@"Kenya"],
                    [[Flag alloc] initWithName:@"Morocco" imageName:@"Morocco"],
                    [[Flag alloc] initWithName:@"Mozambique" imageName:@"Mozambique"],
                    [[Flag alloc] initWithName:@"Rwanda" imageName:@"Rwanda"],
                    [[Flag alloc] initWithName:@"South Africa" imageName:@"South Africa"]
                    , nil];
    
    asianFlags = [NSArray arrayWithObjects:
                  [[Flag alloc] initWithName:@"China" imageName:@"China"],
                  [[Flag alloc] initWithName:@"India" imageName:@"India"],
                  [[Flag alloc] initWithName:@"Japan" imageName:@"Japan"],
                  [[Flag alloc] initWithName:@"Mongolia" imageName:@"Mongolia"],
                  [[Flag alloc] initWithName:@"Russia" imageName:@"Russia"],
                  [[Flag alloc] initWithName:@"Turkey" imageName:@"Turkey"]
                  , nil];
    
    austrailianFlags = [NSArray arrayWithObjects:
                        [[Flag alloc] initWithName:@"Austrailia" imageName:@"Austrailia"],
                        [[Flag alloc] initWithName:@"New Zeland" imageName:@"New Zeland"],
                         nil];
    
    europeanFlags = [NSArray arrayWithObjects:
                     [[Flag alloc] initWithName:@"France" imageName:@"France"],
                     [[Flag alloc] initWithName:@"Germany" imageName:@"Germany"],
                     [[Flag alloc] initWithName:@"Iceland" imageName:@"Iceland"],
                     [[Flag alloc] initWithName:@"Ireland" imageName:@"Ireland"],
                     [[Flag alloc] initWithName:@"Italy" imageName:@"Italy"],
                     [[Flag alloc] initWithName:@"Poland" imageName:@"Poland"],
                     [[Flag alloc] initWithName:@"Russia" imageName:@"Russica"],
                     [[Flag alloc] initWithName:@"Spain" imageName:@"Spain"],
                     [[Flag alloc] initWithName:@"Sweden" imageName:@"Sweden"],
                     [[Flag alloc] initWithName:@"Turkey" imageName:@"Turkey"],
                     [[Flag alloc] initWithName:@"United_Kingdom" imageName:@"United_Kingdom"]
                     , nil];
    
    northAmericanFlags = [NSArray arrayWithObjects:
                          [[Flag alloc] initWithName:@"Canada" imageName:@"Canada"],
                          [[Flag alloc] initWithName:@"Mexico" imageName:@"Mexico"],
                          [[Flag alloc] initWithName:@"United_States" imageName:@"United_States"]
                          , nil];
    
    southAmericanFlags = [NSArray arrayWithObjects:
                          [[Flag alloc] initWithName:@"Argentina" imageName:@"Argentina"],
                          [[Flag alloc] initWithName:@"Brazil" imageName:@"Brazil"],
                          [[Flag alloc] initWithName:@"Chile" imageName:@"Chile"]
                          , nil];
    
    [self.collectionView registerClass:FlagCell.class forCellWithReuseIdentifier:@"FlagCell"];
    [self.collectionView registerClass:ContinentHeader.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ContinentHeader"];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return africanFlags.count;
            case 1:
            return asianFlags.count;
            case 2:
            return austrailianFlags.count;
            case 3:
            return europeanFlags.count;
            case 4:
            return northAmericanFlags.count;
            case 5:
            return southAmericanFlags.count;
            break;
            
        default:
           return 0;
            //NOTE: we did not explicitly assign a datasource delegate for the collection view. The collection view controller class handles this automatically. if you don't provide a specific delegate object, it will assign itself to the task. This is true for both the UICollectionViewDelegate and the UICollectionViewDataSource properties of the colletion view.
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlagCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlagCell" forIndexPath:indexPath];
    Flag * flag = [self flagForIndexPath:indexPath];
    cell.nameLabel.text = flag.name;
    cell.flagImageView.image = flag.image;
    return cell;
}

-(Flag *)flagForIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return [africanFlags objectAtIndex:indexPath.row];
            case 1:
            return [asianFlags objectAtIndex:indexPath.row];
            case 2:
            return [austrailianFlags objectAtIndex:indexPath.row];
            case 3:
            return [europeanFlags objectAtIndex:indexPath.row];
            case 4:
            return [northAmericanFlags objectAtIndex:indexPath.row];
            case 5:
            return [southAmericanFlags objectAtIndex:indexPath.row];
            break;
            
        default:
            return nil;
    }
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ContinentHeader * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ContinentHeader" forIndexPath:indexPath];
    
    headerView.label.text = [self nameForSection:indexPath.section];
    
    return headerView;
}

-(NSString *)nameForSection:(NSInteger)index
{
    switch (index)
    {
        case 0:
            return @"African Flags";
            case 1:
            return @"Asian Flags";
            case 2:
            return @"Australian Flags";
            case 3:
            return @"European Flags";
            case 4:
            return @"North American Flags";
            case 5:
            return @"South American Flags";
            
            
        default:
            return @"Unknown";
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 75);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(50, 50);
    
    //when you set the size of a header or footer in a collection view flow layout, only one dimension is considered. Example: if the flow is vertical, on the height component of the CGSize is used to determine the actual size of the supplementary view. The width is instead inferred by the width of the collection view. the converse is true for horizontal flows, which only consider the width you provide
}


-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Flag * selectedFlag = [self flagForIndexPath:indexPath];
    [self.delegate flagPicker:self didPickFlag:selectedFlag];
}



@end
