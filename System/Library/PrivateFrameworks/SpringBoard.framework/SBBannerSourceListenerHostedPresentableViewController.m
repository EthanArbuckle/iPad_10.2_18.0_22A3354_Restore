@implementation SBBannerSourceListenerHostedPresentableViewController

- (id)transitioningDelegate
{
  SBBannerCustomTransitioningDelegate *v3;
  SBBannerCustomTransitioningDelegate *v4;
  SBBannerCustomTransitioningDelegate *customTransitioningDelegate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[SBBannerSourceListenerHostedPresentableViewController transitioningDelegate](&v7, sel_transitioningDelegate);
  v3 = (SBBannerCustomTransitioningDelegate *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = self->_customTransitioningDelegate;
    self->_customTransitioningDelegate = v4;

    -[SBBannerSourceListenerHostedPresentableViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self->_customTransitioningDelegate);
    v3 = self->_customTransitioningDelegate;
  }
  return v3;
}

- (void)dealloc
{
  SBBannerGestureRecognizerPriorityAssertion *gestureRecognizerPriorityAssertion;
  objc_super v4;

  -[SBBannerGestureRecognizerPriorityAssertion invalidate](self->_gestureRecognizerPriorityAssertion, "invalidate");
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  self->_gestureRecognizerPriorityAssertion = 0;

  -[SBBannerSourceListenerHostedPresentableViewController _invalidateAllButtonEventActions](self, "_invalidateAllButtonEventActions");
  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)isDraggingDismissalEnabled
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ((objc_msgSend(WeakRetained, "ownsHomeGesture") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
    v4 = -[BNBannerSourceListenerHostedPresentableViewController isDraggingDismissalEnabled](&v6, sel_isDraggingDismissalEnabled);
  }

  return v4;
}

- (BOOL)isDraggingInteractionEnabled
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ((objc_msgSend(WeakRetained, "ownsHomeGesture") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
    v4 = -[BNBannerSourceListenerHostedPresentableViewController isDraggingInteractionEnabled](&v6, sel_isDraggingInteractionEnabled);
  }

  return v4;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id WeakRetained;
  SBBarSwipeAffordanceView *v6;
  SBBarSwipeAffordanceView *barSwipeAffordanceView;
  void *v8;
  SBBarSwipeAffordanceView *v9;
  SBBarSwipeAffordanceView *v10;
  void *v11;
  SBBannerSourceListenerHostedPresentableViewController *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController presentableWillAppearAsBanner:](&v14, sel_presentableWillAppearAsBanner_, v4);
  if (-[SBBannerSourceListenerHostedPresentableViewController isViewLoaded](self, "isViewLoaded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "platterBarSwipeAffordanceViewForParticipant:", self);
      v6 = (SBBarSwipeAffordanceView *)objc_claimAutoreleasedReturnValue();
      barSwipeAffordanceView = self->_barSwipeAffordanceView;
      self->_barSwipeAffordanceView = v6;

      -[SBBarSwipeAffordanceView addObserver:](self->_barSwipeAffordanceView, "addObserver:", self);
      -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_barSwipeAffordanceView);
      v9 = self->_barSwipeAffordanceView;
      objc_msgSend(v8, "bounds");
      -[SBBarSwipeAffordanceView setFrame:](v9, "setFrame:");
      -[SBBarSwipeAffordanceView setAutoresizingMask:](self->_barSwipeAffordanceView, "setAutoresizingMask:", 18);
      v10 = self->_barSwipeAffordanceView;
      -[BNBannerSourceListenerPresentableViewController contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBarSwipeAffordanceView addSubview:](v10, "addSubview:", v11);

      v12 = self;
      objc_sync_enter(v12);
      -[NSMutableArray lastObject](v12->_wantsHomeAffordanceActionsAwaitingResponse, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setWantsHomeGesture:", objc_msgSend(v13, "wantsHomeGesture"));

      objc_sync_exit(v12);
    }
    -[SBBannerSourceListenerHostedPresentableViewController _updateAppStatusBarSettingsAssertion](self, "_updateAppStatusBarSettingsAssertion");

  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController presentableDidAppearAsBanner:](&v4, sel_presentableDidAppearAsBanner_, a3);
  -[SBBannerSourceListenerHostedPresentableViewController _updateAppStatusBarSettingsAssertion](self, "_updateAppStatusBarSettingsAssertion");
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  void *v5;
  void *v6;
  SBBarSwipeAffordanceView *barSwipeAffordanceView;
  id WeakRetained;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController presentableWillDisappearAsBanner:withReason:](&v9, sel_presentableWillDisappearAsBanner_withReason_, a3, a4);
  if (-[SBBannerSourceListenerHostedPresentableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerSourceListenerPresentableViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[SBBarSwipeAffordanceView removeFromSuperview](self->_barSwipeAffordanceView, "removeFromSuperview");
    barSwipeAffordanceView = self->_barSwipeAffordanceView;
    self->_barSwipeAffordanceView = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
    objc_msgSend(WeakRetained, "setWantsHomeGesture:", 0);

    -[SBBannerSourceListenerHostedPresentableViewController _invalidateAllButtonEventActions](self, "_invalidateAllButtonEventActions");
  }
  -[SBBannerSourceListenerHostedPresentableViewController _updateAppStatusBarSettingsAssertion](self, "_updateAppStatusBarSettingsAssertion");
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController presentableDidDisappearAsBanner:withReason:](&v5, sel_presentableDidDisappearAsBanner_withReason_, a3, a4);
  -[SBBannerSourceListenerHostedPresentableViewController _updateAppStatusBarSettingsAssertion](self, "_updateAppStatusBarSettingsAssertion");
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id WeakRetained;
  SBBannerSourceListenerHostedPresentableViewController *v17;
  NSMutableArray *wantsHomeAffordanceActionsAwaitingResponse;
  NSMutableArray *v19;
  NSMutableArray *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  NSMutableDictionary *buttonEventsToActions;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  v40 = v6;
  -[BNBannerSourceListenerHostedPresentableViewController scene:didReceiveActions:](&v47, sel_scene_didReceiveActions_, v6, v7);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v42 = *(_QWORD *)v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v42)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
        v11 = objc_opt_class();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        if (v14)
        {
          v15 = objc_msgSend(v14, "wantsHomeGesture");
          WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
          if ((_DWORD)v15 == objc_msgSend(WeakRetained, "ownsHomeGesture"))
          {
            objc_msgSend(v14, "setSuccessful:", 1);
          }
          else
          {
            v17 = self;
            objc_sync_enter(v17);
            wantsHomeAffordanceActionsAwaitingResponse = v17->_wantsHomeAffordanceActionsAwaitingResponse;
            if (!wantsHomeAffordanceActionsAwaitingResponse)
            {
              v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v20 = v17->_wantsHomeAffordanceActionsAwaitingResponse;
              v17->_wantsHomeAffordanceActionsAwaitingResponse = v19;

              wantsHomeAffordanceActionsAwaitingResponse = v17->_wantsHomeAffordanceActionsAwaitingResponse;
            }
            -[NSMutableArray addObject:](wantsHomeAffordanceActionsAwaitingResponse, "addObject:", v14);
            objc_sync_exit(v17);

            objc_msgSend(WeakRetained, "setWantsHomeGesture:", v15);
          }

        }
        v21 = objc_opt_class();
        v22 = v12;
        if (v21)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
        }
        else
        {
          v23 = 0;
        }
        v24 = v23;

        if (v24)
        {
          buttonEventsToActions = self->_buttonEventsToActions;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "presentableButtonEvent"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](buttonEventsToActions, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "invalidate");
          v28 = self->_buttonEventsToActions;
          if (!v28)
          {
            v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v30 = self->_buttonEventsToActions;
            self->_buttonEventsToActions = v29;

            v28 = self->_buttonEventsToActions;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "presentableButtonEvent"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v24, v31);

        }
        v32 = objc_opt_class();
        v33 = v22;
        if (v32)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v34 = v33;
          else
            v34 = 0;
        }
        else
        {
          v34 = 0;
        }

        if (v34)
          self->_supportsCancellingSystemDragGesture = 1;
        v35 = objc_opt_class();
        v36 = v33;
        if (v35)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v37 = v36;
          else
            v37 = 0;
        }
        else
        {
          v37 = 0;
        }
        v38 = v37;

        if (v38)
        {
          -[SBBannerSourceListenerHostedPresentableViewController systemDragCancellationHandler](self, "systemDragCancellationHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "cancelSystemDragForPresentable:", self);

        }
        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  SBBannerGestureRecognizerPriorityAssertion *gestureRecognizerPriorityAssertion;
  void *v18;
  SBBannerGestureRecognizerPriorityAssertion *v19;
  SBBannerGestureRecognizerPriorityAssertion *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  objc_super v26;

  v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v26, sel_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext_, v10, a4, a5, a6);
  objc_msgSend(v10, "clientSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  if (!v15)
    goto LABEL_14;
  objc_msgSend(v15, "wantsDefaultGesturePriorityReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  if (v16)
  {
    if (!gestureRecognizerPriorityAssertion)
    {
      objc_msgSend((id)SBApp, "bannerManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "acquireGestureRecognizerPriorityAssertionForPresentable:priority:reason:", self, 1, v16);
      v19 = (SBBannerGestureRecognizerPriorityAssertion *)objc_claimAutoreleasedReturnValue();
      v20 = self->_gestureRecognizerPriorityAssertion;
      self->_gestureRecognizerPriorityAssertion = v19;

LABEL_12:
    }
  }
  else if (gestureRecognizerPriorityAssertion)
  {
    -[SBBannerGestureRecognizerPriorityAssertion invalidate](gestureRecognizerPriorityAssertion, "invalidate");
    v18 = self->_gestureRecognizerPriorityAssertion;
    self->_gestureRecognizerPriorityAssertion = 0;
    goto LABEL_12;
  }

LABEL_14:
  objc_msgSend(v10, "clientSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  v23 = v21;
  if (v22)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  if (v25)
    -[SBBannerSourceListenerHostedPresentableViewController _updateAppStatusBarSettingsAssertion](self, "_updateAppStatusBarSettingsAssertion");

}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  -[BNBannerSourceListenerHostedPresentableViewController scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "transitionDismissalPreventionReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("dismissOverlays")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("mainScreenAnimationController"))))
  {
    if (a4)
    {
      -[BNBannerSourceListenerHostedPresentableViewController scene](self, "scene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientProcess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(".%@"), v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)homeGestureOwnershipDidChange:(BOOL)a3
{
  id WeakRetained;
  int v5;
  SBBannerSourceListenerHostedPresentableViewController *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  v5 = objc_msgSend(WeakRetained, "ownsHomeGesture");

  v6 = self;
  objc_sync_enter(v6);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6->_wantsHomeAffordanceActionsAwaitingResponse;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "setSuccessful:", v5 ^ objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "wantsHomeGesture", (_QWORD)v11) ^ 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](v6->_wantsHomeAffordanceActionsAwaitingResponse, "removeAllObjects");
  objc_sync_exit(v6);

}

- (BOOL)shouldDisableTouchCancellationForTouch:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;

  if (!self->_supportsCancellingSystemDragGesture)
    return 0;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinateSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:fromCoordinateSpace:", v17, v10, v12);
  v19 = v18;
  v21 = v20;

  -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "windowScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coordinateSpace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "windowScene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "coordinateSpace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertPoint:fromCoordinateSpace:", v29, v19, v21);
  v31 = v30;
  v33 = v32;

  -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "window");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "windowScene");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "coordinateSpace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "convertPoint:toCoordinateSpace:", v38, v31, v33);
  v40 = v39;
  v42 = v41;

  -[SBBannerSourceListenerHostedPresentableViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = objc_msgSend(v43, "pointInside:withEvent:", v6, v40, v42);

  return (char)v34;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = objc_alloc(MEMORY[0x1E0DAC630]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke;
  v8[3] = &unk_1E8E9E980;
  v8[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithHandler:", v8);
  -[BNBannerSourceListenerHostedPresentableViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
  objc_msgSend(v6, "sendActions:", v7);

}

void __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke_2;
  v2[3] = &unk_1E8E9F508;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1216));
    objc_msgSend(WeakRetained, "setWantsHomeGesture:", 0);

  }
}

- (BOOL)handleHomeButtonPress
{
  void *v3;
  int v4;

  -[NSMutableDictionary objectForKey:](self->_buttonEventsToActions, "objectForKey:", &unk_1E91D0C38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");
  if (v4)
  {
    objc_msgSend(v3, "handleButtonEvent");
    -[NSMutableDictionary removeObjectForKey:](self->_buttonEventsToActions, "removeObjectForKey:", &unk_1E91D0C38);
  }

  return v4;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (UIEdgeInsets)bannerContentOutsets
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  double v8;
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
  double v19;
  UIEdgeInsets result;

  -[BNBannerSourceListenerHostedPresentableViewController scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "bannerContentOutsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_invalidateAllButtonEventActions
{
  NSMutableDictionary *buttonEventsToActions;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  buttonEventsToActions = self->_buttonEventsToActions;
  if (buttonEventsToActions)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary allValues](buttonEventsToActions, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "isValid"))
            objc_msgSend(v9, "invalidate");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_buttonEventsToActions, "removeAllObjects");
    v10 = self->_buttonEventsToActions;
    self->_buttonEventsToActions = 0;

  }
}

- (void)_updateAppStatusBarSettingsAssertion
{
  void *v3;
  void *v4;
  void *v5;
  SBMutableStatusBarSettings *v6;
  objc_class *v7;
  void *v8;
  SBWindowSceneStatusBarSettingsAssertion *v9;
  SBWindowSceneStatusBarSettingsAssertion *appStatusBarSettingsAssertion;
  SBWindowSceneStatusBarSettingsAssertion *v11;
  void *v12;
  SBWindowSceneStatusBarSettingsAssertion *v13;
  void *v14;
  id v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BNBannerSourceListenerHostedPresentableViewController preferredBackgroundActivitiesToSuppress](self, "preferredBackgroundActivitiesToSuppress");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count")
      && -[SBBannerSourceListenerHostedPresentableViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    {
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "statusBarManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assertionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_alloc_init(SBMutableStatusBarSettings);
      -[SBMutableStatusBarSettings setBackgroundActivitiesToSuppress:](v6, "setBackgroundActivitiesToSuppress:", v15);
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v5, "newSettingsAssertionWithSettings:atLevel:reason:", v6, 7, v8);
      appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
      self->_appStatusBarSettingsAssertion = v9;

      v11 = self->_appStatusBarSettingsAssertion;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
      -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](v11, "acquireWithAnimationParameters:", v12);

    }
    else
    {
      v13 = self->_appStatusBarSettingsAssertion;
      if (!v13)
      {
LABEL_9:

        return;
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
      -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](v13, "invalidateWithAnimationParameters:", v14);

      v5 = self->_appStatusBarSettingsAssertion;
      self->_appStatusBarSettingsAssertion = 0;
    }

    goto LABEL_9;
  }
}

- (SBPresentableSystemDragCancellationHandler)systemDragCancellationHandler
{
  return (SBPresentableSystemDragCancellationHandler *)objc_loadWeakRetained((id *)&self->_systemDragCancellationHandler);
}

- (void)setSystemDragCancellationHandler:(id)a3
{
  objc_storeWeak((id *)&self->_systemDragCancellationHandler, a3);
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  return (SBUIPresentableHomeGestureContext *)objc_loadWeakRetained((id *)&self->_homeGestureContext);
}

- (void)setHomeGestureContext:(id)a3
{
  objc_storeWeak((id *)&self->_homeGestureContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeGestureContext);
  objc_destroyWeak((id *)&self->_systemDragCancellationHandler);
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_barSwipeAffordanceView, 0);
  objc_storeStrong((id *)&self->_buttonEventsToActions, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_wantsHomeAffordanceActionsAwaitingResponse, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
}

@end
