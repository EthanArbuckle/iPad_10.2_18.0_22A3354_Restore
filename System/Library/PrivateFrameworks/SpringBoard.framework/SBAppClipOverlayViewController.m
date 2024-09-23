@implementation SBAppClipOverlayViewController

- (SBAppClipOverlayViewController)initWithCoordinator:(id)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBAppClipOverlayViewController *v12;
  SBAppClipOverlayViewController *v13;
  uint64_t v14;
  NSString *bundleIdentifier;
  uint64_t v16;
  NSString *sceneIdentifier;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *webClipIdentifier;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBAppClipOverlayViewController;
  v12 = -[SBAppClipOverlayViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v14 = objc_msgSend(v10, "copy");
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    sceneIdentifier = v13->_sceneIdentifier;
    v13->_sceneIdentifier = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v13->_bundleIdentifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sceneStoreForIdentifier:creatingIfNecessary:", v13->_sceneIdentifier, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("appClipIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    webClipIdentifier = v13->_webClipIdentifier;
    v13->_webClipIdentifier = (NSString *)v20;

    v13->_displayedOverPlaceholder = 0;
    v13->_sceneActivationState = -1;

  }
  return v13;
}

- (SBAppClipOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayViewController.m"), 61, CFSTR("Use -initWithCoordinator:bundleIdentifier:sceneIdentifier: instead"));

  return -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:](self, "initWithCoordinator:bundleIdentifier:sceneIdentifier:", 0, 0, 0);
}

- (SBAppClipOverlayViewController)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayViewController.m"), 66, CFSTR("Use -initWithCoordinator:bundleIdentifier:sceneIdentifier: instead"));

  return -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:](self, "initWithCoordinator:bundleIdentifier:sceneIdentifier:", 0, 0, 0);
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  _BOOL4 v7;

  if (self->_displayedOverPlaceholder != a3)
  {
    self->_displayedOverPlaceholder = a3;
    if (a3)
    {
      if (self->_webClipIdentifier)
      {
        *(_QWORD *)&a3 = 1;
      }
      else
      {
        v7 = a4;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayViewController.m"), 76, CFSTR("Expected to have a non-nil web clip identifier if we're displaying over a placeholder."));

        *(_QWORD *)&a4 = v7;
        *(_QWORD *)&a3 = self->_displayedOverPlaceholder;
      }
    }
    -[CPSClipOverlayViewController setDisplayedOverPlaceholder:animated:](self->_overlayViewController, "setDisplayedOverPlaceholder:animated:", a3, a4);
  }
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sceneActivationState != a3)
  {
    self->_sceneActivationState = a3;
    -[CPSClipOverlayViewController setSceneActivationState:animated:](self->_overlayViewController, "setSceneActivationState:animated:");
  }
}

- (void)setNeedsUpdate
{
  if (self->_overlayViewController)
    -[CPSClipOverlayViewController setClipNeedsUpdateToLatestVersion](self->_overlayViewController, "setClipNeedsUpdateToLatestVersion");
  else
    self->_needsUpdate = 1;
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppClipOverlayViewController;
  -[SBAppClipOverlayViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  SBAppClipOverlayView *v3;
  SBAppClipOverlayView *v4;

  v3 = [SBAppClipOverlayView alloc];
  v4 = -[SBAppClipOverlayView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBFTouchPassThroughViewController configureTouchPassThroughView:](self, "configureTouchPassThroughView:", v4);
  -[SBAppClipOverlayViewController setView:](self, "setView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  CPSClipOverlayViewController *v4;
  CPSClipOverlayViewController *overlayViewController;
  CPSClipOverlayViewController *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayViewController;
  -[SBAppClipOverlayViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!self->_overlayViewController)
  {
    -[SBAppClipOverlayCoordinator overlayViewControllerForBundleIdentifier:webClipIdentifier:participant:](self->_coordinator, "overlayViewControllerForBundleIdentifier:webClipIdentifier:participant:", self->_bundleIdentifier, self->_webClipIdentifier, self);
    v4 = (CPSClipOverlayViewController *)objc_claimAutoreleasedReturnValue();
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v4;

    v6 = self->_overlayViewController;
    -[SBAppClipOverlayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppClipOverlayViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v6, v7);

    -[CPSClipOverlayViewController setDisplayedOverPlaceholder:animated:](self->_overlayViewController, "setDisplayedOverPlaceholder:animated:", self->_displayedOverPlaceholder, 0);
    -[CPSClipOverlayViewController setSceneActivationState:animated:](self->_overlayViewController, "setSceneActivationState:animated:", self->_sceneActivationState, 0);
    if (self->_needsUpdate)
    {
      -[CPSClipOverlayViewController setClipNeedsUpdateToLatestVersion](self->_overlayViewController, "setClipNeedsUpdateToLatestVersion");
      self->_needsUpdate = 0;
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBAppClipOverlayViewController invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SBAppClipOverlayViewController;
  -[SBAppClipOverlayViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBAppClipOverlayViewController;
  -[SBAppClipOverlayViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SBAppClipOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CPSClipOverlayViewController view](self->_overlayViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (int64_t)preferredStatusBarStyle
{
  return -[CPSClipOverlayViewController preferredStatusBarStyle](self->_overlayViewController, "preferredStatusBarStyle");
}

- (id)participantName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, self->_sceneIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  CPSClipOverlayViewController *overlayViewController;

  if (self->_overlayViewController)
  {
    -[SBAppClipOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    -[SBAppClipOverlayCoordinator participant:didSurrenderViewController:](self->_coordinator, "participant:didSurrenderViewController:", self, self->_overlayViewController);
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = 0;

  }
}

- (NSString)description
{
  void *v3;
  NSString *sceneIdentifier;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayViewController;
  -[SBAppClipOverlayViewController description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sceneIdentifier = self->_sceneIdentifier;
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" sceneIdentifier:%@ displayedOverPlaceholder:%@ sceneActivationState:%ld overlayViewController:%@"), sceneIdentifier, v5, self->_sceneActivationState, self->_overlayViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)webClipIdentifier
{
  return self->_webClipIdentifier;
}

- (void)setWebClipIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_webClipIdentifier, a3);
}

- (SBAppClipOverlayCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (CPSClipOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (void)setOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayViewController, a3);
}

- (BOOL)displayedOverPlaceholder
{
  return self->_displayedOverPlaceholder;
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3
{
  self->_displayedOverPlaceholder = a3;
}

- (int64_t)sceneActivationState
{
  return self->_sceneActivationState;
}

- (void)setSceneActivationState:(int64_t)a3
{
  self->_sceneActivationState = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
