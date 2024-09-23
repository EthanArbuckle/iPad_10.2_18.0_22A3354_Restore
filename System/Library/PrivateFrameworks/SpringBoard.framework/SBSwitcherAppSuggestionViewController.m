@implementation SBSwitcherAppSuggestionViewController

- (void)setShowSuggestions:(BOOL)a3
{
  if (self->_showSuggestions != a3)
  {
    self->_showSuggestions = a3;
    -[SBSwitcherAppSuggestionViewController _updateBottomBannerWithCompletion:](self, "_updateBottomBannerWithCompletion:", 0);
  }
}

- (void)setBestAppSuggestion:(id)a3
{
  -[SBSwitcherAppSuggestionViewController _setBestAppSuggestion:animationCompletion:](self, "_setBestAppSuggestion:animationCompletion:", a3, 0);
}

- (void)_setBestAppSuggestion:(id)a3 animationCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *setSuggestionQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_initWeak(&location, self);
    setSuggestionQueue = self->_setSuggestionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke;
    v9[3] = &unk_1E8EA0510;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(setSuggestionQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (SBBestAppSuggestion)bestAppSuggestion
{
  return self->_bestAppSuggestion;
}

- (void)endPausingSuggestionUpdatesForReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_pauseSuggestionUpdateReasons, "removeObject:", a3);
  -[SBSwitcherAppSuggestionViewController _evaluateSuggestionQueueSuspension](self, "_evaluateSuggestionQueueSuspension");
}

- (void)_setSuggestionQueueSuspended:(BOOL)a3
{
  NSObject *setSuggestionQueue;
  NSObject *v5;
  NSMutableSet *pauseSuggestionUpdateReasons;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  NSMutableSet *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_suggestionQueueSuspended != a3)
  {
    self->_suggestionQueueSuspended = a3;
    setSuggestionQueue = self->_setSuggestionQueue;
    if (a3)
    {
      dispatch_suspend(setSuggestionQueue);
      SBLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        pauseSuggestionUpdateReasons = self->_pauseSuggestionUpdateReasons;
        v10 = 138412290;
        v11 = pauseSuggestionUpdateReasons;
        v7 = "App suggestion queue is now suspended for reasons: %@";
        v8 = v5;
        v9 = 12;
LABEL_7:
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
      }
    }
    else
    {
      dispatch_resume(setSuggestionQueue);
      SBLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        v7 = "App suggestion queue is no longer suspended";
        v8 = v5;
        v9 = 2;
        goto LABEL_7;
      }
    }

  }
}

- (void)_evaluateSuggestionQueueSuspension
{
  -[SBSwitcherAppSuggestionViewController _setSuggestionQueueSuspended:](self, "_setSuggestionQueueSuspended:", -[NSMutableSet count](self->_pauseSuggestionUpdateReasons, "count") != 0);
}

- (void)viewWillLayoutSubviews
{
  SBSwitcherAppSuggestionBannerView *bannerView;

  if (!self->_presentingOrDismissingBanner)
  {
    if (self->_showSuggestions && self->_bestAppSuggestion)
    {
      bannerView = self->_bannerView;
      -[SBSwitcherAppSuggestionViewController _idleOnscreenRectForBottomBanner](self, "_idleOnscreenRectForBottomBanner");
    }
    else
    {
      bannerView = self->_bannerView;
      -[SBSwitcherAppSuggestionViewController _offscreenRectForBottomBanner](self, "_offscreenRectForBottomBanner");
    }
    -[SBSwitcherAppSuggestionBannerView setFrame:](bannerView, "setFrame:");
  }
}

- (CGRect)_offscreenRectForBottomBanner
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  -[SBSwitcherAppSuggestionViewController _idleOnscreenRectForBottomBanner](self, "_idleOnscreenRectForBottomBanner");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[SBSwitcherAppSuggestionViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  MaxY = CGRectGetMaxY(v15);

  v11 = v4;
  v12 = MaxY;
  v13 = v6;
  v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_idleOnscreenRectForBottomBanner
{
  double v3;
  void *v4;
  unint64_t v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  if (-[SBSwitcherAppSuggestionViewController _bannerStyle](self, "_bannerStyle"))
  {
    if (__sb__runningInSpringBoard())
    {
      if (!SBFEffectiveDeviceClass() || (v3 = 14.0, SBFEffectiveDeviceClass() == 1))
      {
        if (SBFEffectiveHomeButtonType() == 2)
          v3 = 21.0;
        else
          v3 = 14.0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 14.0;
      if (!objc_msgSend(v4, "userInterfaceIdiom"))
      {
        if (SBFEffectiveHomeButtonType() == 2)
          v3 = 21.0;
        else
          v3 = 14.0;
      }

    }
  }
  else
  {
    v3 = 7.0;
  }
  v5 = -[SBSwitcherAppSuggestionViewController _bannerStyle](self, "_bannerStyle");
  v6 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (v6)
    {
      if (!SBFEffectiveDeviceClass() || (v7 = 14.0, SBFEffectiveDeviceClass() == 1))
      {
        if (SBFEffectiveHomeButtonType() == 2)
          v7 = 21.0;
        else
          v7 = 14.0;
      }
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 14.0;
    if (!objc_msgSend(v8, "userInterfaceIdiom"))
    {
      if (SBFEffectiveHomeButtonType() == 2)
        v7 = 21.0;
      else
        v7 = 14.0;
    }
LABEL_35:

    goto LABEL_36;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 14.0;
    if (!objc_msgSend(v8, "userInterfaceIdiom"))
    {
      if (SBFEffectiveHomeButtonType() == 2)
        v7 = 58.0;
      else
        v7 = 14.0;
    }
    goto LABEL_35;
  }
  if (!SBFEffectiveDeviceClass() || (v7 = 14.0, SBFEffectiveDeviceClass() == 1))
  {
    if (SBFEffectiveHomeButtonType() == 2)
      v7 = 58.0;
    else
      v7 = 14.0;
  }
LABEL_36:
  -[SBSwitcherAppSuggestionViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetMaxY(v17) + -40.0 - v3;
  -[SBSwitcherAppSuggestionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v18) + v7 * -2.0;

  v13 = 40.0;
  v14 = v7;
  v15 = v10;
  v16 = v12;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)_bannerStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
      return 1;
  }
  -[SBSwitcherAppSuggestionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientationForSuggestionViewController:", self);

  return (unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFDLL;
}

- (SBSwitcherAppSuggestionViewControllerDelegate)delegate
{
  return (SBSwitcherAppSuggestionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableSet removeAllObjects](self->_pauseSuggestionUpdateReasons, "removeAllObjects");
  -[SBSwitcherAppSuggestionViewController _evaluateSuggestionQueueSuspension](self, "_evaluateSuggestionQueueSuspension");
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherAppSuggestionViewController;
  -[SBSwitcherAppSuggestionViewController dealloc](&v3, sel_dealloc);
}

- (void)beginPausingSuggestionUpdatesForReason:(id)a3
{
  -[NSMutableSet addObject:](self->_pauseSuggestionUpdateReasons, "addObject:", a3);
  -[SBSwitcherAppSuggestionViewController _evaluateSuggestionQueueSuspension](self, "_evaluateSuggestionQueueSuspension");
}

void __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke_2;
  block[3] = &unk_1E8EA0510;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_sync(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 121, *(id *)(a1 + 32));
    objc_msgSend(v3, "_updateBottomBannerWithCompletion:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (SBSwitcherAppSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBSwitcherAppSuggestionViewController *v4;
  uint64_t Serial;
  OS_dispatch_queue *setSuggestionQueue;
  NSMutableSet *v7;
  NSMutableSet *pauseSuggestionUpdateReasons;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherAppSuggestionViewController;
  v4 = -[SBSwitcherAppSuggestionViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    Serial = BSDispatchQueueCreateSerial();
    setSuggestionQueue = v4->_setSuggestionQueue;
    v4->_setSuggestionQueue = (OS_dispatch_queue *)Serial;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pauseSuggestionUpdateReasons = v4->_pauseSuggestionUpdateReasons;
    v4->_pauseSuggestionUpdateReasons = v7;

  }
  return v4;
}

- (void)loadView
{
  SBSwitcherAppSuggestionContentView *v3;
  SBSwitcherAppSuggestionContentView *v4;

  v3 = [SBSwitcherAppSuggestionContentView alloc];
  v4 = -[SBSwitcherAppSuggestionContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBSwitcherAppSuggestionViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGestureRecognizer;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherAppSuggestionViewController;
  -[SBSwitcherAppSuggestionViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleBannerTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleLongPress_);
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v5;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.12);
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherAppSuggestionViewController;
  -[SBSwitcherAppSuggestionViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    self->_presentingOrDismissingBanner = 0;
}

- (void)_updateBottomBannerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  SBSwitcherAppSuggestionBannerView *bannerView;
  void *v6;
  char v7;
  SBBestAppSuggestion *bestAppSuggestion;
  SBBestAppSuggestion *v9;
  void (**v10)(id, _QWORD);
  void (**v11)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  bannerView = self->_bannerView;
  v11 = v4;
  if (!self->_showSuggestions)
  {
    if (bannerView)
    {
      -[SBSwitcherAppSuggestionViewController _animateOutAndRemoveCurrentBottomBannerWithCompletion:](self, "_animateOutAndRemoveCurrentBottomBannerWithCompletion:");
LABEL_17:
      v4 = v11;
      goto LABEL_18;
    }
    goto LABEL_7;
  }
  if (!bannerView)
  {
    bestAppSuggestion = self->_bestAppSuggestion;
    if (bestAppSuggestion)
    {
LABEL_16:
      -[SBSwitcherAppSuggestionViewController _insertAndAnimateInBottomBannerForSuggestion:completion:](self, "_insertAndAnimateInBottomBannerForSuggestion:completion:", bestAppSuggestion, v11);
      goto LABEL_17;
    }
  }
  -[SBSwitcherAppSuggestionBannerView representedAppSuggestion](bannerView, "representedAppSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_bestAppSuggestion);

  if ((v7 & 1) == 0)
  {
    v9 = self->_bestAppSuggestion;
    if (v9)
      v10 = 0;
    else
      v10 = v11;
    -[SBSwitcherAppSuggestionViewController _animateOutAndRemoveCurrentBottomBannerWithCompletion:](self, "_animateOutAndRemoveCurrentBottomBannerWithCompletion:", v10);
    v4 = v11;
    if (!v9)
      goto LABEL_18;
    bestAppSuggestion = self->_bestAppSuggestion;
    goto LABEL_16;
  }
  v4 = v11;
LABEL_7:
  if (v4)
  {
    v4[2](v4, 0);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_insertAndAnimateInBottomBannerForSuggestion:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SBSwitcherAppSuggestionBannerView *v13;
  SBSwitcherAppSuggestionBannerView *bannerView;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v7 = a3;
  v8 = a4;
  if (self->_bannerView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherAppSuggestionViewController.m"), 211, CFSTR("Can't insert app suggestion banner if we already have one"));

  }
  self->_presentingOrDismissingBanner = 1;
  if (SBReduceMotion())
    -[SBSwitcherAppSuggestionViewController _idleOnscreenRectForBottomBanner](self, "_idleOnscreenRectForBottomBanner");
  else
    -[SBSwitcherAppSuggestionViewController _offscreenRectForBottomBanner](self, "_offscreenRectForBottomBanner");
  v13 = -[SBSwitcherAppSuggestionBannerView initWithFrame:appSuggestion:style:]([SBSwitcherAppSuggestionBannerView alloc], "initWithFrame:appSuggestion:style:", v7, -[SBSwitcherAppSuggestionViewController _bannerStyle](self, "_bannerStyle"), v9, v10, v11, v12);
  bannerView = self->_bannerView;
  self->_bannerView = v13;

  -[SBSwitcherAppSuggestionBannerView addGestureRecognizer:](self->_bannerView, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[SBSwitcherAppSuggestionBannerView addGestureRecognizer:](self->_bannerView, "addGestureRecognizer:", self->_longPressGestureRecognizer);
  -[SBSwitcherAppSuggestionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_bannerView);

  -[SBSwitcherAppSuggestionBannerView layoutIfNeeded](self->_bannerView, "layoutIfNeeded");
  if (SBReduceMotion())
    -[SBSwitcherAppSuggestionBannerView setAlpha:](self->_bannerView, "setAlpha:", 0.0);
  v16 = (void *)MEMORY[0x1E0CEABB0];
  v20 = v8;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke;
  v21[3] = &unk_1E8E9DED8;
  v21[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_3;
  v19[3] = &unk_1E8E9F230;
  v19[4] = self;
  v17 = v8;
  objc_msgSend(v16, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v21, v19);

}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114118, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[123];
  objc_msgSend(v2, "_idleOnscreenRectForBottomBanner");
  objc_msgSend(v3, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3
{
  id v4;
  SBSwitcherAppSuggestionBannerView *v5;
  uint64_t v6;
  void *v7;
  id v8;
  SBSwitcherAppSuggestionBannerView *v9;
  SBSwitcherAppSuggestionBannerView *bannerView;
  _QWORD v11[4];
  SBSwitcherAppSuggestionBannerView *v12;
  SBSwitcherAppSuggestionViewController *v13;
  id v14;
  _QWORD v15[5];
  SBSwitcherAppSuggestionBannerView *v16;

  v4 = a3;
  v5 = self->_bannerView;
  -[SBSwitcherAppSuggestionBannerView removeGestureRecognizer:](v5, "removeGestureRecognizer:", self->_tapGestureRecognizer);
  -[SBSwitcherAppSuggestionBannerView removeGestureRecognizer:](v5, "removeGestureRecognizer:", self->_longPressGestureRecognizer);
  self->_presentingOrDismissingBanner = 1;
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke;
  v15[3] = &unk_1E8E9E820;
  v15[4] = self;
  v16 = v5;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_3;
  v11[3] = &unk_1E8EA47F0;
  v12 = v16;
  v13 = self;
  v14 = v4;
  v8 = v4;
  v9 = v16;
  objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v15, v11);
  bannerView = self->_bannerView;
  self->_bannerView = 0;

}

void __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  CAFrameRateRange v12;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_2;
  v10[3] = &unk_1E8E9E820;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114118, v10, v7, v8, v9);

}

uint64_t __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  uint64_t result;

  v2 = SBReduceMotion();
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_idleOnscreenRectForBottomBanner");
  else
    objc_msgSend(v3, "_offscreenRectForBottomBanner");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  result = SBReduceMotion();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return result;
}

uint64_t __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1008) = 0;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_handleBannerTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SBSwitcherAppSuggestionViewController _activateBestAppSuggestion](self, "_activateBestAppSuggestion");
}

- (void)_handleLongPress:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL8 v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  -[SBSwitcherAppSuggestionBannerView bounds](self->_bannerView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v15, "locationInView:", self->_bannerView);
  v16.x = v12;
  v16.y = v13;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  v14 = CGRectContainsPoint(v17, v16);
  if (objc_msgSend(v15, "state") != 1)
  {
    if (objc_msgSend(v15, "state") == 3)
    {
      if (!v14)
        goto LABEL_10;
      -[SBSwitcherAppSuggestionViewController _activateBestAppSuggestion](self, "_activateBestAppSuggestion");
    }
    else if (objc_msgSend(v15, "state") != 4)
    {
      if (objc_msgSend(v15, "state") == 2)
        goto LABEL_10;
      objc_msgSend(v15, "state");
    }
    v14 = 0;
    goto LABEL_10;
  }
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", 0);
  v14 = 1;
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", 1);
LABEL_10:
  -[SBSwitcherAppSuggestionBannerView setHighlighted:](self->_bannerView, "setHighlighted:", v14);

}

- (void)_activateBestAppSuggestion
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "suggestionViewController:activatedSuggestion:", self, self->_bestAppSuggestion);

}

- (BOOL)_hasSuggestionBannerView
{
  return self->_bannerView != 0;
}

- (void)_activateCurrentSuggestion
{
  if (self->_bannerView)
    -[SBSwitcherAppSuggestionViewController _activateBestAppSuggestion](self, "_activateBestAppSuggestion");
}

- (BOOL)showSuggestions
{
  return self->_showSuggestions;
}

- (BOOL)_isSuggestionQueueSuspended
{
  return self->_suggestionQueueSuspended;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pauseSuggestionUpdateReasons, 0);
  objc_storeStrong((id *)&self->_setSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bestAppSuggestion, 0);
}

@end
