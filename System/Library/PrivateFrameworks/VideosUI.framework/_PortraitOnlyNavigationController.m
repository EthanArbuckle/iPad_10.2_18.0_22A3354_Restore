@implementation _PortraitOnlyNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[_PortraitOnlyNavigationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  objc_msgSend(MEMORY[0x1E0DC69D0], "enablePortraitLock:", v5);
  v7.receiver = self;
  v7.super_class = (Class)_PortraitOnlyNavigationController;
  -[_PortraitOnlyNavigationController viewWillMoveToWindow:](&v7, sel_viewWillMoveToWindow_, v4);

}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DC69D0], "enablePortraitLock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_PortraitOnlyNavigationController;
  -[_PortraitOnlyNavigationController dealloc](&v3, sel_dealloc);
}

@end
