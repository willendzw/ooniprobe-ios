#import <UIKit/UIKit.h>
#import "UIView+Toast.h"
#import "RoundedButton.h"
#import "AppDelegate.h"

@interface ConfigurationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *settingsItems;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet RoundedButton *nextButton;

@end
