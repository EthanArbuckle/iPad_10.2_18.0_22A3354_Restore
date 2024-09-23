@implementation NavigationDebugSplitViewController

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugSplitViewController shouldHideStatusBar](self, "shouldHideStatusBar"));

  if (v3)
  {
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[NavigationDebugSplitViewController shouldHideStatusBar](self, "shouldHideStatusBar"));
    v5 = v4[2]();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NavigationDebugSplitViewController;
    return -[NavigationDebugSplitViewController prefersStatusBarHidden](&v7, "prefersStatusBarHidden");
  }
}

- (id)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldHideStatusBar, 0);
}

@end
