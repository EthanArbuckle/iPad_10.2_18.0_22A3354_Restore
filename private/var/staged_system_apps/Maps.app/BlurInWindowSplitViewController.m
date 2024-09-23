@implementation BlurInWindowSplitViewController

- (id)_sidebarBlurEffect
{
  return +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1100);
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BlurInWindowSplitViewController;
  -[BlurInWindowSplitViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  -[BlurInWindowSplitViewController primaryColumnWidth](self, "primaryColumnWidth");
  if (v3 != self->_cachedPrimaryColumnWidth)
  {
    -[BlurInWindowSplitViewController primaryColumnWidth](self, "primaryColumnWidth");
    self->_cachedPrimaryColumnWidth = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BlurInWindowSplitViewController delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "_maps_splitViewControllerDidChangePrimaryColumnWidth:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BlurInWindowSplitViewController delegate](self, "delegate"));
      objc_msgSend(v7, "_maps_splitViewControllerDidChangePrimaryColumnWidth:", self);

    }
  }
}

@end
