@implementation CHTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setCustomizableViewControllers:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHTabBarController;
  -[CHTabBarController setCustomizableViewControllers:](&v3, "setCustomizableViewControllers:", 0);
}

@end
