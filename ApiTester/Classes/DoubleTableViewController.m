//
//  Created by lillialexis on 10/21/11.
//
// To change the template use AppCode | Preferences | File Templates.
//

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import <UIKit/UIKit.h>
#import "DoubleTableViewController.h"
#import "ConfigurationData.h"

@implementation DoubleTableViewController
@synthesize rootViewController;
@synthesize testTypesViewController;
@synthesize topView;
@synthesize leftView;
@synthesize rightView;

- (void)addHeader
{
    UIView *backgroundView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 70)] autorelease];
    backgroundView.backgroundColor = JANRAIN_BLUE_20;

    UILabel *headerLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 748, 56)] autorelease];
    headerLabel.font = [UIFont boldSystemFontOfSize:18.0];
    headerLabel.textColor = [UIColor darkGrayColor];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.numberOfLines = 1;
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.text = @"Welcome to the Janrain Engage for iOS Test Harness app.";

    UIImageView *headerDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]] autorelease];
    headerDivider.frame = CGRectMake(0, 56, 768, 14);

    [topView addSubview:backgroundView];
    [topView addSubview:headerLabel];
    [topView addSubview:headerDivider];
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
    }

    return self;
}

- (void)viewDidLoad
{
    DLog(@"");

    [super viewDidLoad];
    config = [ConfigurationData sharedConfigurationData];

//    rootViewController      = [[RootViewController alloc]
//                                    initWithNibName:@"RootViewController" bundle:nil];
//    testTypesViewController = [[TestTypesViewController alloc]
//                                    initWithNibName:@"TestTypesViewController" bundle:nil];

    [self addHeader];

    rootViewController.delegate      = self;
    testTypesViewController.delegate = self;

    [leftView  addSubview:rootViewController.view];
    [rightView addSubview:testTypesViewController.view];

    titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 380, 44)] autorelease];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];

    titleLabel.text = @"Sign In or Sharing?";

    self.navigationItem.titleView = titleLabel;
    self.title = @"Select the Test Type";
}

- (void)testTypesViewController:(TestTypesViewController*)testTypes tableView:(UITableView *)tableView didSelectViewController:(UIViewController*)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)rootViewController:(RootViewController*)viewController tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (config.signInOrSharing == CDSignIn)
        titleLabel.text = @"Please Select the Sign-In Test";
    else if (config.signInOrSharing == CDSharing)
        titleLabel.text = @"Please Select the Sign-In Test";
    else
        titleLabel.text = @"Sign In or Sharing?";

    [testTypesViewController.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"YO!!!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{
    [rootViewController release];
    [testTypesViewController release];

    [topView release];
    [leftView release];
    [rightView release];

    [super dealloc];
}
@end
