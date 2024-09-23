@implementation MailDetailNavigationController

- (MailDetailNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  MailDetailNavigationController *v5;
  MailDetailNavigationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailDetailNavigationController;
  v5 = -[MailDetailNavigationController initWithRootViewController:](&v8, "initWithRootViewController:", v4);
  v6 = v5;
  if (v5)
    -[MailDetailNavigationController _commonInit](v5, "_commonInit");

  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
    self->_ancestorSplitViewControllerDisplayMode = 0;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;

  -[MailDetailNavigationController setDelegate:](self, "setDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

  -[MailDetailNavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
  self->_ancestorSplitViewControllerDisplayMode = 0;
}

- (MailDetailNavigationController)init
{
  MailDetailNavigationController *v2;
  MailDetailNavigationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailDetailNavigationController;
  v2 = -[MailDetailNavigationController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MailDetailNavigationController _commonInit](v2, "_commonInit");
  return v3;
}

- (MailDetailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  MailDetailNavigationController *v4;
  MailDetailNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailDetailNavigationController;
  v4 = -[MailDetailNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
  v5 = v4;
  if (v4)
    -[MailDetailNavigationController _commonInit](v4, "_commonInit");
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailDetailNavigationController;
  -[MailDetailNavigationController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MailDetailNavigationController _updateBarHidingEnabled](self, "_updateBarHidingEnabled");

}

- (void)_updateBarHidingEnabled
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController topViewController](self, "topViewController"));
  -[MailDetailNavigationController setHidesBarsOnSwipe:](self, "setHidesBarsOnSwipe:", objc_msgSend(v3, "wantsBarHidingWhenVerticallyCompact") & -[MailDetailNavigationController _shouldHideBarsInCurrentLayout](self, "_shouldHideBarsInCurrentLayout"));

}

- (BOOL)_shouldHideBarsInCurrentLayout
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "verticalSizeClass") == (id)1;

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MailDetailNavigationController;
  -[MailDetailNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController splitViewController](self, "splitViewController"));
  self->_ancestorSplitViewControllerDisplayMode = (int64_t)objc_msgSend(v8, "displayMode");

}

- (id)conversationViewController
{
  return -[MailDetailNavigationController mf_viewControllerOfClass:startFromTopOfStack:](self, "mf_viewControllerOfClass:startFromTopOfStack:", objc_opt_class(ConversationViewController), 0);
}

- (int64_t)ancestorSplitViewControllerDisplayMode
{
  id ancestorSplitViewControllerDisplayMode;
  void *v3;

  ancestorSplitViewControllerDisplayMode = (id)self->_ancestorSplitViewControllerDisplayMode;
  if (!ancestorSplitViewControllerDisplayMode)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController splitViewController](self, "splitViewController"));
    ancestorSplitViewControllerDisplayMode = objc_msgSend(v3, "displayMode");

  }
  return (int64_t)ancestorSplitViewControllerDisplayMode;
}

- (BOOL)containsTransferStackViewController
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = -[MailDetailNavigationController mf_viewControllerOfClass:startFromTopOfStack:](self, "mf_viewControllerOfClass:startFromTopOfStack:", objc_opt_class(MFTransferStackViewController), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3 != 0;

  return v4;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a5;
  v6 = a3;
  if (objc_msgSend(v6, "isNavigationBarHidden"))
    objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, v5);

}

@end
