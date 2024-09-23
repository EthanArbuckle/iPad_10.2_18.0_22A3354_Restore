@implementation TSKPopoverBasedViewController

- (TSKPopoverBasedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TSKPopoverBasedViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKPopoverBasedViewController;
  v4 = -[TSKPopoverBasedViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4 && TSUPhoneUI())
  {
    v4->mWrapInNavigationController = 1;
    v4->mDismissOnUndo = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mHideOnTouchGestureRecognizer = 0;
  self->mPopoverToggleView = 0;

  self->mPopoverController = 0;
  self->mHalfHeightViewController = 0;

  self->mHalfHeightCloseBlock = 0;
  self->mHalfHeightTapShield = 0;

  self->mHalfHeightParentView = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverBasedViewController;
  -[TSKPopoverBasedViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverBasedViewController;
  -[TSKPopoverBasedViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TSKPopoverBasedViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverBasedViewController;
  -[TSKPopoverBasedViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  +[TSKKeyboardMonitor addKeyboardObserver:](TSKKeyboardMonitor, "addKeyboardObserver:", self);
  -[TSKPopoverBasedViewController contentSize](self, "contentSize");
  -[TSKPopoverBasedViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverBasedViewController;
  -[TSKPopoverBasedViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  +[TSKKeyboardMonitor removeKeyboardObserver:](TSKKeyboardMonitor, "removeKeyboardObserver:", self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return objc_msgSend((id)-[TSKPopoverBasedViewController presentingViewController](self, "presentingViewController"), "supportedInterfaceOrientations");
}

- (BOOL)shouldHideToolbar
{
  return 1;
}

- (BOOL)isPopoverGestureInFlight
{
  return +[TSKHideOnTouchOutsideViewGestureRecognizer isInFlight](TSKHideOnTouchOutsideViewGestureRecognizer, "isInFlight");
}

- (id)p_topParentViewController
{
  void *v2;
  void *v3;

  v2 = (void *)-[TSKPopoverBasedViewController parentViewController](self, "parentViewController");
  do
  {
    v3 = v2;
    v2 = (void *)objc_msgSend(v2, "parentViewController");
  }
  while (v2);
  return v3;
}

- (id)p_newRootViewController
{
  id v3;
  id v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = -[TSKPopoverBasedViewController i_contentViewController](self, "i_contentViewController");
  if (-[TSKPopoverBasedViewController imposeContentSizeOnViewControllers](self, "imposeContentSizeOnViewControllers"))
  {
    -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v3, "setPreferredContentSize:");
  }
  if (!-[TSKPopoverBasedViewController wrapInNavigationController](self, "wrapInNavigationController"))
    return v3;
  objc_msgSend(v3, "setEdgesForExtendedLayout:", 0);
  objc_msgSend(v3, "setAutomaticallyAdjustsScrollViewInsets:", 0);
  TSUPhoneUI();
  v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRootViewController:", v3);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setWantsFullScreenLayout:", 0);
  objc_msgSend(v4, "setToolbarHidden:", -[TSKPopoverBasedViewController shouldHideToolbar](self, "shouldHideToolbar"));
  objc_msgSend((id)objc_msgSend(v4, "navigationBar"), "setTranslucent:", 0);
  if ((TSUPhoneUI() & 1) == 0)
    objc_msgSend((id)objc_msgSend(v4, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  v5 = objc_msgSend(v4, "isNavigationBarHidden");
  objc_msgSend(v3, "preferredContentSize");
  v7 = v6;
  v9 = v8;
  if ((v5 & 1) == 0)
  {
    v10 = (void *)objc_msgSend(v4, "navigationBar");
    objc_msgSend((id)objc_msgSend(v3, "view"), "bounds");
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    v9 = v9 + v13;
  }
  objc_msgSend(v4, "setPreferredContentSize:", v7, v9);
  return v4;
}

- (void)setWrapInNavigationController:(BOOL)a3
{
  TSKPopoverController *mPopoverController;

  if (self->mWrapInNavigationController != a3)
  {
    self->mWrapInNavigationController = a3;
    if (!-[TSKPopoverBasedViewController isVisible](self, "isVisible"))
    {
      mPopoverController = self->mPopoverController;
      if (mPopoverController)
      {

        self->mPopoverController = 0;
      }
    }
  }
}

- (id)navigationBar
{
  objc_opt_class();
  return (id)objc_msgSend((id)TSUDynamicCast(), "navigationBar");
}

- (void)outsideTouch:(id)a3
{
  TSKPopoverBasedViewControllerDelegate *mPopoverDelegate;
  double v6;
  double v7;
  UIView *mPopoverToggleView;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGPoint v19;
  CGRect v20;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (mPopoverDelegate = self->mPopoverDelegate,
        objc_msgSend(a3, "locationInView:", -[TSKPopoverBasedViewController view](self, "view")),
        -[TSKPopoverBasedViewControllerDelegate popoverController:shouldReceiveOutsideTouchAtLocation:inView:](mPopoverDelegate, "popoverController:shouldReceiveOutsideTouchAtLocation:inView:", self, -[TSKPopoverBasedViewController view](self, "view"), v6, v7)))
  {
    if (!-[TSKPopoverBasedViewController staysOpenOnOutsideTouches](self, "staysOpenOnOutsideTouches"))
    {
      mPopoverToggleView = self->mPopoverToggleView;
      if (!mPopoverToggleView)
        goto LABEL_7;
      -[UIView bounds](mPopoverToggleView, "bounds");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      objc_msgSend(a3, "locationInView:", self->mPopoverToggleView);
      v19.x = v17;
      v19.y = v18;
      v20.origin.x = v10;
      v20.origin.y = v12;
      v20.size.width = v14;
      v20.size.height = v16;
      if (!CGRectContainsPoint(v20, v19))
LABEL_7:
        -[TSKPopoverBasedViewController p_dismissPopoverAnimated:](self, "p_dismissPopoverAnimated:", 1);
    }
  }
}

- (id)p_outsideTouchWatchView
{
  TSKPopoverBasedViewController *v2;

  v2 = self;
  if (-[TSKPopoverBasedViewController wrapInNavigationController](self, "wrapInNavigationController"))
    v2 = (TSKPopoverBasedViewController *)-[TSKPopoverBasedViewController navigationController](v2, "navigationController");
  return (id)-[TSKPopoverBasedViewController view](v2, "view");
}

- (void)p_installHideOnTouchGesture
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (TSUPadUI())
  {
    v3 = -[TSKPopoverBasedViewController p_outsideTouchWatchView](self, "p_outsideTouchWatchView");
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "rootViewController");
    if (v4)
    {
      v5 = (void *)v4;
      self->mHideOnTouchGestureRecognizer = -[TSKHideOnTouchOutsideViewGestureRecognizer initWithTarget:action:watchView:]([TSKHideOnTouchOutsideViewGestureRecognizer alloc], "initWithTarget:action:watchView:", self, sel_outsideTouch_, v3);
      v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "view"), "gestureRecognizers"), "mutableCopy");
      if (!v6)
        v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v6, "insertObject:atIndex:", self->mHideOnTouchGestureRecognizer, 0);
      objc_msgSend((id)objc_msgSend(v5, "view"), "setGestureRecognizers:", v6);

      -[TSKPopoverController setPassthroughViews:](-[TSKPopoverBasedViewController popoverController](self, "popoverController"), "setPassthroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(v5, "view")));
    }
  }
}

- (void)p_removeHideOnTouchGesture
{
  if (TSUPadUI())
  {
    objc_msgSend((id)-[TSKHideOnTouchOutsideViewGestureRecognizer view](self->mHideOnTouchGestureRecognizer, "view"), "removeGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

    self->mHideOnTouchGestureRecognizer = 0;
    -[TSKPopoverController setPassthroughViews:](-[TSKPopoverBasedViewController popoverController](self, "popoverController"), "setPassthroughViews:", 0);
  }
}

- (void)setAllowsOutsideTouch:(BOOL)a3
{
  _BOOL4 v3;
  TSKHideOnTouchOutsideViewGestureRecognizer *mHideOnTouchGestureRecognizer;
  BOOL v6;

  v3 = a3;
  if (TSUPadUI())
  {
    self->mAllowsOutsideTouch = v3;
    if (-[TSKPopoverBasedViewController isPopoverVisible](self, "isPopoverVisible"))
    {
      mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
      if (mHideOnTouchGestureRecognizer)
        v6 = 1;
      else
        v6 = !v3;
      if (v6)
      {
        if (mHideOnTouchGestureRecognizer)
        {
          if (!v3)
            -[TSKPopoverBasedViewController p_removeHideOnTouchGesture](self, "p_removeHideOnTouchGesture");
        }
      }
      else
      {
        -[TSKPopoverBasedViewController p_installHideOnTouchGesture](self, "p_installHideOnTouchGesture");
      }
    }
  }
}

- (void)clearOutsideTouchWatchView
{
  -[TSKHideOnTouchOutsideViewGestureRecognizer setWatchView:](self->mHideOnTouchGestureRecognizer, "setWatchView:", 0);
}

- (void)resetOutsideTouchWatchView
{
  -[TSKHideOnTouchOutsideViewGestureRecognizer setWatchView:](self->mHideOnTouchGestureRecognizer, "setWatchView:", -[TSKPopoverBasedViewController p_outsideTouchWatchView](self, "p_outsideTouchWatchView"));
}

- (CGSize)contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
  if (v3 == 0.0)
  {
    objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "frame");
    v5 = v4;
  }
  else
  {
    -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
    v5 = v6;
  }
  -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
  if (v7 == 0.0)
  {
    objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "frame");
    v9 = v8;
  }
  else
  {
    -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
  }
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGRect)frameForCurrentiPhoneOrientation
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if ((TSUPhoneUI() & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController frameForCurrentiPhoneOrientation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 423, CFSTR("This should only be called from iPhone (or non-iPad)"));
  }
  if (TSUPhoneUI())
  {
    -[UIView frame](-[UIViewController view](self->mHalfHeightViewController, "view"), "frame");
  }
  else
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)p_informDelegateOfWillShow
{
  TSKPopoverBasedViewControllerDelegate *v3;

  v3 = -[TSKPopoverBasedViewController popoverDelegate](self, "popoverDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSKPopoverBasedViewControllerDelegate popoverControllerWillShowPopoverBasedViewController:](v3, "popoverControllerWillShowPopoverBasedViewController:", self);
}

- (void)p_informDelegateOfWillDismiss
{
  TSKPopoverBasedViewControllerDelegate *v3;

  v3 = -[TSKPopoverBasedViewController popoverDelegate](self, "popoverDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSKPopoverBasedViewControllerDelegate popoverControllerWillDismissPopoverBasedViewController:](v3, "popoverControllerWillDismissPopoverBasedViewController:", self);
}

- (void)p_informDelegateOfDidDismiss
{
  TSKPopoverBasedViewControllerDelegate *v3;

  v3 = -[TSKPopoverBasedViewController popoverDelegate](self, "popoverDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSKPopoverBasedViewControllerDelegate popoverControllerDidDismissPopoverBasedViewController:](v3, "popoverControllerDidDismissPopoverBasedViewController:", self);
}

- (void)p_dismissFullscreenModalAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  self->mViewControllerVisible = 0;
  v5 = (void *)objc_msgSend(-[TSKPopoverBasedViewController i_contentViewController](self, "i_contentViewController"), "parentViewController");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__TSKPopoverBasedViewController_p_dismissFullscreenModalAnimated___block_invoke;
  v6[3] = &unk_24D829278;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v6);
}

uint64_t __66__TSKPopoverBasedViewController_p_dismissFullscreenModalAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_informDelegateOfDidDismiss");
}

- (void)p_dismissHalfHeightFromCloseButton
{
  -[TSKPopoverBasedViewController closeButtonPressed](self, "closeButtonPressed");
  -[TSKPopoverBasedViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)p_dismissFullscreenModalFromCloseButton
{
  -[TSKPopoverBasedViewController closeButtonPressed](self, "closeButtonPressed");
  -[TSKPopoverBasedViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)p_dismissPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (TSUPhoneUI())
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController p_dismissPopoverAnimated:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 494, CFSTR("Can't present popovers on the phone!"));
  }
  -[TSKPopoverController dismissPopoverAnimated:](self->mPopoverController, "dismissPopoverAnimated:", v3);
}

- (void)p_registerPopoverBasedViewControllerNotifications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, TSKPopoverBasedViewControllerIsModalKey, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", TSUPhoneUI()), TSKPopoverBasedViewControllerIsFullscreenKey, 0);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v6, "postNotificationName:object:userInfo:", TSKPopoverBasedViewControllerWillPresentNotification, self, v5);
}

- (void)p_showModalInViewController:(id)a3 withTitle:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  TSKPopoverBasedViewControllerDelegate *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;

  v6 = a6;
  v7 = a5;
  if ((TSUPhoneUI() & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController p_showModalInViewController:withTitle:animated:withDoneButton:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 511, CFSTR("Can't show modal view controller on iPad."));
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "isMenuVisible"))
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", &__block_literal_global_12);
  self->mViewControllerVisible = 1;
  -[TSKPopoverBasedViewController p_informDelegateOfWillShow](self, "p_informDelegateOfWillShow");
  v13 = -[TSKPopoverBasedViewController p_newRootViewController](self, "p_newRootViewController");
  if (-[TSKPopoverBasedViewController wrapInNavigationController](self, "wrapInNavigationController"))
  {
    objc_opt_class();
    v14 = TSUDynamicCast();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = -[TSKPopoverBasedViewController popoverDelegate](self, "popoverDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[TSKPopoverBasedViewControllerDelegate wantsCloseArrowForPopoverBasedViewController:](v16, "wantsCloseArrowForPopoverBasedViewController:", self))
      {
        v17 = -[TSKPopoverBasedViewController p_newCloseImageBarButtonWithTarget:action:](self, "p_newCloseImageBarButtonWithTarget:action:", self, sel_p_dismissFullscreenModalFromCloseButton);
        goto LABEL_13;
      }
      if (v6)
      {
        if (TSUPhoneUI())
        {
          v18 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "toolbarButtonForModalDoneWithTarget:action:", self, sel_p_dismissFullscreenModalFromCloseButton);
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v18);
LABEL_13:
          v19 = v17;
          if (!a4)
            goto LABEL_19;
          goto LABEL_18;
        }
        v20 = CFSTR("Done");
        v21 = 2;
      }
      else
      {
        v20 = CFSTR("Close");
        v21 = 1;
      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", v20, &stru_24D82FEB0, CFSTR("TSKit")), v21, self, sel_p_dismissFullscreenModalFromCloseButton);
      -[TSKPopoverBasedViewController i_configureCloseItem:](self, "i_configureCloseItem:", v19);
      if (!a4)
      {
LABEL_19:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "topViewController"), "navigationItem"), "setRightBarButtonItem:", v19);

        goto LABEL_20;
      }
LABEL_18:
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "topViewController"), "navigationItem"), "setTitle:", a4);
      goto LABEL_19;
    }
  }
LABEL_20:
  objc_msgSend(a3, "presentViewController:animated:completion:", v13, v7, 0);
}

uint64_t __95__TSKPopoverBasedViewController_p_showModalInViewController_withTitle_animated_withDoneButton___block_invoke()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
}

- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v7;

  v7 = objc_alloc(MEMORY[0x24BDF6860]);
  return (id)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TSKInsp_Close-ArrowDown"), TSKBundle(), -[TSKPopoverBasedViewController traitCollection](self, "traitCollection")), 1, a3, a4);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5
{
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:", a4, a5, 15, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 withDoneButton:(BOOL)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, 15, 1, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v6);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, a6, a7, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v7);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, a6, a7, a8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v8);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8 constrainToView:(BOOL)a9 withPadding:(double)a10 fromToolbar:(BOOL)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double height;
  double width;
  double y;
  double x;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSKPopoverBasedViewController p_registerPopoverBasedViewControllerNotifications](self, "p_registerPopoverBasedViewControllerNotifications");
  if (TSUPhoneUI())
    -[TSKPopoverBasedViewController p_showModalInViewController:withTitle:animated:withDoneButton:](self, "p_showModalInViewController:withTitle:animated:withDoneButton:", a5, 0, v14, v13);
  else
    -[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:](self, "showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:", a4, a6, v14, v12, a11, x, y, width, height, a10);
}

- (void)presentModallyFromBarItem:(id)a3 viewController:(id)a4
{
  -[TSKPopoverBasedViewController p_registerPopoverBasedViewControllerNotifications](self, "p_registerPopoverBasedViewControllerNotifications");
  if (TSUPhoneUI())
    -[TSKPopoverBasedViewController p_showModalInViewController:withTitle:animated:withDoneButton:](self, "p_showModalInViewController:withTitle:animated:withDoneButton:", a4, 0, 1, 0);
  else
    -[TSKPopoverBasedViewController showPopoverFromBarItem:](self, "showPopoverFromBarItem:", a3);
}

- (void)presentModallyWithTitle:(id)a3 viewController:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v11;
  uint64_t v12;

  v6 = a6;
  v7 = a5;
  if ((TSUPhoneUI() & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController presentModallyWithTitle:viewController:animated:withDoneButton:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 658, CFSTR("presentModallyWithTitle is only intended to be used on the phone."));
  }
  -[TSKPopoverBasedViewController p_registerPopoverBasedViewControllerNotifications](self, "p_registerPopoverBasedViewControllerNotifications");
  -[TSKPopoverBasedViewController p_showModalInViewController:withTitle:animated:withDoneButton:](self, "p_showModalInViewController:withTitle:animated:withDoneButton:", a4, a3, v7, v6);
}

- (void)p_dismissHalfHeight
{
  void (**mHalfHeightCloseBlock)(id, TSKPopoverBasedViewController *);
  BOOL mHalfHeightAnimated;
  TSKModalShieldView *v5;
  UIViewController *v6;
  uint64_t v7;
  UIView *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[9];
  _QWORD v17[7];
  BOOL v18;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSKWillEnterFullScreenNotification"), 0);
  self->mViewControllerVisible = 0;
  mHalfHeightCloseBlock = (void (**)(id, TSKPopoverBasedViewController *))self->mHalfHeightCloseBlock;
  if (mHalfHeightCloseBlock)
  {
    mHalfHeightCloseBlock[2](mHalfHeightCloseBlock, self);

    self->mHalfHeightCloseBlock = 0;
  }
  mHalfHeightAnimated = self->mHalfHeightAnimated;
  v5 = self->mHalfHeightTapShield;
  v6 = self->mHalfHeightViewController;

  self->mHalfHeightViewController = 0;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke;
  v17[3] = &unk_24D82A830;
  v18 = mHalfHeightAnimated;
  v17[4] = v6;
  v17[5] = v5;
  v17[6] = self;
  if (self->mHalfHeightAnimated)
  {
    v8 = -[UIViewController view](v6, "view");
    -[UIView frame](v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIView bounds](-[UIView superview](v8, "superview"), "bounds");
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke_2;
    v16[3] = &unk_24D82A858;
    v16[4] = v8;
    v16[5] = v10;
    v16[6] = v15;
    v16[7] = v12;
    v16[8] = v14;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v16, v17, 0.200000003, 0.0);
  }
  else
  {
    __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke((uint64_t)v17);
  }
}

uint64_t __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "viewWillDisappear:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "viewDidDisappear:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);

  return objc_msgSend(*(id *)(a1 + 48), "p_informDelegateOfDidDismiss");
}

uint64_t __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7
{
  -[TSKPopoverBasedViewController presentInRect:inView:animated:modal:closeBlock:animations:](self, "presentInRect:inView:animated:modal:closeBlock:animations:", a4, a5, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7 animations:(id)a8
{
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  TSKModalShieldView *v32;
  TSKModalShieldView *v33;
  UIView *v34;
  UIView *v35;
  _QWORD v36[11];

  v10 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = (void *)MEMORY[0x24BDBCE70];
  v19 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v20 = TSKPopoverBasedViewControllerIsModalKey;
  v21 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v22 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, v20, v21, TSKPopoverBasedViewControllerIsFullscreenKey, 0);
  v23 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v23, "postNotificationName:object:userInfo:", TSKPopoverBasedViewControllerWillPresentNotification, self, v22);
  self->mViewControllerVisible = 1;
  if (!a4)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController presentInRect:inView:animated:modal:closeBlock:animations:]");
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 743, CFSTR("invalid nil value for '%s'"), "parentView");
  }
  self->mHalfHeightParentView = (UIView *)a4;
  v26 = -[TSKPopoverBasedViewController p_newRootViewController](self, "p_newRootViewController");
  if (-[TSKPopoverBasedViewController wrapInNavigationController](self, "wrapInNavigationController"))
  {
    objc_opt_class();
    v27 = (void *)TSUDynamicCast();
    if (-[TSKPopoverBasedViewController useDoneButton](self, "useDoneButton"))
      v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D82FEB0, CFSTR("TSKit")), 0, self, sel_p_dismissHalfHeightFromCloseButton);
    else
      v28 = -[TSKPopoverBasedViewController p_newCloseImageBarButtonWithTarget:action:](self, "p_newCloseImageBarButtonWithTarget:action:", self, sel_p_dismissHalfHeightFromCloseButton);
    v29 = v28;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "topViewController"), "navigationItem"), "setRightBarButtonItem:", v28);
    objc_msgSend(v27, "setShowTopSeparator:", 1);
    objc_msgSend(v27, "setIsFullscreenViewController:", 0);

  }
  self->mHalfHeightAnimated = a5;
  -[TSKPopoverBasedViewController setHalfHeightViewController:](self, "setHalfHeightViewController:", v26);
  self->mHalfHeightOriginalFrame.origin.x = x;
  self->mHalfHeightOriginalFrame.origin.y = y;
  self->mHalfHeightOriginalFrame.size.width = width;
  self->mHalfHeightOriginalFrame.size.height = height;
  objc_msgSend(a4, "bounds");
  v31 = v30;

  self->mHalfHeightTapShield = 0;
  if (v10)
  {
    v32 = [TSKModalShieldView alloc];
    objc_msgSend(a4, "bounds");
    v33 = -[TSKModalShieldView initWithFrame:](v32, "initWithFrame:");
    self->mHalfHeightTapShield = v33;
    -[TSKModalShieldView setDelegate:](v33, "setDelegate:", self);
    objc_msgSend(a4, "addSubview:", self->mHalfHeightTapShield);
  }
  v34 = -[UIViewController view](self->mHalfHeightViewController, "view");
  v35 = v34;
  if (self->mHalfHeightAnimated)
  {
    -[UIView setFrame:](v34, "setFrame:", x, v31, width, height);
    -[UIView layoutIfNeeded](v35, "layoutIfNeeded");
    objc_msgSend(a4, "addSubview:", v35);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __91__TSKPopoverBasedViewController_presentInRect_inView_animated_modal_closeBlock_animations___block_invoke;
    v36[3] = &unk_24D82A880;
    v36[4] = v35;
    v36[5] = a8;
    *(double *)&v36[6] = x;
    *(double *)&v36[7] = y;
    *(double *)&v36[8] = width;
    *(double *)&v36[9] = height;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v36, 0.200000003);
  }
  else
  {
    -[UIView setFrame:](v34, "setFrame:", x, y, width, height);
    objc_msgSend(a4, "addSubview:", v35);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_applicationWillEnterFullScreen_, CFSTR("TSKWillEnterFullScreenNotification"), 0);
  if (TSUPhoneUI())
  {
    objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "addPopoverBasedViewController:", self);
    self->mUndoManagerNotificationsRegistered = 1;
  }

  self->mHalfHeightCloseBlock = (id)objc_msgSend(a7, "copy");
}

uint64_t __91__TSKPopoverBasedViewController_presentInRect_inView_animated_modal_closeBlock_animations___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)shieldViewReceivedTap
{
  -[TSKPopoverBasedViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TSKPopoverBasedViewController p_informDelegateOfWillDismiss](self, "p_informDelegateOfWillDismiss");
  if (TSUPhoneUI())
  {
    if (self->mUndoManagerNotificationsRegistered)
    {
      objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "removePopoverBasedViewController:", self);
      self->mUndoManagerNotificationsRegistered = 0;
    }
    if (self->mHalfHeightViewController)
    {
      self->mHalfHeightAnimated = v3;
      -[TSKPopoverBasedViewController p_dismissHalfHeight](self, "p_dismissHalfHeight");
    }
    else
    {
      -[TSKPopoverBasedViewController p_dismissFullscreenModalAnimated:](self, "p_dismissFullscreenModalAnimated:", v3);
    }
  }
  else
  {
    -[TSKPopoverBasedViewController p_dismissPopoverAnimated:](self, "p_dismissPopoverAnimated:", v3);
  }
}

- (BOOL)isVisible
{
  if (TSUPhoneUI())
    return self->mViewControllerVisible;
  else
    return -[TSKPopoverBasedViewController isPopoverVisible](self, "isPopoverVisible");
}

- (TSKPopoverController)popoverController
{
  void *v3;
  uint64_t v4;
  TSKPopoverController *result;
  TSKPopoverController *v6;

  if (TSUPhoneUI())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController popoverController]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 902, CFSTR("iPad-specific API is being called on a phone!"));
  }
  -[TSKPopoverBasedViewController contentSize](self, "contentSize");
  -[TSKPopoverBasedViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  result = self->mPopoverController;
  if (!result)
  {
    v6 = -[TSKPopoverController initWithContentViewController:]([TSKPopoverController alloc], "initWithContentViewController:", -[TSKPopoverBasedViewController p_newRootViewController](self, "p_newRootViewController"));
    self->mPopoverController = v6;
    -[TSKPopoverController setDismissOnUndo:](v6, "setDismissOnUndo:", 1);
    return self->mPopoverController;
  }
  return result;
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4
{
  -[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:](self, "showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:", a4, 15, 1, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6
{
  -[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:](self, "showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:", a4, a5, a6, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8 fromToolbar:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  void *v20;
  uint64_t v21;
  TSKPopoverController *v22;
  double v23;

  v9 = a9;
  v11 = a7;
  v12 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (TSUPhoneUI())
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:]");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 929, CFSTR("Can't present popovers on the phone!"));
  }
  v22 = -[TSKPopoverBasedViewController popoverController](self, "popoverController");
  -[TSKPopoverBasedViewController p_willPresentPopover](self, "p_willPresentPopover");
  if (v9)
    v23 = y + 5.0;
  else
    v23 = y;
  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:constrainToView:withPadding:](v22, "presentPopoverFromRect:inView:permittedArrowDirections:animated:constrainToView:withPadding:", a4, a5, v12, v11, x, v23, width, height, a8);
}

- (void)showPopoverFromBarItem:(id)a3
{
  void *v5;
  uint64_t v6;

  if (TSUPhoneUI())
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController showPopoverFromBarItem:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 955, CFSTR("Can't present popovers on the phone!"));
  }
  -[TSKPopoverBasedViewController p_willPresentPopover](self, "p_willPresentPopover");
  -[TSKPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](-[TSKPopoverBasedViewController popoverController](self, "popoverController"), "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", a3, 15, 1);
}

- (BOOL)isPopoverVisible
{
  void *v3;
  uint64_t v4;
  int v5;

  if (TSUPhoneUI())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController isPopoverVisible]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 962, CFSTR("iPad-specific API is being called on a phone!"));
  }
  if ((-[TSKPopoverController isPopoverVisible](self->mPopoverController, "isPopoverVisible") & 1) != 0
    || objc_msgSend((id)-[TSKPopoverController contentViewController](self->mPopoverController, "contentViewController"), "isViewLoaded")&& objc_msgSend((id)objc_msgSend((id)-[TSKPopoverController contentViewController](self->mPopoverController, "contentViewController"), "view"), "window"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[TSKPopoverBasedViewController isViewLoaded](self, "isViewLoaded");
    if (v5)
      LOBYTE(v5) = objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "window") != 0;
  }
  return v5;
}

- (void)p_willPresentPopover
{
  void *v3;
  uint64_t v4;

  if (TSUPhoneUI())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController p_willPresentPopover]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 979, CFSTR("iPad-specific API is being called on a phone!"));
  }
  if (self->mAllowsOutsideTouch && !self->mHideOnTouchGestureRecognizer)
    -[TSKPopoverBasedViewController p_installHideOnTouchGesture](self, "p_installHideOnTouchGesture");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_applicationWillEnterFullScreen_, CFSTR("TSKWillEnterFullScreenNotification"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_didDismissPopover_, CFSTR("TSKDidDismissPopover"), -[TSKPopoverBasedViewController popoverController](self, "popoverController"));
  -[TSKPopoverBasedViewController p_informDelegateOfWillShow](self, "p_informDelegateOfWillShow");
}

- (void)p_applicationWillEnterFullScreen:(id)a3
{
  -[TSKPopoverBasedViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)p_didDismissPopover:(id)a3
{
  void *v4;
  uint64_t v5;

  if ((TSKPopoverController *)objc_msgSend(a3, "object") == self->mPopoverController)
  {
    if (TSUPhoneUI())
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverBasedViewController p_didDismissPopover:]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 1001, CFSTR("iPad-specific API is being called on a phone!"));
    }
    if (self->mHideOnTouchGestureRecognizer)
      -[TSKPopoverBasedViewController p_removeHideOnTouchGesture](self, "p_removeHideOnTouchGesture");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSKWillEnterFullScreenNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSKDidDismissPopover"), self->mPopoverController);
    -[TSKPopoverBasedViewController p_informDelegateOfDidDismiss](self, "p_informDelegateOfDidDismiss");

    self->mPopoverController = 0;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v8;

  if (objc_msgSend((id)TSUProtocolCast(), "wantsDismissButton"))
  {
    v8 = (void *)objc_msgSend(a3, "viewControllers");
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      objc_opt_class();
      objc_msgSend(v8, "firstObject");
      objc_msgSend((id)objc_msgSend(a4, "navigationItem"), "setRightBarButtonItem:", objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "navigationItem"), "rightBarButtonItem"));
    }
  }
  if (-[TSKPopoverBasedViewController imposeContentSizeOnViewControllers](self, "imposeContentSizeOnViewControllers"))
  {
    -[TSKPopoverBasedViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(a4, "setPreferredContentSize:");
  }
}

- (BOOL)wantsDismissButton
{
  return 1;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  if (-[TSKPopoverBasedViewController viewResizesWithKeyboard](self, "viewResizesWithKeyboard"))
    -[TSKPopoverBasedViewController p_keyboardWillHide:withNotification:](self, "p_keyboardWillHide:withNotification:", 0, a3);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  if (-[TSKPopoverBasedViewController viewResizesWithKeyboard](self, "viewResizesWithKeyboard"))
    -[TSKPopoverBasedViewController p_keyboardWillHide:withNotification:](self, "p_keyboardWillHide:withNotification:", 1, a3);
}

- (void)p_keyboardWillHide:(BOOL)a3 withNotification:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  _QWORD v33[9];
  double v34;

  if (-[TSKPopoverBasedViewController p_shouldResizeViewWithKeyboard](self, "p_shouldResizeViewWithKeyboard"))
  {
    v7 = (void *)objc_msgSend(a4, "userInfo");
    v8 = (void *)objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF7A18]);
    v9 = (void *)-[TSKPopoverBasedViewController view](self, "view");
    objc_msgSend(v8, "CGRectValue");
    objc_msgSend(v9, "convertRect:fromView:", 0);
    v11 = v10;
    objc_msgSend(v8, "CGRectValue");
    -[TSKPopoverBasedViewController p_originOffsetForKeyboardFrame:](self, "p_originOffsetForKeyboardFrame:");
    v13 = v12;
    v14 = (void *)objc_msgSend(a4, "userInfo");
    v15 = (void *)objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDF7A20]);
    v16 = (void *)-[TSKPopoverBasedViewController view](self, "view");
    objc_msgSend(v15, "CGRectValue");
    objc_msgSend(v16, "convertRect:fromView:", 0);
    v18 = v11 - v17;
    v19 = (void *)objc_msgSend(a4, "userInfo");
    v20 = (void *)objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BDF79C0]);
    v34 = 0.0;
    objc_msgSend(v20, "getValue:", &v34);
    -[UIView frame](-[UIViewController view](self->mHalfHeightViewController, "view"), "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27 - (v18 - v13);
    if (TSUStatusBarIsLandscape())
    {
      if (a3)
      {
        -[TSKPopoverBasedViewController frameForCurrentiPhoneOrientation](self, "frameForCurrentiPhoneOrientation");
        v22 = v29;
        v28 = v30;
        v24 = v31;
        v26 = v32;
      }
      else
      {
        v26 = v26 + v28;
        v28 = 0.0;
      }
    }
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __69__TSKPopoverBasedViewController_p_keyboardWillHide_withNotification___block_invoke;
    v33[3] = &unk_24D82A858;
    v33[4] = self;
    v33[5] = v22;
    *(double *)&v33[6] = v28;
    v33[7] = v24;
    *(double *)&v33[8] = v26;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v33, 0, v34);
  }
}

uint64_t __69__TSKPopoverBasedViewController_p_keyboardWillHide_withNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "view"), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)p_originOffsetForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow");
  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(v7, "frame");
  if (x >= 0.0)
  {
    if (x <= v9)
    {
      if (y >= 0.0)
      {
        v11 = 0.0;
        if (y > v10)
          v11 = y - v10;
      }
      else
      {
        v11 = y + height;
      }
    }
    else
    {
      v11 = x - v9;
    }
  }
  else
  {
    v11 = x + width;
  }
  return fabs(v11);
}

- (BOOL)p_shouldResizeViewWithKeyboard
{
  int v3;

  if (self->mHalfHeightViewController)
  {
    v3 = TSUPhoneUI();
    if (v3)
      LOBYTE(v3) = self->mViewResizesWithKeyboard;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (TSKPopoverBasedViewControllerDelegate)popoverDelegate
{
  return self->mPopoverDelegate;
}

- (void)setPopoverDelegate:(id)a3
{
  self->mPopoverDelegate = (TSKPopoverBasedViewControllerDelegate *)a3;
}

- (BOOL)wrapInNavigationController
{
  return self->mWrapInNavigationController;
}

- (BOOL)useDoneButton
{
  return self->mUseDoneButton;
}

- (void)setUseDoneButton:(BOOL)a3
{
  self->mUseDoneButton = a3;
}

- (BOOL)viewResizesWithKeyboard
{
  return self->mViewResizesWithKeyboard;
}

- (void)setViewResizesWithKeyboard:(BOOL)a3
{
  self->mViewResizesWithKeyboard = a3;
}

- (BOOL)allowsOutsideTouch
{
  return self->mAllowsOutsideTouch;
}

- (BOOL)staysOpenOnOutsideTouches
{
  return self->mStaysOpenOnOutsideTouches;
}

- (void)setStaysOpenOnOutsideTouches:(BOOL)a3
{
  self->mStaysOpenOnOutsideTouches = a3;
}

- (UIView)popoverToggleView
{
  return self->mPopoverToggleView;
}

- (void)setPopoverToggleView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (BOOL)dismissOnUndo
{
  return self->mDismissOnUndo;
}

- (void)setDismissOnUndo:(BOOL)a3
{
  self->mDismissOnUndo = a3;
}

- (BOOL)imposeContentSizeOnViewControllers
{
  return self->mImposeContentSizeOnViewControllers;
}

- (void)setImposeContentSizeOnViewControllers:(BOOL)a3
{
  self->mImposeContentSizeOnViewControllers = a3;
}

- (UIViewController)halfHeightViewController
{
  return self->mHalfHeightViewController;
}

- (void)setHalfHeightViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1008);
}

@end
