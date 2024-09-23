@implementation BSUIFeedNavigationController

- (BSUIFeedNavigationController)initWithOptions:(id)a3
{
  BSUIFeedNavigationController *v3;
  BSUIFeedNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIFeedNavigationController;
  v3 = -[BSUINavigationController initWithOptions:](&v6, "initWithOptions:", a3);
  v4 = v3;
  if (v3)
    -[BSUIFeedNavigationController setDefinesPresentationContext:](v3, "setDefinesPresentationContext:", 1);
  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController topViewController](self, "topViewController"));
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return (int64_t)v3;
}

- (BOOL)_shouldUseBuiltinInteractionController
{
  return 1;
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v7 = -[BSUIFeedNavigationController isNavigationBarHidden](self, "isNavigationBarHidden");
  -[BSUIFeedNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 0, 0);
  v8.receiver = self;
  v8.super_class = (Class)BSUIFeedNavigationController;
  -[BSUIFeedNavigationController attachPalette:isPinned:](&v8, "attachPalette:isPinned:", v6, v4);

  -[BSUIFeedNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", v7, 0);
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  id v3;
  BSUIFeedNavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BSUIFeedNavigationController;
  v3 = -[BSUIFeedNavigationController bc_ancestorOverrideCardPresentingViewController](&v12, "bc_ancestorOverrideCardPresentingViewController");
  v4 = (BSUIFeedNavigationController *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v4 = self;
    v6 = objc_opt_class(UISearchController, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController bc_childPresentedViewController](v4, "bc_childPresentedViewController"));
    v8 = BUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController bc_childPresentedViewController](v4, "bc_childPresentedViewController"));

      v4 = (BSUIFeedNavigationController *)v10;
    }
  }
  return v4;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUIFeedNavigationController;
  -[BSUIFeedNavigationController didShowViewController:animated:](&v5, "didShowViewController:animated:", a3, a4);
  -[BSUIFeedNavigationController notifyFeedDidBecomeCurrent](self, "notifyFeedDidBecomeCurrent");
}

- (void)notifyFeedDidBecomeCurrent
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController currentFeedViewController](self, "currentFeedViewController"));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "didBecomeCurrentFeed");
    v2 = v3;
  }

}

- (BSUIFeedViewController)currentFeedViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BSUIFeedViewController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController topViewController](self, "topViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (BSUIFeedViewController *)v6;
}

- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v10;

  v5 = a4;
  self->_isCoveredByCardStack = 1;
  v8 = a5;
  v9 = a3;
  -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
  v10.receiver = self;
  v10.super_class = (Class)BSUIFeedNavigationController;
  -[BSUIFeedNavigationController bc_presentCardViewController:animated:completion:](&v10, "bc_presentCardViewController:animated:completion:", v9, v5, v8);

}

- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v10;

  v5 = a4;
  self->_isCoveredByCardStack = 0;
  v8 = a5;
  v9 = a3;
  -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
  v10.receiver = self;
  v10.super_class = (Class)BSUIFeedNavigationController;
  -[BSUIFeedNavigationController bc_dismissCardViewController:animated:completion:](&v10, "bc_dismissCardViewController:animated:completion:", v9, v5, v8);

}

- (int64_t)_topFeedLiveResizeOptions
{
  if (-[BSUIFeedNavigationController isCoveredByCardStack](self, "isCoveredByCardStack"))
    return 2;
  else
    return 0;
}

- (BOOL)isCoveredByCardStack
{
  return self->_isCoveredByCardStack;
}

- (void)setIsCoveredByCardStack:(BOOL)a3
{
  self->_isCoveredByCardStack = a3;
}

@end
