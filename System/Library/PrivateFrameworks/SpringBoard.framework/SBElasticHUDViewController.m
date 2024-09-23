@implementation SBElasticHUDViewController

- (SBElasticHUDViewController)initWithFactory:(id)a3
{
  void *v4;
  SBElasticHUDViewController *v5;

  objc_msgSend(a3, "elasticValueViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBElasticHUDViewController initWithElasticValueContentViewController:](self, "initWithElasticValueContentViewController:", v4);

  return v5;
}

- (SBElasticHUDViewController)initWithElasticValueContentViewController:(id)a3
{
  id v5;
  SBElasticHUDViewController *v6;
  SBElasticHUDViewController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBElasticHUDViewController;
  v6 = -[SBElasticHUDViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    -[SBElasticHUDViewController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6);
    objc_storeStrong((id *)&v7->_elasticValueViewController, a3);
    -[SBElasticValueViewController setDelegate:](v7->_elasticValueViewController, "setDelegate:", v7);
    v8 = objc_opt_class();
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coverSheetSlidingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "edgePullGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[SBElasticValueViewController setupFailureRelationshipForGestureRecognizer:](v7->_elasticValueViewController, "setupFailureRelationshipForGestureRecognizer:", v12);

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[SBElasticValueViewController supportedInterfaceOrientations](self->_elasticValueViewController, "supportedInterfaceOrientations");
}

- (void)noteValueDidChange:(float)a3
{
  -[SBElasticValueViewController updateValue:](self->_elasticValueViewController, "updateValue:");
}

- (void)reloadData
{
  -[SBElasticValueViewController reloadData](self->_elasticValueViewController, "reloadData");
}

- (void)viewDidLoad
{
  SBElasticValueViewController *elasticValueViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBElasticHUDViewController;
  -[SBElasticHUDViewController viewDidLoad](&v8, sel_viewDidLoad);
  elasticValueViewController = self->_elasticValueViewController;
  -[SBElasticHUDViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticHUDViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", elasticValueViewController, v4);

  -[SBElasticValueViewController view](self->_elasticValueViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticHUDViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  -[SBElasticValueViewController view](self->_elasticValueViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBElasticHUDViewController;
  -[SBElasticHUDViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[SBElasticValueViewController view](self->_elasticValueViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticHUDViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return objc_alloc_init(_SBElasticHUDViewControllerNullAnimator);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return objc_alloc_init(_SBElasticHUDViewControllerNullAnimator);
}

- (NSArray)physicalButtonSceneTargets
{
  return -[SBElasticValueViewController physicalButtonSceneTargets](self->_elasticValueViewController, "physicalButtonSceneTargets");
}

- (BOOL)definesAnimatedDismissal
{
  return -[SBElasticValueViewController definesAnimatedDismissal](self->_elasticValueViewController, "definesAnimatedDismissal");
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
  -[SBElasticValueViewController dismissAnimatedWithCompletion:](self->_elasticValueViewController, "dismissAnimatedWithCompletion:", a3);
}

- (void)setPositionOffset:(CGPoint)a3
{
  -[SBElasticValueViewController setPositionOffset:](self->_elasticValueViewController, "setPositionOffset:", a3.x, a3.y);
}

- (int64_t)triggerButton
{
  return -[SBElasticValueViewController triggerButton](self->_elasticValueViewController, "triggerButton");
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  return -[SBElasticValueViewController attachmentDelegate](self->_elasticValueViewController, "attachmentDelegate");
}

- (void)setAttachmentDelegate:(id)a3
{
  -[SBElasticValueViewController setAttachmentDelegate:](self->_elasticValueViewController, "setAttachmentDelegate:", a3);
}

- (unint64_t)attachmentIgnoredOrientations
{
  return -[SBElasticValueViewController attachmentIgnoredOrientations](self->_elasticValueViewController, "attachmentIgnoredOrientations");
}

- (BOOL)isHUDAttached
{
  return -[SBElasticValueViewController isHUDAttached](self->_elasticValueViewController, "isHUDAttached");
}

- (BOOL)elasticValueViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  void *v6;

  -[SBElasticHUDViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "elasticHUDViewControllerCanBePresented:withReason:", self, a4);

  return (char)a4;
}

- (void)elasticValueViewControllerNeedsDismissal:(id)a3
{
  id v4;

  -[SBElasticHUDViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elasticHUDViewControllerRequestsDismissal:", self);

}

- (SBElasticHUDViewControllerDelegate)delegate
{
  return (SBElasticHUDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBElasticValueViewController)elasticValueViewController
{
  return self->_elasticValueViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticValueViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
