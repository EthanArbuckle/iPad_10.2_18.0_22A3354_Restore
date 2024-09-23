@implementation SiriUINavigationController

- (SiriUINavigationController)initWithRootViewController:(id)a3
{
  SiriUINavigationController *v3;
  SiriUINavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUINavigationController;
  v3 = -[SiriUINavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
    -[SiriUINavigationController _sharedInit](v3, "_sharedInit");
  return v4;
}

- (SiriUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  SiriUINavigationController *v4;
  SiriUINavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  v4 = -[SiriUINavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
  v5 = v4;
  if (v4)
    -[SiriUINavigationController _sharedInit](v4, "_sharedInit");
  return v5;
}

- (SiriUINavigationController)initWithCoder:(id)a3
{
  SiriUINavigationController *v3;
  SiriUINavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUINavigationController;
  v3 = -[SiriUINavigationController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SiriUINavigationController _sharedInit](v3, "_sharedInit");
  return v4;
}

- (SiriUINavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  SiriUINavigationController *v4;
  SiriUINavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  v4 = -[SiriUINavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SiriUINavigationController _sharedInit](v4, "_sharedInit");
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUINavigationController;
  -[SiriUINavigationController viewDidLoad](&v5, sel_viewDidLoad);
  -[SiriUINavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

  -[SiriUINavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriui_customizeAppearance");

  -[SiriUINavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", !self->_supportsSAE);
}

- (id)delegate
{
  void *v2;
  void *v3;

  -[SiriUINavigationController _delegateAdapter](self, "_delegateAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SiriUINavigationController _delegateAdapter](self, "_delegateAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  -[SiriUINavigationController setDelegate:](&v7, sel_setDelegate_, v5);

  -[SiriUINavigationController _delegateAdapter](self, "_delegateAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExternalDelegate:", v4);

}

- (SiriUINavigationTransitioning)transitionController
{
  void *v2;
  void *v3;

  -[SiriUINavigationController _delegateAdapter](self, "_delegateAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SiriUINavigationTransitioning *)v3;
}

- (void)setTransitionController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SiriUINavigationController transitionController](self, "transitionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "configureWithNavigationController:", self);
    -[SiriUINavigationController _delegateAdapter](self, "_delegateAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTransitionController:", v6);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[SiriUINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_supportsSAE)
  {
    -[SiriUINavigationController viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "count") > 2;

  }
  else
  {
    v7 = v5 == v4;
  }

  return v7;
}

- (void)_sharedInit
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SiriUINavigationController setDelegate:](self, "setDelegate:", 0);
  v3 = AFDeviceSupportsSystemAssistantExperience();
  self->_supportsSAE = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUINavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

  }
  -[SiriUINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[SiriUINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:", self, sel__handleGestureFromRecognizer_);

}

- (_SiriUINavigationControllerDelegateAdapter)_delegateAdapter
{
  _SiriUINavigationControllerDelegateAdapter *delegateAdapter;
  _SiriUINavigationControllerDelegateAdapter *v4;
  _SiriUINavigationControllerDelegateAdapter *v5;

  delegateAdapter = self->_delegateAdapter;
  if (!delegateAdapter)
  {
    v4 = objc_alloc_init(_SiriUINavigationControllerDelegateAdapter);
    v5 = self->_delegateAdapter;
    self->_delegateAdapter = v4;

    delegateAdapter = self->_delegateAdapter;
  }
  return delegateAdapter;
}

- (void)_handleGestureFromRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "state") == 1)
  {
    -[SiriUINavigationController transitionController](self, "transitionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setOperation:", 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SiriUINavigationController transitionCoordinator](self, "transitionCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coordinateAdditionalTransitionsWithTransitionCoordinator:", v5);

    }
  }

}

- (BOOL)popToRootViewController
{
  return self->_popToRootViewController;
}

- (void)setPopToRootViewController:(BOOL)a3
{
  self->_popToRootViewController = a3;
}

- (UIView)animatingBackgroundView
{
  return self->_animatingBackgroundView;
}

- (void)setAnimatingBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_animatingBackgroundView, a3);
}

- (void)_setDelegateAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_delegateAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateAdapter, 0);
  objc_storeStrong((id *)&self->_animatingBackgroundView, 0);
}

@end
