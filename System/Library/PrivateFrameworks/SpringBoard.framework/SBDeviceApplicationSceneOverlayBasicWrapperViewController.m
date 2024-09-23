@implementation SBDeviceApplicationSceneOverlayBasicWrapperViewController

- (SBDeviceApplicationSceneOverlayBasicWrapperViewController)initWithContentViewController:(id)a3 rendersWhileLocked:(BOOL)a4 needsCounterRotation:(BOOL)a5
{
  id v9;
  SBDeviceApplicationSceneOverlayBasicWrapperViewController *v10;
  SBDeviceApplicationSceneOverlayBasicWrapperViewController *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  v10 = -[SBDeviceApplicationSceneOverlayBasicWrapperViewController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_rendersWhileLocked = a4;
    objc_storeStrong((id *)&v10->_contentViewController, a3);
    v11->_needsCounterRotation = a5;
  }

  return v11;
}

- (void)loadView
{
  SBDeviceApplicationSceneOverlayBasicWrapperView *v3;
  SBDeviceApplicationSceneOverlayBasicWrapperView *contentWrapperView;

  v3 = -[SBDeviceApplicationSceneOverlayBasicWrapperView initWithCounterRotationRequirement:]([SBDeviceApplicationSceneOverlayBasicWrapperView alloc], "initWithCounterRotationRequirement:", self->_needsCounterRotation);
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v3;

  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController setView:](self, "setView:", self->_contentWrapperView);
}

- (SBDeviceApplicationSceneOverlayView)overlayView
{
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (SBDeviceApplicationSceneOverlayView *)self->_contentWrapperView;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[UIViewController view](self->_contentViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController beginAppearanceTransition:animated:](self->_contentViewController, "beginAppearanceTransition:animated:", 1, v3);
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[SBDeviceApplicationSceneOverlayBasicWrapperView addSubview:](self->_contentWrapperView, "addSubview:", v5);
  -[SBDeviceApplicationSceneOverlayBasicWrapperView bounds](self->_contentWrapperView, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIViewController endAppearanceTransition](self->_contentViewController, "endAppearanceTransition");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[UIViewController beginAppearanceTransition:animated:](self->_contentViewController, "beginAppearanceTransition:animated:", 0, v3);
  -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_contentViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIViewController endAppearanceTransition](self->_contentViewController, "endAppearanceTransition");
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController setView:](self, "setView:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[UIViewController view](self->_contentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneOverlayBasicWrapperView bounds](self->_contentWrapperView, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
