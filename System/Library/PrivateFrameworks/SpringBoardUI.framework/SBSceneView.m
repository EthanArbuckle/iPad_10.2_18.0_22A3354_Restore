@implementation SBSceneView

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  if (self->_resizesHostedContext != a3)
  {
    self->_resizesHostedContext = a3;
    -[SBSceneView _updateResizesHostedContext](self, "_updateResizesHostedContext");
  }
}

- (id)_transitionViewForHostView
{
  return self->_hostView;
}

void __42__SBSceneView_sceneHandle_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAppearanceStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_modifyPresentationContext:", v3);

}

- (void)_modifyPresentationContext:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setClippingDisabled:", -[SBSceneView _contentPrefersToDisableClipping](self, "_contentPrefersToDisableClipping"));

}

- (void)setCustomContentView:(id)a3
{
  UIView **p_customContentView;
  UIView *v6;
  UIView *v7;
  UIView *backgroundView;
  UIView *v9;

  v9 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  v6 = self->_customContentView;
  if (v6 != v9)
  {
    objc_storeStrong((id *)&self->_customContentView, a3);
    v7 = *p_customContentView;
    -[SBSceneView bounds](self, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    if (self->_effectiveDisplayMode == 1)
    {
      backgroundView = v6;
      if (!v6)
        backgroundView = self->_backgroundView;
      -[SBSceneView _transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:](self, "_transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:", 1, backgroundView, 1, *p_customContentView, 0, 0);
    }
    else
    {
      -[UIView setAlpha:](*p_customContentView, "setAlpha:", 0.0);
      -[UIView addSubview:](self->_sceneContentContainerView, "addSubview:", *p_customContentView);
    }
    -[UIView removeFromSuperview](v6, "removeFromSuperview");
  }

}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  void (**v9)(_QWORD);
  void *v10;
  id v11;

  v11 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 248, CFSTR("this object has already been invalidated"));

  }
  if (self->_requestedDisplayMode == a3)
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    self->_requestedDisplayMode = a3;
    -[SBSceneView _evaluateEffectiveDisplayModeWithAnimationFactory:completion:](self, "_evaluateEffectiveDisplayModeWithAnimationFactory:completion:", v11, v9);
  }

}

- (void)_configureSceneLiveHostView:(id)a3
{
  UIView *v4;
  UIView *sceneContentContainerView;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v4 != sceneContentContainerView)
    -[UIView addSubview:](self->_sceneContentContainerView, "addSubview:", v6);
  -[SBSceneView _layoutLiveHostView:](self, "_layoutLiveHostView:", v6);
  -[SBSceneView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setPlaceholderContentProvider:(id)a3
{
  SBScenePlaceholderContentViewProvider *v5;
  SBScenePlaceholderContentViewProvider *placeholderContentProvider;
  SBScenePlaceholderContentViewProvider *v7;

  v5 = (SBScenePlaceholderContentViewProvider *)a3;
  placeholderContentProvider = self->_placeholderContentProvider;
  if (placeholderContentProvider != v5)
  {
    v7 = v5;
    -[SBScenePlaceholderContentViewProvider setDelegate:](placeholderContentProvider, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_placeholderContentProvider, a3);
    -[SBScenePlaceholderContentViewProvider setDelegate:](self->_placeholderContentProvider, "setDelegate:", self);
    -[SBSceneView _reloadPlaceholderContentIfNecessary](self, "_reloadPlaceholderContentIfNecessary");
    v5 = v7;
  }

}

- (void)setPlaceholderContentContext:(id)a3
{
  SBScenePlaceholderContentContext *v5;
  SBScenePlaceholderContentContext *v6;

  v5 = (SBScenePlaceholderContentContext *)a3;
  if (self->_placeholderContentContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderContentContext, a3);
    -[SBSceneView _reloadPlaceholderContentIfNecessary](self, "_reloadPlaceholderContentIfNecessary");
    v5 = v6;
  }

}

- (void)_reloadPlaceholderContentIfNecessary
{
  SBScenePlaceholderContentView *placeholderContentView;
  SBScenePlaceholderContentView *v4;
  SBScenePlaceholderContentView *v5;
  SBScenePlaceholderContentView *v6;

  if (self->_effectiveDisplayMode == 2)
  {
    v6 = self->_placeholderContentView;
    -[SBScenePlaceholderContentView removeFromSuperview](self->_placeholderContentView, "removeFromSuperview");
    placeholderContentView = self->_placeholderContentView;
    self->_placeholderContentView = 0;

    -[SBSceneView _configurePlaceholderContentView](self, "_configurePlaceholderContentView");
    v4 = self->_placeholderContentView;
    if (v4)
    {
      -[SBSceneView _transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:](self, "_transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:", self->_effectiveDisplayMode, v6, self->_effectiveDisplayMode, v4, 0, 0);
    }
    else
    {
      -[SBSceneView _evaluateEffectiveDisplayModeWithAnimationFactory:completion:](self, "_evaluateEffectiveDisplayModeWithAnimationFactory:completion:", 0, 0);
      v5 = v6;
      if (!v6)
      {
LABEL_8:

        return;
      }
      -[SBSceneView _placeholderVisibilityChanged](self, "_placeholderVisibilityChanged");
    }
    v5 = v6;
    goto LABEL_8;
  }
}

- (void)_layoutLiveSnapshotView:(id)a3
{
  UIView *v4;
  UIView *sceneContentContainerView;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v4 == sceneContentContainerView)
  {
    -[UIView bounds](self->_sceneContentContainerView, "bounds");
    objc_msgSend(v6, "setFrame:");
  }

}

- (void)_layoutLiveHostView:(id)a3
{
  id v4;
  id v5;
  id *p_sceneContentContainerView;
  id v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_sceneContentContainerView = (id *)&self->_sceneContentContainerView;
  v7 = *p_sceneContentContainerView;

  if (v5 == v7)
  {
    objc_msgSend(*p_sceneContentContainerView, "bounds");
    objc_msgSend(v4, "setFrame:");
  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBSceneView _layoutLiveHostView:].cold.1(v4, (uint64_t *)p_sceneContentContainerView, v8);

  }
}

- (void)layoutSubviews
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIView *v30;
  UIView *sceneContentContainerView;
  UIView *v32;
  UIView *backgroundView;
  UIView *v34;
  UIView *v35;
  UIView *v36;
  UIView *v37;
  SBSceneView *v38;
  void *v39;
  void *v40;
  double v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)SBSceneView;
  -[SBSceneView layoutSubviews](&v42, sel_layoutSubviews);
  -[SBSceneView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBSceneView _contentContainerEdgeInsets](self, "_contentContainerEdgeInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v41 = v4 + v13;
  -[UIView setFrame:](self->_sceneContentContainerView, "setFrame:", v4 + v13, v12, v15, v17);
  -[SBSceneView _contentContainerCornerRadius](self, "_contentContainerCornerRadius");
  v19 = v18;
  -[UIView layer](self->_sceneContentContainerView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 <= 0.0)
  {
    objc_msgSend(v20, "setCornerRadius:", 0.0);
  }
  else
  {
    objc_msgSend(v20, "setCornerRadius:", v19);

    -[UIView layer](self->_sceneContentContainerView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
  }

  -[UIView bounds](self->_sceneContentContainerView, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UIView superview](self->_customContentView, "superview");
  v30 = (UIView *)objc_claimAutoreleasedReturnValue();
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v30 == sceneContentContainerView)
    -[UIView setFrame:](self->_customContentView, "setFrame:", v23, v25, v27, v29);
  if (-[UIView isDescendantOfView:](self->_backgroundView, "isDescendantOfView:", self->_sceneContentContainerView)
    || (-[UIScenePresentation backgroundView](self->_hostView, "backgroundView"),
        v32 = (UIView *)objc_claimAutoreleasedReturnValue(),
        backgroundView = self->_backgroundView,
        v32,
        v32 == backgroundView))
  {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v23, v25, v27, v29);
    -[UIView superview](self->_backgroundView, "superview");
    v34 = (UIView *)objc_claimAutoreleasedReturnValue();
    v35 = self->_sceneContentContainerView;

    if (v34 == v35)
      -[UIView sendSubviewToBack:](self->_sceneContentContainerView, "sendSubviewToBack:", self->_backgroundView);
  }
  -[SBScenePlaceholderContentView superview](self->_placeholderContentView, "superview");
  v36 = (UIView *)objc_claimAutoreleasedReturnValue();
  v37 = self->_sceneContentContainerView;

  if (v36 == v37)
    -[SBScenePlaceholderContentView setFrame:](self->_placeholderContentView, "setFrame:", v23, v25, v27, v29);
  -[SBSceneView _layoutLiveSnapshotView:](self, "_layoutLiveSnapshotView:", self->_liveSnapshotView);
  -[SBSceneView _layoutLiveHostView:](self, "_layoutLiveHostView:", self->_hostView);
  -[UIView superview](self->_crossfadeView, "superview");
  v38 = (SBSceneView *)objc_claimAutoreleasedReturnValue();

  if (v38 == self)
  {
    -[UIView setFrame:](self->_crossfadeView, "setFrame:", v41, v12, v15, v17);
    -[UIView layer](self->_crossfadeView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v19 <= 0.0)
    {
      objc_msgSend(v39, "setCornerRadius:", 0.0);
    }
    else
    {
      objc_msgSend(v39, "setCornerRadius:", v19);

      -[UIView layer](self->_crossfadeView, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    }

  }
}

- (void)_layoutLiveHostView:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_215F8C000, a3, OS_LOG_TYPE_ERROR, "Live host view super view[%{public}@] not matching container view[%{public}@], frame not updated", (uint8_t *)&v7, 0x16u);

}

- (void)_recheckLiveContentDependencies
{
  void (**v3)(_QWORD);
  int64_t effectiveDisplayMode;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  id WeakRetained;
  int64_t v9;
  char v10;
  uint64_t v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__SBSceneView__recheckLiveContentDependencies__block_invoke;
  v12[3] = &unk_24D4CFFF8;
  v12[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x2199F42EC](v12, a2);
  effectiveDisplayMode = self->_effectiveDisplayMode;
  if (self->_requestedDisplayMode != 4)
  {
    if (effectiveDisplayMode != 4)
      goto LABEL_17;
    goto LABEL_8;
  }
  v5 = -[SBSceneHandle isContentReady](self->_sceneHandle, "isContentReady");
  v6 = v5;
  if ((effectiveDisplayMode == 4) != v5)
  {
    objc_msgSend((id)objc_opt_class(), "defaultDisplayModeAnimationFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v6)
        v9 = 4;
      else
        v9 = -[SBSceneView _bestDisplayModeLessThanMode:](self, "_bestDisplayModeLessThanMode:", 4);
      objc_msgSend(WeakRetained, "animationFactoryForImplicitTransitionFromMode:toMode:defaultFactory:", self->_effectiveDisplayMode, v9, v7);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    -[SBSceneView _evaluateEffectiveDisplayModeWithAnimationFactory:completion:](self, "_evaluateEffectiveDisplayModeWithAnimationFactory:completion:", v7, 0);

    goto LABEL_17;
  }
  v10 = !v5;
  if (effectiveDisplayMode != 4)
    v10 = 1;
  if ((v10 & 1) == 0 && !self->_hostView)
LABEL_8:
    v3[2](v3);
LABEL_17:

}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  if (-[SBSceneView _shouldObserveSceneHostContentState](self, "_shouldObserveSceneHostContentState", a3, a4))
    -[SBSceneView _recheckLiveContentDependencies](self, "_recheckLiveContentDependencies");
}

- (BOOL)_shouldObserveSceneHostContentState
{
  return self->_requestedDisplayMode == 4 || self->_effectiveDisplayMode == 4;
}

- (void)_evaluateEffectiveDisplayModeWithAnimationFactory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  int64_t i;
  void *v9;
  int64_t effectiveDisplayMode;
  void *v11;
  int64_t v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  int64_t v16;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  for (i = self->_requestedDisplayMode;
        ;
        i = -[SBSceneView _bestDisplayModeLessThanMode:](self, "_bestDisplayModeLessThanMode:", i))
  {
    -[SBSceneView _configureViewForEffectiveDisplayMode:](self, "_configureViewForEffectiveDisplayMode:", i);
    if (!i)
      break;
    -[SBSceneView _viewForDisplayMode:](self, "_viewForDisplayMode:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      break;
  }
  effectiveDisplayMode = self->_effectiveDisplayMode;
  if (effectiveDisplayMode == i)
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    self->_effectiveDisplayMode = i;
    -[SBSceneView _updateBackgroundViewContainment](self, "_updateBackgroundViewContainment");
    ++self->_inflightDisplayModeAnimations;
    -[SBSceneView _viewForDisplayMode:](self, "_viewForDisplayMode:", effectiveDisplayMode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_effectiveDisplayMode;
    -[SBSceneView _viewForDisplayMode:](self, "_viewForDisplayMode:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__SBSceneView__evaluateEffectiveDisplayModeWithAnimationFactory_completion___block_invoke;
    v14[3] = &unk_24D4CFF58;
    v14[4] = self;
    v16 = i;
    v15 = v7;
    -[SBSceneView _transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:](self, "_transitionFromDisplayMode:showingView:toDisplayMode:showingView:withAnimationFactory:completion:", effectiveDisplayMode, v11, v12, v13, v6, v14);

  }
}

- (void)_updateBackgroundColor
{
  id v3;

  if (-[SBSceneView _wantsBlackBackground](self, "_wantsBlackBackground"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSceneView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
  else
  {
    -[SBSceneView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (id)_viewForDisplayMode:(int64_t)a3
{
  uint64_t v4;
  id v5;

  switch(a3)
  {
    case 1:
      v4 = 512;
      goto LABEL_7;
    case 2:
      v4 = 520;
      goto LABEL_7;
    case 3:
      v4 = 528;
LABEL_7:
      v5 = *(id *)((char *)&self->super.super.super.isa + v4);
      break;
    case 4:
      if (-[NSCountedSet count](self->_liveContentDisableReasons, "count")
        || !-[SBSceneHandle isContentReady](self->_sceneHandle, "isContentReady"))
      {
        v5 = 0;
      }
      else
      {
        -[SBSceneView _transitionViewForHostView](self, "_transitionViewForHostView");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)_configureViewForEffectiveDisplayMode:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      -[SBSceneView _configureLiveHostView](self, "_configureLiveHostView");
      break;
    case 3:
      -[SBSceneView _configureLiveSnapshotView](self, "_configureLiveSnapshotView");
      break;
    case 2:
      -[SBSceneView _configurePlaceholderContentView](self, "_configurePlaceholderContentView");
      break;
  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  id v7;
  UIView *obj;
  UIView *obja;
  UIView *objb;

  v4 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v4)
  {
    obj = v4;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    v6 = obj;
    if (!obj)
    {
      v7 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[SBSceneView bounds](self, "bounds");
      obja = (UIView *)objc_msgSend(v7, "initWithFrame:");
      -[UIView setBackgroundColor:](obja, "setBackgroundColor:", 0);
      v6 = obja;
    }
    objb = v6;
    objc_storeStrong((id *)&self->_backgroundView, v6);
    -[SBSceneView _updateBackgroundViewContainment](self, "_updateBackgroundViewContainment");
    v4 = objb;
  }

}

- (void)_updateBackgroundViewContainment
{
  int64_t effectiveDisplayMode;
  UIView *v4;
  UIView *v5;
  UIView *backgroundView;

  effectiveDisplayMode = self->_effectiveDisplayMode;
  -[UIScenePresentation backgroundView](self->_hostView, "backgroundView");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (effectiveDisplayMode == 4)
  {
    backgroundView = self->_backgroundView;

    if (v5 != backgroundView)
      -[UIScenePresentation setBackgroundView:](self->_hostView, "setBackgroundView:", self->_backgroundView);
  }
  else
  {

    if (v5)
      -[UIScenePresentation setBackgroundView:](self->_hostView, "setBackgroundView:", 0);
    -[UIView insertSubview:atIndex:](self->_sceneContentContainerView, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
}

- (void)_configureLiveHostView
{
  UIScenePresentation *hostView;
  UIScenePresentation *v4;
  UIScenePresentation *v5;
  void *v6;
  void *v8;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 797, CFSTR("Attempting to _configureLiveHostView for %@, which is already invalidated."), self);

  }
  if (-[SBSceneHandle isContentReady](self->_sceneHandle, "isContentReady"))
  {
    hostView = self->_hostView;
    if (!hostView)
    {
      -[UIScenePresenter presentationView](self->_presenter, "presentationView");
      v4 = (UIScenePresentation *)objc_claimAutoreleasedReturnValue();
      v5 = self->_hostView;
      self->_hostView = v4;

      hostView = self->_hostView;
    }
    -[SBSceneView _configureSceneLiveHostView:](self, "_configureSceneLiveHostView:", hostView);
    -[UIScenePresenter activate](self->_presenter, "activate");
    -[SBSceneView _updateBackgroundViewContainment](self, "_updateBackgroundViewContainment");
    -[SBSceneView _transitionViewForHostView](self, "_transitionViewForHostView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
  -[SBSceneView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_transitionFromDisplayMode:(int64_t)a3 showingView:(id)a4 toDisplayMode:(int64_t)a5 showingView:(id)a6 withAnimationFactory:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  id v19;
  void *v20;
  void *v21;
  SBSceneView *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  _QWORD v36[4];
  id v37;
  double v38;
  _QWORD v39[4];
  id v40;
  SBSceneView *v41;
  id v42;
  id v43;
  void (**v44)(_QWORD);

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(_QWORD))a8;
  -[SBSceneView _viewForDisplayMode:](self, "_viewForDisplayMode:", a5);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 != v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a5 - 1) > 3)
      v31 = CFSTR("None");
    else
      v31 = off_24D4D0018[a5 - 1];
    -[SBSceneView _viewForDisplayMode:](self, "_viewForDisplayMode:", a5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 664, CFSTR("Expected views to match (toView: %@, toMode: %@, toDisplayModeView: %@)."), v16, v31, v32);

  }
  -[SBSceneView window](self, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v17)
    goto LABEL_7;
  if (!v20
    || (objc_msgSend(v20, "isHidden") & 1) != 0
    || -[SBSceneView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor"))
  {

    v17 = 0;
LABEL_7:
    if (v16)
    {
      objc_msgSend(v16, "superview");
      v22 = (SBSceneView *)objc_claimAutoreleasedReturnValue();

      if (v22 != self)
        -[SBSceneView _addContentLikeViewToHierarchyForTransitionIfPossible:](self, "_addContentLikeViewToHierarchyForTransitionIfPossible:", v16);
    }
    objc_msgSend(v16, "setAlpha:", 1.0);
    if (v18)
      v18[2](v18);
    goto LABEL_12;
  }
  if (a3 == 4 && a5 == 3)
    goto LABEL_7;
  if (v15 && v16)
  {
    +[SBCrossfadeView crossfadeViewWithStartView:endView:translucent:](SBCrossfadeView, "crossfadeViewWithStartView:endView:translucent:", v15, v16, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClipsToBounds:", 1);
    objc_msgSend(v23, "setAnimationFactory:", v17);
    -[SBSceneView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v23, self->_sceneContentContainerView);
    -[UIView removeFromSuperview](self->_crossfadeView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_crossfadeView, v23);
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke;
    v39[3] = &unk_24D4CFF80;
    v40 = v23;
    v41 = self;
    v42 = v15;
    v43 = v16;
    v44 = v18;
    v24 = v23;
    objc_msgSend(v24, "crossfadeWithCompletion:", v39);

  }
  else
  {
    if (v15)
      v25 = v15;
    else
      v25 = v16;
    v26 = v25;
    v27 = v26;
    if (v26)
    {
      if (v26 == v16)
        -[SBSceneView _addContentLikeViewToHierarchyForTransitionIfPossible:](self, "_addContentLikeViewToHierarchyForTransitionIfPossible:", v16);
      if (v15)
        v28 = 0.0;
      else
        v28 = 1.0;
      v29 = (void *)MEMORY[0x24BE0BF08];
      v30 = MEMORY[0x24BDAC760];
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_2;
      v36[3] = &unk_24D4CFFA8;
      v37 = v27;
      v38 = v28;
      v34[0] = v30;
      v34[1] = 3221225472;
      v34[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_3;
      v34[3] = &unk_24D4CFFD0;
      v35 = v18;
      objc_msgSend(v29, "animateWithFactory:actions:completion:", v17, v36, v34);

    }
    else if (v18)
    {
      v18[2](v18);
    }

  }
LABEL_12:

}

- (void)_placeholderVisibilityChanged
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "sceneView:changedPreferredStatusBarStyleTo:", self, -[SBSceneView preferredStatusBarStyle](self, "preferredStatusBarStyle", v6));
      v4 = v6;
    }
  }

}

- (int64_t)_bestDisplayModeLessThanMode:(int64_t)a3
{
  return 2 * ((unint64_t)a3 > 2);
}

- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height;
  double width;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SBSceneView *v21;
  SBSceneView *v22;
  id v23;
  uint64_t v24;
  UIView *sceneContentContainerView;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  NSString *hostingIdentifier;
  void *v36;
  void *v38;
  uint64_t v39;
  objc_super v40;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  }
  if ((unint64_t)(a6 - 3) >= 2)
    v17 = height;
  else
    v17 = width;
  if ((unint64_t)(a6 - 3) >= 2)
    v18 = width;
  else
    v18 = height;
  v19 = *MEMORY[0x24BDBEFB0];
  v20 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v40.receiver = self;
  v40.super_class = (Class)SBSceneView;
  v21 = -[SBSceneView initWithFrame:](&v40, sel_initWithFrame_, v19, v20, v18, v17);
  v22 = v21;
  if (v21)
  {
    -[SBSceneView setOpaque:](v21, "setOpaque:", 0);
    objc_storeStrong((id *)&v22->_sceneHandle, a3);
    v22->_referenceSize.width = width;
    v22->_referenceSize.height = height;
    v22->_orientation = a5;
    v22->_requestedDisplayMode = 0;
    v22->_effectiveDisplayMode = 0;
    v22->_placeholderContentEnabled = 1;
    v23 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[SBSceneView bounds](v22, "bounds");
    v24 = objc_msgSend(v23, "initWithFrame:");
    sceneContentContainerView = v22->_sceneContentContainerView;
    v22->_sceneContentContainerView = (UIView *)v24;

    -[SBSceneView _invalidateContentPrefersToDisableClipping](v22, "_invalidateContentPrefersToDisableClipping");
    -[SBSceneView addSubview:](v22, "addSubview:", v22->_sceneContentContainerView);
    -[SBSceneView setBackgroundView:](v22, "setBackgroundView:", 0);
    if (v16)
      v26 = objc_msgSend(v16, "sceneViewPresentationPriority:", v22);
    else
      v26 = 0;
    v22->_hostingPriority = v26;
    objc_msgSend(v16, "sceneViewPresentationIdentifier:", v22);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = CFSTR("SBApplicationSceneView");
    if (v27)
      v29 = (__CFString *)v27;
    v30 = v29;

    v31 = objc_alloc(MEMORY[0x24BDD17C8]);
    v32 = ++initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester____RequesterCounter;
    if (v16)
      v33 = objc_msgSend(v31, "initWithFormat:", CFSTR("%@:%p-SBApplicationSceneView:%p-%llu"), v30, v16, v22, v32);
    else
      v33 = objc_msgSend(v31, "initWithFormat:", CFSTR("%@-%p-%llu"), v30, v22, v32, v39);
    v34 = (NSString *)v33;

    hostingIdentifier = v22->_hostingIdentifier;
    v22->_hostingIdentifier = v34;

    -[SBSceneHandle addObserver:](v22->_sceneHandle, "addObserver:", v22);
    objc_msgSend(v15, "sceneIfExists");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      -[SBSceneView sceneHandle:didCreateScene:](v22, "sceneHandle:didCreateScene:", v15, v36);

  }
  return v22;
}

uint64_t __76__SBSceneView__evaluateEffectiveDisplayModeWithAnimationFactory_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t result;

  --*(_QWORD *)(a1[4] + 568);
  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 568))
  {
    v3 = *(_QWORD *)(v2 + 456);
    if (v3 == a1[6])
    {
      if (v3 == 4
        || ((objc_msgSend(*(id *)(v2 + 472), "deactivate"), v2 = a1[4], v4 = *(_QWORD *)(v2 + 456), v4 != 4)
          ? (v5 = v4 == 1)
          : (v5 = 1),
            v5))
      {
        objc_msgSend((id)v2, "_clearSnapshotViews");
      }
    }
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_invalidateContentPrefersToDisableClipping
{
  uint64_t v3;
  UIScenePresenter *presenter;
  _QWORD v5[4];
  char v6;

  v3 = -[SBSceneView _contentPrefersToDisableClipping](self, "_contentPrefersToDisableClipping") ^ 1;
  -[SBSceneView setClipsToBounds:](self, "setClipsToBounds:", v3);
  -[UIView setClipsToBounds:](self->_sceneContentContainerView, "setClipsToBounds:", v3);
  presenter = self->_presenter;
  if (presenter)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__SBSceneView__invalidateContentPrefersToDisableClipping__block_invoke;
    v5[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    v6 = v3;
    -[UIScenePresenter modifyPresentationContext:](presenter, "modifyPresentationContext:", v5);
  }
}

- (void)_configurePlaceholderContentView
{
  SBScenePlaceholderContentView *v3;
  SBScenePlaceholderContentView *placeholderContentView;

  if (!self->_placeholderContentView && self->_placeholderContentEnabled)
  {
    -[SBScenePlaceholderContentViewProvider sceneView:requestsPlaceholderContentViewWithContext:](self->_placeholderContentProvider, "sceneView:requestsPlaceholderContentViewWithContext:", self, self->_placeholderContentContext);
    v3 = (SBScenePlaceholderContentView *)objc_claimAutoreleasedReturnValue();
    placeholderContentView = self->_placeholderContentView;
    self->_placeholderContentView = v3;

    -[SBScenePlaceholderContentView setAlpha:](self->_placeholderContentView, "setAlpha:", 0.0);
    -[UIView addSubview:](self->_sceneContentContainerView, "addSubview:", self->_placeholderContentView);
    -[SBSceneView _placeholderVisibilityChanged](self, "_placeholderVisibilityChanged");
  }
}

- (void)_updateResizesHostedContext
{
  UIScenePresenter *presenter;
  _QWORD v3[5];

  presenter = self->_presenter;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__SBSceneView__updateResizesHostedContext__block_invoke;
  v3[3] = &unk_24D4CFF30;
  v3[4] = self;
  -[UIScenePresenter modifyPresentationContext:](presenter, "modifyPresentationContext:", v3);
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  void *v5;
  UIScenePresenter *v6;
  UIScenePresenter *presenter;
  UIScenePresenter *v8;
  _QWORD v9[5];

  objc_msgSend(a4, "uiPresentationManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPresenterWithIdentifier:priority:", self->_hostingIdentifier, self->_hostingPriority);
  v6 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
  presenter = self->_presenter;
  self->_presenter = v6;

  v8 = self->_presenter;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__SBSceneView_sceneHandle_didCreateScene___block_invoke;
  v9[3] = &unk_24D4CFF30;
  v9[4] = self;
  -[UIScenePresenter modifyPresentationContext:](v8, "modifyPresentationContext:", v9);
  -[SBSceneView _updateResizesHostedContext](self, "_updateResizesHostedContext");
  -[SBSceneView _updateLiveContentRendering](self, "_updateLiveContentRendering");
  -[SBSceneView _enableHostingIfPossible](self, "_enableHostingIfPossible");
}

- (void)setMinificationFilter:(id)a3
{
  NSString *v4;
  NSString *minificationFilter;
  char v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  minificationFilter = self->_minificationFilter;
  if (minificationFilter != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqual:](minificationFilter, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_minificationFilter;
      self->_minificationFilter = v7;

      -[SBSceneView _updateLiveContentRendering](self, "_updateLiveContentRendering");
      v4 = v9;
    }
  }

}

- (void)_updateLiveContentRendering
{
  UIScenePresenter *presenter;
  NSString *minificationFilter;
  UIView *sceneContentContainerView;
  NSString *v6;
  void *v7;
  _QWORD v8[5];

  presenter = self->_presenter;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__SBSceneView__updateLiveContentRendering__block_invoke;
  v8[3] = &unk_24D4CFF30;
  v8[4] = self;
  -[UIScenePresenter modifyPresentationContext:](presenter, "modifyPresentationContext:", v8);
  if (self->_rendersAsynchronously)
    minificationFilter = self->_minificationFilter;
  else
    minificationFilter = 0;
  sceneContentContainerView = self->_sceneContentContainerView;
  v6 = minificationFilter;
  -[UIView layer](sceneContentContainerView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinificationFilter:", v6);

}

- (void)_enableHostingIfPossible
{
  void *v4;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 561, CFSTR("this object has already been invalidated"));

  }
  -[SBSceneView _recheckLiveContentDependencies](self, "_recheckLiveContentDependencies");
}

+ (id)defaultDisplayModeAnimationFactory
{
  return (id)objc_msgSend(MEMORY[0x24BE0BF08], "factoryWithDuration:", 0.35);
}

- (int64_t)preferredStatusBarStyle
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SBScenePlaceholderContentView statusBarStyle](self->_placeholderContentView, "statusBarStyle");
  else
    return -1;
}

- (void)_clearSnapshotViews
{
  SBScenePlaceholderContentView *placeholderContentView;
  UISceneSnapshotPresentation *liveSnapshotView;

  -[SBScenePlaceholderContentView removeFromSuperview](self->_placeholderContentView, "removeFromSuperview");
  placeholderContentView = self->_placeholderContentView;
  self->_placeholderContentView = 0;

  -[SBSceneView _placeholderVisibilityChanged](self, "_placeholderVisibilityChanged");
  -[UISceneSnapshotPresentation removeFromSuperview](self->_liveSnapshotView, "removeFromSuperview");
  liveSnapshotView = self->_liveSnapshotView;
  self->_liveSnapshotView = 0;

  -[SBSceneView _configureBackgroundColorForLiveSnapshot:](self, "_configureBackgroundColorForLiveSnapshot:", 0);
}

- (void)_configureBackgroundColorForLiveSnapshot:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[SBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiPresentationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultPresentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColorWhileHosting");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SBSceneView setBackgroundColor:](self, "setBackgroundColor:", v7);
  }
  else
  {
    -[SBSceneView _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[68])
  {
    objc_msgSend(v2, "_updateBackgroundViewContainment");
    objc_msgSend(*(id *)(a1 + 40), "_addContentLikeViewToHierarchyForTransitionIfPossible:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_addContentLikeViewToHierarchyForTransitionIfPossible:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 544);
    *(_QWORD *)(v4 + 544) = 0;

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_addContentLikeViewToHierarchyForTransitionIfPossible:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4 && -[SBSceneView _shouldViewBeInHierarchyForTransition:](self, "_shouldViewBeInHierarchyForTransition:", v4))
  {
    -[UIView addSubview:](self->_sceneContentContainerView, "addSubview:", v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldViewBeInHierarchyForTransition:(id)a3
{
  UIView *v4;
  UIView *v5;
  UIView *v6;
  BOOL v7;

  v4 = (UIView *)a3;
  v5 = v4;
  if (self->_customContentView == v4 || (UIView *)self->_placeholderContentView == v4)
  {
    v7 = 1;
  }
  else
  {
    -[SBSceneView _transitionViewForHostView](self, "_transitionViewForHostView");
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v5;

  }
  return v7;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

uint64_t __42__SBSceneView__updateLiveContentRendering__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRenderingMode:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 577));
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  if (self->_rendersAsynchronously != a3)
  {
    self->_rendersAsynchronously = a3;
    -[SBSceneView _updateLiveContentRendering](self, "_updateLiveContentRendering");
  }
}

- (SBScenePlaceholderContentViewProvider)placeholderContentProvider
{
  return self->_placeholderContentProvider;
}

- (int64_t)effectiveDisplayMode
{
  return self->_effectiveDisplayMode;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __42__SBSceneView__updateResizesHostedContext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setResizesHostedContext:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 578));
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 orientation:(int64_t)a5
{
  return -[SBSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](self, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", a3, a5, a5, 0, a4.width, a4.height);
}

- (void)dealloc
{
  objc_super v3;

  -[SBSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  -[SBSceneView _invalidateHostPresenter](self, "_invalidateHostPresenter");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneView;
  -[SBSceneView dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;
  unint64_t v10;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("sceneId"));

  v6 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_sceneHandle, CFSTR("sceneHandle"));
  v7 = -[SBSceneView displayMode](self, "displayMode") - 1;
  if (v7 > 3)
    v8 = CFSTR("None");
  else
    v8 = off_24D4D0018[v7];
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("requestedDisplayMode"));
  v10 = -[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode") - 1;
  if (v10 > 3)
    v11 = CFSTR("None");
  else
    v11 = off_24D4D0018[v10];
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("effectiveDisplayMode"));
  -[NSCountedSet allObjects](self->_liveContentDisableReasons, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v13, CFSTR("liveContentDisableAssertions"), 1);

  v14 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
  if (self->_placeholderContentEnabled != a3)
  {
    self->_placeholderContentEnabled = a3;
    -[SBSceneView _reloadPlaceholderContentIfNecessary](self, "_reloadPlaceholderContentIfNecessary");
  }
}

- (id)newSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)-[UIScenePresenter newSnapshotContext](self->_presenter, "newSnapshotContext");
  if (v5)
  {
    -[SBSceneView _configureSceneSnapshotContext:](self, "_configureSceneSnapshotContext:", v5);
    objc_msgSend(v4, "createSnapshotWithContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)acquireLiveContentDisableAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  NSCountedSet *liveContentDisableReasons;
  NSCountedSet *v8;
  NSCountedSet *v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = (void *)objc_msgSend(v5, "copy");

  liveContentDisableReasons = self->_liveContentDisableReasons;
  if (liveContentDisableReasons)
  {
    -[NSCountedSet addObject:](liveContentDisableReasons, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14E0], "setWithObject:", v6);
    v8 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_liveContentDisableReasons;
    self->_liveContentDisableReasons = v8;

  }
  -[SBSceneView _evaluateEffectiveDisplayModeWithAnimationFactory:completion:](self, "_evaluateEffectiveDisplayModeWithAnimationFactory:completion:", 0, 0);
  -[UIScenePresentation removeFromSuperview](self->_hostView, "removeFromSuperview");
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x24BE0BE98]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__SBSceneView_acquireLiveContentDisableAssertionForReason___block_invoke;
  v15[3] = &unk_24D4CFEE8;
  objc_copyWeak(&v17, &location);
  v11 = v6;
  v16 = v11;
  v12 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSceneView.DisableLiveContent"), v11, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

void __59__SBSceneView_acquireLiveContentDisableAssertionForReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[70], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_evaluateEffectiveDisplayModeWithAnimationFactory:completion:", 0, 0);
    WeakRetained = v3;
  }

}

- (void)invalidate
{
  void *v3;
  SBScenePlaceholderContentViewProvider *placeholderContentProvider;
  UIView *customContentView;
  UIView *v6;
  UIView *sceneContentContainerView;
  UIView *backgroundView;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    self->_requestedDisplayMode = 0;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.176470588, 0.333333333, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneView setBackgroundColor:](self, "setBackgroundColor:", v3);

    -[SBSceneView _invalidateHostPresenter](self, "_invalidateHostPresenter");
    -[SBSceneView _clearSnapshotViews](self, "_clearSnapshotViews");
    -[SBScenePlaceholderContentViewProvider setDelegate:](self->_placeholderContentProvider, "setDelegate:", 0);
    placeholderContentProvider = self->_placeholderContentProvider;
    self->_placeholderContentProvider = 0;

    -[UIView removeFromSuperview](self->_customContentView, "removeFromSuperview");
    customContentView = self->_customContentView;
    self->_customContentView = 0;

    -[UIView superview](self->_backgroundView, "superview");
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();
    sceneContentContainerView = self->_sceneContentContainerView;

    if (v6 == sceneContentContainerView)
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    -[SBSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (self->_hostView)
    self = (SBSceneView *)self->_hostView;
  -[SBSceneView bounds](self, "bounds", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSceneView;
    v5 = -[SBSceneView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_refresh
{
  int64_t effectiveDisplayMode;

  effectiveDisplayMode = self->_effectiveDisplayMode;
  if (effectiveDisplayMode == 3)
  {
    -[SBSceneView _hotSwapLiveSnapshotView](self, "_hotSwapLiveSnapshotView");
  }
  else if (effectiveDisplayMode == 2)
  {
    -[SBSceneView _hotSwapPlaceholderContentView](self, "_hotSwapPlaceholderContentView");
  }
  -[SBSceneView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_configureSceneLiveSnapshotView:(id)a3
{
  -[UIView addSubview:](self->_sceneContentContainerView, "addSubview:", a3);
}

- (BOOL)_representsTranslucentContent
{
  return 0;
}

- (BOOL)_contentPrefersToDisableClipping
{
  return 0;
}

uint64_t __57__SBSceneView__invalidateContentPrefersToDisableClipping__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClippingDisabled:", *(_BYTE *)(a1 + 32) == 0);
}

- (BOOL)_wantsBlackBackground
{
  return 0;
}

- (UIEdgeInsets)_contentContainerEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_contentContainerCornerRadius
{
  return 0.0;
}

- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4
{
  double height;
  double width;
  int64_t orientation;
  double v11;
  double v12;
  void *v15;
  void *v16;

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 486, CFSTR("bogus reference size"));

  }
  if ((BSInterfaceOrientationIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneView.m"), 487, CFSTR("bogus interface orientation"));

  }
  orientation = self->_orientation;
  v11 = self->_referenceSize.width;
  v12 = self->_referenceSize.height;
  self->_referenceSize.width = width;
  self->_referenceSize.height = height;
  -[SBSceneView _setOrientation:](self, "_setOrientation:", a4);
  if (-[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode") == 2
    && (orientation != a4 || v11 != width || v12 != height))
  {
    -[SBSceneView _hotSwapPlaceholderContentView](self, "_hotSwapPlaceholderContentView");
  }
}

- (void)_containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBScenePlaceholderContentView setContainerOrientation:](self->_placeholderContentView, "setContainerOrientation:", a3);
}

- (void)placeholderContentViewProviderContentDidUpdate:(id)a3
{
  if (self->_placeholderContentProvider == a3)
    -[SBSceneView _reloadPlaceholderContentIfNecessary](self, "_reloadPlaceholderContentIfNecessary");
}

- (void)_setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[SBSceneView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_invalidateHostPresenter
{
  UIScenePresenter *presenter;
  UIScenePresentation *hostView;

  -[UIScenePresenter invalidate](self->_presenter, "invalidate");
  presenter = self->_presenter;
  self->_presenter = 0;

  -[SBSceneView _invalidateSceneLiveHostView:](self, "_invalidateSceneLiveHostView:", self->_hostView);
  -[UIScenePresentation removeFromSuperview](self->_hostView, "removeFromSuperview");
  hostView = self->_hostView;
  self->_hostView = 0;

}

- (void)_configureLiveSnapshotView
{
  void *v3;
  void *v4;
  id v5;
  UISceneSnapshotPresentation *v6;
  UISceneSnapshotPresentation *liveSnapshotView;

  if (!self->_liveSnapshotView)
  {
    if (-[SBSceneHandle isContentReady](self->_sceneHandle, "isContentReady"))
    {
      -[SBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uiPresentationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SBSceneView newSnapshot](self, "newSnapshot");
      objc_msgSend(v4, "snapshotPresentationForSnapshot:", v5);
      v6 = (UISceneSnapshotPresentation *)objc_claimAutoreleasedReturnValue();
      liveSnapshotView = self->_liveSnapshotView;
      self->_liveSnapshotView = v6;

      -[UISceneSnapshotPresentation setAlpha:](self->_liveSnapshotView, "setAlpha:", 0.0);
      -[SBSceneView _configureBackgroundColorForLiveSnapshot:](self, "_configureBackgroundColorForLiveSnapshot:", 1);
      -[SBSceneView _configureSceneLiveSnapshotView:](self, "_configureSceneLiveSnapshotView:", self->_liveSnapshotView);
      -[SBSceneView setNeedsLayout](self, "setNeedsLayout");
      -[SBSceneView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)_updateLiveViewContainment
{
  if (self->_hostView)
    -[SBSceneView _configureSceneLiveHostView:](self, "_configureSceneLiveHostView:");
  if (self->_liveSnapshotView)
    -[SBSceneView _configureSceneLiveSnapshotView:](self, "_configureSceneLiveSnapshotView:");
}

- (void)_hotSwapPlaceholderContentView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__SBSceneView__hotSwapPlaceholderContentView__block_invoke;
  v2[3] = &unk_24D4CFFF8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v2);
}

uint64_t __45__SBSceneView__hotSwapPlaceholderContentView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearSnapshotViews");
  objc_msgSend(*(id *)(a1 + 32), "_configurePlaceholderContentView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)_hotSwapLiveSnapshotView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__SBSceneView__hotSwapLiveSnapshotView__block_invoke;
  v2[3] = &unk_24D4CFFF8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v2);
}

void __39__SBSceneView__hotSwapLiveSnapshotView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  v4 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_clearSnapshotViews");
  objc_msgSend(*(id *)(a1 + 32), "_configureLiveSnapshotView");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  if (!v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 528), v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  }
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");

}

uint64_t __46__SBSceneView__recheckLiveContentDependencies__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_configureLiveHostView");
  objc_msgSend(*(id *)(a1 + 32), "_transitionViewForHostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (int64_t)displayMode
{
  return self->_requestedDisplayMode;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (BOOL)placeholderContentEnabled
{
  return self->_placeholderContentEnabled;
}

- (NSString)minificationFilter
{
  return self->_minificationFilter;
}

- (BOOL)rendersAsynchronously
{
  return self->_rendersAsynchronously;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (SBSceneViewDelegate)delegate
{
  return (SBSceneViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minificationFilter, 0);
  objc_storeStrong((id *)&self->_placeholderContentProvider, 0);
  objc_storeStrong((id *)&self->_liveContentDisableReasons, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_liveSnapshotView, 0);
  objc_storeStrong((id *)&self->_placeholderContentView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_sceneContentContainerView, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
