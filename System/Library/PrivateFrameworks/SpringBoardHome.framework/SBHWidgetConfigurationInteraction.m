@implementation SBHWidgetConfigurationInteraction

- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 intent:(id)a5 configuredDataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBHWidgetConfigurationInteraction *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBHWidgetConfigurationInteraction initWithDescriptor:gridSizeClass:gridSizeClassDomain:intent:configuredDataSource:](self, "initWithDescriptor:gridSizeClass:gridSizeClassDomain:intent:configuredDataSource:", v13, v12, v14, v11, v10);

  return v15;
}

- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 gridSizeClassDomain:(id)a5 intent:(id)a6 configuredDataSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBHWidgetConfigurationInteraction *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  SBHWidgetSettings *widgetSettings;
  WFWidgetConfigurationOptions *v22;
  WFWidgetConfigurationOptions *configurationOptions;
  WFWidgetConfigurationOptions *v24;
  void *v25;
  WFWidgetConfigurationOptions *v26;
  void *v27;
  uint64_t v28;
  CHSBaseDescriptor *descriptor;
  SBHViewControllerTransition *v30;
  SBHViewControllerTransition *transition;
  objc_super v33;
  uint8_t buf[4];
  SBHWidgetConfigurationInteraction *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)SBHWidgetConfigurationInteraction;
  v17 = -[SBHWidgetConfigurationInteraction init](&v33, sel_init);
  if (v17)
  {
    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v35 = v17;
      v36 = 2114;
      v37 = v12;
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initializing configuration interaction for descriptor: %{public}@ -- intent: %@", buf, 0x20u);
    }

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widgetSettings");
    v20 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v17->_widgetSettings;
    v17->_widgetSettings = (SBHWidgetSettings *)v20;

    objc_storeStrong((id *)&v17->_configuration, a6);
    objc_storeStrong((id *)&v17->_configuredDataSource, a7);
    v22 = (WFWidgetConfigurationOptions *)objc_alloc_init(MEMORY[0x1E0DDA0F8]);
    configurationOptions = v17->_configurationOptions;
    v17->_configurationOptions = v22;

    -[WFWidgetConfigurationOptions setIntent:](v17->_configurationOptions, "setIntent:", v15);
    v24 = v17->_configurationOptions;
    objc_msgSend(v12, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationOptions setWidgetDisplayName:](v24, "setWidgetDisplayName:", v25);

    v26 = v17->_configurationOptions;
    objc_msgSend(v12, "widgetDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationOptions setWidgetDescription:](v26, "setWidgetDescription:", v27);

    -[WFWidgetConfigurationOptions setWidgetConfigurationType:](v17->_configurationOptions, "setWidgetConfigurationType:", objc_msgSend(v12, "sbh_configurationType"));
    -[WFWidgetConfigurationOptions setFamily:](v17->_configurationOptions, "setFamily:", objc_msgSend(v14, "chsWidgetFamilyForIconGridSizeClass:", v13));
    v28 = objc_msgSend(v12, "copy");
    descriptor = v17->_descriptor;
    v17->_descriptor = (CHSBaseDescriptor *)v28;

    v30 = objc_alloc_init(SBHViewControllerTransition);
    transition = v17->_transition;
    v17->_transition = v30;

    -[SBHViewControllerTransition setDelegate:](v17->_transition, "setDelegate:", v17);
  }

  return v17;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)targetView
{
  void *v2;
  void *v3;

  -[SBHWidgetConfigurationInteraction configurationViewController](self, "configurationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)beginConfiguration
{
  id v2;

  -[SBHWidgetConfigurationInteraction transition](self, "transition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressToEndStateWithAnimation:", 1);

}

- (void)endConfiguration
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  SBHWidgetConfigurationInteraction *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SBHWidgetConfigurationInteraction transition](self, "transition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTransitioning") & 1) == 0)
  {
    SBLogIcon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ calling finishWithCurrentConfiguration", (uint8_t *)&v8, 0x16u);

    }
    -[SBHWidgetConfigurationInteraction configurationViewController](self, "configurationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithCurrentConfiguration");

  }
  -[SBHWidgetConfigurationInteraction _endConfigurationImmediately:](self, "_endConfigurationImmediately:", 0);

}

- (void)endConfigurationImmediately
{
  -[SBHWidgetConfigurationInteraction _endConfigurationImmediately:](self, "_endConfigurationImmediately:", 1);
}

- (void)_endConfigurationImmediately:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[SBHWidgetConfigurationInteraction transition](self, "transition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnToBeginningStateWithAnimation:", !v3);

}

- (void)prepareTransition:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint8_t buf[4];
  SBHWidgetConfigurationInteraction *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setUserInfo:", self);
  v6 = objc_alloc(MEMORY[0x1E0DDA100]);
  -[SBHWidgetConfigurationInteraction configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithOptions:", v7);

  -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setOverrideUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyleForConfigurationInteraction:", self));
  objc_msgSend(v8, "setDelegate:", self);
  -[SBHWidgetConfigurationInteraction setConfigurationViewController:](self, "setConfigurationViewController:", v8);
  objc_msgSend(v9, "containerViewControllerForConfigurationInteraction:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationInteraction setContainerViewController:](self, "setContainerViewController:", v10);
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "containerViewForConfigurationInteraction:", self);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  -[SBHWidgetConfigurationInteraction setContainerView:](self, "setContainerView:", v11);
  objc_msgSend(v9, "sourceIconViewForConfigurationInteraction:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationInteraction setSourceView:](self, "setSourceView:", v13);
  if (v10 && v11 && v13)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "referenceIconViewForConfigurationInteraction:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetConfigurationInteraction setReferenceView:](self, "setReferenceView:", v14);
      objc_msgSend(v14, "setHighlighted:", 0);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "homeScreenContentViewForConfigurationInteraction:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetConfigurationInteraction setHomeScreenContentView:](self, "setHomeScreenContentView:", v15);

    }
    objc_msgSend(v13, "setUserInteractionEnabled:", 1);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapToPresent_);
    -[SBHWidgetConfigurationInteraction setTapToPresentGesture:](self, "setTapToPresentGesture:", v16);
    objc_msgSend(v13, "addGestureRecognizer:", v16);
    objc_msgSend(v11, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_opt_respondsToSelector();
    v26 = v24;
    v27 = v22;
    v28 = v20;
    v29 = v18;
    if ((v25 & 1) != 0)
      objc_msgSend(v9, "contentBoundingRectForConfigurationInteraction:", self, v18, v20, v22, v24);
    -[SBHWidgetConfigurationInteraction setContentBoundingRect:](self, "setContentBoundingRect:", v29, v28, v27, v26);
    -[SBHWidgetConfigurationInteraction widgetSettings](self, "widgetSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v16;
    v64 = v5;
    if ((objc_msgSend(v30, "configurationBlursBackground") & 1) != 0)
    {
      v31 = (void *)MEMORY[0x1E0D47498];
      v32 = v30;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("widgetConfigurationBackground"), v33, 0, 0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v32;
      objc_msgSend(v34, "setFrame:", v18, v20, v22, v24);
      objc_msgSend(v34, "setAutoresizingMask:", 18);
      objc_msgSend(v34, "setGroupNameBase:", CFSTR("Widget-Configuration"));
      objc_msgSend(v11, "addSubview:", v34);
      -[SBHWidgetConfigurationInteraction setBackgroundView:](self, "setBackgroundView:", v34);
      -[SBHWidgetConfigurationInteraction _setUpMatchMoveAnimationForBackgroundView:](self, "_setUpMatchMoveAnimationForBackgroundView:", v34);

    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v18, v20, v22, v24);
    objc_msgSend(v35, "setAutoresizingMask:", 18);
    objc_msgSend(v35, "bs_setHitTestingDisabled:", 1);
    objc_msgSend(v30, "configurationDarkeningTintAlpha");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v36);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:");
    objc_msgSend(v35, "setAlpha:", 0.0);
    v62 = v30;
    objc_msgSend(v30, "configurationWidgetTintColorAlpha");
    v38 = v37;
    if (BSFloatGreaterThanFloat())
    {
      -[SBHWidgetConfigurationInteraction descriptor](self, "descriptor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_opt_class();
      v41 = v39;
      if (v40)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v42 = v41;
        else
          v42 = 0;
      }
      else
      {
        v42 = 0;
      }
      v44 = v42;

      objc_msgSend(v44, "backgroundColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v18, v20, v22, v24);
        objc_msgSend(v46, "setAutoresizingMask:", 18);
        objc_msgSend(v45, "colorWithAlphaComponent:", v38);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setBackgroundColor:", v47);

        objc_msgSend(v35, "addSubview:", v46);
      }

    }
    objc_msgSend(v11, "addSubview:", v35);
    -[SBHWidgetConfigurationInteraction setBackgroundTintView:](self, "setBackgroundTintView:", v35);
    -[SBHWidgetConfigurationInteraction _setUpMatchMoveAnimationForBackgroundView:](self, "_setUpMatchMoveAnimationForBackgroundView:", v35);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapToDismiss_);
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v18, v20, v22, v24);
    objc_msgSend(v49, "addGestureRecognizer:", v48);
    -[SBHWidgetConfigurationInteraction setTouchBlockingView:](self, "setTouchBlockingView:", v49);
    objc_msgSend(v11, "addSubview:", v49);
    objc_msgSend(v10, "bs_addChildViewController:withSuperview:", v8, v11);
    objc_msgSend(v8, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v18, v20, v22, v24);
    -[SBHWidgetConfigurationInteraction _sourceContentFrame](self, "_sourceContentFrame");
    -[SBHWidgetConfigurationInteraction setSourceContentFrame:](self, "setSourceContentFrame:");
    -[SBHWidgetConfigurationInteraction _targetContentFrame](self, "_targetContentFrame");
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;
    -[SBHWidgetConfigurationInteraction setTargetContentFrame:](self, "setTargetContentFrame:");
    objc_msgSend(v8, "configurationView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setOverridingCardViewFrame:", v52, v54, v56, v58);

    v5 = v64;
  }
  else
  {
    SBLogIcon();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v66 = self;
      v67 = 2114;
      v68 = v60;
      v69 = 2114;
      v70 = v10;
      v71 = 2114;
      v72 = v11;
      v73 = 2114;
      v74 = v13;
      _os_log_error_impl(&dword_1CFEF3000, v43, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ failed to create a new presentation for container view controller: %{public}@ -- container view: %{public}@ -- source view: %{public}@", buf, 0x34u);

    }
    objc_msgSend(v5, "returnToBeginningStateWithAnimation:", 0);
  }

}

- (id)animatorForTransition:(id)a3
{
  _BOOL4 IsReduceMotionEnabled;
  __objc2_class **v4;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v4 = off_1E8D81CE8;
  if (!IsReduceMotionEnabled)
    v4 = off_1E8D81CF0;
  return objc_alloc_init(*v4);
}

- (void)transitionWillProgressToEndState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  SBHWidgetConfigurationInteraction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting", (uint8_t *)&v9, 0xCu);
  }

  -[SBHWidgetConfigurationInteraction touchBlockingView](self, "touchBlockingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "configurationInteractionWillBegin:", self);
  SBLogTelemetrySignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_PRESENT", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBHWidgetConfigurationWillPresentNotification"), self);

}

- (void)transitionDidProgressToEndState:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  SBHWidgetConfigurationInteraction *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presentation finished", (uint8_t *)&v8, 0xCu);
  }

  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_PRESENT", " enableTelemetry=YES ", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBHWidgetConfigurationDidPresentNotification"), self);

  -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "configurationInteractionDidBegin:", self);

}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  SBHWidgetConfigurationInteraction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing", (uint8_t *)&v9, 0xCu);
  }

  -[SBHWidgetConfigurationInteraction touchBlockingView](self, "touchBlockingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "configurationInteractionWillEnd:", self);
  SBLogTelemetrySignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_DISMISS", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBHWidgetConfigurationWillDismissNotification"), self);

}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  int v23;
  SBHWidgetConfigurationInteraction *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = self;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissal finished", (uint8_t *)&v23, 0xCu);
  }

  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_DISMISS", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBHWidgetConfigurationDidDismissNotification"), self);

  objc_msgSend(v4, "setUserInfo:", 0);
  -[SBHWidgetConfigurationInteraction backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[SBHWidgetConfigurationInteraction backgroundTintView](self, "backgroundTintView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[SBHWidgetConfigurationInteraction setContainerView:](self, "setContainerView:", 0);
  -[SBHWidgetConfigurationInteraction containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationInteraction configurationViewController](self, "configurationViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bs_removeChildViewController:", v11);

  -[SBHWidgetConfigurationInteraction setContainerViewController:](self, "setContainerViewController:", 0);
  -[SBHWidgetConfigurationInteraction setConfigurationViewController:](self, "setConfigurationViewController:", 0);
  -[SBHWidgetConfigurationInteraction setHomeScreenContentView:](self, "setHomeScreenContentView:", 0);
  -[SBHWidgetConfigurationInteraction sourceView](self, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationInteraction tapToPresentGesture](self, "tapToPresentGesture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeGestureRecognizer:", v13);

  objc_msgSend(v12, "invalidate");
  -[SBHWidgetConfigurationInteraction setSourceView:](self, "setSourceView:", 0);
  -[SBHWidgetConfigurationInteraction setTapToPresentGesture:](self, "setTapToPresentGesture:", 0);
  -[SBHWidgetConfigurationInteraction referenceView](self, "referenceView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "customIconImageViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 0);

  objc_msgSend(v14, "setIconLabelAlpha:", 1.0);
  objc_msgSend(v14, "setAlpha:", 1.0);
  objc_msgSend(v14, "setHidden:", 0);
  -[SBHWidgetConfigurationInteraction setReferenceView:](self, "setReferenceView:", 0);
  -[SBHWidgetConfigurationInteraction setBackgroundView:](self, "setBackgroundView:", 0);
  -[SBHWidgetConfigurationInteraction setBackgroundTintView:](self, "setBackgroundTintView:", 0);
  -[SBHWidgetConfigurationInteraction touchBlockingView](self, "touchBlockingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeFromSuperview");

  -[SBHWidgetConfigurationInteraction setTouchBlockingView:](self, "setTouchBlockingView:", 0);
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[SBHWidgetConfigurationInteraction setSourceContentFrame:](self, "setSourceContentFrame:", *MEMORY[0x1E0C9D648], v19, v20, v21);
  -[SBHWidgetConfigurationInteraction setTargetContentFrame:](self, "setTargetContentFrame:", v18, v19, v20, v21);
  -[SBHWidgetConfigurationInteraction setContentBoundingRect:](self, "setContentBoundingRect:", v18, v19, v20, v21);
  -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "configurationInteractionDidEnd:", self);

}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  SBHWidgetConfigurationInteraction *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[SBHWidgetConfigurationInteraction configurationViewController](self, "configurationViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationInteraction configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == v7)
  {
    v15 = objc_msgSend(v10, "_indexingHash");
    v16 = objc_msgSend(v8, "_indexingHash");
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v15 == v16)
    {
      if (v17)
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138544130;
        v20 = self;
        v21 = 2114;
        v22 = v13;
        v23 = 2112;
        v24 = v8;
        v25 = 2112;
        v26 = v11;
        v14 = "[%{public}@]: %{public}@ is ignoring new intent: %@ -- equivalent to old intent: %@";
        goto LABEL_7;
      }
    }
    else
    {
      if (v17)
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = self;
        v21 = 2114;
        v22 = v18;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is committing new intent: %@", (uint8_t *)&v19, 0x20u);

      }
      -[SBHWidgetConfigurationInteraction setConfiguration:](self, "setConfiguration:", v8);
      -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject configurationInteractionDidCommit:](v12, "configurationInteractionDidCommit:", self);
    }
  }
  else
  {
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = self;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v8;
      v25 = 2114;
      v26 = v7;
      v14 = "[%{public}@]: %{public}@ is ignoring new intent: %@ -- for unexpected view controller: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x2Au);

    }
  }

  -[SBHWidgetConfigurationInteraction _endConfigurationImmediately:](self, "_endConfigurationImmediately:", 0);
}

- (void)_handleTapToPresent:(id)a3
{
  NSObject *v4;
  int v5;
  SBHWidgetConfigurationInteraction *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting due to user tap", (uint8_t *)&v5, 0xCu);
  }

  -[SBHWidgetConfigurationInteraction beginConfiguration](self, "beginConfiguration");
}

- (void)_handleTapToDismiss:(id)a3
{
  NSObject *v4;
  int v5;
  SBHWidgetConfigurationInteraction *v6;
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

  -[SBHWidgetConfigurationInteraction _endConfigurationImmediately:](self, "_endConfigurationImmediately:", 0);
}

- (CGRect)_sourceContentFrame
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[SBHWidgetConfigurationInteraction referenceView](self, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBHWidgetConfigurationInteraction sourceView](self, "sourceView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "iconImageFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBHWidgetConfigurationInteraction containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_targetContentFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double MaxX;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  CGFloat v53;
  double v54;
  CGFloat rect;
  CGFloat rect_8;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect result;

  -[SBHWidgetConfigurationInteraction widgetSettings](self, "widgetSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v52 = v5;

  -[SBHWidgetConfigurationInteraction contentBoundingRect](self, "contentBoundingRect");
  v54 = v6;
  if ((objc_msgSend(v3, "configurationMaximizesCardHeight") & 1) == 0)
  {
    -[SBHWidgetConfigurationInteraction configurationViewController](self, "configurationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSize");
    BSRectWithSize();

  }
  -[SBHWidgetConfigurationInteraction sourceContentFrame](self, "sourceContentFrame");
  UIRectGetCenter();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_5:
      UIRectGetCenter();
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 != 1)
      goto LABEL_5;
  }
  UIRectCenteredAboutPointScale();
  -[SBHWidgetConfigurationInteraction sourceView](self, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v11);

  if (v12)
  {
    v51 = v52;
    UIRectCenteredXInRectScale();
    goto LABEL_11;
  }
  -[SBHWidgetSettings configurationFractionBetweenSourceAndContainerX](self->_widgetSettings, "configurationFractionBetweenSourceAndContainerX");
  -[SBHWidgetSettings configurationFractionBetweenSourceAndContainerY](self->_widgetSettings, "configurationFractionBetweenSourceAndContainerY");
  UIRectGetCenter();
LABEL_10:
  UIRectCenteredAboutPointScale();
LABEL_11:
  rect = v13;
  rect_8 = v14;
  v17 = v15;
  v18 = v16;
  -[SBHWidgetConfigurationInteraction containerView](self, "containerView", v51);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v53 = v21;
  if (objc_msgSend(v3, "configurationUsesPercentVerticalMargin"))
  {
    -[SBHWidgetConfigurationInteraction delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v28, "verticalMarginPercentageForConfigurationInteraction:", self);
    if (BSFloatLessThanFloat())
      objc_msgSend(v3, "configurationPercentVerticalMargin");
    UICeilToScale();
    v30 = v29;

  }
  else
  {
    objc_msgSend(v3, "configurationAbsoluteVerticalMargin");
    v30 = v31;
  }
  if (v54 <= v27 - v30 - v30)
    v32 = v54;
  else
    v32 = v27 - v30 - v30;
  if (objc_msgSend(v3, "configurationEnforcesMaxCardHeight"))
  {
    objc_msgSend(v3, "configurationMaxCardHeight");
    if (v32 > v33)
      v32 = v33;
  }
  v34 = rect;
  if (v18 > v32)
    v18 = v32;
  v35 = rect_8;
  v36 = v17;
  v37 = v18;
  MaxX = CGRectGetMaxX(*(CGRect *)&v34);
  v57.origin.x = v53;
  v57.origin.y = v23;
  v57.size.width = v25;
  v57.size.height = v27;
  if (MaxX > CGRectGetWidth(v57))
  {
    v58.origin.x = v53;
    v58.origin.y = v23;
    v58.size.width = v25;
    v58.size.height = v27;
    CGRectGetWidth(v58);
    v59.origin.x = rect;
    v59.origin.y = rect_8;
    v59.size.width = v17;
    v59.size.height = v18;
    CGRectGetWidth(v59);
  }
  UIRectContainInRect();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v47 = v40;
  v48 = v42;
  v49 = v44;
  v50 = v46;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
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
  -[SBHWidgetConfigurationInteraction containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchMoveAnimationForPinningToView:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAnimation:forKey:", v8, CFSTR("SBHWidgetConfigurationBackgroundMatchMoveAnimation"));
}

- (INIntent)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SBHIconViewConfigurationInteractionDelegate)delegate
{
  return (SBHIconViewConfigurationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBLeafIconDataSource)configuredDataSource
{
  return self->_configuredDataSource;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (WFWidgetConfigurationOptions)configurationOptions
{
  return self->_configurationOptions;
}

- (WFWidgetConfigurationViewController)configurationViewController
{
  return self->_configurationViewController;
}

- (void)setConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_configurationViewController, a3);
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
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

- (CGRect)contentBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBoundingRect.origin.x;
  y = self->_contentBoundingRect.origin.y;
  width = self->_contentBoundingRect.size.width;
  height = self->_contentBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBoundingRect:(CGRect)a3
{
  self->_contentBoundingRect = a3;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (void)setHomeScreenContentView:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenContentView, a3);
}

- (BSInvalidatable)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (SBIconView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
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

- (UITapGestureRecognizer)tapToPresentGesture
{
  return self->_tapToPresentGesture;
}

- (void)setTapToPresentGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapToPresentGesture, a3);
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (CHSBaseDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_tapToPresentGesture, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_configuredDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
