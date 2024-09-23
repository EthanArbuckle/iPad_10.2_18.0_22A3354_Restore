@implementation _UIFullscreenPresentationController

- (int64_t)presentationStyle
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIFullscreenPresentationController _removeCounterRotationIfApplied](self, "_removeCounterRotationIfApplied");
  v3.receiver = self;
  v3.super_class = (Class)_UIFullscreenPresentationController;
  -[UIPresentationController dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_invokesDelegatesOnOrientationChange
{
  return dyld_program_sdk_at_least();
}

- (void)_adjustOrientationIfNecessaryInWindow:(id)a3 forViewController:(id)a4 preservingViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t presentingViewControllerHandledCounterRotation;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t originalOrientation;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  int v27;
  void *v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  presentingViewControllerHandledCounterRotation = -[UIPresentationController state](self, "state");
  if (presentingViewControllerHandledCounterRotation == 1)
    self->_originalOrientation = objc_msgSend(v8, "interfaceOrientation");
  self->_disableAnimatedReenablingOfAutorotation = 0;
  if (objc_msgSend(v8, "_isWindowServerHostingManaged") && objc_msgSend(v8, "autorotates"))
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v38 = objc_msgSend((id)UIApp, "_expectedViewOrientation");
    if (v10 && presentingViewControllerHandledCounterRotation == 1)
    {
      v12 = v36[3];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke;
      v34[3] = &unk_1E16BFBF0;
      v34[4] = &v35;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v10, v12, v34);
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v13 = objc_msgSend(v8, "interfaceOrientation");
    v14 = v36[3];
    if (v13 != v14)
    {
      if (!v14)
      {
        if (dyld_program_sdk_at_least())
        {
          v14 = v36[3];
        }
        else
        {
          v14 = objc_msgSend((id)UIApp, "_expectedViewOrientation");
          v36[3] = v14;
        }
      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke_2;
      v29[3] = &unk_1E16BFC18;
      v29[4] = &v30;
      v29[5] = &v35;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v9, v14, v29);
    }
    if (!v31[3])
    {
      v15 = -[UIViewController _preferredInterfaceOrientationForPresentationInWindow:fromInterfaceOrientation:](v9, v8, v13);
      v31[3] = v15;
    }
    if (presentingViewControllerHandledCounterRotation != 1)
    {
      if (-[_UIFullscreenPresentationController _invokesDelegatesOnOrientationChange](self, "_invokesDelegatesOnOrientationChange"))
      {
        -[UIPresentationController presentedViewController](self, "presentedViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "supportedInterfaceOrientations");

        originalOrientation = self->_originalOrientation;
        if (originalOrientation > 4 || (v17 & qword_18667A110[originalOrientation]) != 0)
        {
          v19 = v31[3];
          switch(v19)
          {
            case 0:
              v20 = v17 & 1;
              v21 = 1;
              break;
            case 1:
              v20 = v17 & 2;
              v21 = 2;
              break;
            case 2:
              v20 = v17 & 4;
              v21 = 4;
              break;
            case 3:
              v20 = v17 & 8;
              v21 = 8;
              break;
            case 4:
              v20 = v17 & 0x10;
              v21 = 16;
              break;
            default:
              v20 = 0;
              v21 = 0;
              break;
          }
          v22 = v20 == v21;
        }
        else
        {
          v22 = 0;
          v19 = v31[3];
        }
        presentingViewControllerHandledCounterRotation = 1;
        if (v19 != originalOrientation && !v22)
          presentingViewControllerHandledCounterRotation = self->_presentingViewControllerHandledCounterRotation;
      }
      else
      {
        presentingViewControllerHandledCounterRotation = 1;
      }
    }
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23 == v10)
      objc_msgSend(v10, "_setFreezeLayoutForOrientationChangeOnDismissal:", 1);
    objc_msgSend(v8, "windowScene");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIScene _systemShellOwnsInterfaceOrientation](v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v8, "windowScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "_canDynamicallySpecifySupportedInterfaceOrientations");

      if (v27)
        -[_UIFullscreenPresentationController _prepareForMixedOrientationTransitionIfNecessaryInWindow:fromViewController:toViewController:](self, "_prepareForMixedOrientationTransitionIfNecessaryInWindow:fromViewController:toViewController:", v8, v10, v9);
    }
    else
    {
      objc_msgSend(v10, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFullscreenPresentationController _placeCounterRotationViewWithView:inWindow:fromOrientation:toOrientation:force:](self, "_placeCounterRotationViewWithView:inWindow:fromOrientation:toOrientation:force:", v28, v8, v13, v31[3], presentingViewControllerHandledCounterRotation);

    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v35, 8);
  }

}

- (void)_prepareForMixedOrientationTransitionIfNecessaryInWindow:(id)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  objc_class *v25;
  void *v26;
  __CFString *v27;
  id v28;
  void *v29;
  objc_class *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  _UIForcedOrientationTransactionToken *v34;
  _UIForcedOrientationTransactionToken *forcedOrientationToken;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;

  v39 = a3;
  v8 = a4;
  v9 = a5;
  -[_UIFullscreenPresentationController _removeCounterRotationIfApplied](self, "_removeCounterRotationIfApplied");
  v10 = -[_UICurrentContextPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
  if (v10)
  {
    objc_msgSend(v8, "_willBeginCounterRotationForPresentation");
    if (-[UIPresentationController state](self, "state") == 1)
      self->_presentingViewControllerHandledCounterRotation = objc_msgSend(v8, "_handlesCounterRotationForPresentation");
  }
  v11 = objc_msgSend(v39, "interfaceOrientation");
  objc_msgSend(v8, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)MEMORY[0x1E0CB3940];
  _NSStringForUIPresentationControllerState(-[UIPresentationController state](self, "state"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = CFSTR("(nil)");
  }

  v28 = v9;
  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p>"), v31, v28);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = CFSTR("(nil)");
  }

  objc_msgSend(v21, "stringWithFormat:", CFSTR("Fullscreen transition (%@): fromVC=%@; toVC=%@;"), v22, v27, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "_adjustWindowOrientationForTransitionWithSupportedOrientations:preferredOrientation:reason:", objc_msgSend(v28, "__supportedInterfaceOrientations"), objc_msgSend(v28, "preferredInterfaceOrientationForPresentation"), v33);
  v34 = (_UIForcedOrientationTransactionToken *)objc_claimAutoreleasedReturnValue();
  forcedOrientationToken = self->_forcedOrientationToken;
  self->_forcedOrientationToken = v34;

  self->_disableAnimatedReenablingOfAutorotation = 1;
  v36 = objc_msgSend(v39, "interfaceOrientation");
  if (v10)
  {
    v37 = v36;
    if (v11 == v36)
    {
      objc_msgSend(v23, "_didEndCounterRotationForPresentation");
    }
    else
    {
      objc_msgSend(v23, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFullscreenPresentationController _applyCounterRotationToView:fromOrientation:toOrientation:withBounds:](self, "_applyCounterRotationToView:fromOrientation:toOrientation:withBounds:", v38, v11, v37, v14, v16, v18, v20);

    }
  }

}

- (void)_placeCounterRotationViewWithView:(id)a3 inWindow:(id)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6 force:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  int64_t originalOrientation;
  void *v15;
  id finalRotationBlock;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  int64_t v30;
  BOOL v31;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  if (a6 == a5)
  {
    if (!v7)
    {
      -[_UIFullscreenPresentationController _removeCounterRotationIfApplied](self, "_removeCounterRotationIfApplied");
      originalOrientation = self->_originalOrientation;
      if (originalOrientation)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __118___UIFullscreenPresentationController__placeCounterRotationViewWithView_inWindow_fromOrientation_toOrientation_force___block_invoke;
        v27[3] = &unk_1E16BFC40;
        v28 = v13;
        v29 = originalOrientation;
        v30 = a6;
        v31 = v7;
        v15 = (void *)objc_msgSend(v27, "copy");
        finalRotationBlock = self->_finalRotationBlock;
        self->_finalRotationBlock = v15;

      }
    }
  }
  else
  {
    -[_UIFullscreenPresentationController _removeCounterRotationIfApplied](self, "_removeCounterRotationIfApplied");
    objc_msgSend(v12, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (-[_UICurrentContextPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView"))
    {
      -[UIView __viewDelegate]((id *)v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_willBeginCounterRotationForPresentation");

      if (-[UIPresentationController state](self, "state") == 1)
      {
        -[UIView __viewDelegate]((id *)v12);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        self->_presentingViewControllerHandledCounterRotation = objc_msgSend(v26, "_handlesCounterRotationForPresentation");

      }
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)v13, a6, 1, v7, 0.0);
      -[_UIFullscreenPresentationController _applyCounterRotationToView:fromOrientation:toOrientation:withBounds:](self, "_applyCounterRotationToView:fromOrientation:toOrientation:withBounds:", v12, a5, a6, v18, v20, v22, v24);
    }
    else
    {
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)v13, a6, 1, v7, 0.0);
    }
  }

}

- (void)_applyCounterRotationToView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 withBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  UIView *v13;
  UIView *v14;
  double v15;
  double v16;
  double v17;
  UIView *counterRotatedView;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = (UIView *)a3;
  v14 = v13;
  memset(&v22, 0, sizeof(v22));
  if (v13)
    -[UIView transform](v13, "transform");
  v15 = 0.0;
  v16 = 0.0;
  if (a4 != 1)
  {
    if (a4 == 3)
    {
      v16 = 1.57079633;
    }
    else if (a4 == 4)
    {
      v16 = -1.57079633;
    }
    else
    {
      v16 = 3.14159265;
      if (a4 != 2)
        v16 = 0.0;
    }
  }
  if (a5 != 1)
  {
    if (a5 == 3)
    {
      v15 = 1.57079633;
    }
    else if (a5 == 4)
    {
      v15 = -1.57079633;
    }
    else
    {
      v15 = 3.14159265;
      if (a5 != 2)
        v15 = 0.0;
    }
  }
  v17 = v16 - v15;
  v20 = v22;
  CGAffineTransformRotate(&v21, &v20, v16 - v15);
  v22 = v21;
  v19 = v21;
  -[UIView setTransform:](v14, "setTransform:", &v19);
  self->_counterRotatedAngle = v17;
  self->_counterRotatedOriginalBounds.origin.x = x;
  self->_counterRotatedOriginalBounds.origin.y = y;
  self->_counterRotatedOriginalBounds.size.width = width;
  self->_counterRotatedOriginalBounds.size.height = height;
  -[UIView setBounds:](v14, "setBounds:", x, y, width, height);
  counterRotatedView = self->_counterRotatedView;
  self->_counterRotatedView = v14;

}

- (void)_removeCounterRotationIfApplied
{
  UIView *counterRotatedView;
  CGFloat v4;
  void *v5;
  UIView *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  counterRotatedView = self->_counterRotatedView;
  if (counterRotatedView)
  {
    memset(&v10, 0, sizeof(v10));
    -[UIView transform](counterRotatedView, "transform");
    v4 = -self->_counterRotatedAngle;
    v8 = v10;
    CGAffineTransformRotate(&v9, &v8, v4);
    v10 = v9;
    v7 = v9;
    -[UIView setTransform:](self->_counterRotatedView, "setTransform:", &v7);
    -[UIView setBounds:](self->_counterRotatedView, "setBounds:", self->_counterRotatedOriginalBounds.origin.x, self->_counterRotatedOriginalBounds.origin.y, self->_counterRotatedOriginalBounds.size.width, self->_counterRotatedOriginalBounds.size.height);
    -[UIView __viewDelegate]((id *)&self->_counterRotatedView->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didEndCounterRotationForPresentation");

    v6 = self->_counterRotatedView;
    self->_counterRotatedView = 0;

  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[_UIFullscreenPresentationController _transitionDidEnd:isDismissal:](self, "_transitionDidEnd:isDismissal:", a3, 0);
  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  -[UIPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_, v3);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[_UIFullscreenPresentationController _transitionDidEnd:isDismissal:](self, "_transitionDidEnd:isDismissal:", a3, 1);
  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  -[UIPresentationController dismissalTransitionDidEnd:](&v5, sel_dismissalTransitionDidEnd_, v3);
}

- (void)_transitionDidEnd:(BOOL)a3 isDismissal:(BOOL)a4
{
  _BOOL4 v4;
  _UIForcedOrientationTransactionToken *forcedOrientationToken;
  BOOL v7;
  _UIForcedOrientationTransactionToken *v8;
  void (**finalRotationBlock)(void);
  id v10;
  _UIForcedOrientationTransactionToken *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  id location;

  v4 = a4;
  forcedOrientationToken = self->_forcedOrientationToken;
  if (forcedOrientationToken)
    v7 = !a3;
  else
    v7 = 1;
  if (v7)
  {
    if (forcedOrientationToken)
    {
      -[_UIForcedOrientationTransactionToken cancel](forcedOrientationToken, "cancel", a3);
      v8 = self->_forcedOrientationToken;
      self->_forcedOrientationToken = 0;

    }
    -[_UIFullscreenPresentationController _removeCounterRotationIfApplied](self, "_removeCounterRotationIfApplied", a3);
    if (v4)
    {
      finalRotationBlock = (void (**)(void))self->_finalRotationBlock;
      if (finalRotationBlock)
      {
        finalRotationBlock[2]();
        v10 = self->_finalRotationBlock;
        self->_finalRotationBlock = 0;

      }
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setFreezeLayoutForOrientationChangeOnDismissal:", 0);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = self->_forcedOrientationToken;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69___UIFullscreenPresentationController__transitionDidEnd_isDismissal___block_invoke;
    v13[3] = &unk_1E16BFC68;
    objc_copyWeak(&v14, &location);
    v15 = v4;
    -[_UIForcedOrientationTransactionToken commitAnimated:completionBlock:](v11, "commitAnimated:completionBlock:", 0, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_setPresentedViewController:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  v3 = a3;
  -[UIPresentationController _setPresentedViewController:](&v5, sel__setPresentedViewController_, v3);
  objc_msgSend(v3, "view", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "_wantsAutolayout")
    || objc_msgSend(v4, "translatesAutoresizingMaskIntoConstraints"))
  {
    objc_msgSend(v4, "setAutoresizingMask:", 18);
  }

}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 0;
}

- (BOOL)_shouldAnimateReenablingOfAutorotation
{
  return !self->_disableAnimatedReenablingOfAutorotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedOrientationToken, 0);
  objc_storeStrong(&self->_finalRotationBlock, 0);
  objc_storeStrong((id *)&self->_counterRotatedView, 0);
}

@end
