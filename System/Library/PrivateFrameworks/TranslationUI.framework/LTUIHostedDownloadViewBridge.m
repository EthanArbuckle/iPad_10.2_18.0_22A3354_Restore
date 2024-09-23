@implementation LTUIHostedDownloadViewBridge

+ (UIViewController)viewController
{
  return (UIViewController *)sub_1D2CE9178((uint64_t)a1, (uint64_t)a2, 0);
}

+ (UIViewController)accessibilityViewController
{
  return (UIViewController *)sub_1D2CE9178((uint64_t)a1, (uint64_t)a2, 1);
}

- (LTUIHostedDownloadViewBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HostedDownloadViewBridge();
  return -[LTUIHostedDownloadViewBridge init](&v3, sel_init);
}

@end
