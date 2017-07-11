

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgVw;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actindVw;

@end

@implementation ViewController

NSString * urlStrng;
NSURL * url;

- (void)viewDidLoad {
    [super viewDidLoad];
    urlStrng = @"https://wpnature.com/wp-content/uploads/2017/02/beach-hanalei-bay-kaua-hawaii-ocean-lagoon-sand-escape-pool-polynesia-kauai-fantasy-holiday-tropical-honeymoon-sea-animated-wallpaper-windows-7.jpg";
    url = [[NSURL alloc]initWithString:urlStrng];
 //   [_actindVw startAnimating];
  //  [_actindVw setHidden:true];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)downloadBtnTapped:(id)sender {
//self.imgVw.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
       //     dispatch_async(dispatch_get_main_queue(), ^{

      //      });
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{                self.imgVw.image = [UIImage imageWithData:data];

        }];
    };
    }] resume];

}


@end
