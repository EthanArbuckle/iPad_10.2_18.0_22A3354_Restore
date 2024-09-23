@implementation SBSStatusBarStyleOverridesCoordinator

- (void)setRegisteredStyleOverrides:(unint64_t)a3 reply:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSStatusBarStyleOverridesCoordinator;
  -[SBSBackgroundActivityCoordinator setRegisteredStyleOverrides:reply:](&v4, sel_setRegisteredStyleOverrides_reply_, a3, a4);
}

- (unint64_t)styleOverrides
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSStatusBarStyleOverridesCoordinator;
  return -[SBSBackgroundActivityCoordinator styleOverrides](&v3, sel_styleOverrides);
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSStatusBarStyleOverridesCoordinator;
  -[SBSBackgroundActivityCoordinator setDelegate:](&v3, sel_setDelegate_, a3);
}

- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSStatusBarStyleOverridesCoordinator;
  -[SBSBackgroundActivityCoordinator delegate](&v3, sel_delegate);
  return (SBSStatusBarStyleOverridesCoordinatorDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

@end
