#import "WebsiteCategoryTableViewController.h"

@interface WebsiteCategoryTableViewController ()

@end

@implementation WebsiteCategoryTableViewController
@synthesize category;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(category, nil);
    categories_enabled = [SettingsUtility getSitesCategoriesEnabled];
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return NSLocalizedString(@"some_inro_text", nil);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = NSLocalizedString(category, nil);
    cell.imageView.image = [UIImage imageNamed:category];
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchview addTarget:self action:@selector(setSwitch:) forControlEvents:UIControlEventValueChanged];
    if ([categories_enabled containsObject:category]) switchview.on = YES;
    else switchview.on = NO;
    cell.accessoryView = switchview;
    return cell;
}

-(IBAction)setSwitch:(UISwitch *)mySwitch{
    UITableViewCell *cell = (UITableViewCell *)mySwitch.superview;
    NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
    [SettingsUtility addRemoveSitesCategory:category];
}

@end
