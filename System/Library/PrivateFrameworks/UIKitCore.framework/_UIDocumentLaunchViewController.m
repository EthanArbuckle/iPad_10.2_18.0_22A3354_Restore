@implementation _UIDocumentLaunchViewController

- (void)initWithConfiguration:(void *)a1
{
  void *v2;
  id v4;
  void *v6;
  objc_super v7;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithConfiguration_, v2, CFSTR("_UIDocumentLaunchViewController.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    v7.receiver = v2;
    v7.super_class = (Class)_UIDocumentLaunchViewController;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    v2 = v4;
    if (v4)
    {
      -[_UIDocumentLaunchViewController setConfiguration:]((uint64_t)v4, a2);
      objc_msgSend(v2, "setDefinesPresentationContext:", 1);
    }
  }
  return v2;
}

- (void)setConfiguration:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  id *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  if (a1)
  {
    v2 = obj;
    if (!obj)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_setConfiguration_, a1, CFSTR("_UIDocumentLaunchViewController.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong((id *)(a1 + 1096), (id)v2);
    *(_BYTE *)(a1 + 1088) |= 0x10u;
    objc_msgSend((id)a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    if (v2)
    {
      v5 = *(_BYTE *)(a1 + 1088) & 1;
      if (*(_BYTE *)(v2 + 8))
      {
        v6 = *(_QWORD *)(v2 + 32);
        v7 = (v6 >> 3) & 1;
        if ((*(_BYTE *)(a1 + 1088) & 1) == 0)
          LODWORD(v7) = 0;
        if ((v6 & 1) != 0)
          v2 = v7;
        else
          v2 = 1;
      }
      else
      {
        v2 = 0;
      }
    }
    else
    {
      v5 = *(_BYTE *)(a1 + 1088) & 1;
    }
    objc_msgSend((id)a1, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", v2);

    objc_msgSend((id)a1, "parentViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_msgSend(v19, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "view");
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIView _backing_clientLayer](v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v12, v13, -2, (uint64_t)v15);

    }
    if ((((v5 == 0) ^ v2) & 1) == 0)
    {
      *(_BYTE *)(a1 + 1088) = *(_BYTE *)(a1 + 1088) & 0xFE | v2;
      objc_msgSend((id)a1, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = *(_BYTE *)(a1 + 1088);

        if ((v17 & 8) == 0)
        {
          if ((_DWORD)v2)
            -[_UIDocumentLaunchViewController _presentBrowserViewController](a1);
          else
            -[_UIDocumentLaunchViewController _dismissBrowserViewController](a1);
        }
      }
    }

  }
}

- (void)_presentBrowserViewController
{
  id v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[10];

  if (a1)
  {
    v2 = *(id *)(a1 + 1016);
    v3 = *(_QWORD **)(a1 + 1096);
    if (v3)
      v3 = (_QWORD *)v3[6];
    v4 = v3;
    objc_msgSend(v4, "presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDelegate:", v6);

    objc_msgSend(v4, "_setOverrideTransitioningDelegate:", a1);
    objc_msgSend(v4, "_setOverrideUseCustomPresentation:", 1);
    objc_msgSend(v4, "presentationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__presentBrowserViewController, a1, CFSTR("_UIDocumentLaunchViewController.m"), 515, CFSTR("Attempted to present browser view controller with an unexpected presentation controller: %@"), v11);

    }
    _UIDocumentUnavailableBrowserViewController(*(_QWORD *)(a1 + 1096));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_prepareForPresentingInUIPDocumentLanding");
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64___UIDocumentLaunchViewController__presentBrowserViewController__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = a1;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
    objc_msgSend(*(id *)(a1 + 1008), "presentViewController:animated:completion:", v4, 1, 0);
    v12[5] = v9;
    v12[6] = 3221225472;
    v12[7] = ___uip_documentBrowser_sendAnalyticsEvent_block_invoke;
    v12[8] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v12[9] = 1;
    AnalyticsSendEventLazy();

  }
}

- (void)_dismissBrowserViewController
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (a1)
  {
    v2 = *(_QWORD **)(a1 + 1096);
    if (v2)
      v2 = (_QWORD *)v2[6];
    v3 = v2;
    objc_msgSend(v3, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      v6 = *(id *)(a1 + 1008);
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke;
      v9[3] = &unk_1E16B1B28;
      v10 = v6;
      v7 = v6;
      -[_UIDocumentLaunchViewController _prepareDocumentAnimationInfoWithCompletion:]((uint64_t *)a1, (uint64_t)v9);

    }
    else
    {
      objc_msgSend(v3, "_cancelDelayedPresentation:", 0);
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_3;
      v8[3] = &unk_1E16B1B28;
      v8[4] = a1;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", !-[_UIDocumentLaunchViewController _isParentViewControllerDisappearedOrAppearing]((void *)a1), &__block_literal_global_552, v8, 0);
    }
    v11 = v5;
    v12 = 3221225472;
    v13 = ___uip_documentBrowser_sendAnalyticsEvent_block_invoke;
    v14 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v15 = 2;
    AnalyticsSendEventLazy();

  }
}

- (void)browserPresentationControllerDidInvalidateSheetDetentValues:(id)a3
{
  id v3;

  -[UIViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)browserPresentationControllerDidInvalidateUntransformedFrame:(id)a3
{
  id v3;

  -[UIViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)browserPresentationControllerPerformLayout:(id)a3
{
  id v3;

  -[UIViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)browserPresentationControllerPresentationTransitionWillBegin:(id)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  -[UIView setHidden:](self->_animationInteractionView, "setHidden:", 0);
}

- (void)browserPresentationControllerPresentationTransitionDidEnd:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  *(_BYTE *)&self->_flags &= ~8u;
  -[UIView setHidden:](self->_animationInteractionView, "setHidden:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~4u;
  }
  else
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __93___UIDocumentLaunchViewController_browserPresentationControllerPresentationTransitionDidEnd___block_invoke;
    v4[3] = &unk_1E16B3F40;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)browserPresentationControllerDismissalTransitionWillBegin:(id)a3
{
  unint64_t v5;
  NSObject *v6;
  _UIDocumentUnavailableConfiguration *configuration;
  NSObject *v8;
  UIViewController *browserViewController;
  UIViewController *v10;
  int v11;
  UIViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_flags |= 8u;
  -[UIView setHidden:](self->_animationInteractionView, "setHidden:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags |= 4u;
    v5 = browserPresentationControllerDismissalTransitionWillBegin____s_category;
    if (!browserPresentationControllerDismissalTransitionWillBegin____s_category)
    {
      v5 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&browserPresentationControllerDismissalTransitionWillBegin____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      configuration = self->_configuration;
      v8 = v6;
      if (configuration)
        browserViewController = configuration->_browserViewController;
      else
        browserViewController = 0;
      v10 = browserViewController;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "A visible UIDocumentBrowserViewController was asked to dismiss unexpectedly. Avoid calling -[UIViewController dismissViewControllerAnimated:completion:] when this browser view controller is used within a UIDocumentViewControllerLaunchOptions context. Browser view controller: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    objc_msgSend(a3, "_sendWillDismiss");
  }
}

- (void)browserPresentationControllerDismissalTransitionDidEnd:(id)a3
{
  _QWORD v5[4];
  id v6;
  id location;

  *(_BYTE *)&self->_flags &= ~8u;
  -[UIView setHidden:](self->_animationInteractionView, "setHidden:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __90___UIDocumentLaunchViewController_browserPresentationControllerDismissalTransitionDidEnd___block_invoke;
    v5[3] = &unk_1E16B3F40;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    *(_BYTE *)&self->_flags &= ~4u;
    objc_msgSend(a3, "_sendDidDismiss");
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v8;
  _UIDocumentUnavailableBrowserPresentationController *v9;

  configuration = self->_configuration;
  if (configuration)
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  v8 = configuration;

  if (v8 == a3)
    v9 = self->_browserPresentationController;
  else
    v9 = 0;
  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v8;
  _UIDocumentLaunchViewController *v9;

  configuration = self->_configuration;
  if (configuration)
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  v8 = configuration;

  if (v8 == a3)
  {
    *(_BYTE *)&self->_flags |= 2u;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v6;
  _UIDocumentLaunchViewController *v7;

  configuration = self->_configuration;
  if (configuration)
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  v6 = configuration;

  if (v6 == a3)
  {
    *(_BYTE *)&self->_flags &= ~2u;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id location;

  -[_UIDocumentLaunchViewController interruptibleAnimatorForTransition:](self, "interruptibleAnimatorForTransition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __53___UIDocumentLaunchViewController_animateTransition___block_invoke;
  v12 = &unk_1E16BFAE0;
  objc_copyWeak(&v15, &location);
  v13 = a3;
  v6 = v5;
  v14 = v6;
  v7 = _Block_copy(&v9);
  v8 = v7;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    objc_msgSend(v6, "pauseAnimation", v9, v10, v11, v12, v13);
    -[_UIDocumentLaunchViewController _prepareDocumentAnimationInfoWithCompletion:]((uint64_t *)self, (uint64_t)v8);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_prepareDocumentAnimationInfoWithCompletion:(uint64_t *)a1
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD v14[5];
  id v15;
  id location;

  if (a1)
  {
    _UIDocumentUnavailableBrowserViewController(a1[137]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)a1[137];
    if (v5)
      v5 = (_QWORD *)v5[3];
    v6 = v5;
    v7 = v6;
    if (v4)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
      goto LABEL_13;
    v9 = (_QWORD *)a1[137];
    if (v9)
      v9 = (_QWORD *)v9[10];
    v10 = v9;

    v11 = a1[137];
    v12 = v11 ? *(_QWORD *)(v11 + 32) & 4 : 0;
    if (_AXSReduceMotionEnabled()
      || (v13 = _AXSReduceMotionReduceSlideTransitionsEnabled(), !v10)
      || v12
      || v13)
    {
LABEL_13:
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    else
    {
      objc_initWeak(&location, a1);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79___UIDocumentLaunchViewController__prepareDocumentAnimationInfoWithCompletion___block_invoke;
      v14[3] = &unk_1E16E5420;
      objc_copyWeak(&v15, &location);
      v14[4] = a2;
      objc_msgSend(v4, "_requestAnimationInfoForDocumentAtURL:completion:", v7, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  UIViewPropertyAnimator **p_transitionAnimator;
  UIViewPropertyAnimator *v6;
  UISpringTimingParameters *v7;
  UIViewPropertyAnimator *v8;

  p_transitionAnimator = &self->_transitionAnimator;
  v6 = self->_transitionAnimator;
  if (!v6)
  {
    v7 = -[UISpringTimingParameters initWithDampingRatio:response:]([UISpringTimingParameters alloc], "initWithDampingRatio:response:", 1.0, 0.4);
    v8 = [UIViewPropertyAnimator alloc];
    -[_UIDocumentLaunchViewController transitionDuration:](self, "transitionDuration:", a3);
    v6 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", v7);
    objc_storeStrong((id *)p_transitionAnimator, v6);

  }
  return v6;
}

- (void)animationEnded:(BOOL)a3
{
  _UIMagicMorphAnimation *morphAnimation;
  DOCAnimatableInfo *documentAnimationInfo;
  UIViewPropertyAnimator *transitionAnimator;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", a3, 0.0);
    -[UIView setAlpha:](self->_contentContainerView, "setAlpha:", 0.0);
  }
  morphAnimation = self->_morphAnimation;
  self->_morphAnimation = 0;

  documentAnimationInfo = self->_documentAnimationInfo;
  self->_documentAnimationInfo = 0;

  transitionAnimator = self->_transitionAnimator;
  self->_transitionAnimator = 0;

}

- (void)_updateParentNavigationBarVisibility:(void *)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "parentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      objc_msgSend(v7, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_preferredNavigationBarVisibility");

      if (!v5)
      {
LABEL_6:

        return;
      }
    }
    objc_msgSend(v7, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setPreferredNavigationBarVisibility:", a2);

    goto LABEL_6;
  }
}

- (BOOL)_isParentViewControllerDisappearedOrAppearing
{
  _QWORD *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "parentViewController");
  v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (v1[46] & 4) == 0;
  else
    v2 = 1;

  return v2;
}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _UIDocumentUnavailableConfiguration *configuration;
  UIViewController *v10;
  UIViewController *v11;
  _QWORD v12[4];
  UIViewController *v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  -[UIViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childModalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      v10 = configuration->_browserViewController;
      v11 = v5;
      if (v5 == v10)
        goto LABEL_8;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;
    if (!-[UIResponder _containsResponder:](v10, "_containsResponder:", v5))
    {
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60___UIDocumentLaunchViewController__firstResponderDidChange___block_invoke;
    v12[3] = &unk_1E16B1B50;
    v13 = v5;
    v14 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

    v10 = v11;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)loadView
{
  _UIDocumentLaunchView *v3;
  void *v4;
  void *v5;
  _UISystemBackgroundView *v6;
  void *v7;
  _UISystemBackgroundView *v8;
  void *v9;
  void *v10;
  _UISystemBackgroundView *backgroundView;
  _UITouchPassthroughView *v12;
  void *v13;
  _UITouchPassthroughView *v14;
  void *v15;
  _UITouchPassthroughView *contentContainerView;
  _UITouchPassthroughView *v17;
  _UITouchPassthroughView *v18;
  _UITouchPassthroughView *v19;
  _UITouchPassthroughView *pageContainerView;
  _UITouchPassthroughView *v21;
  _UITouchPassthroughView *v22;
  _UITouchPassthroughView *v23;
  _UITouchPassthroughView *backgroundAccessoryContainerView;
  _UITouchPassthroughView *v25;
  _UIDocumentUnavailableTitlePageView *v26;
  _UIDocumentUnavailableTitlePageView *titleView;
  _UIDocumentUnavailableTitlePageView *v28;
  _UITouchPassthroughView *v29;
  _UITouchPassthroughView *v30;
  _UITouchPassthroughView *foregroundAccessoryContainerView;
  _UITouchPassthroughView *v32;
  _UIDocumentUnavailableBrowserContainerViewController *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  _UIDocumentUnavailableBrowserContainerViewController *browserContainerViewController;
  _UIDocumentUnavailableBrowserContainerViewController *v45;
  UIView *v46;
  void *v47;
  UIView *v48;
  void *v49;
  UIView *animationInteractionView;
  UIView *v51;
  void *v52;
  _UIDocumentUnavailableBrowserPresentationController *v53;
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v55;
  _UIDocumentUnavailableBrowserPresentationController *v56;
  _UIDocumentUnavailableBrowserPresentationController *browserPresentationController;
  _UISystemBackgroundView *v58;

  v3 = objc_alloc_init(_UIDocumentLaunchView);
  -[UIViewController setView:](self, "setView:", v3);

  -[UIViewController traitOverrides](self, "traitOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInterfaceLevel:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

  v6 = [_UISystemBackgroundView alloc];
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UISystemBackgroundView initWithConfiguration:](v6, "initWithConfiguration:", v7);

  -[UIView setAlpha:](v8, "setAlpha:", 0.0);
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISystemBackgroundView frameInContainerView:](v8, "frameInContainerView:", v9);
  -[_UISystemBackgroundView setFrame:](v8, "setFrame:");

  -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSubview:atIndex:", v8, 0);

  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;
  v58 = v8;

  v12 = [_UITouchPassthroughView alloc];
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v14 = -[UIView initWithFrame:](v12, "initWithFrame:");

  -[UIView setAlpha:](v14, "setAlpha:", 0.0);
  -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;
  v17 = v14;

  v18 = [_UITouchPassthroughView alloc];
  -[UIView bounds](v17, "bounds");
  v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
  -[UIView setAutoresizingMask:](v19, "setAutoresizingMask:", 18);
  -[UIView _setSafeAreaInsetsFrozen:](v19, "_setSafeAreaInsetsFrozen:", 1);
  -[UIView addSubview:](v17, "addSubview:", v19);
  pageContainerView = self->_pageContainerView;
  self->_pageContainerView = v19;
  v21 = v19;

  v22 = [_UITouchPassthroughView alloc];
  -[UIView bounds](v21, "bounds");
  v23 = -[UIView initWithFrame:](v22, "initWithFrame:");
  -[UIView setAutoresizingMask:](v23, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v21, "addSubview:", v23);
  backgroundAccessoryContainerView = self->_backgroundAccessoryContainerView;
  self->_backgroundAccessoryContainerView = v23;
  v25 = v23;

  v26 = objc_alloc_init(_UIDocumentUnavailableTitlePageView);
  -[UIView addSubview:](v21, "addSubview:", v26);
  titleView = self->_titleView;
  self->_titleView = v26;
  v28 = v26;

  v29 = [_UITouchPassthroughView alloc];
  -[UIView bounds](v21, "bounds");
  v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
  -[UIView setAutoresizingMask:](v30, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v21, "addSubview:", v30);
  foregroundAccessoryContainerView = self->_foregroundAccessoryContainerView;
  self->_foregroundAccessoryContainerView = v30;
  v32 = v30;

  v33 = objc_alloc_init(_UIDocumentUnavailableBrowserContainerViewController);
  -[UIView bounds](v17, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  -[UIViewController view](v33, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

  -[UIViewController view](v33, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v17, "addSubview:", v43);

  -[UIViewController addChildViewController:](self, "addChildViewController:", v33);
  -[UIViewController didMoveToParentViewController:](v33, "didMoveToParentViewController:", self);
  browserContainerViewController = self->_browserContainerViewController;
  self->_browserContainerViewController = v33;
  v45 = v33;

  v46 = [UIView alloc];
  -[UIViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v48 = -[UIView initWithFrame:](v46, "initWithFrame:");

  -[UIView setAutoresizingMask:](v48, "setAutoresizingMask:", 18);
  -[UIView layer](v48, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setHitTestsAsOpaque:", 1);

  -[UIView setHidden:](v48, "setHidden:", 1);
  animationInteractionView = self->_animationInteractionView;
  self->_animationInteractionView = v48;
  v51 = v48;

  -[UIViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", v51);

  v53 = [_UIDocumentUnavailableBrowserPresentationController alloc];
  configuration = self->_configuration;
  if (configuration)
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  v55 = configuration;
  v56 = -[_UIDocumentUnavailableBrowserPresentationController initWithPresentedViewController:presentingViewController:](v53, "initWithPresentedViewController:presentingViewController:", v55, v45);

  if (v56)
    objc_storeWeak((id *)&v56->_browserDelegate, self);
  browserPresentationController = self->_browserPresentationController;
  self->_browserPresentationController = v56;

}

- (void)viewWillLayoutSubviews
{
  int *v3;
  uint64_t v4;
  _UIDocumentUnavailableConfiguration *v5;
  _UIDocumentUnavailableTitlePageView *v6;
  unint64_t documentState;
  id *v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  id v21;
  id v22;
  int v23;
  _BOOL4 v24;
  _UIDocumentUnavailableConfiguration *v25;
  _UIDocumentUnavailableConfiguration *v26;
  _UIDocumentUnavailablePageBackgroundAccessoryView *v27;
  UIView *foregroundAccessoryView;
  id v29;
  UIView *backgroundAccessoryView;
  UIView *v31;
  _UISystemBackgroundView *v32;
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v34;
  int v35;
  _UIDocumentUnavailableConfiguration *v36;
  _UIDocumentUnavailableConfiguration *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  _UIDocumentUnavailableConfiguration *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  CGFloat v70;
  double Width;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  _UIDocumentUnavailableTitlePageView *v92;
  double MidX;
  double *v94;
  double Height;
  double MinY;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  _UIDocumentUnavailableConfiguration *v107;
  double v108;
  double rect;
  double v110;
  double v111;
  objc_super v112;
  _QWORD v113[2];
  id (*v114)(uint64_t, void *);
  void *v115;
  _UIDocumentUnavailableConfiguration *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  _UIDocumentUnavailableConfiguration *v121;
  uint64_t v122;
  double v123;
  uint64_t v124;
  double v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v112.receiver = self;
  v112.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController viewWillLayoutSubviews](&v112, sel_viewWillLayoutSubviews);
  v3 = &OBJC_IVAR___UITableView__dragSourceDelegate;
  v4 = MEMORY[0x1E0C809B0];
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)&self->_flags &= ~0x10u;
    v5 = self->_configuration;
    v6 = self->_titleView;
    if (v5)
      documentState = v5->_documentState;
    else
      LOBYTE(documentState) = 0;
    v113[0] = v4;
    v113[1] = 3221225472;
    v114 = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke;
    v115 = &unk_1E16E5448;
    v116 = v5;
    v117 = v4;
    v118 = 3221225472;
    v119 = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_27;
    v120 = &unk_1E16E5470;
    LOBYTE(v122) = (documentState & 2) != 0;
    BYTE1(v122) = (documentState & 4) != 0;
    v121 = v116;
    v8 = v116;
    v9 = v8;
    if (v5)
    {
      v10 = v8[8];
      __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke((uint64_t)v113, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentUnavailableTitlePageView setPrimaryAction:]((id *)&v6->super.super.super.super.isa, v11);

      v12 = v9[9];
    }
    else
    {
      __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke((uint64_t)v113, 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentUnavailableTitlePageView setPrimaryAction:]((id *)&v6->super.super.super.super.isa, v101);

      v12 = 0;
    }
    v13 = v12;
    v114((uint64_t)v113, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentUnavailableTitlePageView setSecondaryAction:]((id *)&v6->super.super.super.super.isa, v14);

    if (v5)
    {
      v15 = v9[2];
      -[_UIDocumentUnavailableTitlePageView setSecondaryMenu:]((id *)&v6->super.super.super.super.isa, v15);

      v16 = v9[7];
    }
    else
    {
      -[_UIDocumentUnavailableTitlePageView setSecondaryMenu:]((id *)&v6->super.super.super.super.isa, 0);
      v16 = 0;
    }
    v17 = v16;
    -[_UIDocumentUnavailableTitlePageView setTitle:]((id *)&v6->super.super.super.super.isa, v17);

    if (v5)
      v18 = v9[8];
    else
      v18 = 0;
    v19 = v18;
    v20 = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_27((uint64_t)&v117, v19);
    if (v6 && v6->_hasPrimaryProgress != v20)
    {
      v6->_hasPrimaryProgress = v20;
      -[UIView setNeedsLayout](v6, "setNeedsLayout");
    }

    if (v5)
      v21 = v9[9];
    else
      v21 = 0;
    v22 = v21;
    v23 = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_27((uint64_t)&v117, v22);
    if (v6)
    {
      if (v6->_hasSecondaryProgress != v23)
      {
        v6->_hasSecondaryProgress = v23;
        -[UIView setNeedsLayout](v6, "setNeedsLayout");
      }

      v24 = (documentState & 3) == 0;
      if (v6->_actionsEnabled != v24)
      {
        v6->_actionsEnabled = v24;
        -[UIView setNeedsLayout](v6, "setNeedsLayout");
      }
    }
    else
    {

    }
    v25 = self->_configuration;
    v26 = v25;
    v3 = &OBJC_IVAR___UITableView__dragSourceDelegate;
    if (v25)
    {
      v27 = v25->_backgroundAccessoryView;
      foregroundAccessoryView = v26->_foregroundAccessoryView;
    }
    else
    {
      v27 = 0;
      foregroundAccessoryView = 0;
    }
    v29 = foregroundAccessoryView;
    if (!((unint64_t)v27 | (unint64_t)v29))
    {
      v27 = self->_defaultBackgroundAccessoryView;
      if (!v27)
      {
        v27 = objc_alloc_init(_UIDocumentUnavailablePageBackgroundAccessoryView);
        objc_storeStrong((id *)&self->_defaultBackgroundAccessoryView, v27);
      }
    }
    backgroundAccessoryView = self->_backgroundAccessoryView;
    if (backgroundAccessoryView != (UIView *)v27)
    {
      -[UIView removeFromSuperview](backgroundAccessoryView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_backgroundAccessoryView, v27);
    }
    v31 = self->_foregroundAccessoryView;
    if (v31 != v29)
    {
      -[UIView removeFromSuperview](v31, "removeFromSuperview");
      objc_storeStrong((id *)&self->_foregroundAccessoryView, foregroundAccessoryView);
    }

  }
  v32 = self->_backgroundView;
  configuration = self->_configuration;
  if (configuration)
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_background;
  v34 = configuration;
  v35 = -[_UIDocumentUnavailableConfiguration _hasBackgroundFill](v34, "_hasBackgroundFill");

  if (v35)
  {
    v36 = self->_configuration;
    if (v36)
      v36 = (_UIDocumentUnavailableConfiguration *)v36->_background;
    v37 = v36;
    -[_UISystemBackgroundView setConfiguration:](v32, "setConfiguration:", v37);

    +[UIColor clearColor](UIColor, "clearColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", v38);
  }
  else
  {
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBackgroundColor:", v39);

    -[_UISystemBackgroundView setConfiguration:](v32, "setConfiguration:", v38);
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", v40);

  }
  -[UIViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISystemBackgroundView frameInContainerView:](v32, "frameInContainerView:", v41);
  -[_UISystemBackgroundView setFrame:](v32, "setFrame:");

  -[UIViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;

  -[UIViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "layoutMargins");
  v53 = v52;
  v55 = v54;
  v102 = v57;
  v103 = v56;

  -[UIViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "safeAreaInsets");
  v106 = v60;
  v107 = v59;
  v108 = v61;
  v105 = v62;

  -[UIViewController traitCollection](self, "traitCollection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "horizontalSizeClass");

  -[UIViewController traitCollection](self, "traitCollection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "verticalSizeClass");

  _UIDocumentUnavailableBrowserViewController((uint64_t)self->_configuration);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "defaultDocumentAspectRatio");
  v69 = v68;

  v70 = v44;
  v130.origin.x = v44;
  v110 = v48;
  v111 = v46;
  v130.origin.y = v46;
  v130.size.width = v48;
  rect = v50;
  v130.size.height = v50;
  Width = CGRectGetWidth(v130);
  if (v64 == 1)
    v72 = 36.0;
  else
    v72 = 72.0;
  if (v64 == 1)
    v73 = 36.0;
  else
    v73 = 56.0;
  v74 = Width - v55 - v102 - (v72 + v72);
  v75 = v74;
  if (v64 != 1)
  {
    v76 = v69 * 200.0 + 600.0;
    if (v69 <= 0.0)
      v76 = 733.333333;
    if (v74 >= v76)
      v75 = v76;
    else
      v75 = v74;
  }
  v77 = v70;
  v131.origin.x = v70;
  v131.size.width = v110;
  v131.origin.y = v111;
  v131.size.height = rect;
  v78 = CGRectGetHeight(v131) - v53 - v103 - (v73 + v73);
  -[UIViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "_currentScreenScale");
  v81 = UIRectRoundToScale(v55 + v72 + (v74 - v75) * 0.5, v53 + v73, v75, v78, v80);
  v83 = v82;
  v85 = v84;
  v87 = v86;

  v88 = -[_UIDocumentUnavailableBrowserPresentationController smallestDetentValue](self->_browserPresentationController);
  v104 = v88;
  if (v66 == 2)
  {
    v89 = v88;
    v132.origin.x = v77;
    v132.size.width = v110;
    v132.origin.y = v111;
    v132.size.height = rect;
    v90 = CGRectGetHeight(v132) - v89 - v108;
    v133.origin.x = v81;
    v133.origin.y = v83;
    v133.size.width = v85;
    v133.size.height = v87;
    v91 = fmax(CGRectGetMaxY(v133) - v90, 0.0);
  }
  else
  {
    v91 = 0.0;
  }
  v92 = self->_titleView;
  v134.origin.x = v81;
  v134.origin.y = v83;
  v134.size.width = v85;
  v134.size.height = v87;
  MidX = CGRectGetMidX(v134);
  v135.origin.x = v81;
  v135.origin.y = v83;
  v135.size.width = v85;
  v135.size.height = v87;
  -[UIView setCenter:](v92, "setCenter:", MidX, CGRectGetMidY(v135));
  -[UIView setBounds:](v92, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v85, v87);
  if (v92 && vabdd_f64(v92->_bottomInset, v91) > 2.22044605e-16)
  {
    v92->_bottomInset = v91;
    -[UIView setNeedsLayout](v92, "setNeedsLayout");
  }
  v94 = *(double **)((char *)&self->super.super.super.isa + v3[185]);
  if (v94)
  {
    if (v94[55] != v85 || v94[56] != v87)
    {
      v94[55] = v85;
      v94[56] = v87;
      objc_msgSend(v94, "setNeedsLayout");
    }
  }
  v117 = v4;
  v118 = 3221225472;
  v119 = __54___UIDocumentLaunchViewController__layoutContentViews__block_invoke;
  v120 = &__block_descriptor_104_e27_v24__0__UIView_8__UIView_16l;
  v121 = v107;
  v122 = v106;
  v123 = v108;
  v124 = v105;
  v125 = v81;
  v126 = v83;
  v127 = v85;
  v128 = v87;
  v129 = v104;
  v136.origin.x = v77;
  v136.origin.y = v111;
  v136.size.width = v110;
  v136.size.height = rect;
  Height = CGRectGetHeight(v136);
  -[UISheetPresentationController _currentPresentedViewFrame](self->_browserPresentationController, "_currentPresentedViewFrame");
  MinY = CGRectGetMinY(v137);
  if (vabdd_f64(Height, MinY) <= 2.22044605e-16)
    v98 = v108 + v104;
  else
    v98 = Height - MinY;
  v99 = (v108 + v104 - v98) / 3.5;
  v138.origin.x = v77;
  v138.origin.y = v111;
  v138.size.width = v110;
  v138.size.height = rect;
  v100 = CGRectGetMidX(v138);
  v139.origin.x = v77;
  v139.origin.y = v111;
  v139.size.width = v110;
  v139.size.height = rect;
  -[UIView setCenter:](self->_pageContainerView, "setCenter:", v100, CGRectGetMidY(v139) + v99);
  -[UIView setBounds:](self->_pageContainerView, "setBounds:", v77, v111, v110, rect);
  __54___UIDocumentLaunchViewController__layoutContentViews__block_invoke((double *)&v117, self->_backgroundAccessoryView, self->_backgroundAccessoryContainerView);
  __54___UIDocumentLaunchViewController__layoutContentViews__block_invoke((double *)&v117, self->_foregroundAccessoryView, self->_foregroundAccessoryContainerView);

}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewSafeAreaInsetsDidChange
{
  _UITouchPassthroughView *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController viewSafeAreaInsetsDidChange](&v6, sel_viewSafeAreaInsetsDidChange);
  v3 = self->_pageContainerView;
  v4 = -[UIView _safeAreaInsetsFrozen](v3, "_safeAreaInsetsFrozen");
  -[UIView _setSafeAreaInsetsFrozen:](v3, "_setSafeAreaInsetsFrozen:", 0);
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  -[UIView setSafeAreaInsets:](v3, "setSafeAreaInsets:");

  -[UIView _setSafeAreaInsetsFrozen:](v3, "_setSafeAreaInsetsFrozen:", v4);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  -[UIViewController parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != a3)
    -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](self, 0);
}

- (void)didMoveToParentViewController:(id)a3
{
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v6;
  _UIDocumentLaunchViewController *v7;
  _UIDocumentUnavailableBrowserPresentationController *browserPresentationController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController didMoveToParentViewController:](&v9, sel_didMoveToParentViewController_);
  if (!a3)
  {
    configuration = self->_configuration;
    if (configuration)
      configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
    v6 = configuration;
    -[_UIDocumentUnavailableConfiguration _overrideTransitioningDelegate](v6, "_overrideTransitioningDelegate");
    v7 = (_UIDocumentLaunchViewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      -[_UIDocumentUnavailableConfiguration _setOverrideTransitioningDelegate:](v6, "_setOverrideTransitioningDelegate:", 0);
      -[_UIDocumentUnavailableConfiguration _setOverrideUseCustomPresentation:](v6, "_setOverrideUseCustomPresentation:", 0);
    }
    -[UIViewController dismissViewControllerAnimated:completion:](self->_browserContainerViewController, "dismissViewControllerAnimated:completion:", 0, 0);
    browserPresentationController = self->_browserPresentationController;
    self->_browserPresentationController = 0;

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _UIDocumentUnavailableConfiguration *configuration;
  _UIDocumentUnavailableConfiguration *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if ((*(_BYTE *)&self->_flags & 1) != 0 && a3 && (*(_BYTE *)&self->_flags & 8) == 0)
  {
    configuration = self->_configuration;
    if (configuration)
      configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
    v7 = configuration;
    -[_UIDocumentUnavailableConfiguration presentingViewController](v7, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[_UIDocumentLaunchViewController _presentBrowserViewController]((uint64_t)self);
  }
}

- (UIEdgeInsets)_minimumLayoutMarginsForView
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animationInteractionView, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_documentAnimationInfo, 0);
  objc_storeStrong((id *)&self->_morphAnimation, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_pageContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_browserPresentationController, 0);
  objc_storeStrong((id *)&self->_browserContainerViewController, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
