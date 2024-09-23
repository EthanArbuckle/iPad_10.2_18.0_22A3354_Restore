@implementation NCNotificationPresentableViewController

- (NCNotificationPresentableViewController)initWithNotificationViewController:(id)a3
{
  id v5;
  NCNotificationPresentableViewController *v6;
  NCNotificationPresentableViewController *v7;
  id *p_notificationViewController;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationPresentableViewController;
  v6 = -[NCNotificationPresentableViewController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_readyForPanGestureProxy = 1;
    p_notificationViewController = (id *)&v6->_notificationViewController;
    objc_storeStrong((id *)&v6->_notificationViewController, a3);
    objc_msgSend(*p_notificationViewController, "addObserver:", v7);
    objc_msgSend(*p_notificationViewController, "setDefinesPresentationContext:", 1);
    -[NCNotificationPresentableViewController addChildViewController:](v7, "addChildViewController:", *p_notificationViewController);
    objc_msgSend(*p_notificationViewController, "notificationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "revealsAdditionalContentOnPresentation");

    v12 = *p_notificationViewController;
    if (v11)
    {
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

    }
    else
    {
      objc_msgSend(v12, "preferredContentSize");
      -[NCNotificationPresentableViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
    }
  }

  return v7;
}

- (BOOL)isDragging
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_panGestureProxy);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "state") < 3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v3;

  if (self->_notificationViewController)
    return -[NCNotificationViewController canBecomeFirstResponder](self->_notificationViewController, "canBecomeFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationPresentableViewController;
  return -[NCNotificationPresentableViewController canBecomeFirstResponder](&v3, sel_canBecomeFirstResponder);
}

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  if (self->_notificationViewController)
    return -[NCNotificationViewController becomeFirstResponder](self->_notificationViewController, "becomeFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationPresentableViewController;
  return -[NCNotificationPresentableViewController becomeFirstResponder](&v3, sel_becomeFirstResponder);
}

- (BOOL)canResignFirstResponder
{
  objc_super v3;

  if (self->_notificationViewController)
    return -[NCNotificationViewController canResignFirstResponder](self->_notificationViewController, "canResignFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationPresentableViewController;
  return -[NCNotificationPresentableViewController canResignFirstResponder](&v3, sel_canResignFirstResponder);
}

- (BOOL)resignFirstResponder
{
  objc_super v3;

  if (self->_notificationViewController)
    return -[NCNotificationViewController resignFirstResponder](self->_notificationViewController, "resignFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationPresentableViewController;
  return -[NCNotificationPresentableViewController resignFirstResponder](&v3, sel_resignFirstResponder);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  -[NCNotificationPresentableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[NCNotificationPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController view](self->_notificationViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  -[NCNotificationPresentableViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if (!self->_presentationState)
  {
    -[NCNotificationViewController view](self->_notificationViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationPresentableViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
}

- (BOOL)shouldAutorotate
{
  return -[NCNotificationViewController shouldAutorotate](self->_notificationViewController, "shouldAutorotate");
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[NCNotificationViewController supportedInterfaceOrientations](self->_notificationViewController, "supportedInterfaceOrientations");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  -[NCNotificationPresentableViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if (!self->_presentationState)
  {
    objc_msgSend(v4, "preferredContentSize");
    -[NCNotificationPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NCNotificationPresentableViewController;
  -[NCNotificationPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self->_presentationState == 1)
  {
    self->_presentationState = 2;
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E8D1D428;
    objc_copyWeak(&v12, &location);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v9[3] = &unk_1E8D1D428;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v2[3] = &unk_1E8D1B568;
  v2[4] = WeakRetained;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);

}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_initialBannerFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_panGestureProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualTranslationInCoordinateSpace:", v11);
  v13 = v5 + v12;

  objc_msgSend(*(id *)(a1 + 32), "notificationViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v3, v13, v7, v9);

}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isPanPresentation"))
  {
    objc_msgSend(WeakRetained, "notificationViewController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "presentLongLookAnimated:trigger:completion:", 1, 6, 0);

  }
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  double width;
  double height;
  CGSize result;

  if (self->_presentationState < 1)
  {
    -[NCNotificationViewController preferredContentSizeWithPresentationSize:containerSize:](self->_notificationViewController, "preferredContentSizeWithPresentationSize:containerSize:", a3.width, a3.height, a4.width, a4.height);
    a4.width = v4;
    a4.height = v5;
  }
  width = a4.width;
  height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 0;
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC6008], "requesterIdentifier");
}

- (NSString)requestIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationPresentableViewController notificationViewController](self, "notificationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  if (self->_readyForPanGestureProxy)
  {
    objc_storeWeak((id *)&self->_panGestureProxy, v4);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__NCNotificationPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
    v5[3] = &unk_1E8D1D450;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    objc_msgSend(v4, "setActionHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __76__NCNotificationPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  switch(objc_msgSend(v3, "state"))
  {
    case 1:
      if (!objc_msgSend(WeakRetained, "_presentationState")
        || (objc_msgSend(WeakRetained, "_isPanPresentation") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "notificationViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        objc_msgSend(v6, "convertRect:toView:", 0);
        objc_msgSend(WeakRetained, "_setInitialBannerFrame:");
        v11 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (objc_msgSend(WeakRetained, "_presentationState") == 3)
      {
        objc_msgSend(WeakRetained, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "locationInCoordinateSpace:", v6);
        objc_msgSend(v6, "hitTest:withEvent:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "notificationViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presentedViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v9, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v7, "isDescendantOfView:", v10);

        }
        else
        {
          v11 = 0;
        }
        goto LABEL_24;
      }
      v11 = 0;
LABEL_25:
      objc_msgSend(WeakRetained, "_setCanPan:", v11);
LABEL_37:

      return;
    case 2:
      if (objc_msgSend(WeakRetained, "_canPan")
        && ((objc_msgSend(v3, "didCrossDefaultThreshold") & 1) != 0
         || objc_msgSend(WeakRetained, "_presentationState") >= 1))
      {
        objc_msgSend(WeakRetained, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(WeakRetained, "_presentationState") <= 0
          && objc_msgSend(*(id *)(a1 + 32), "_isAppearingOrAppeared")
          && ((objc_opt_respondsToSelector() & 1) == 0
           || objc_msgSend(v12, "notificationPresentableViewControllerShouldPresentLongLook:", WeakRetained)))
        {
          objc_msgSend(WeakRetained, "notificationViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "shouldCommitToExpandedPlatterPresentationWithFeedback");

          if (v14)
          {
            objc_msgSend(WeakRetained, "_setPanPresentation:", 1);
            objc_msgSend(WeakRetained, "_setPresentationState:", 1);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v32 = *MEMORY[0x1E0C9D820];
              objc_msgSend(v12, "notificationPresentableViewController:presentationSize:containerSize:", WeakRetained, 0, &v32);
              objc_msgSend(WeakRetained, "setPreferredContentSize:", v32);
            }
          }
          else
          {
            objc_msgSend(WeakRetained, "_setPresentationState:", 4);
          }
        }

      }
      goto LABEL_37;
    case 3:
      if (!objc_msgSend(WeakRetained, "_canPan")
        || objc_msgSend(WeakRetained, "_isPanPresentation")
        && objc_msgSend(WeakRetained, "_presentationState") != 3)
      {
        goto LABEL_28;
      }
      objc_msgSend(*(id *)(a1 + 32), "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "velocityInCoordinateSpace:", v15);
      v17 = v16;

      objc_msgSend(*(id *)(a1 + 32), "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contentScaleFactor");
      v20 = NCTranslationWithVelocityAndDefaultScrollViewAcceleration(v17, v19);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "visualTranslationInCoordinateSpace:", v21);
      v23 = v20 + v22;

      v5 = v23 / 60.0;
      if (v23 / 60.0 <= 1.0)
        goto LABEL_28;
      objc_msgSend(WeakRetained, "notificationViewController", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentedViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "expandedPlatterPresentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "containerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_removeAllRetargetableAnimations:", 1);

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_28;
      }
      v28 = v25;
      objc_msgSend(v28, "dismisser");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v28, 1);

      goto LABEL_37;
    case 4:
    case 5:
LABEL_28:
      if (objc_msgSend(WeakRetained, "_canPan", v5)
        && objc_msgSend(WeakRetained, "_presentationState") >= 1)
      {
        if (objc_msgSend(WeakRetained, "_presentationState") > 3)
        {
          v30 = WeakRetained;
          v31 = 0;
        }
        else
        {
          v30 = WeakRetained;
          v31 = 3;
        }
        objc_msgSend(v30, "_setPresentationState:", v31);
      }
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

- (id)presentableDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("logDigest");
  -[NCNotificationPresentableViewController requestIdentifier](self, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "un_logDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("bannerAppearState");
  v10[0] = v4;
  NCStringForAppearState(self->_bannerAppearState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BNPresentableDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __int128 v10;

  v4 = a3;
  self->_bannerAppearState = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentableWillAppearAsBanner:", v4);
  -[NCNotificationPresentableViewController notificationViewController](self, "notificationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "revealsAdditionalContentOnPresentation")
    || !-[NCNotificationPresentableViewController _isAppearingOrAppeared](self, "_isAppearingOrAppeared"))
  {

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(WeakRetained, "notificationPresentableViewControllerShouldPresentLongLook:", self);

    if ((v9 & 1) == 0)
      goto LABEL_9;
  }
  else
  {

  }
  self->_presentationState = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = *MEMORY[0x1E0C9D820];
    objc_msgSend(WeakRetained, "notificationPresentableViewController:presentationSize:containerSize:", self, 0, &v10);
    -[NCNotificationPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10);
  }
LABEL_9:

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  self->_bannerAppearState = 2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentableDidAppearAsBanner:", v9);
  -[NCNotificationPresentableViewController notificationViewController](self, "notificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "revealsAdditionalContentOnPresentation");

  if (v8)
    objc_msgSend(v5, "presentLongLookAnimated:trigger:completion:", 1, 7, 0);

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  self->_bannerAppearState = 3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentableWillDisappearAsBanner:withReason:", v8, v6);

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  self->_bannerAppearState = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentableDidDisappearAsBanner:withReason:", v8, v6);

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentableWillNotAppearAsBanner:withReason:", v8, v6);

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "userInteractionWillBeginForBannerForPresentable:", v5);

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "userInteractionDidEndForBannerForPresentable:", v5);
  if ((unint64_t)(self->_presentationState - 1) <= 2)
  {
    objc_storeWeak((id *)&self->_panGestureProxy, 0);
    self->_readyForPanGestureProxy = 0;
  }

}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id WeakRetained;
  __int128 v12;

  v4 = a3;
  if (!self->_panPresentation && self->_presentationState <= 0)
  {
    self->_presentationState = 1;
    -[NCNotificationPresentableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController view](self->_notificationViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v5, "convertRect:toView:", 0);
    self->_initialBannerFrame.origin.x = v7;
    self->_initialBannerFrame.origin.y = v8;
    self->_initialBannerFrame.size.width = v9;
    self->_initialBannerFrame.size.height = v10;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = *MEMORY[0x1E0C9D820];
      objc_msgSend(WeakRetained, "notificationPresentableViewController:presentationSize:containerSize:", self, 0, &v12);
      -[NCNotificationPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v12);
    }

  }
}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  if (!self->_panPresentation)
    self->_presentationState = 3;
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  NCNotificationViewController *v4;
  void *v5;

  objc_msgSend(a3, "presentingViewController");
  v4 = (NCNotificationViewController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self->_notificationViewController)
  {
    -[NCNotificationPresentableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isAppearingOrAppeared
{
  int v3;

  v3 = -[NCNotificationPresentableViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  if (v3)
    LOBYTE(v3) = (self->_bannerAppearState - 1) < 2;
  return v3;
}

- (NCNotificationPresentableViewControllerDelegate)delegate
{
  return (NCNotificationPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NCNotificationViewController)notificationViewController
{
  return self->_notificationViewController;
}

- (int)bannerAppearState
{
  return self->_bannerAppearState;
}

- (BNPanGestureProxy)_panGestureProxy
{
  return (BNPanGestureProxy *)objc_loadWeakRetained((id *)&self->_panGestureProxy);
}

- (void)_setPanGestureProxy:(id)a3
{
  objc_storeWeak((id *)&self->_panGestureProxy, a3);
}

- (BOOL)_isReadyForPanGestureProxy
{
  return self->_readyForPanGestureProxy;
}

- (void)_setReadyForPanGestureProxy:(BOOL)a3
{
  self->_readyForPanGestureProxy = a3;
}

- (CGRect)_initialBannerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBannerFrame.origin.x;
  y = self->_initialBannerFrame.origin.y;
  width = self->_initialBannerFrame.size.width;
  height = self->_initialBannerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setInitialBannerFrame:(CGRect)a3
{
  self->_initialBannerFrame = a3;
}

- (BOOL)_canPan
{
  return self->_canPan;
}

- (void)_setCanPan:(BOOL)a3
{
  self->_canPan = a3;
}

- (BOOL)_isPanPresentation
{
  return self->_panPresentation;
}

- (void)_setPanPresentation:(BOOL)a3
{
  self->_panPresentation = a3;
}

- (int64_t)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_panGestureProxy);
  objc_storeStrong((id *)&self->_notificationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
