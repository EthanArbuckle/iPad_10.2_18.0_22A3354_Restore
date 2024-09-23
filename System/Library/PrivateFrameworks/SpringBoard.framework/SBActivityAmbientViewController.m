@implementation SBActivityAmbientViewController

- (SBActivityAmbientViewController)initWithPrimaryActivityItem:(id)a3 overlayMode:(int64_t)a4
{
  id v6;
  SBActivityAmbientViewController *v7;
  SBActivityAmbientViewController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBActivityAmbientViewController;
  v7 = -[SBActivityAmbientViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_overlayMode = a4;
    -[SBActivityAmbientViewController _setPrimaryActivityItem:](v7, "_setPrimaryActivityItem:", v6);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SBActivityAmbientViewController _removeDismissGesture](self, "_removeDismissGesture");
  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientViewController;
  -[SBActivityAmbientViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DA9F28]);
  -[SBActivityAmbientViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  -[SBActivityAmbientViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBActivityAmbientViewController _addOverlayForPrimaryActivity](self, "_addOverlayForPrimaryActivity");
  -[SBActivityAmbientViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("sb-activity-ambient-view"));

}

- (void)viewWillLayoutSubviews
{
  SBActivityAmbientCompactOverlayViewController *compactOverlayViewController;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityAmbientViewController;
  -[SBActivityAmbientViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    -[SBActivityAmbientCompactOverlayViewController contentSize](compactOverlayViewController, "contentSize");
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (!self->_isAnimatingTransition)
  {
    -[SBActivityAmbientViewController _compactOverlayFrameForContentSize:](self, "_compactOverlayFrameForContentSize:", v4, v5);
    -[SBActivityAmbientViewController _layoutCompactOverlayIfNecessaryWithView:frame:](self, "_layoutCompactOverlayIfNecessaryWithView:frame:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  -[SBActivityAmbientViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBActivityAmbientViewController _addDismissGesture](self, "_addDismissGesture");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  -[SBActivityAmbientViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBActivityAmbientViewController _cleanupCurrentCompactOverlayViewController](self, "_cleanupCurrentCompactOverlayViewController");
  -[SBActivityAmbientViewController _cleanupCurrentFullOverlayViewController](self, "_cleanupCurrentFullOverlayViewController");
  -[SBActivityAmbientViewController _cleanupTransitionBlurViewIfNecessary](self, "_cleanupTransitionBlurViewIfNecessary");
  -[SBActivityAmbientViewController _cleanupBackgroundBlurViewIfNecessary](self, "_cleanupBackgroundBlurViewIfNecessary");
  -[SBActivityAmbientViewController _removeDismissGesture](self, "_removeDismissGesture");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)addOverlayForPrimaryActivityItem:(id)a3 withOverlayMode:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogActivity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient overlay for primary item", (uint8_t *)&v8, 0xCu);

  }
  -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", v5, 3, 0);

}

- (void)addOverlayForSecondaryActivityItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SBActivityItem *secondaryActivityItem;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient overlay for secondary item", (uint8_t *)&v8, 0xCu);

  }
  -[SBActivityAmbientViewController _setSecondaryActivityItem:](self, "_setSecondaryActivityItem:", v4);
  secondaryActivityItem = self->_secondaryActivityItem;
  if (secondaryActivityItem)
    -[SBActivityAmbientViewController _updateCompactActivityOverlayWithItem:withCompletion:](self, "_updateCompactActivityOverlayWithItem:withCompletion:", secondaryActivityItem, 0);

}

- (void)transitionToCompactOverlayMode
{
  if (self->_primaryActivityItem)
  {
    if (!self->_overlayMode)
      -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:");
  }
}

- (void)alertActivityItem:(id)a3 withAlertBlock:(id)a4
{
  SBActivityItem *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  SBActivityItem *primaryActivityItem;
  _BOOL4 v11;
  SBActivityItem *v12;
  _BOOL4 v13;
  SBActivityItem *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (SBActivityItem *)a3;
  v7 = (void (**)(_QWORD))a4;
  SBLogActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SBActivityItem identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ambient item alerting", (uint8_t *)&v17, 0xCu);

  }
  primaryActivityItem = self->_primaryActivityItem;
  if (primaryActivityItem == v6)
  {
    -[SBActivityViewController activityItem](self->_fullOverlayViewController, "activityItem");
    v12 = (SBActivityItem *)objc_claimAutoreleasedReturnValue();
    v11 = v12 == v6;

    primaryActivityItem = self->_primaryActivityItem;
  }
  else
  {
    v11 = 0;
  }
  if (primaryActivityItem == v6)
  {
    -[SBActivityViewController activityItem](self->_compactOverlayViewController, "activityItem");
    v14 = (SBActivityItem *)objc_claimAutoreleasedReturnValue();
    v13 = v14 == v6;

  }
  else
  {
    v13 = 0;
  }
  if (!v11 && !v13 && self->_secondaryActivityItem != v6)
  {
    -[SBActivityAmbientViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activityAmbientViewController:removePendingItem:", self, v6);

    v16 = 4;
LABEL_16:
    -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", v6, v16, 0);
    goto LABEL_17;
  }
  if (v13)
    v16 = 0;
  else
    v16 = 2;
  if (!v11)
    goto LABEL_16;
LABEL_17:
  v7[2](v7);

}

- (void)removeOverlayForActivityItem:(id)a3 withCompletion:(id)a4
{
  SBActivityItem *v6;
  id v7;
  SBActivityItem *v8;
  SBActivityItem *v9;
  SBActivityItem *secondaryActivityItem;
  id *v11;
  _QWORD v12[5];
  SBActivityItem *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = (SBActivityItem *)a3;
  v7 = a4;
  -[SBActivityViewController activityItem](self->_fullOverlayViewController, "activityItem");
  v8 = (SBActivityItem *)objc_claimAutoreleasedReturnValue();

  -[SBActivityViewController activityItem](self->_compactOverlayViewController, "activityItem");
  v9 = (SBActivityItem *)objc_claimAutoreleasedReturnValue();

  secondaryActivityItem = self->_secondaryActivityItem;
  if (self->_primaryActivityItem == v6)
    -[SBActivityAmbientViewController _setPrimaryActivityItem:](self, "_setPrimaryActivityItem:", 0);
  if (secondaryActivityItem == v6)
    -[SBActivityAmbientViewController _setSecondaryActivityItem:](self, "_setSecondaryActivityItem:", 0);
  if (v8 == v6)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke;
    v15[3] = &unk_1E8EA02D8;
    v15[4] = self;
    v11 = &v16;
    v16 = v7;
    -[SBActivityAmbientViewController _dismissFullOverlayWithCompletion:](self, "_dismissFullOverlayWithCompletion:", v15);
    goto LABEL_9;
  }
  if (v9 == v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke_2;
    v12[3] = &unk_1E8E9F7B8;
    v12[4] = self;
    v11 = (id *)&v13;
    v13 = v6;
    v14 = v7;
    -[SBActivityAmbientViewController _dismissCompactOverlayForActivityEnding:completion:](self, "_dismissCompactOverlayForActivityEnding:completion:", 1, v12);

LABEL_9:
  }

}

uint64_t __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetPrimaryActivityItemWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupCurrentCompactOverlayViewController");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == v2[133])
    return objc_msgSend(v2, "_resetPrimaryActivityItemWithCompletion:", *(_QWORD *)(a1 + 48));
  if (v3 == v2[134])
    objc_msgSend(v2, "_addSecondaryActivityItemIfAvailable");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)wantsIdleTimerDisabled
{
  return !self->_overlayMode
      && -[SBActivityViewController wantsIdleTimerDisabled](self->_fullOverlayViewController, "wantsIdleTimerDisabled");
}

- (BOOL)isTransitioning
{
  return self->_isAnimatingTransition;
}

- (void)setCompactOverlayHidden:(BOOL)a3
{
  SBActivityAmbientCompactOverlayViewController *compactOverlayViewController;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    v4 = a3;
    -[SBActivityAmbientCompactOverlayViewController view](compactOverlayViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1.0;
    if (v4)
      v6 = 0.0;
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__SBActivityAmbientViewController_setCompactOverlayHidden___block_invoke;
    v9[3] = &unk_1E8E9DE88;
    v10 = v5;
    v11 = v6;
    v8 = v5;
    objc_msgSend(v7, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v9, 0, 0.1, 0.0, 0.0, 0.0, 50.0, 0.0);

  }
}

uint64_t __59__SBActivityAmbientViewController_setCompactOverlayHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_setPrimaryActivityItem:(id)a3
{
  void *v5;
  SBActivityItem *v6;

  v6 = (SBActivityItem *)a3;
  if (self->_primaryActivityItem != v6)
  {
    objc_storeStrong((id *)&self->_primaryActivityItem, a3);
    -[SBActivityAmbientViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityAmbientViewController:removePendingItem:", self, v6);

    -[SBActivityAmbientViewController _didUpdateVisibleActivityItems](self, "_didUpdateVisibleActivityItems");
  }

}

- (void)_setSecondaryActivityItem:(id)a3
{
  void *v5;
  SBActivityItem *v6;

  v6 = (SBActivityItem *)a3;
  if (self->_secondaryActivityItem != v6)
  {
    objc_storeStrong((id *)&self->_secondaryActivityItem, a3);
    -[SBActivityAmbientViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityAmbientViewController:removePendingItem:", self, v6);

    -[SBActivityAmbientViewController _didUpdateVisibleActivityItems](self, "_didUpdateVisibleActivityItems");
  }

}

- (void)_addOverlayForPrimaryActivity
{
  int64_t overlayMode;

  if (self->_primaryActivityItem)
  {
    overlayMode = self->_overlayMode;
    if (overlayMode == 1)
    {
      -[SBActivityAmbientViewController _updateCompactActivityOverlayWithItem:withCompletion:](self, "_updateCompactActivityOverlayWithItem:withCompletion:");
    }
    else if (!overlayMode)
    {
      -[SBActivityAmbientViewController _updateFullActivityOverlayWithItem:](self, "_updateFullActivityOverlayWithItem:");
    }
  }
}

- (void)_updateCompactActivityOverlayWithItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  SBLogActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding compact ambient overlay", buf, 0xCu);

  }
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityAmbientViewController:removePendingItem:", self, v6);

  if (self->_compactOverlayViewController)
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__SBActivityAmbientViewController__updateCompactActivityOverlayWithItem_withCompletion___block_invoke;
    v11[3] = &unk_1E8EACBC0;
    v11[4] = self;
    v12 = v7;
    -[SBActivityAmbientViewController _compactOverlayViewControllerForItem:completion:](self, "_compactOverlayViewControllerForItem:completion:", v6, v11);

  }
}

void __88__SBActivityAmbientViewController__updateCompactActivityOverlayWithItem_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a2;
  if (v4)
  {
    v10 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1112), a2);
    objc_msgSend(v10, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cornerRadius");
    objc_msgSend(v5, "_setContinuousCornerRadius:");

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v10, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "contentSize");
    objc_msgSend(v8, "_compactOverlayFrameForContentSize:");
    objc_msgSend(v6, "_layoutCompactOverlayIfNecessaryWithView:frame:", v7);

    objc_msgSend(*(id *)(a1 + 32), "_animatePresentationOfCompactOverlayWithCompactViewController:completion:", v10, *(_QWORD *)(a1 + 40));
LABEL_5:
    v4 = v10;
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = 0;
    (*(void (**)(void))(v9 + 16))();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_updateFullActivityOverlayWithItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding full ambient overlay", buf, 0xCu);

  }
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityAmbientViewController:removePendingItem:", self, v4);
  if (!self->_fullOverlayViewController)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke;
    v8[3] = &unk_1E8EACBE8;
    v8[4] = self;
    v9 = v7;
    -[SBActivityAmbientViewController _fullOverlayViewControllerForItem:completion:](self, "_fullOverlayViewControllerForItem:completion:", v4, v8);

  }
}

void __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), a2);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_layoutFullOverlayWithActivityView:", v6);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke_2;
    v10[3] = &unk_1E8E9E820;
    v7 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v7, "_animatePresentationOfFullOverlayWithViewController:completion:", v4, v10);

  }
}

uint64_t __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activityAmbientViewControllerResetIdleTimerBehavior:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "_updateResolvedPreferences");
}

- (void)_fullOverlayViewControllerForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SBActivityAmbientFullOverlayViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBActivityAmbientFullOverlayViewController *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SBActivityAmbientViewController *v21;
  SBActivityAmbientFullOverlayViewController *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = -[SBActivityViewController initWithActivityItem:sceneType:payloadID:]([SBActivityAmbientFullOverlayViewController alloc], "initWithActivityItem:sceneType:payloadID:", v6, 2, 0);
  -[SBActivityAmbientFullOverlayViewController view](v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[SBActivityAmbientFullOverlayViewController view](v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[SBActivityAmbientFullOverlayViewController view](v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "platterTargetBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("sb-activity-ambient-full-view,bundleIdentifier:%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v15);

  -[SBActivityViewController setDelegate:](v8, "setDelegate:", self);
  -[SBActivityViewController setPresentationMode:](v8, "setPresentationMode:", 1);
  -[SBActivityViewController setVisibility:](v8, "setVisibility:", 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke;
  v19[3] = &unk_1E8EACC38;
  v20 = v6;
  v21 = self;
  v22 = v8;
  v23 = v7;
  v16 = v8;
  v17 = v7;
  v18 = v6;
  -[SBActivityViewController ensureContent:queue:completion:](v16, "ensureContent:queue:completion:", MEMORY[0x1E0C80D38], v19, 1.79769313e308);

}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    SBLogActivity();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_25;
    v7[3] = &unk_1E8EACC10;
    v7[4] = v6;
    v8 = v5;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v6, "bs_addChildViewController:animated:transitionBlock:", v8, 0, v7);

  }
}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v7, "insertSubview:belowSubview:", v6, v5);
  else
    objc_msgSend(v7, "addSubview:", v6);
  v4[2](v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_compactOverlayViewControllerForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SBActivityAmbientCompactOverlayViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBActivityAmbientCompactOverlayViewController *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SBActivityAmbientCompactOverlayViewController *v21;
  SBActivityAmbientViewController *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = -[SBActivityViewController initWithActivityItem:sceneType:payloadID:]([SBActivityAmbientCompactOverlayViewController alloc], "initWithActivityItem:sceneType:payloadID:", v6, 3, 0);
  -[SBActivityAmbientCompactOverlayViewController view](v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[SBActivityAmbientCompactOverlayViewController view](v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[SBActivityAmbientCompactOverlayViewController view](v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "platterTargetBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("sb-activity-ambient-compact-view,bundleIdentifier:%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v15);

  -[SBActivityViewController setDelegate:](v8, "setDelegate:", self);
  -[SBActivityAmbientCompactOverlayViewController setCompactOverlayDelegate:](v8, "setCompactOverlayDelegate:", self);
  -[SBActivityViewController setPresentationMode:](v8, "setPresentationMode:", 1);
  -[SBActivityViewController setVisibility:](v8, "setVisibility:", 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke;
  v19[3] = &unk_1E8EACC38;
  v20 = v6;
  v21 = v8;
  v22 = self;
  v23 = v7;
  v16 = v8;
  v17 = v7;
  v18 = v6;
  -[SBActivityViewController ensureContent:queue:completion:](v16, "ensureContent:queue:completion:", MEMORY[0x1E0C80D38], v19, 1.79769313e308);

}

void __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  void *v6;

  v3 = a2;
  if (v3)
  {
    SBLogActivity();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke_cold_1(a1);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
    objc_msgSend(v6, "_setContinuousCornerRadius:");

    objc_msgSend(*(id *)(a1 + 48), "bs_addChildViewController:", *(_QWORD *)(a1 + 40));
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v5();

}

- (void)_animatePresentationOfCompactOverlayWithCompactViewController:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke;
  v17[3] = &unk_1E8E9DED8;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "performWithoutAnimation:", v17);
  v10 = (void *)MEMORY[0x1E0CEABB0];
  v14 = v5;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_2;
  v15[3] = &unk_1E8E9DED8;
  v16 = v9;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_3;
  v13[3] = &unk_1E8E9F1C0;
  v11 = v5;
  v12 = v9;
  objc_msgSend(v10, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v15, v13, 0.8888, 0.0, 2.0, 315.827, 34.0214, 0.0);

}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.2, 0.2);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animatePresentationOfFullOverlayWithViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  SBActivityAmbientViewController *v26;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke;
  v24[3] = &unk_1E8E9E820;
  v10 = v7;
  v25 = v10;
  v26 = self;
  objc_msgSend(v8, "performWithoutAnimation:", v24);
  v22[4] = self;
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_2;
  v23[3] = &unk_1E8E9DED8;
  v23[4] = self;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_3;
  v22[3] = &unk_1E8E9E980;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v23, v22, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_4;
  v20[3] = &unk_1E8E9DED8;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v11, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v20, 0, 1.1117, 0.0, 2.0, 186.88, 27.3488, 0.0);
  v13 = (void *)MEMORY[0x1E0CEABB0];
  v17 = v6;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_5;
  v18[3] = &unk_1E8E9DED8;
  v19 = v12;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_6;
  v16[3] = &unk_1E8E9F1C0;
  v14 = v6;
  v15 = v12;
  objc_msgSend(v13, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v18, v16, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 40), "_addNewFullOverlayTransitionBlurMaterialViewWithParentView:initialWeighting:hidden:", *(_QWORD *)(a1 + 32), 0, 0.5);
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setWeighting:", 0.0);
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupTransitionBlurViewIfNecessary");
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dismissCompactOverlayForActivityEnding:(BOOL)a3 completion:(id)a4
{
  SBActivityAmbientCompactOverlayViewController *compactOverlayViewController;
  id v6;
  id v7;

  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    v6 = a4;
    -[SBActivityAmbientCompactOverlayViewController view](compactOverlayViewController, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SBActivityAmbientViewController _dismissCompactOverlayWithView:forActivityEnding:completion:](self, "_dismissCompactOverlayWithView:forActivityEnding:completion:", v7, v7 != 0, v6);

  }
}

- (void)_dismissCompactOverlayWithView:(id)a3 forActivityEnding:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke;
  v13[3] = &unk_1E8E9DED8;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke_2;
  v11[3] = &unk_1E8E9F1C0;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v13, v11, 0.5845, 0.0, 2.0, 877.298, 51.1883, 0.0);

}

uint64_t __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dismissFullOverlayWithCompletion:(id)a3
{
  id v4;
  SBActivityAmbientFullOverlayViewController *fullOverlayViewController;
  SBActivityAmbientFullOverlayViewController *v6;
  SBActivityAmbientFullOverlayViewController *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  SBActivityAmbientFullOverlayViewController *v18;
  id v19;
  _QWORD v20[5];
  SBActivityAmbientFullOverlayViewController *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  SBActivityAmbientViewController *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fullOverlayViewController = self->_fullOverlayViewController;
  if (fullOverlayViewController)
  {
    v6 = fullOverlayViewController;
    v7 = self->_fullOverlayViewController;
    self->_fullOverlayViewController = 0;

    -[SBActivityAmbientFullOverlayViewController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogActivity();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SBActivityViewController activityItem](v6, "activityItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissing ambient full screen overlay", buf, 0xCu);

    }
    v12 = MEMORY[0x1E0C809B0];
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke;
    v30[3] = &unk_1E8E9E820;
    v30[4] = self;
    v14 = v8;
    v31 = v14;
    objc_msgSend(v13, "performWithoutAnimation:", v30);
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_2;
    v28[3] = &unk_1E8E9E820;
    v28[4] = self;
    v29 = v14;
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_3;
    v25[3] = &unk_1E8E9DEB0;
    v16 = v29;
    v26 = v16;
    v27 = self;
    objc_msgSend(v15, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v28, v25, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
    v17 = (void *)MEMORY[0x1E0CEABB0];
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_4;
    v23[3] = &unk_1E8E9DED8;
    v24 = v16;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_5;
    v20[3] = &unk_1E8EA47F0;
    v20[4] = self;
    v21 = v6;
    v22 = v4;
    v18 = v6;
    v19 = v16;
    objc_msgSend(v17, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v23, v20, 1.1117, 0.0, 2.0, 186.88, 27.3488, 0.0);

  }
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "_addNewFullOverlayTransitionBlurMaterialViewWithParentView:initialWeighting:hidden:", *(_QWORD *)(a1 + 40), 0, 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayCornerRadius");
  v6 = v5;

  return objc_msgSend(*(id *)(a1 + 40), "_setContinuousCornerRadius:", v6);
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setWeighting:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "_cleanupTransitionBlurViewIfNecessary");
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.9, 0.9);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupFullViewController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterTargetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartyActivityGroupingIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (void)_cleanupCompactViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[SBActivityAmbientViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v4);

  }
}

- (void)_cleanupFullViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[SBActivityAmbientViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v4);

  }
}

- (void)_cleanupCurrentCompactOverlayViewController
{
  SBActivityAmbientCompactOverlayViewController *compactOverlayViewController;

  -[SBActivityAmbientViewController _cleanupCompactViewController:](self, "_cleanupCompactViewController:", self->_compactOverlayViewController);
  compactOverlayViewController = self->_compactOverlayViewController;
  self->_compactOverlayViewController = 0;

}

- (void)_cleanupCurrentFullOverlayViewController
{
  SBActivityAmbientFullOverlayViewController *fullOverlayViewController;

  if (!self->_transitionAnimationCount)
  {
    -[SBActivityAmbientViewController _cleanupFullViewController:](self, "_cleanupFullViewController:", self->_fullOverlayViewController);
    fullOverlayViewController = self->_fullOverlayViewController;
    self->_fullOverlayViewController = 0;

    -[SBActivityAmbientViewController _updateResolvedPreferences](self, "_updateResolvedPreferences");
  }
}

- (void)_cleanupTransitionBlurViewIfNecessary
{
  MTMaterialView *fullOverlayTransitionBlurView;
  MTMaterialView *v4;

  fullOverlayTransitionBlurView = self->_fullOverlayTransitionBlurView;
  if (fullOverlayTransitionBlurView)
  {
    if (!self->_transitionAnimationCount)
    {
      -[MTMaterialView removeFromSuperview](fullOverlayTransitionBlurView, "removeFromSuperview");
      v4 = self->_fullOverlayTransitionBlurView;
      self->_fullOverlayTransitionBlurView = 0;

    }
  }
}

- (void)_cleanupBackgroundBlurViewIfNecessary
{
  MTMaterialView *backgroundBlurMaterialView;
  MTMaterialView *v4;

  backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
  if (backgroundBlurMaterialView)
  {
    if (!self->_transitionAnimationCount)
    {
      -[MTMaterialView removeFromSuperview](backgroundBlurMaterialView, "removeFromSuperview");
      v4 = self->_backgroundBlurMaterialView;
      self->_backgroundBlurMaterialView = 0;

    }
  }
}

- (void)_cleanupSwitchingTransitionView
{
  UIView *switchingTransitionView;
  UIView *v4;

  switchingTransitionView = self->_switchingTransitionView;
  if (switchingTransitionView)
  {
    -[UIView removeFromSuperview](switchingTransitionView, "removeFromSuperview");
    v4 = self->_switchingTransitionView;
    self->_switchingTransitionView = 0;

  }
}

- (void)_didUpdateVisibleActivityItems
{
  id v3;

  -[SBActivityAmbientViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityAmbientViewControllerDidUpdateVisibleActivityItems:", self);

}

- (id)_ambientActivitySettings
{
  void *v2;
  void *v3;

  +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateAudioCategoriesDisablingVolumeHUD
{
  uint64_t v3;
  void *v4;
  id obj;

  if (self->_overlayMode)
  {
    v3 = 0;
  }
  else
  {
    -[SBActivityViewController audioCategoriesDisablingVolumeHUD](self->_fullOverlayViewController, "audioCategoriesDisablingVolumeHUD");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  obj = (id)v3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, obj);
    -[SBActivityAmbientViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityAmbientViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:", self);

  }
}

- (BOOL)_isActiveActivityItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "activityAmbientViewController:isActiveActivityItem:", self, v4);

  return (char)self;
}

- (id)_nextSecondaryActivityItemForTransitionType:(int64_t)a3
{
  void *v5;
  SBActivityItem *v6;
  SBActivityItem *primaryActivityItem;
  SBActivityItem *v8;

  -[SBActivityAmbientViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityAmbientViewControllerNextPendingActivityItem:", self);
  v6 = (SBActivityItem *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "activityAmbientViewController:removePendingItem:", self, v6);
    objc_msgSend(v5, "activityAmbientViewController:addPendingItem:", self, self->_primaryActivityItem);
  }
  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 != 2)
    {
      v8 = 0;
      goto LABEL_13;
    }
    primaryActivityItem = v6;
    if (!v6)
      primaryActivityItem = self->_primaryActivityItem;
  }
  else
  {
    primaryActivityItem = self->_primaryActivityItem;
    if (!primaryActivityItem)
    {
      primaryActivityItem = self->_secondaryActivityItem;
      if (!primaryActivityItem)
        primaryActivityItem = v6;
    }
  }
  v8 = primaryActivityItem;
LABEL_13:

  return v8;
}

- (void)_transitionOverlayForActivityItem:(id)a3 withTransitionType:(int64_t)a4 withCompletion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;

  v9 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (-[SBActivityAmbientViewController _canTransitionActivityItem:forTransitionType:](self, "_canTransitionActivityItem:forTransitionType:", v9, a4))
  {
    -[SBActivityAmbientViewController _beginTransitionForActivityItem:transitionType:withCompletion:](self, "_beginTransitionForActivityItem:transitionType:withCompletion:", v9, a4, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)_beginTransitionForActivityItem:(id)a3 transitionType:(int64_t)a4 withCompletion:(id)a5
{
  SBActivityItem *v8;
  id v9;
  NSObject *v10;
  void *v11;
  SBActivityAmbientFullOverlayViewController *v12;
  SBActivityAmbientCompactOverlayViewController *v13;
  BOOL v14;
  SBActivityAmbientFullOverlayViewController *v15;
  SBActivityAmbientCompactOverlayViewController *v16;
  SBActivityItem *v17;
  void *v18;
  uint64_t v19;
  SBActivityAmbientFullOverlayViewController *v20;
  SBActivityAmbientCompactOverlayViewController *v21;
  _QWORD v22[5];
  SBActivityItem *v23;
  SBActivityAmbientCompactOverlayViewController *v24;
  SBActivityAmbientFullOverlayViewController *v25;
  id v26;
  int64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  SBActivityItem *v30;
  SBActivityAmbientFullOverlayViewController *v31;
  SBActivityAmbientCompactOverlayViewController *v32;
  id v33;
  int64_t v34;
  BOOL v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (SBActivityItem *)a3;
  v9 = a5;
  SBLogActivity();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SBActivityItem identifier](v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v11;
    v38 = 2048;
    v39 = a4;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] begining ambient overlay transition for type: %ld", buf, 0x16u);

  }
  ++self->_transitionAnimationCount;
  v12 = self->_fullOverlayViewController;
  v13 = self->_compactOverlayViewController;
  if (-[SBActivityAmbientViewController _transitionTypeIsToFullOverlay:](self, "_transitionTypeIsToFullOverlay:", a4))
  {
    self->_overlayMode = 0;
    if (a4 == 2)
      -[SBActivityAmbientViewController _setSecondaryActivityItem:](self, "_setSecondaryActivityItem:", 0);
    v14 = self->_primaryActivityItem == v8;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke;
    v29[3] = &unk_1E8EACC88;
    v35 = v14;
    v29[4] = self;
    v34 = a4;
    v30 = v8;
    v31 = v12;
    v32 = v13;
    v33 = v9;
    v15 = v12;
    v16 = v13;
    -[SBActivityAmbientViewController _fullOverlayViewControllerForItem:completion:](self, "_fullOverlayViewControllerForItem:completion:", v30, v29);

    v17 = v30;
  }
  else
  {
    self->_overlayMode = 1;
    -[SBActivityAmbientCompactOverlayViewController view](v13, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_4;
    v28[3] = &unk_1E8E9DED8;
    v28[4] = self;
    -[SBActivityAmbientViewController _dismissCompactOverlayWithView:forActivityEnding:completion:](self, "_dismissCompactOverlayWithView:forActivityEnding:completion:", v18, 0, v28);

    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_5;
    v22[3] = &unk_1E8EACCD8;
    v22[4] = self;
    v23 = v8;
    v24 = v13;
    v27 = a4;
    v25 = v12;
    v26 = v9;
    v20 = v12;
    v21 = v13;
    -[SBActivityAmbientViewController _compactOverlayViewControllerForItem:completion:](self, "_compactOverlayViewControllerForItem:completion:", v23, v22);

    v17 = v23;
  }

}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id *v12;
  id v13;
  uint64_t v14;
  id *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), a2);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_layoutFullOverlayWithActivityView:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_updateResolvedPreferences");
    v7 = *(_QWORD **)(a1 + 32);
    if (*(_BYTE *)(a1 + 80))
    {
      v8 = (void *)v7[139];
      v7[139] = 0;

      objc_msgSend(*(id *)(a1 + 32), "_animateTransitionToFullOverlayForPrimaryActivityItem:transitionType:fullOverlayViewControllerForTransition:oldCompactOverlayViewController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_msgSend(v7, "_nextSecondaryActivityItemForTransitionType:", *(_QWORD *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_setPrimaryActivityItem:", *(_QWORD *)(a1 + 40));
      v10 = *(_QWORD **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v10, "_setSecondaryActivityItem:", v9);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_2;
        v26[3] = &unk_1E8EACC60;
        v11 = *(void **)(a1 + 40);
        v27 = *(id *)(a1 + 32);
        v12 = &v28;
        v13 = v11;
        v14 = *(_QWORD *)(a1 + 72);
        v28 = v13;
        v33 = v14;
        v15 = &v29;
        v29 = v4;
        v30 = *(id *)(a1 + 48);
        v31 = *(id *)(a1 + 56);
        v32 = *(id *)(a1 + 64);
        objc_msgSend(v27, "_compactOverlayViewControllerForItem:completion:", v9, v26);

      }
      else
      {
        v16 = (void *)v10[139];
        v10[139] = 0;

        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 72);
        v20 = *(void **)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 56);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_3;
        v23[3] = &unk_1E8E9E270;
        v23[4] = v17;
        v12 = &v24;
        v21 = v20;
        v24 = v21;
        v15 = &v25;
        v25 = *(id *)(a1 + 56);
        objc_msgSend(v17, "_animateTransitionToBecomeNewPrimaryAcivityWithItem:transitionType:fullOverlayViewController:compactOverlayViewControllerForTransition:oldFullViewController:oldCompactViewController:completion:", v18, v19, v4, 0, v21, v22, v23);
      }

    }
  }

}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1112), a2);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v7, "contentSize");
    objc_msgSend(v6, "_compactOverlayFrameForContentSize:");
    objc_msgSend(v4, "_layoutCompactOverlayIfNecessaryWithView:frame:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_animateTransitionToBecomeNewPrimaryAcivityWithItem:transitionType:fullOverlayViewController:compactOverlayViewControllerForTransition:oldFullViewController:oldCompactViewController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }

}

uint64_t __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanupFullViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupCompactViewController:", *(_QWORD *)(a1 + 48));
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;

  v2 = *(id **)(a1 + 32);
  v4 = v2[134];
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityAmbientViewController:addPendingItem:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(*(id *)(a1 + 32), "_setSecondaryActivityItem:", 0);
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1112), a2);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 72);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_6;
    v10[3] = &unk_1E8EACCB0;
    v10[4] = v5;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 72);
    v13 = v8;
    v16 = v9;
    v14 = v4;
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v5, "_animateTransitionToCompactOverlayForItem:transitionType:compactOverlayViewController:completion:", v6, v7, v14, v10);
    objc_msgSend(*(id *)(a1 + 32), "_updateResolvedPreferences");

  }
}

uint64_t __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanupCompactViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_cleanupFullViewController:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_endAndCleanupTransitionForActivityItem:forTransitionType:compactOverlayViewController:fullOverlayViewController:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 72));
}

- (void)_animateTransitionToFullOverlayForPrimaryActivityItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewControllerForTransition:(id)a5 oldCompactOverlayViewController:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MidY;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  SBActivityAmbientViewController *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  SBActivityAmbientViewController *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  int64_t v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  SBActivityAmbientViewController *v84;
  _QWORD v85[5];
  CGRect v86;

  v85[3] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v63 = a5;
  v12 = a6;
  v65 = a7;
  self->_isAnimatingTransition = 1;
  objc_msgSend(v63, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v13, "frame");
  v24 = v23;
  v86.origin.x = v16;
  v86.origin.y = v18;
  v86.size.width = v20;
  v86.size.height = v22;
  MidY = CGRectGetMidY(v86);
  objc_msgSend(v13, "frame");
  v27 = v20 / v26;
  objc_msgSend(v13, "frame");
  v28 = MEMORY[0x1E0C809B0];
  v29 = (void *)MEMORY[0x1E0CEABB0];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke;
  v82[3] = &unk_1E8E9E820;
  v31 = v22 / v30;
  v32 = v13;
  v83 = v32;
  v84 = self;
  objc_msgSend(v29, "performWithoutAnimation:", v82);
  -[SBActivityAmbientViewController _animationSettingsForTransitionType:](self, "_animationSettingsForTransitionType:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CEABB0];
  v80[0] = v28;
  v80[1] = 3221225472;
  v80[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_2;
  v80[3] = &unk_1E8E9DED8;
  v81 = v14;
  v59 = v14;
  objc_msgSend(v34, "animateWithDuration:delay:options:animations:completion:", 0, v80, 0, 0.05, 0.0);
  v35 = (void *)MEMORY[0x1E0CEABB0];
  v78[0] = v28;
  v78[1] = 3221225472;
  v78[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_3;
  v78[3] = &unk_1E8E9DED8;
  v36 = v32;
  v79 = v36;
  objc_msgSend(v35, "sb_animateWithSettings:mode:animations:completion:", v33, 3, v78, 0);
  v37 = (void *)MEMORY[0x1E0CEABB0];
  v76[0] = v28;
  v76[1] = 3221225472;
  v76[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_4;
  v76[3] = &unk_1E8E9E820;
  v76[4] = self;
  v38 = v36;
  v77 = v38;
  v67 = v33;
  objc_msgSend(v37, "sb_animateWithSettings:mode:animations:completion:", v33, 3, v76, 0);
  v39 = self;
  -[SBActivityAmbientViewController _animationSettingsForFullOverlayTransitionYCurve](self, "_animationSettingsForFullOverlayTransitionYCurve");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "BSAnimationSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "BSAnimationSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v28;
  v68[1] = 3221225472;
  v68[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_5;
  v68[3] = &unk_1E8EACCB0;
  v69 = v38;
  v70 = self;
  v71 = v12;
  v72 = v61;
  v73 = v63;
  v74 = v65;
  v75 = a4;
  v66 = v65;
  v64 = v63;
  v62 = v61;
  v60 = v12;
  v58 = v38;
  v57 = (void *)MEMORY[0x1D17E5550](v68);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 * 0.5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setToValue:", v44);

  objc_msgSend(v41, "mass");
  objc_msgSend(v43, "setMass:");
  objc_msgSend(v41, "damping");
  objc_msgSend(v43, "setDamping:");
  objc_msgSend(v41, "stiffness");
  objc_msgSend(v43, "setStiffness:");
  v45 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v43, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v43, "settlingDuration");
  objc_msgSend(v43, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MidY);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFromValue:", v47);

  objc_msgSend(v41, "mass");
  objc_msgSend(v46, "setMass:");
  objc_msgSend(v41, "damping");
  objc_msgSend(v46, "setDamping:");
  objc_msgSend(v41, "stiffness");
  objc_msgSend(v46, "setStiffness:");
  objc_msgSend(v46, "setFillMode:", v45);
  objc_msgSend(v46, "settlingDuration");
  objc_msgSend(v46, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.y"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFromValue:", v49);

  objc_msgSend(v48, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v42, "mass");
  objc_msgSend(v48, "setMass:");
  objc_msgSend(v42, "damping");
  objc_msgSend(v48, "setDamping:");
  objc_msgSend(v42, "stiffness");
  objc_msgSend(v48, "setStiffness:");
  objc_msgSend(v48, "setFillMode:", v45);
  objc_msgSend(v48, "settlingDuration");
  objc_msgSend(v48, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.x"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", v51);

  objc_msgSend(v50, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v42, "mass");
  objc_msgSend(v50, "setMass:");
  objc_msgSend(v42, "damping");
  objc_msgSend(v50, "setDamping:");
  objc_msgSend(v42, "stiffness");
  objc_msgSend(v50, "setStiffness:");
  objc_msgSend(v50, "setFillMode:", v45);
  objc_msgSend(v50, "settlingDuration");
  objc_msgSend(v50, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v46;
  v85[1] = v48;
  v85[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAnimations:", v53);

  objc_msgSend(v52, "setFillMode:", v45);
  objc_msgSend(v48, "settlingDuration");
  objc_msgSend(v52, "setDuration:");
  v54 = (void *)MEMORY[0x1D17E5550](v57);
  objc_msgSend(v52, "setValue:forKey:", v54, CFSTR("SBActivityFullOverlayAnimationCompletionKey"));

  objc_msgSend(v52, "setDelegate:", v39);
  objc_msgSend(v59, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addAnimation:forKey:", v43, CFSTR("position-y"));

  objc_msgSend(v58, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addAnimation:forKey:", v52, CFSTR("scale-position"));

}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", 250.0);
  objc_msgSend(*(id *)(a1 + 40), "_addNewFullOverlayTransitionBlurMaterialViewWithParentView:initialWeighting:hidden:", *(_QWORD *)(a1 + 32), 0, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 40), "_addNewBackgroundBlurMaterialViewWithInitialWeighting:hidden:", 0, 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setWeighting:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setWeighting:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayCornerRadius");
  v4 = v3;

  return objc_msgSend(*(id *)(a1 + 40), "_setContinuousCornerRadius:", v4);
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 0);

  objc_msgSend(*(id *)(a1 + 40), "_cleanupCompactViewController:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_endAndCleanupTransitionForActivityItem:forTransitionType:compactOverlayViewController:fullOverlayViewController:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_animateTransitionToBecomeNewPrimaryAcivityWithItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewController:(id)a5 compactOverlayViewControllerForTransition:(id)a6 oldFullViewController:(id)a7 oldCompactViewController:(id)a8 completion:(id)a9
{
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  SBActivityAmbientViewController *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  SBActivityAmbientViewController *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  int64_t v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[4];
  id v90;

  v64 = a3;
  v53 = a5;
  v51 = a6;
  v57 = a7;
  v55 = a8;
  v60 = a9;
  self->_isAnimatingTransition = 1;
  -[SBActivityAmbientViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayCornerRadius");
  v16 = v15;

  objc_msgSend(v57, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setUserInteractionEnabled:", 0);
  v68 = v17;
  objc_msgSend(v17, "_setContinuousCornerRadius:", v16);
  objc_msgSend(v18, "_setContinuousCornerRadius:", v16);
  -[SBActivityAmbientViewController _addNewSwitchingTransitionViewBelowSubview:](self, "_addNewSwitchingTransitionViewBelowSubview:", v17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CEABB0];
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke;
  v89[3] = &unk_1E8E9DED8;
  v62 = v19;
  v90 = v62;
  objc_msgSend(v20, "performWithoutAnimation:", v89);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFromValue:", &unk_1E91CF6D8);
  objc_msgSend(v72, "setToValue:", &unk_1E91CF6E8);
  objc_msgSend(v72, "setMass:", 2.0);
  objc_msgSend(v72, "setDamping:", 50.0);
  objc_msgSend(v72, "setStiffness:", 300.0);
  v21 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v72, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v72, "setDuration:", 0.8);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setFromValue:", &unk_1E91CF6C8);
  objc_msgSend(v71, "setToValue:", &unk_1E91CF6F8);
  objc_msgSend(v71, "setMass:", 2.0);
  objc_msgSend(v71, "setDamping:", 27.3488);
  objc_msgSend(v71, "setStiffness:", 186.88);
  objc_msgSend(v71, "setFillMode:", v21);
  objc_msgSend(v71, "setDuration:", 1.1117);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFromValue:", &unk_1E91CF6C8);
  objc_msgSend(v49, "setToValue:", &unk_1E91CF6D8);
  objc_msgSend(v49, "setMass:", 2.0);
  objc_msgSend(v49, "setDamping:", 50.0);
  objc_msgSend(v49, "setStiffness:", 300.0);
  objc_msgSend(v49, "setFillMode:", v21);
  objc_msgSend(v49, "setDuration:", 0.8);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setFromValue:", &unk_1E91CF708);
  objc_msgSend(v70, "setToValue:", &unk_1E91CF6D8);
  objc_msgSend(v70, "setMass:", 2.0);
  objc_msgSend(v70, "setDamping:", 50.0);
  objc_msgSend(v70, "setStiffness:", 300.0);
  objc_msgSend(v70, "setFillMode:", v21);
  objc_msgSend(v70, "setDuration:", 0.8);
  objc_msgSend(v70, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFromValue:", &unk_1E91CF6F8);
  objc_msgSend(v44, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v44, "setMass:", 2.0);
  objc_msgSend(v44, "setDamping:", 27.3488);
  objc_msgSend(v44, "setStiffness:", 186.88);
  objc_msgSend(v44, "setFillMode:", v21);
  objc_msgSend(v44, "setDuration:", 1.1117);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFromValue:", &unk_1E91CF6D8);
  objc_msgSend(v59, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v59, "setMass:", 2.0);
  objc_msgSend(v59, "setDamping:", 50.0);
  objc_msgSend(v59, "setStiffness:", 300.0);
  objc_msgSend(v59, "setFillMode:", v21);
  objc_msgSend(v59, "setDuration:", 0.8);
  objc_msgSend(v59, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFromValue:", &unk_1E91CF6C8);
  objc_msgSend(v48, "setToValue:", &unk_1E91CF718);
  objc_msgSend(v48, "setMass:", 2.0);
  objc_msgSend(v48, "setDamping:", 51.1883);
  objc_msgSend(v48, "setStiffness:", 877.298);
  objc_msgSend(v48, "setFillMode:", v21);
  objc_msgSend(v48, "setDuration:", 0.5845);
  objc_msgSend(v48, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFromValue:", &unk_1E91CF6C8);
  objc_msgSend(v45, "setToValue:", &unk_1E91CF6D8);
  objc_msgSend(v45, "setMass:", 2.0);
  objc_msgSend(v45, "setDamping:", 51.1883);
  objc_msgSend(v45, "setStiffness:", 877.298);
  objc_msgSend(v45, "setFillMode:", v21);
  objc_msgSend(v45, "setDuration:", 0.5845);
  objc_msgSend(v45, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", &unk_1E91CF718);
  objc_msgSend(v50, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v50, "setMass:", 2.0);
  objc_msgSend(v50, "setDamping:", 34.0214);
  objc_msgSend(v50, "setStiffness:", 315.827);
  objc_msgSend(v50, "setFillMode:", v21);
  objc_msgSend(v50, "setDuration:", 0.8888);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", &unk_1E91CF6D8);
  objc_msgSend(v22, "setToValue:", &unk_1E91CF6C8);
  objc_msgSend(v22, "setMass:", 2.0);
  objc_msgSend(v22, "setDamping:", 34.0214);
  objc_msgSend(v22, "setStiffness:", 315.827);
  objc_msgSend(v22, "setFillMode:", v21);
  objc_msgSend(v22, "setDuration:", 0.8888);
  objc_msgSend(v22, "setBeginTime:", 0.2);
  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  v23 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_59;
  v87[3] = &unk_1E8E9E820;
  v24 = self;
  v87[4] = self;
  v25 = v18;
  v88 = v25;
  v26 = MEMORY[0x1D17E5550](v87);
  v43 = (void *)v26;
  v77[0] = v23;
  v77[1] = 3221225472;
  v77[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_2;
  v77[3] = &unk_1E8EACD00;
  v78 = v46;
  v79 = self;
  v80 = v57;
  v81 = v55;
  v82 = v64;
  v83 = v51;
  v84 = v53;
  v85 = v60;
  v86 = a4;
  v67 = v60;
  v61 = v53;
  v54 = v51;
  v65 = v64;
  v56 = v55;
  v52 = v57;
  v58 = v46;
  v47 = (void *)MEMORY[0x1D17E5550](v77);
  v27 = (void *)MEMORY[0x1D17E5550]();
  if (v52)
    v28 = v49;
  else
    v28 = v44;
  objc_msgSend(v28, "setValue:forKey:", v27, CFSTR("SBActivityFullOverlayAnimationCompletionKey"));

  objc_msgSend(v28, "setDelegate:", v24);
  v29 = (void *)MEMORY[0x1D17E5550](v26);
  objc_msgSend(v70, "setValue:forKey:", v29, CFSTR("SBActivityFullOverlayAnimationCompletionKey"));

  objc_msgSend(v70, "setDelegate:", v24);
  v30 = (void *)MEMORY[0x1E0CEABB0];
  v31 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_3;
  v75[3] = &unk_1E8E9DED8;
  v76 = v62;
  v63 = v62;
  objc_msgSend(v30, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v75, 0, 0.8888, 0.2, 2.0, 315.827, 34.0214, 0.0);
  v32 = (void *)MEMORY[0x1E0CEABB0];
  v73[0] = v31;
  v73[1] = 3221225472;
  v73[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_4;
  v73[3] = &unk_1E8E9DED8;
  v74 = v25;
  v33 = v25;
  objc_msgSend(v32, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v73, 0, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
  objc_msgSend(v68, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAmbientViewController _addGaussianBlurToLayer:inputRadius:](v24, "_addGaussianBlurToLayer:inputRadius:", v34, 0.0);

  objc_msgSend(v33, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAmbientViewController _addGaussianBlurToLayer:inputRadius:](v24, "_addGaussianBlurToLayer:inputRadius:", v35, 50.0);

  objc_msgSend(v68, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v71, CFSTR("currentFullScale"));

  objc_msgSend(v68, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v72, CFSTR("currentFullBlur"));

  objc_msgSend(v68, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addAnimation:forKey:", v49, CFSTR("currentFullOverlayAlpha"));

  objc_msgSend(v69, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addAnimation:forKey:", v48, CFSTR("currentCompactScale"));

  objc_msgSend(v69, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addAnimation:forKey:", v45, CFSTR("currrentCompactAlpha"));

  objc_msgSend(v33, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addAnimation:forKey:", v44, CFSTR("newFullScale"));

  objc_msgSend(v33, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v70, CFSTR("newFullBlur"));

}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.5, 0.5);
  return objc_msgSend(v1, "setTransform:", &v3);
}

void __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_59(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_removeGaussianBlurFromLayer:", v2);

}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_cleanupFullViewController:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_cleanupCompactViewController:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "_endAndCleanupTransitionForActivityItem:forTransitionType:compactOverlayViewController:fullOverlayViewController:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_animateTransitionToCompactOverlayForItem:(id)a3 transitionType:(int64_t)a4 compactOverlayViewController:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double MidX;
  CGFloat v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  double v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGRect v71;
  CGRect v72;

  v8 = a5;
  v9 = a6;
  self->_isAnimatingTransition = 1;
  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  -[SBActivityAmbientViewController _compactOverlayFrameForContentSize:](self, "_compactOverlayFrameForContentSize:");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v10, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[SBActivityAmbientViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;

  objc_msgSend(v10, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cornerRadius");
  v30 = v29;

  v31 = v30 / v27;
  v71.origin.x = v18;
  v71.origin.y = v20;
  v71.size.width = v22;
  v71.size.height = v24;
  MidX = CGRectGetMidX(v71);
  v72.origin.x = v18;
  v72.origin.y = v20;
  v72.size.width = v22;
  v72.size.height = v24;
  v33 = CGRectGetMidY(v72) - v15 * 0.5;
  memset(&v70, 0, sizeof(v70));
  CGAffineTransformMakeScale(&v70, v22 / v13, v24 / v15);
  -[SBActivityAmbientViewController _layoutCompactOverlayIfNecessaryWithView:frame:](self, "_layoutCompactOverlayIfNecessaryWithView:frame:", v11, MidX - v13 * 0.5, v33, v13, v15);
  v34 = MEMORY[0x1E0C809B0];
  v35 = (void *)MEMORY[0x1E0CEABB0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke;
  v64[3] = &unk_1E8EACD28;
  v64[4] = self;
  v36 = v11;
  v65 = v36;
  v68 = v15 * v31;
  v69 = v70;
  v37 = v8;
  v66 = v37;
  v38 = v10;
  v67 = v38;
  objc_msgSend(v35, "performWithoutAnimation:", v64);
  v39 = (void *)MEMORY[0x1E0CEABB0];
  v62[0] = v34;
  v62[1] = 3221225472;
  v62[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_2;
  v62[3] = &unk_1E8E9DED8;
  v40 = v38;
  v63 = v40;
  objc_msgSend(v39, "animateWithDuration:delay:options:animations:completion:", 0, v62, 0, 0.2, 0.0);
  v41 = (void *)MEMORY[0x1E0CEABB0];
  v60[0] = v34;
  v60[1] = 3221225472;
  v60[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_3;
  v60[3] = &unk_1E8E9DED8;
  v42 = v37;
  v61 = v42;
  objc_msgSend(v41, "animateWithDuration:delay:options:animations:completion:", 0, v60, 0, 0.2, 0.1);
  v43 = (void *)MEMORY[0x1E0CEABB0];
  v58[0] = v34;
  v58[1] = 3221225472;
  v58[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_4;
  v58[3] = &unk_1E8E9DED8;
  v44 = v42;
  v59 = v44;
  objc_msgSend(v43, "animateWithDuration:delay:options:animations:completion:", 0, v58, 0, 0.2, 0.2);
  v45 = (void *)MEMORY[0x1E0CEABB0];
  -[SBActivityAmbientViewController _animationSettingsForTransitionType:](self, "_animationSettingsForTransitionType:", a4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v9;
  v54[0] = v34;
  v54[1] = 3221225472;
  v54[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_5;
  v54[3] = &unk_1E8E9F108;
  v54[4] = self;
  v55 = v44;
  v56 = v36;
  v57 = v40;
  v52[0] = v34;
  v52[1] = 3221225472;
  v52[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_6;
  v52[3] = &unk_1E8EA4988;
  v47 = v9;
  v48 = v40;
  v49 = v36;
  v50 = v44;
  objc_msgSend(v45, "sb_animateWithSettings:mode:animations:completion:", v46, 3, v54, v52);

}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setContinuousCornerRadius:", *(double *)(a1 + 64));
  v3 = *(void **)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 88);
  v8[0] = *(_OWORD *)(a1 + 72);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 104);
  objc_msgSend(v3, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 48), "setBackgroundAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "setContentAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_addNewFullOverlayTransitionBlurMaterialViewWithParentView:initialWeighting:hidden:", *(_QWORD *)(a1 + 56), 1, 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 56), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

  return objc_msgSend(*(id *)(a1 + 56), "layoutIfNeeded");
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundAlpha:", 1.0);
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentAlpha:", 1.0);
}

void __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_5(id *a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  __int128 v12;
  double v13;
  double v14;
  void *v15;
  _OWORD v16[3];

  objc_msgSend(*((id *)a1[4] + 122), "setWeighting:", 0.0);
  objc_msgSend(*((id *)a1[4] + 121), "setWeighting:", 1.0);
  v2 = a1[4];
  objc_msgSend(a1[5], "contentSize");
  objc_msgSend(v2, "_compactOverlayFrameForContentSize:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = a1[6];
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v12;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v11, "setTransform:", v16);
  objc_msgSend(a1[6], "setFrame:", v4, v6, v8, v10);
  objc_msgSend(a1[7], "setFrame:", v4, v6, v8, v10);
  objc_msgSend(a1[5], "cornerRadius");
  v14 = v13;
  objc_msgSend(a1[6], "_setContinuousCornerRadius:");
  objc_msgSend(a1[7], "_setContinuousCornerRadius:", v14);
  objc_msgSend(a1[6], "setAlpha:", 1.0);
  objc_msgSend(a1[4], "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_animationSettingsForFullOverlayTransitionYCurve
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v2, "setBehaviorType:", 1);
  objc_msgSend(v2, "setDampingRatio:", 0.84);
  objc_msgSend(v2, "setResponse:", 0.435);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  return v2;
}

- (id)_animationSettingsForTransitionType:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  CAFrameRateRange v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v4, "setBehaviorType:", 1);
  v5 = 0.0;
  v6 = 0.0;
  if ((unint64_t)a3 <= 4)
  {
    v5 = dbl_1D0E89708[a3];
    v6 = dbl_1D0E89730[a3];
  }
  objc_msgSend(v4, "setDampingRatio:", v6);
  objc_msgSend(v4, "setResponse:", v5);
  v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
  return v4;
}

- (BOOL)_canTransitionActivityItem:(id)a3 forTransitionType:(int64_t)a4
{
  SBActivityItem *v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;

  v6 = (SBActivityItem *)a3;
  if (-[SBActivityAmbientViewController _isActiveActivityItem:](self, "_isActiveActivityItem:", v6))
  {
    v7 = 1;
    switch(a4)
    {
      case 0:
        if (self->_primaryActivityItem != v6)
          goto LABEL_8;
        v8 = self->_overlayMode == 1;
        goto LABEL_11;
      case 1:
        v9 = 1064;
        goto LABEL_7;
      case 2:
        v9 = 1072;
LABEL_7:
        if (*(SBActivityItem **)((char *)&self->super.super.super.isa + v9) != v6)
          goto LABEL_8;
        v8 = self->_overlayMode == 0;
LABEL_11:
        v7 = v8;
        break;
      case 3:
      case 4:
        break;
      default:
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v7 = 0;
  }

  return v7;
}

- (BOOL)_layerHasGaussianBlurFilter:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "filters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x1E0CD2C88];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addGaussianBlurToLayer:(id)a3 inputRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[SBActivityAmbientViewController _layerHasGaussianBlurFilter:](self, "_layerHasGaussianBlurFilter:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputQuality"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputIntermediateBitDepth"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputRadius"));

    v9 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("inputHardEdges"));
    objc_msgSend(v6, "filters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "addObject:", v7);
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v12);

  }
}

- (void)_removeGaussianBlurFromLayer:(id)a3
{
  objc_msgSend(a3, "setFilters:", MEMORY[0x1E0C9AA60]);
}

- (void)_addNewFullOverlayTransitionBlurMaterialViewWithParentView:(id)a3 initialWeighting:(double)a4 hidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MTMaterialView *fullOverlayTransitionBlurView;

  v5 = a5;
  v8 = a3;
  -[SBActivityAmbientViewController _cleanupTransitionBlurViewIfNecessary](self, "_cleanupTransitionBlurViewIfNecessary");
  v9 = (void *)MEMORY[0x1E0D47498];
  SBHBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("ambientContentOverlay"), v10, 0, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v11, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v11, "setHidden:", v5);
  objc_msgSend(v8, "addSubview:", v11);
  objc_msgSend(v8, "bringSubviewToFront:", v11);
  objc_msgSend(v8, "layoutIfNeeded");

  fullOverlayTransitionBlurView = self->_fullOverlayTransitionBlurView;
  self->_fullOverlayTransitionBlurView = (MTMaterialView *)v11;

}

- (void)_addNewBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  MTMaterialView *backgroundBlurMaterialView;
  id v11;

  if (!self->_backgroundBlurMaterialView)
  {
    v4 = a4;
    -[SBActivityAmbientViewController view](self, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D47498];
    SBHBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("activityAmbientBackground"), v8, 0, 0, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(v9, "setHidden:", v4);
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    objc_msgSend(v11, "addSubview:", v9);
    objc_msgSend(v11, "sendSubviewToBack:", v9);
    objc_msgSend(v11, "layoutIfNeeded");
    backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = (MTMaterialView *)v9;

  }
}

- (void)_addNewCompactOverlayTransitionViewWithParentView:(id)a3 alpha:(double)a4
{
  objc_class *v6;
  id v7;
  UIView *v8;
  void *v9;
  UIView *compactOverlayTransitionView;

  if (!self->_compactOverlayTransitionView)
  {
    v6 = (objc_class *)MEMORY[0x1E0CEABB0];
    v7 = a3;
    v8 = (UIView *)objc_alloc_init(v6);
    objc_msgSend(v7, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UIView setAlpha:](v8, "setAlpha:", a4);
    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "addSubview:", v8);
    objc_msgSend(v7, "bringSubviewToFront:", v8);
    objc_msgSend(v7, "layoutIfNeeded");

    compactOverlayTransitionView = self->_compactOverlayTransitionView;
    self->_compactOverlayTransitionView = v8;

  }
}

- (id)_addNewSwitchingTransitionViewBelowSubview:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CEABB0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBActivityAmbientViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  -[SBActivityAmbientViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSubview:belowSubview:", v6, v5);

  -[SBActivityAmbientViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  return v6;
}

- (void)_endAndCleanupTransitionForActivityItem:(id)a3 forTransitionType:(int64_t)a4 compactOverlayViewController:(id)a5 fullOverlayViewController:(id)a6 completion:(id)a7
{
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(_QWORD))a7;
  SBLogActivity();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ending ambient overlay transition for type: %ld", (uint8_t *)&v17, 0x16u);

  }
  --self->_transitionAnimationCount;
  -[SBActivityAmbientViewController _cleanupTransitionBlurViewIfNecessary](self, "_cleanupTransitionBlurViewIfNecessary");
  -[SBActivityAmbientViewController _cleanupBackgroundBlurViewIfNecessary](self, "_cleanupBackgroundBlurViewIfNecessary");
  -[SBActivityAmbientViewController _cleanupSwitchingTransitionView](self, "_cleanupSwitchingTransitionView");
  self->_isAnimatingTransition = 0;
  if (a4)
  {
    if (a4 == 1)
      -[SBActivityAmbientViewController _cleanupCurrentFullOverlayViewController](self, "_cleanupCurrentFullOverlayViewController");
  }
  else
  {
    -[SBActivityAmbientViewController _addSecondaryActivityItemIfAvailable](self, "_addSecondaryActivityItemIfAvailable");
  }
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activityAmbientViewControllerResetIdleTimerBehavior:", self);

  -[SBActivityAmbientViewController _updateResolvedPreferences](self, "_updateResolvedPreferences");
  SBLogActivity();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Transition completed for type: %ld", (uint8_t *)&v17, 0x16u);

  }
  if (v11)
    v11[2](v11);

}

- (void)_addSecondaryActivityItemIfAvailable
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityAmbientViewControllerNextPendingActivityItem:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dequeueing ambient item to be secondary", (uint8_t *)&v7, 0xCu);

    }
    -[SBActivityAmbientViewController addOverlayForSecondaryActivityItem:](self, "addOverlayForSecondaryActivityItem:", v4);
  }

}

- (void)_resetPrimaryActivityItemWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  SBActivityItem *secondaryActivityItem;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (!self->_isAnimatingTransition)
  {
    if (self->_primaryActivityItem)
    {
      if (v4)
        v4[2](v4);
    }
    else
    {
      secondaryActivityItem = self->_secondaryActivityItem;
      if (secondaryActivityItem)
      {
        -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", secondaryActivityItem, 2, v4);
      }
      else
      {
        -[SBActivityAmbientViewController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activityAmbientViewControllerNextPendingActivityItem:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          SBLogActivity();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = 138543362;
            v12 = v10;
            _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dequeueing ambient item to be primary", (uint8_t *)&v11, 0xCu);

          }
          if (self->_overlayMode)
          {
            -[SBActivityAmbientViewController _setPrimaryActivityItem:](self, "_setPrimaryActivityItem:", v8);
            -[SBActivityAmbientViewController _updateCompactActivityOverlayWithItem:withCompletion:](self, "_updateCompactActivityOverlayWithItem:withCompletion:", v8, v5);
          }
          else
          {
            -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", v8, 3, v5);
          }
        }
        else if (v5)
        {
          v5[2](v5);
        }
        -[SBActivityAmbientViewController _didUpdateVisibleActivityItems](self, "_didUpdateVisibleActivityItems");

      }
    }
  }

}

- (void)_layoutCompactOverlayIfNecessaryWithView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14 = v9;
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[SBActivityAmbientCompactOverlayViewController view](self->_compactOverlayViewController, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  -[SBActivityAmbientViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bringSubviewToFront:", v11);

  -[SBActivityAmbientViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

- (CGRect)_compactOverlayFrameForContentSize:(CGSize)a3
{
  CGFloat height;
  double width;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat MidX;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[SBActivityAmbientViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  MidX = CGRectGetMidX(v19);
  v15 = v9 + 20.0;
  v16 = MidX + width * -0.5;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

- (void)_layoutFullOverlayWithActivityView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBActivityAmbientViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  objc_msgSend(v5, "layoutIfNeeded");
}

- (BOOL)_transitionTypeIsToFullOverlay:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x1Du >> a3);
}

- (void)_addDismissGesture
{
  SBScreenEdgePanGestureRecognizer *v3;
  UIScreenEdgePanGestureRecognizer *dismissEdgePanGesture;
  void *v5;
  void *v6;
  int v7;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *dismissPanGesture;
  id v10;

  if (!self->_dismissEdgePanGesture)
  {
    v3 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:type:options:", self, sel__handleDismissGesture_, 5, 0);
    dismissEdgePanGesture = self->_dismissEdgePanGesture;
    self->_dismissEdgePanGesture = &v3->super;

    -[UIScreenEdgePanGestureRecognizer setEdges:](self->_dismissEdgePanGesture, "setEdges:", 4);
    -[UIScreenEdgePanGestureRecognizer setAllowedTouchTypes:](self->_dismissEdgePanGesture, "setAllowedTouchTypes:", &unk_1E91CE788);
    -[UIScreenEdgePanGestureRecognizer setDelegate:](self->_dismissEdgePanGesture, "setDelegate:", self);
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:withType:", self->_dismissEdgePanGesture, 134);

  }
  if (!self->_dismissPanGesture)
  {
    -[SBActivityAmbientViewController _ambientActivitySettings](self, "_ambientActivitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fullScreenDismissGestureEnabled");

    if (v7)
    {
      v8 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handleDismissGesture_);
      dismissPanGesture = self->_dismissPanGesture;
      self->_dismissPanGesture = v8;

      -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_dismissPanGesture, "setAllowedTouchTypes:", &unk_1E91CE7A0);
      -[UIPanGestureRecognizer setDelegate:](self->_dismissPanGesture, "setDelegate:", self);
      -[SBActivityAmbientViewController view](self, "view");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addGestureRecognizer:", self->_dismissPanGesture);

    }
  }
}

- (void)_removeDismissGesture
{
  void *v3;
  UIScreenEdgePanGestureRecognizer *dismissEdgePanGesture;
  void *v5;
  UIPanGestureRecognizer *dismissPanGesture;

  if (self->_dismissEdgePanGesture)
  {
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", self->_dismissEdgePanGesture);

    dismissEdgePanGesture = self->_dismissEdgePanGesture;
    self->_dismissEdgePanGesture = 0;

  }
  if (self->_dismissPanGesture)
  {
    -[SBActivityAmbientViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_dismissPanGesture);

    dismissPanGesture = self->_dismissPanGesture;
    self->_dismissPanGesture = 0;

  }
}

- (void)_handleDismissGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "state");
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      -[SBActivityAmbientViewController _handleDismissGestureEnded:](self, "_handleDismissGestureEnded:", v5);
      goto LABEL_6;
    }
    -[SBActivityAmbientViewController _handleDismissGestureBegan:](self, "_handleDismissGestureBegan:", v5);
  }
  -[SBActivityAmbientViewController _handleDismissGestureChanged:](self, "_handleDismissGestureChanged:", v5);
LABEL_6:

}

- (void)_handleDismissGestureBegan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  self->_isInFullOverlayDrag = 1;
  v4 = a3;
  -[SBActivityAmbientViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayCornerRadius");
  v7 = v6;

  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setContinuousCornerRadius:", v7);

  -[SBActivityAmbientViewController setCompactOverlayHidden:](self, "setCompactOverlayHidden:", 1);
  -[SBActivityAmbientViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  -[SBActivityAmbientViewController _prepareFullOverlayViewForDragWithLocation:](self, "_prepareFullOverlayViewForDragWithLocation:", v11, v13);
}

- (void)_handleDismissGestureChanged:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[SBActivityAmbientViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v9);
  v6 = v5;
  v8 = v7;

  -[SBActivityAmbientViewController _beginFullOverlayDragWithTranslation:](self, "_beginFullOverlayDragWithTranslation:", v6, v8);
}

- (void)_handleDismissGestureEnded:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_isInFullOverlayDrag = 0;
  self->_currentFullOverlayDragTranslationY = 9.22337204e18;
  self->_currentFullOverlayDragScale = 9.22337204e18;
  self->_currentFullOverlayDragOriginY = 9.22337204e18;
  v4 = a3;
  -[SBActivityAmbientViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  -[SBActivityAmbientViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v8);
  v10 = v9;

  v11 = fabs(v7);
  if ((fabs(v10) <= 50.0 || v10 >= 0.0) && v11 <= 50.0)
  {
    -[SBActivityAmbientViewController _cancelFullOverlayDrag](self, "_cancelFullOverlayDrag", v11);
  }
  else
  {
    -[SBActivityItem descriptor](self->_primaryActivityItem, "descriptor", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isMomentary");

    if (v15)
    {
      SBLogActivity();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[SBActivityItem identifier](self->_primaryActivityItem, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v17;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ambient full screen dismissed but is momentary so ending activity", (uint8_t *)&v20, 0xCu);

      }
      v18 = objc_alloc_init(MEMORY[0x1E0C90230]);
      -[SBActivityItem identifier](self->_primaryActivityItem, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endActivity:", v19);

    }
    else
    {
      -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", self->_primaryActivityItem, 1, 0);
    }
  }
}

- (void)_prepareFullOverlayViewForDragWithLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[11];

  y = a3.y;
  x = a3.x;
  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__SBActivityAmbientViewController__prepareFullOverlayViewForDragWithLocation___block_invoke;
  v15[3] = &unk_1E8EA5150;
  v15[4] = self;
  *(CGFloat *)&v15[5] = x;
  *(CGFloat *)&v15[6] = y;
  v15[7] = v8;
  v15[8] = v10;
  v15[9] = v12;
  v15[10] = v14;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v15);
}

void __78__SBActivityAmbientViewController__prepareFullOverlayViewForDragWithLocation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setAnchorPointForDrag:forView:", v2, vdivq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 72)));

}

- (void)_setAnchorPointForDrag:(CGPoint)a3 forView:(id)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  y = a3.y;
  x = a3.x;
  v18 = a4;
  objc_msgSend(v18, "frame");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v18, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", x, y);

  objc_msgSend(v18, "frame");
  v12 = v11 - v7;
  v14 = v13 - v9;
  objc_msgSend(v18, "center");
  v16 = v15 - v12;
  objc_msgSend(v18, "center");
  objc_msgSend(v18, "setCenter:", v16, v17 - v14);

}

- (void)_beginFullOverlayDragWithTranslation:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double currentFullOverlayDragTranslationY;
  double v8;
  double currentFullOverlayDragOriginY;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat currentFullOverlayDragScale;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  CGAffineTransform v27;
  uint64_t v28;
  _QWORD v29[5];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;

  y = a3.y;
  x = a3.x;
  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  currentFullOverlayDragTranslationY = self->_currentFullOverlayDragTranslationY;
  v8 = y;
  if (currentFullOverlayDragTranslationY != 9.22337204e18)
  {
    currentFullOverlayDragOriginY = self->_currentFullOverlayDragOriginY;
    if (y <= 50.0)
      v10 = y;
    else
      v10 = self->_currentFullOverlayDragTranslationY;
    if (currentFullOverlayDragOriginY >= 30.0)
      v11 = y;
    else
      v11 = self->_currentFullOverlayDragTranslationY;
    if (y < currentFullOverlayDragTranslationY)
      v12 = v11;
    else
      v12 = v10;
    if (currentFullOverlayDragOriginY == 9.22337204e18)
      v8 = y;
    else
      v8 = v12;
  }
  -[SBActivityAmbientViewController _scaleForFullOverlayDismissalWithTranslation:](self, "_scaleForFullOverlayDismissalWithTranslation:", y);
  currentFullOverlayDragScale = v13;
  if (v13 < 0.2 && self->_currentFullOverlayDragScale != 9.22337204e18)
    currentFullOverlayDragScale = self->_currentFullOverlayDragScale;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeScale(&v34, currentFullOverlayDragScale, currentFullOverlayDragScale);
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeTranslation(&v33, x, v8);
  t1 = v34;
  memset(&v32, 0, sizeof(v32));
  t2 = v33;
  CGAffineTransformConcat(&v32, &t1, &t2);
  -[SBActivityAmbientViewController _cornerRadiusForFullOverlayDismissalWithTranslation:](self, "_cornerRadiusForFullOverlayDismissalWithTranslation:", v8);
  v17 = v16;
  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke;
  v29[3] = &unk_1E8E9DED8;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v29);
  v19 = (void *)MEMORY[0x1E0CEABB0];
  -[SBActivityAmbientViewController _animationSettingsForFullOverlayDrag](self, "_animationSettingsForFullOverlayDrag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v32;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_2;
  v25[3] = &unk_1E8EACD50;
  v26 = v6;
  v28 = v17;
  v21 = v6;
  objc_msgSend(v19, "sb_animateWithSettings:mode:animations:completion:", v20, 5, v25, 0);

  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_3;
  v24[3] = &unk_1E8E9DE88;
  v24[4] = self;
  *(double *)&v24[5] = v8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v15, 3, v24, 0);
  self->_currentFullOverlayDragTranslationY = v8;
  self->_currentFullOverlayDragScale = currentFullOverlayDragScale;
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  self->_currentFullOverlayDragOriginY = v23;

}

void __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_addNewBackgroundBlurMaterialViewWithInitialWeighting:hidden:", 0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 88));
}

uint64_t __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_3(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  objc_msgSend(*(id *)(a1 + 32), "_blurWeightingForFullOverlayDismissalWithTranslation:", *(double *)(a1 + 40));
  return objc_msgSend(v1, "setWeighting:");
}

- (double)_scaleForFullOverlayDismissalWithTranslation:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBActivityAmbientViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = a3 / (v5 / 6.0) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0)
    v8 = v7 + 1.0;
  else
    v8 = 1.0 - v7;
  return fmin(fmax(v8, 0.0), 1.1);
}

- (double)_blurWeightingForFullOverlayDismissalWithTranslation:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBActivityAmbientViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = a3 / (v5 * 0.25) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0)
    v8 = v7 + 1.0;
  else
    v8 = 1.0 - v7;
  return fmin(fmax(v8, 0.0), 1.1);
}

- (double)_cornerRadiusForFullOverlayDismissalWithTranslation:(double)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double result;

  v3 = fabs(a3);
  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  result = v6 * 0.5;
  if (v3 <= v6 * 0.5)
    return v3;
  return result;
}

- (id)_animationSettingsForFullOverlayDrag
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v2, "setBehaviorType:", 1);
  objc_msgSend(v2, "setDefaultValues");
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  return v2;
}

- (id)_animationSettingsForFullOverlayDragCancel
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v2, "setBehaviorType:", 1);
  objc_msgSend(v2, "setDampingRatio:", 1.0);
  objc_msgSend(v2, "setResponse:", 0.5);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  return v2;
}

- (void)_cancelFullOverlayDrag
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  SBActivityAmbientViewController *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  -[SBActivityAmbientViewController setCompactOverlayHidden:](self, "setCompactOverlayHidden:", 0);
  -[SBActivityAmbientFullOverlayViewController view](self->_fullOverlayViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAmbientViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0CEABB0];
  -[SBActivityAmbientViewController _animationSettingsForFullOverlayDragCancel](self, "_animationSettingsForFullOverlayDragCancel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke;
  v19[3] = &unk_1E8EA0820;
  v22 = v6;
  v23 = v8;
  v24 = v10;
  v25 = v12;
  v20 = v3;
  v21 = self;
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke_2;
  v17[3] = &unk_1E8EA46C0;
  v17[4] = self;
  v18 = v20;
  v16 = v20;
  objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v14, 3, v19, v17);

}

uint64_t __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64) * 0.5, *(double *)(a1 + 72) * 0.5);
  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "setWeighting:", 0.0);
}

uint64_t __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1016) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_cleanupTransitionBlurViewIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupBackgroundBlurViewIfNecessary");
}

- (void)handleTapForCompactOverlayViewController:(id)a3 withActivityItem:(id)a4
{
  -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:", a4, 2 * (self->_primaryActivityItem != a4), 0);
}

- (void)activityViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  id v5;

  if (self->_fullOverlayViewController == a3)
  {
    -[SBActivityAmbientViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityAmbientViewControllerResetIdleTimerBehavior:", self);

  }
}

- (void)activityViewControllerContentRequestsCancellingGesture:(id)a3
{
  if (self->_fullOverlayViewController == a3)
  {
    -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGesture, "setEnabled:", 0);
    -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGesture, "setEnabled:", 1);
    -[UIScreenEdgePanGestureRecognizer setEnabled:](self->_dismissEdgePanGesture, "setEnabled:", 0);
    -[UIScreenEdgePanGestureRecognizer setEnabled:](self->_dismissEdgePanGesture, "setEnabled:", 1);
  }
}

- (void)activityViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3
{
  if (self->_fullOverlayViewController == a3)
    -[SBActivityAmbientViewController _updateAudioCategoriesDisablingVolumeHUD](self, "_updateAudioCategoriesDisablingVolumeHUD");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**v4)(void);
  void (**v5)(void);

  objc_msgSend(a3, "valueForKey:", CFSTR("SBActivityFullOverlayAnimationCompletionKey"), a4);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;
  int v12;

  if (self->_dismissEdgePanGesture != a3 && self->_dismissPanGesture != a3)
    return 0;
  -[SBActivityAmbientViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activityAmbientViewControllerCanBeginFullOverlayDismissGesture:", self);

  objc_msgSend((id)SBApp, "bannerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAmbientViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isDisplayingBannerInWindowScene:", v8);

  -[SBActivityViewController activityItem](self->_fullOverlayViewController, "activityItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBActivityAmbientViewController _isActiveActivityItem:](self, "_isActiveActivityItem:", v10);

  if (!self->_fullOverlayViewController)
    return 0;
  v12 = v5 ^ 1;
  if (self->_overlayMode)
    v12 = 1;
  if (((v12 | v9) & 1) != 0)
    return 0;
  if (self->_isInFullOverlayDrag)
    return 0;
  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIScreenEdgePanGestureRecognizer *v6;
  UIScreenEdgePanGestureRecognizer *v7;
  UIPanGestureRecognizer *dismissPanGesture;
  UIScreenEdgePanGestureRecognizer *dismissEdgePanGesture;
  BOOL v12;

  v6 = (UIScreenEdgePanGestureRecognizer *)a3;
  v7 = (UIScreenEdgePanGestureRecognizer *)a4;
  dismissPanGesture = self->_dismissPanGesture;
  dismissEdgePanGesture = self->_dismissEdgePanGesture;
  v12 = dismissPanGesture == (UIPanGestureRecognizer *)v6 && dismissEdgePanGesture == v7
     || dismissPanGesture == (UIPanGestureRecognizer *)v7 && dismissEdgePanGesture == v6;

  return v12;
}

- (void)invalidate
{
  -[SBActivityViewController invalidate](self->_fullOverlayViewController, "invalidate");
  -[SBActivityViewController invalidate](self->_compactOverlayViewController, "invalidate");
  -[SBActivityAmbientViewController _removeDismissGesture](self, "_removeDismissGesture");
}

- (SBActivityItem)primaryActivityItem
{
  return self->_primaryActivityItem;
}

- (SBActivityItem)secondaryActivityItem
{
  return self->_secondaryActivityItem;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (SBActivityAmbientViewControllerDelegate)delegate
{
  return (SBActivityAmbientViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBActivityAmbientFullOverlayViewController)fullOverlayViewController
{
  return self->_fullOverlayViewController;
}

- (void)setFullOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fullOverlayViewController, a3);
}

- (SBActivityAmbientCompactOverlayViewController)compactOverlayViewController
{
  return self->_compactOverlayViewController;
}

- (void)setCompactOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_compactOverlayViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactOverlayViewController, 0);
  objc_storeStrong((id *)&self->_fullOverlayViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_secondaryActivityItem, 0);
  objc_storeStrong((id *)&self->_primaryActivityItem, 0);
  objc_storeStrong((id *)&self->_dismissPanGesture, 0);
  objc_storeStrong((id *)&self->_dismissEdgePanGesture, 0);
  objc_storeStrong((id *)&self->_switchingTransitionView, 0);
  objc_storeStrong((id *)&self->_compactOverlayTransitionView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_fullOverlayTransitionBlurView, 0);
}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "[ActivityID: %{public}@] error ensuring ambient full screen overlay content: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

void __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "[ActivityID: %{public}@] error ensuring ambient compact overlay content: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

@end
