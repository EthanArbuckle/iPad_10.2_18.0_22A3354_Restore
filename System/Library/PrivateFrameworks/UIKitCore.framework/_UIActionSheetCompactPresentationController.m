@implementation _UIActionSheetCompactPresentationController

- (_UIActionSheetCompactPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 visualStyle:(id)a5
{
  id v8;
  _UIActionSheetCompactPresentationController *v9;
  _UIActionSheetCompactPresentationController *v10;
  void *v11;
  UILongPressGestureRecognizer *v12;
  UIView *v13;
  void *v14;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *dimmingViewDismissTapGestureRecognizer;
  _UIDimmingKnockoutBackdropView *v17;
  void *v18;
  objc_super v20;

  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIActionSheetCompactPresentationController;
  v9 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v20, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v10 = v9;
  if (v9)
  {
    v9->_pseudoAlertPreferredTop = -1.0;
    objc_msgSend(v8, "dismissActionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSheetCompactPresentationController setDismissActionView:](v10, "setDismissActionView:", v11);
    v12 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v10, sel__handleDismiss_);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v12, "setMinimumPressDuration:", 0.0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v12, "setCancelsTouchesInView:", 1);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v12, "setDelaysTouchesBegan:", 1);
    objc_msgSend(v11, "addGestureRecognizer:", v12);
    -[_UIActionSheetCompactPresentationController setDismissActionViewGestureRecognizer:](v10, "setDismissActionViewGestureRecognizer:", v12);
    v13 = objc_alloc_init(UIView);
    objc_msgSend(v8, "dimmingViewColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[_UIActionSheetCompactPresentationController setDimmingView:](v10, "setDimmingView:", v13);
    v15 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v10, sel__dismiss);
    dimmingViewDismissTapGestureRecognizer = v10->_dimmingViewDismissTapGestureRecognizer;
    v10->_dimmingViewDismissTapGestureRecognizer = v15;

    -[UIView addGestureRecognizer:](v13, "addGestureRecognizer:", v10->_dimmingViewDismissTapGestureRecognizer);
    v17 = -[_UIDimmingKnockoutBackdropView initWithStyle:]([_UIDimmingKnockoutBackdropView alloc], "initWithStyle:", 0);
    objc_msgSend(v8, "cornerRadius");
    -[_UIDimmingKnockoutBackdropView setCornerRadius:](v17, "setCornerRadius:");
    -[_UIActionSheetCompactPresentationController setBackdropView:](v10, "setBackdropView:", v17);
    -[UIPresentationController presentedView](v10, "presentedView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 0);

    -[_UIActionSheetCompactPresentationController setVisualStyle:](v10, "setVisualStyle:", v8);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  -[UIPresentationController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldPresentInFullscreen
{
  _UIActionSheetCompactPresentationController *v2;
  void *v3;

  v2 = self;
  -[_UIActionSheetCompactPresentationController actionSheetDelegate](self, "actionSheetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "actionSheetCompactPresentationControllerShouldPresentInCurrentContext:", v2) ^ 1;

  return (char)v2;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return 0;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 1;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  UIEdgeInsets result;

  v34.receiver = self;
  v34.super_class = (Class)_UIActionSheetCompactPresentationController;
  -[UIPresentationController _baseContentInsetsWithLeftMargin:rightMargin:](&v34, sel__baseContentInsetsWithLeftMargin_rightMargin_, a3, a4);
  if (self->_hasPendingAnimatedLayout)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contentOverlayInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v17 = v5;
    v12 = v6;
    v16 = v7;
    -[_UIActionSheetCompactPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[UIPresentationController containerView](self, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v33 = v28;

    v35.origin.x = v19;
    v35.origin.y = v21;
    v35.size.width = v23;
    v35.size.height = v25;
    v10 = fmax(v17 - CGRectGetMinY(v35), 0.0);
    v36.origin.x = v19;
    v36.origin.y = v21;
    v36.size.width = v23;
    v36.size.height = v25;
    v14 = fmax(CGRectGetMaxY(v36) - (v33 - v10), 0.0);
  }
  v29 = v10;
  v30 = v12;
  v31 = v14;
  v32 = v16;
  result.right = v32;
  result.bottom = v31;
  result.left = v30;
  result.top = v29;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  self->_hasPendingAnimatedLayout = 1;
  v9.receiver = self;
  v9.super_class = (Class)_UIActionSheetCompactPresentationController;
  v7 = a4;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98___UIActionSheetCompactPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E16B2150;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  self->_pseudoAlertPreferredTop = -1.0;
  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  -[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:](&v4, sel__transitionToPresentationController_withTransitionCoordinator_, a3, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActionSheetCompactPresentationController _currentLayoutGeometry](self, "_currentLayoutGeometry");
  -[UIPresentationController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UIActionSheetPresentationControllerCurrentKeyboardFrame(v5);
  v12 = UIActionSheetPresentationControllerFrameForPresentedView(&v23, v6, v7, v8, v9, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_layoutViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16[128];

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPresentationController presentedView](self, "presentedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController backdropView](self, "backdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dismissActionView](self, "dismissActionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dimmingView](self, "dimmingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController _currentLayoutGeometry](self, "_currentLayoutGeometry");
  v12 = UIActionSheetPresentationControllerCurrentKeyboardFrame(v5);
  UIActionSheetPresentationControllerLayoutViews(v6, v7, v8, v9, v10, v11, v16, v12, v13, v14, v15);

}

- (void)_applyVisualAffordancesToViews
{
  void *v3;
  void *v4;
  double v5;
  char v6;

  -[_UIActionSheetCompactPresentationController _currentLayoutGeometry](self, "_currentLayoutGeometry");
  -[_UIActionSheetCompactPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 1.0;
  if (!v6)
    v5 = 0.0;
  objc_msgSend(v3, "setAlpha:", v5);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_UIActionSheetCompactPresentationController _currentLayoutGeometry](self, "_currentLayoutGeometry");
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void (*v14)(_QWORD *, uint64_t);
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD aBlock[5];

  -[_UIActionSheetCompactPresentationController _subscribeToKeyboardNotifications](self, "_subscribeToKeyboardNotifications");
  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dimmingView](self, "dimmingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedView](self, "presentedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController backdropView](self, "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dismissActionView](self, "dismissActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIActionSheetPresentationControllerAddViewsToContainerView(v3, v4, v5, v6, v7);

  -[UIPresentationController presentedView](self, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

  -[UIPresentationController presentedView](self, "presentedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cornerRadius");
  objc_msgSend(v9, "_setContinuousCornerRadius:");

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E16B3FD8;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v13, "isBeingPresented");

  v14 = (void (*)(_QWORD *, uint64_t))v12[2];
  if ((_DWORD)v5)
  {
    v14(v12, 0);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v17[3] = &unk_1E16B1CC8;
    v18 = v12;
    objc_msgSend(v16, "animateAlongsideTransition:completion:", v17, 0);

  }
  else
  {
    v14(v12, 1);
  }

}

- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  -[UIPresentationController _willRunTransitionForCurrentStateDeferred:](&v4, sel__willRunTransitionForCurrentStateDeferred_, a3);
  if (!-[UIPresentationController presenting](self, "presenting"))
    -[_UIActionSheetCompactPresentationController _unsubscribeFromKeyboardNotifications](self, "_unsubscribeFromKeyboardNotifications");
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[_UIActionSheetCompactPresentationController _unsubscribeFromKeyboardNotifications](self, "_unsubscribeFromKeyboardNotifications");
  -[_UIActionSheetCompactPresentationController setShouldAdoptPresentedAppearance:](self, "setShouldAdoptPresentedAppearance:", 0);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75___UIActionSheetCompactPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E16B2150;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32[3];
  id location;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_UIActionSheetCompactPresentationController;
  -[UIPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v34, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "preferredContentSize");
    v7 = v6;
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    aBlock[3] = &unk_1E16BE7C0;
    objc_copyWeak(v32, &location);
    v32[1] = v7;
    v32[2] = v9;
    v11 = _Block_copy(aBlock);
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
    v29[3] = &unk_1E16B3F40;
    objc_copyWeak(&v30, &location);
    v12 = _Block_copy(v29);
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
    v27[3] = &unk_1E16B3F40;
    objc_copyWeak(&v28, &location);
    v13 = _Block_copy(v27);
    -[_UIActionSheetCompactPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UIPresentationController presentedView](self, "presentedView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSheetCompactPresentationController _resizeAnimationDuration](self, "_resizeAnimationDuration");
    UIActionSheetPresentationControllerAnimationCoordinatorForFrameChangeOfView(v22, v23, v24, v11, v12, v13, v15, v17, v19, v21, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActionSheetCompactPresentationController setAnimationCoordinator:](self, "setAnimationCoordinator:", v26);
    objc_msgSend(v26, "animate");

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }

}

- (void)_subscribeToKeyboardNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardChanged_, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v6);

}

- (void)_unsubscribeFromKeyboardNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v6);

}

- (void)_keyboardChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("UIKeyboardFrameBeginUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v31 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGRectValue");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v4, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  objc_msgSend(v4, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "valueForKey:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  -[_UIActionSheetCompactPresentationController _updateForKeyboardStartFrame:endFrame:duration:curve:](self, "_updateForKeyboardStartFrame:endFrame:duration:curve:", v30, v31, v9, v11, v13, v17, v19, v21, v23, v27);
}

- (void)_updateForKeyboardStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 curve:(int64_t)a6
{
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double height;
  _OWORD v25[8];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  -[UIPresentationController presentedView](self, "presentedView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController backdropView](self, "backdropView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dismissActionView](self, "dismissActionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController dimmingView](self, "dimmingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "coordinateSpace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSheetCompactPresentationController _currentLayoutGeometry](self, "_currentLayoutGeometry");
  UIActionSheetPresentationControllerAdjustForKeyboardNotification(v14, v15, v16, v17, v18, v22, v25, a6, v12, v11, v10, v9, x, y, width, height, a5);

}

- (void)setDismissActionTitle:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v4 = &stru_1E16EDF20;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissActionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (NSString)dismissActionTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)beginPseudoAlertPresentationMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGRect v7;

  -[UIPresentationController presentedView](self, "presentedView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UIPresentationController _isAdapted](self, "_isAdapted"))
  {
    objc_msgSend(v6, "frame");
    self->_pseudoAlertPreferredTop = CGRectGetMinY(v7);
  }
  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[_UIActionSheetCompactPresentationController dimmingViewDismissTapGestureRecognizer](self, "dimmingViewDismissTapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

}

- (void)endPseudoAlertPresentationMode
{
  void *v3;
  void *v4;
  id v5;

  self->_pseudoAlertPreferredTop = -1.0;
  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[_UIActionSheetCompactPresentationController dimmingViewDismissTapGestureRecognizer](self, "dimmingViewDismissTapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesShortCompactVerticalLayout:", v3);

}

- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically
{
  void *v2;
  void *v3;
  char v4;

  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesShortCompactVerticalLayout");

  return v4;
}

- (void)_dismiss
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIActionSheetCompactPresentationController *v8;

  -[_UIActionSheetCompactPresentationController actionSheetDelegate](self, "actionSheetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___UIActionSheetCompactPresentationController__dismiss__block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v3;
  v8 = self;
  v5 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)_handleDismiss:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[_UIActionSheetCompactPresentationController dismissActionView](self, "dismissActionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v8);
  v5 = objc_msgSend(v8, "pointInside:withEvent:", 0);
  v6 = objc_msgSend(v4, "state");

  switch(v6)
  {
    case 1:
      v7 = 1;
      goto LABEL_7;
    case 2:
      v7 = v5;
      goto LABEL_7;
    case 3:
      objc_msgSend(v8, "setHighlighted:", 0);
      if ((_DWORD)v5)
        -[_UIActionSheetCompactPresentationController _dismiss](self, "_dismiss");
      break;
    case 4:
    case 5:
      v7 = 0;
LABEL_7:
      objc_msgSend(v8, "setHighlighted:", v7);
      break;
    default:
      break;
  }

}

- ($12108E44556860A125E570C4E6FEF4BB)_currentLayoutGeometry
{
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  $12108E44556860A125E570C4E6FEF4BB *result;
  id v24;

  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2.origin = 0u;
  retstr->var2.size = 0u;
  retstr->var3 = 0u;
  *(_OWORD *)&retstr->var4.top = 0u;
  *(_OWORD *)&retstr->var4.bottom = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  retstr->var8 = 0u;
  retstr->var0 = -[_UIActionSheetCompactPresentationController shouldAdoptPresentedAppearance](self, "shouldAdoptPresentedAppearance");
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  retstr->var2.origin.x = v6;
  retstr->var2.origin.y = v7;
  retstr->var2.size.width = v8;
  retstr->var2.size.height = v9;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSize");
  retstr->var3.width = v11;
  retstr->var3.height = v12;

  -[_UIActionSheetCompactPresentationController pseudoAlertPreferredTop](self, "pseudoAlertPreferredTop");
  retstr->var1 = v13;
  -[UIPresentationController containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentInsetsForContainerView:", v14);
  retstr->var4.top = v15;
  retstr->var4.left = v16;
  retstr->var4.bottom = v17;
  retstr->var4.right = v18;

  objc_msgSend(v24, "dismissToContentSpacing");
  retstr->var5 = v19;
  -[_UIActionSheetCompactPresentationController _minimumSizeForDismissButton](self, "_minimumSizeForDismissButton");
  retstr->var8.width = v20;
  retstr->var8.height = v21;
  -[_UIActionSheetCompactPresentationController dismissActionView](self, "dismissActionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var7 = objc_msgSend(v22, "isHidden");

  retstr->var6 = -[_UIActionSheetCompactPresentationController _shouldDisableAvoidsKeyboard](self, "_shouldDisableAvoidsKeyboard");
  return result;
}

- (BOOL)_shouldDisableAvoidsKeyboard
{
  char v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;
  void *v8;
  int v9;

  if (-[_UIActionSheetCompactPresentationController avoidsKeyboardDisabled](self, "avoidsKeyboardDisabled"))
    return 1;
  -[UIPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = objc_msgSend(v5, "_isSceneSized");
  if (UIKeyboardAutomaticIsOnScreen())
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "keyboardActive") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  v3 = isKindOfClass & v7 & v9;

  return v3;
}

- (CGSize)_minimumSizeForDismissButton
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIActionSheetCompactPresentationController visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)_resizeAnimationDuration
{
  return 0.35;
}

- (BOOL)avoidsKeyboardDisabled
{
  return self->_avoidsKeyboardDisabled;
}

- (void)setAvoidsKeyboardDisabled:(BOOL)a3
{
  self->_avoidsKeyboardDisabled = a3;
}

- (_UIActionSheetCompactPresentationControllerDelegate)actionSheetDelegate
{
  return (_UIActionSheetCompactPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionSheetDelegate);
}

- (void)setActionSheetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionSheetDelegate, a3);
}

- (BOOL)shouldAdoptPresentedAppearance
{
  return self->_shouldAdoptPresentedAppearance;
}

- (void)setShouldAdoptPresentedAppearance:(BOOL)a3
{
  self->_shouldAdoptPresentedAppearance = a3;
}

- (UIActionSheetPresentationControllerDismissActionView)dismissActionView
{
  return self->_dismissActionView;
}

- (void)setDismissActionView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissActionView, a3);
}

- (UILongPressGestureRecognizer)dismissActionViewGestureRecognizer
{
  return self->_dismissActionViewGestureRecognizer;
}

- (void)setDismissActionViewGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissActionViewGestureRecognizer, a3);
}

- (UITapGestureRecognizer)dimmingViewDismissTapGestureRecognizer
{
  return self->_dimmingViewDismissTapGestureRecognizer;
}

- (void)setDimmingViewDismissTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingViewDismissTapGestureRecognizer, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (_UIDimmingKnockoutBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (_UIAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (void)setAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_animationCoordinator, a3);
}

- (UIActionSheetPresentationControllerVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (double)pseudoAlertPreferredTop
{
  return self->_pseudoAlertPreferredTop;
}

- (void)setPseudoAlertPreferredTop:(double)a3
{
  self->_pseudoAlertPreferredTop = a3;
}

- (BOOL)hasPendingAnimatedLayout
{
  return self->_hasPendingAnimatedLayout;
}

- (void)setHasPendingAnimatedLayout:(BOOL)a3
{
  self->_hasPendingAnimatedLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_animationCoordinator, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dimmingViewDismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissActionViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissActionView, 0);
  objc_destroyWeak((id *)&self->_actionSheetDelegate);
}

@end
