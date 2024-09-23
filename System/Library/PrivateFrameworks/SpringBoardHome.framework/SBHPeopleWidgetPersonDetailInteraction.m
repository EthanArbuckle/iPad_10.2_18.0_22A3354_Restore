@implementation SBHPeopleWidgetPersonDetailInteraction

- (SBHPeopleWidgetPersonDetailInteraction)initWithInteractionContext:(id)a3
{
  id v4;
  SBHPeopleWidgetPersonDetailInteraction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SBHPeopleWidgetPersonDetailInteractionSettings *settings;
  uint64_t v10;
  SBHPeopleWidgetPersonDetailInteractionContext *interactionContext;
  SBHViewControllerTransition *v12;
  SBHViewControllerTransition *transition;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHPeopleWidgetPersonDetailInteraction;
  v5 = -[SBHPeopleWidgetPersonDetailInteraction init](&v15, sel_init);
  if (v5)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personDetailInteractionSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBHPeopleWidgetPersonDetailInteractionSettings *)v8;

    v10 = objc_msgSend(v4, "copy");
    interactionContext = v5->_interactionContext;
    v5->_interactionContext = (SBHPeopleWidgetPersonDetailInteractionContext *)v10;

    v12 = objc_alloc_init(SBHViewControllerTransition);
    transition = v5->_transition;
    v5->_transition = v12;

    -[SBHViewControllerTransition setDelegate:](v5->_transition, "setDelegate:", v5);
  }

  return v5;
}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (SBIconView)sourceView
{
  void *v2;
  void *v3;

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconView *)v3;
}

- (SBIconView)referenceView
{
  void *v2;
  void *v3;

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconView *)v3;
}

- (double)targetContentCornerRadius
{
  void *v2;
  double v3;
  uint64_t v4;
  double v5;

  -[SBHPeopleWidgetPersonDetailInteraction settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "usesCardStyle"))
  {
    objc_msgSend(v2, "cardCornerRadius");
  }
  else
  {
    v4 = SBHScreenTypeForCurrentDevice();
    v3 = SBHDisplayCornerRadiusForScreenType(v4);
  }
  v5 = v3;

  return v5;
}

- (UIView)homeScreenContentView
{
  void *v2;
  void *v3;

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGRect)homeScreenContentFrame
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

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenContentFrame");
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

- (void)beginInteractionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHPeopleWidgetPersonDetailInteraction transition](self, "transition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progressToEndStateWithAnimation:", v3);

}

- (void)endInteractionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHPeopleWidgetPersonDetailInteraction transition](self, "transition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnToBeginningStateWithAnimation:", v3);

}

- (void)prepareTransition:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
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
  void *v59;
  void *v60;
  uint8_t buf[4];
  SBHPeopleWidgetPersonDetailInteraction *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setUserInfo:", self);
  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D709C0]);
  objc_msgSend(v6, "personURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithURL:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D709C8]), "initWithMetadata:", v9);
  objc_msgSend(v10, "setDelegate:", self);
  -[SBHPeopleWidgetPersonDetailInteraction setPersonViewController:](self, "setPersonViewController:", v10);
  objc_msgSend(v6, "containerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceIconView");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v11 && v12 && v13)
  {
    v59 = (void *)v13;
    v56 = v11;
    objc_msgSend(v6, "referenceIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHighlighted:", 0);
    v54 = v15;
    objc_msgSend(v15, "addObserver:", self);
    objc_msgSend(v12, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[SBHPeopleWidgetPersonDetailInteraction settings](self, "settings");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    v26 = CFSTR("personDetailBackground");
    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !objc_msgSend(v60, "usesCardStyle"))
      v26 = CFSTR("personDetailBackground-iPad");
    v27 = (void *)MEMORY[0x1E0D47498];
    v28 = (void *)MEMORY[0x1E0CB34D0];
    v29 = v26;
    objc_msgSend(v28, "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v29, v30, 0, 0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setFrame:", v17, v19, v21, v23);
    objc_msgSend(v31, "setAutoresizingMask:", 18);
    objc_msgSend(v31, "setGroupNameBase:", CFSTR("Person-Detail"));
    objc_msgSend(v12, "addSubview:", v31);
    -[SBHPeopleWidgetPersonDetailInteraction setBackgroundView:](self, "setBackgroundView:", v31);
    -[SBHPeopleWidgetPersonDetailInteraction _setUpMatchMoveAnimationForBackgroundView:](self, "_setUpMatchMoveAnimationForBackgroundView:", v31);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v17, v19, v21, v23);
    objc_msgSend(v32, "setAutoresizingMask:", 18);
    objc_msgSend(v32, "bs_setHitTestingDisabled:", 1);
    v57 = v9;
    v58 = v5;
    v55 = v6;
    if (objc_msgSend(v60, "usesCardStyle"))
      objc_msgSend(v60, "cardStyleDarkeningTintAlpha");
    else
      objc_msgSend(v60, "fullScreenDarkeningTintAlpha");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v33);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v53);
    objc_msgSend(v32, "setAlpha:", 0.0);
    objc_msgSend(v12, "addSubview:", v32);
    -[SBHPeopleWidgetPersonDetailInteraction setBackgroundTintView:](self, "setBackgroundTintView:", v32);
    -[SBHPeopleWidgetPersonDetailInteraction _setUpMatchMoveAnimationForBackgroundView:](self, "_setUpMatchMoveAnimationForBackgroundView:", v32);
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapToDismiss_);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v17, v19, v21, v23);
    objc_msgSend(v35, "addGestureRecognizer:", v52);
    -[SBHPeopleWidgetPersonDetailInteraction setTouchBlockingView:](self, "setTouchBlockingView:", v35);
    objc_msgSend(v12, "addSubview:", v35);
    objc_msgSend(v59, "customIconImageViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "continuousCornerRadius");
    v38 = v37;

    -[SBHPeopleWidgetPersonDetailInteraction setSourceContentCornerRadius:](self, "setSourceContentCornerRadius:", v38);
    -[SBHPeopleWidgetPersonDetailInteraction _sourceContentFrame](self, "_sourceContentFrame");
    -[SBHPeopleWidgetPersonDetailInteraction setSourceContentFrame:](self, "setSourceContentFrame:");
    -[SBHPeopleWidgetPersonDetailInteraction _targetContentFrame](self, "_targetContentFrame");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    -[SBHPeopleWidgetPersonDetailInteraction setTargetContentFrame:](self, "setTargetContentFrame:");
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v40, v42, v44, v46);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
    v48 = v12;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    objc_msgSend(v49, "setFrame:");
    objc_msgSend(v49, "setAutoresizingMask:", 18);
    objc_msgSend(v47, "addSubview:", v49);
    objc_msgSend(v47, "setClipsToBounds:", 1);
    -[SBHPeopleWidgetPersonDetailInteraction setPlatterView:](self, "setPlatterView:", v47);
    objc_msgSend(v10, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v40, v42, v44, v46);
    v11 = v56;
    objc_msgSend(v56, "bs_addChildViewController:withSuperview:", v10, v48);
    -[SBHPeopleWidgetPersonDetailInteraction setTargetView:](self, "setTargetView:", v50);

    v12 = v48;
    v14 = v59;

    v9 = v57;
    v5 = v58;
    v6 = v55;
  }
  else
  {
    SBLogIcon();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v62 = self;
      v63 = 2114;
      v64 = v51;
      v65 = 2114;
      v66 = v11;
      v67 = 2114;
      v68 = v12;
      v69 = 2114;
      v70 = v14;
      _os_log_error_impl(&dword_1CFEF3000, v34, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ failed to create a new presentation for container view controller: %{public}@ -- container view: %{public}@ -- source view: %{public}@", buf, 0x34u);

    }
    objc_msgSend(v5, "returnToBeginningStateWithAnimation:", 0);
  }

}

- (id)animatorForTransition:(id)a3
{
  _BOOL4 IsReduceMotionEnabled;
  __objc2_class **v4;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v4 = off_1E8D81B08;
  if (!IsReduceMotionEnabled)
    v4 = off_1E8D81B20;
  return objc_alloc_init(*v4);
}

- (void)transitionWillProgressToEndState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  SBHPeopleWidgetPersonDetailInteraction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting", (uint8_t *)&v7, 0xCu);
  }

  -[SBHPeopleWidgetPersonDetailInteraction touchBlockingView](self, "touchBlockingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[SBHPeopleWidgetPersonDetailInteraction modalInteractionDelegate](self, "modalInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "modalInteractionWillBegin:", self);

}

- (void)transitionDidProgressToEndState:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  SBHPeopleWidgetPersonDetailInteraction *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presentation finished", (uint8_t *)&v6, 0xCu);
  }

  -[SBHPeopleWidgetPersonDetailInteraction modalInteractionDelegate](self, "modalInteractionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "modalInteractionDidBegin:", self);

}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  SBHPeopleWidgetPersonDetailInteraction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing", (uint8_t *)&v7, 0xCu);
  }

  -[SBHPeopleWidgetPersonDetailInteraction touchBlockingView](self, "touchBlockingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[SBHPeopleWidgetPersonDetailInteraction modalInteractionDelegate](self, "modalInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "modalInteractionWillEnd:", self);

}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  SBHPeopleWidgetPersonDetailInteraction *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = self;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissal finished", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(v4, "setUserInfo:", 0);
  -[SBHPeopleWidgetPersonDetailInteraction backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[SBHPeopleWidgetPersonDetailInteraction backgroundTintView](self, "backgroundTintView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPeopleWidgetPersonDetailInteraction personViewController](self, "personViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_removeChildViewController:", v10);

  -[SBHPeopleWidgetPersonDetailInteraction setPersonViewController:](self, "setPersonViewController:", 0);
  -[SBHPeopleWidgetPersonDetailInteraction interactionContext](self, "interactionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceIconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "invalidate");
  -[SBHPeopleWidgetPersonDetailInteraction referenceView](self, "referenceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIconLabelAlpha:", 1.0);
  objc_msgSend(v13, "setIconImageAlpha:", 1.0);
  objc_msgSend(v13, "setAlpha:", 1.0);
  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "removeObserver:", self);
  -[SBHPeopleWidgetPersonDetailInteraction setBackgroundView:](self, "setBackgroundView:", 0);
  -[SBHPeopleWidgetPersonDetailInteraction setBackgroundTintView:](self, "setBackgroundTintView:", 0);
  -[SBHPeopleWidgetPersonDetailInteraction touchBlockingView](self, "touchBlockingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  -[SBHPeopleWidgetPersonDetailInteraction setTouchBlockingView:](self, "setTouchBlockingView:", 0);
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[SBHPeopleWidgetPersonDetailInteraction setSourceContentFrame:](self, "setSourceContentFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
  -[SBHPeopleWidgetPersonDetailInteraction setTargetContentFrame:](self, "setTargetContentFrame:", v15, v16, v17, v18);
  -[SBHPeopleWidgetPersonDetailInteraction modalInteractionDelegate](self, "modalInteractionDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "modalInteractionDidEnd:", self);

}

- (void)iconViewWasRecycled:(id)a3
{
  -[SBHPeopleWidgetPersonDetailInteraction endInteractionAnimated:](self, "endInteractionAnimated:", 0);
}

- (void)iconViewDidBecomeWindowless:(id)a3
{
  -[SBHPeopleWidgetPersonDetailInteraction endInteractionAnimated:](self, "endInteractionAnimated:", 0);
}

- (void)iconViewWasDiscarded:(id)a3
{
  -[SBHPeopleWidgetPersonDetailInteraction endInteractionAnimated:](self, "endInteractionAnimated:", 0);
}

- (void)peopleEntityViewControllerDidRequestDismissal:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  SBHPeopleWidgetPersonDetailInteraction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHPeopleWidgetPersonDetailInteraction personViewController](self, "personViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing due to view controller request", (uint8_t *)&v7, 0xCu);
    }

    -[SBHPeopleWidgetPersonDetailInteraction endInteractionAnimated:](self, "endInteractionAnimated:", 1);
  }
}

- (void)_handleTapToDismiss:(id)a3
{
  NSObject *v4;
  int v5;
  SBHPeopleWidgetPersonDetailInteraction *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing due to user tap", (uint8_t *)&v5, 0xCu);
  }

  -[SBHPeopleWidgetPersonDetailInteraction endInteractionAnimated:](self, "endInteractionAnimated:", 1);
}

- (CGRect)_sourceContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
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
  double v24;
  CGRect result;

  -[SBHPeopleWidgetPersonDetailInteraction referenceView](self, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconImageFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHPeopleWidgetPersonDetailInteraction containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_targetContentFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[SBHPeopleWidgetPersonDetailInteraction settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPeopleWidgetPersonDetailInteraction containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (objc_msgSend(v3, "usesCardStyle"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");

    -[SBHPeopleWidgetPersonDetailInteraction sourceContentFrame](self, "sourceContentFrame");
    UIRectGetCenter();
    -[SBHPeopleWidgetPersonDetailInteraction containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "interfaceOrientation");

    objc_msgSend(v3, "cardWidth");
    if ((unint64_t)(v16 - 1) > 1)
      objc_msgSend(v3, "cardHeightLandscape");
    else
      objc_msgSend(v3, "cardHeightPortrait");
    UIRectCenteredAboutPointScale();
    objc_msgSend(v3, "fractionBetweenSourceAndContainerX");
    objc_msgSend(v3, "fractionBetweenSourceAndContainerY");
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    objc_msgSend(v3, "percentMargin");
    UICeilToScale();
    UICeilToScale();
    UIRectContainInRect();
    v6 = v17;
    v8 = v18;
    v10 = v19;
    v12 = v20;
  }

  v21 = v6;
  v22 = v8;
  v23 = v10;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_setUpMatchMoveAnimationForBackgroundView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DA9D88];
  v5 = a3;
  -[SBHPeopleWidgetPersonDetailInteraction containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchMoveAnimationForPinningToView:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAnimation:forKey:", v8, CFSTR("SBHPersonDetailInteractionBackgroundMatchMoveAnimation"));
}

- (SBHModalInteractionDelegate)modalInteractionDelegate
{
  return (SBHModalInteractionDelegate *)objc_loadWeakRetained((id *)&self->modalInteractionDelegate);
}

- (void)setModalInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->modalInteractionDelegate, a3);
}

- (SBHPeopleWidgetPersonDetailInteractionContext)interactionContext
{
  return self->_interactionContext;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)settings
{
  return self->_settings;
}

- (PPLPeopleEntityViewController)personViewController
{
  return self->_personViewController;
}

- (void)setPersonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_personViewController, a3);
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (CGRect)sourceContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentFrame.origin.x;
  y = self->_sourceContentFrame.origin.y;
  width = self->_sourceContentFrame.size.width;
  height = self->_sourceContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (double)sourceContentCornerRadius
{
  return self->_sourceContentCornerRadius;
}

- (void)setSourceContentCornerRadius:(double)a3
{
  self->_sourceContentCornerRadius = a3;
}

- (CGRect)targetContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetContentFrame.origin.x;
  y = self->_targetContentFrame.origin.y;
  width = self->_targetContentFrame.size.width;
  height = self->_targetContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetContentFrame:(CGRect)a3
{
  self->_targetContentFrame = a3;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (void)setBackgroundTintView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTintView, a3);
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchBlockingView, a3);
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_personViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_destroyWeak((id *)&self->modalInteractionDelegate);
}

@end
