@implementation PKPortraitNavigationController

- (BOOL)_canShowWhileLocked
{
  return -[PKPortraitNavigationController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end
