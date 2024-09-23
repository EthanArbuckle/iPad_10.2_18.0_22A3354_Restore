@implementation SBCaptureButtonDropletLaunchViewController

- (SBCaptureButtonDropletLaunchViewController)initWithButtonOrigin:(int64_t)a3
{
  SBCaptureButtonDropletLaunchViewController *v4;
  uint64_t v5;
  SBCaptureButtonSettings *settings;
  uint64_t v7;
  SBButtonBezelGeometryInfo *buttonGeometryInfo;
  uint64_t v9;
  NSMutableDictionary *toStageFloatAnimatableProperty;
  uint64_t v11;
  NSMutableDictionary *toStageCompletionBlock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  v4 = -[SBCaptureButtonDropletLaunchViewController init](&v14, sel_init);
  if (v4)
  {
    +[SBCaptureButtonDomain rootSettings](SBCaptureButtonDomain, "rootSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    settings = v4->_settings;
    v4->_settings = (SBCaptureButtonSettings *)v5;

    +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel](SBButtonBezelGeometryInfo, "buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel");
    v7 = objc_claimAutoreleasedReturnValue();
    buttonGeometryInfo = v4->_buttonGeometryInfo;
    v4->_buttonGeometryInfo = (SBButtonBezelGeometryInfo *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    toStageFloatAnimatableProperty = v4->_toStageFloatAnimatableProperty;
    v4->_toStageFloatAnimatableProperty = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    toStageCompletionBlock = v4->_toStageCompletionBlock;
    v4->_toStageCompletionBlock = (NSMutableDictionary *)v11;

    v4->_associatedButton = a3;
  }
  return v4;
}

- (void)animateDropletFromButtonWithMilestones:(id)a3
{
  -[SBCaptureButtonDropletLaunchViewController _setStage:animated:milestones:](self, "_setStage:animated:milestones:", 1, 1, a3);
}

- (BOOL)expandHintingDropletByAddingComponents:(unint64_t)a3
{
  unint64_t stage;
  unint64_t expansionComponents;
  BOOL v6;
  void *v7;

  stage = self->_stage;
  if (stage - 1 > 1)
    return 0;
  expansionComponents = self->_expansionComponents;
  v6 = (expansionComponents & a3) != a3;
  if ((expansionComponents & a3) != a3)
  {
    self->_expansionComponents = expansionComponents | a3;
    -[SBCaptureButtonDropletLaunchViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    stage = self->_stage;
  }
  if (stage == 1)
  {
    -[SBCaptureButtonDropletLaunchViewController _setStage:animated:milestones:](self, "_setStage:animated:milestones:", 2, 1, 0);
    return self->_stage > 1;
  }
  return v6;
}

- (id)lendAnimatingDropletViewToExternalOwner
{
  -[SBCaptureButtonDropletLaunchViewController _setStage:animated:milestones:](self, "_setStage:animated:milestones:", 3, 0, 0);
  return (id)-[DRPDropletContextView acquireGeometricChangeAssertionForReason:](self->_dropletContext, "acquireGeometricChangeAssertionForReason:", CFSTR("Lent Droplet"));
}

- (void)resetToOffscreenAnimated:(BOOL)a3 milestones:(id)a4
{
  -[SBCaptureButtonDropletLaunchViewController _setStage:animated:milestones:](self, "_setStage:animated:milestones:", 0, a3, a4);
}

- (CGRect)preludeAnimationRectPresentationValue
{
  void *v2;
  void *v3;
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
  CGRect result;

  -[DRPDropletContainerView layer](self->_appDropletContainer, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)animatingDroplet
{
  return self->_appDropletContainer;
}

- (id)animatingDropletContext
{
  return self->_dropletContext;
}

- (CGPoint)preludeAnimationVelocity
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[DRPDropletContainerView _velocityForKey:](self->_appDropletContainer, "_velocityForKey:", CFSTR("position.x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[DRPDropletContainerView _velocityForKey:](self->_appDropletContainer, "_velocityForKey:", CFSTR("position.y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SBCaptureButtonDropletLaunchViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "setOpaque:", 0);
  -[SBCaptureButtonDropletLaunchViewController setView:](self, "setView:", v7);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  DRPDropletContextView *v5;
  DRPDropletContextView *dropletContext;
  void *v7;
  UIView *v8;
  UIView *contentView;
  DRPDropletContainerView *v10;
  DRPDropletContainerView *appDropletContainer;
  DRPDropletAnimationCoordinator *v12;
  DRPDropletAnimationCoordinator *animator;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  -[SBCaptureButtonDropletLaunchViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D1D8E8]);
  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (DRPDropletContextView *)objc_msgSend(v3, "initWithFrame:");
  dropletContext = self->_dropletContext;
  self->_dropletContext = v5;

  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_dropletContext);

  -[DRPDropletContextView setAutoresizingMask:](self->_dropletContext, "setAutoresizingMask:", 18);
  v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  contentView = self->_contentView;
  self->_contentView = v8;

  -[DRPDropletContextView addContainerWithContentView:](self->_dropletContext, "addContainerWithContentView:", self->_contentView);
  v10 = (DRPDropletContainerView *)objc_claimAutoreleasedReturnValue();
  appDropletContainer = self->_appDropletContainer;
  self->_appDropletContainer = v10;

  v12 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x1E0D1D8E0]);
  animator = self->_animator;
  self->_animator = v12;

  self->_stage = 0;
  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  -[SBCaptureButtonDropletLaunchViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  if (self->_stage != 3)
    -[SBCaptureButtonDropletLaunchViewController _applyViewConfigurationForCurrentStage](self, "_applyViewConfigurationForCurrentStage");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_setStage:(unint64_t)a3 animated:(BOOL)a4 milestones:(id)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, double, double);
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *toStageCompletionBlock;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *toStageFloatAnimatableProperty;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v5 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = v9;
  if (self->_stage == a3 && self->_animateNextStageTransition == v5)
    goto LABEL_40;
  self->_stage = a3;
  self->_animateNextStageTransition = v5;
  if (self->_stage != 2)
    self->_expansionComponents = 0;
  v37 = a3;
  if (a3 == 3 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureButtonDropletLaunchViewController.m"), 170, CFSTR("Unimplemented"));

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NSMutableDictionary allKeys](self->_toStageFloatAnimatableProperty, "allKeys", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_toStageFloatAnimatableProperty, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_toStageCompletionBlock, "objectForKey:", v16);
        v18 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "presentationValue");
          ((void (**)(_QWORD, void *, uint64_t, double, double))v18)[2](v18, v17, 1, 1.79769313e308, v19);
        }
        if (v17 && (objc_msgSend(v17, "isInvalidated") & 1) == 0)
          objc_msgSend(v17, "invalidate");

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v13);
  }

  -[NSMutableDictionary removeAllObjects](self->_toStageFloatAnimatableProperty, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_toStageCompletionBlock, "removeAllObjects");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = v36;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (!v21)
  {
    v23 = 0;
    v29 = v20;
    goto LABEL_32;
  }
  v22 = v21;
  v23 = 0;
  v24 = *(_QWORD *)v39;
  do
  {
    for (j = 0; j != v22; ++j)
    {
      if (*(_QWORD *)v39 != v24)
        objc_enumerationMutation(v20);
      v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
      objc_msgSend(v26, "bs_CGFloatValue");
      if (BSFloatEqualToFloat())
      {
        objc_msgSend(v20, "objectForKey:", v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v27;
      }
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  }
  while (v22);

  if (v23)
  {
    toStageCompletionBlock = self->_toStageCompletionBlock;
    v29 = (void *)MEMORY[0x1D17E5550](v23);
    a3 = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](toStageCompletionBlock, "setObject:forKey:", v29, v30);

LABEL_32:
    goto LABEL_34;
  }
  a3 = v37;
LABEL_34:
  objc_msgSend(v20, "bs_filter:", &__block_literal_global_215);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA9F38], "sbf_animatablePropertyWithProgressMilestonesToBlocks:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    toStageFloatAnimatableProperty = self->_toStageFloatAnimatableProperty;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](toStageFloatAnimatableProperty, "setObject:forKey:", v31, v33);

  }
  if (a3 != 3)
  {
    -[SBCaptureButtonDropletLaunchViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setNeedsLayout");

  }
LABEL_40:

}

uint64_t __76__SBCaptureButtonDropletLaunchViewController__setStage_animated_milestones___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bs_CGFloatValue");
  return BSFloatEqualToFloat() ^ 1;
}

- (void)_applyViewConfigurationForCurrentStage
{
  void *v3;
  void *v4;

  -[SBCaptureButtonDropletLaunchViewController _configurationForStage:](self, "_configurationForStage:", self->_stage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[DRPDropletAnimationCoordinator applyViewConfiguration:animated:tracking:containerView:contextView:](self->_animator, "applyViewConfiguration:animated:tracking:containerView:contextView:", v3, self->_animateNextStageTransition, 0, self->_appDropletContainer, self->_dropletContext);
    v3 = v4;
  }

}

- (id)_configurationForStage:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SBCaptureButtonDropletLaunchViewController *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  unint64_t expansionComponents;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  NSMutableDictionary *toStageFloatAnimatableProperty;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *toStageCompletionBlock;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  CATransform3D v47;
  _QWORD v48[4];
  id v49;
  id v50[2];
  id location;
  _QWORD v52[4];
  id v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  switch(a3)
  {
    case 2uLL:
      -[SBCaptureButtonDropletLaunchViewController _defaultConfigurationForStage:](self, "_defaultConfigurationForStage:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      UIRectGetCenter();
      v18 = v17;
      expansionComponents = self->_expansionComponents;
      if ((expansionComponents & 1) != 0)
      {
        objc_msgSend(v16, "setCenterX:");
        expansionComponents = self->_expansionComponents;
        if ((expansionComponents & 2) == 0)
        {
LABEL_7:
          if ((expansionComponents & 4) == 0)
            goto LABEL_15;
LABEL_14:
          objc_msgSend(v16, "setContainerWidth:", v11);
          objc_msgSend(v16, "setContainerHeight:", v13);
          goto LABEL_15;
        }
      }
      else if ((expansionComponents & 2) == 0)
      {
        goto LABEL_7;
      }
      objc_msgSend(v16, "setCenterY:", v18);
      if ((self->_expansionComponents & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    case 1uLL:
      v14 = self;
      v15 = 1;
      goto LABEL_10;
    case 0uLL:
      v14 = self;
      v15 = 0;
LABEL_10:
      -[SBCaptureButtonDropletLaunchViewController _defaultConfigurationForStage:](v14, "_defaultConfigurationForStage:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
  }
  v16 = 0;
LABEL_15:
  v20 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:", self->_associatedButton);
  v21 = CFSTR("centerX");
  if ((v20 & 0xA) == 0)
    v21 = CFSTR("centerY");
  v22 = v21;
  toStageFloatAnimatableProperty = self->_toStageFloatAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](toStageFloatAnimatableProperty, "objectForKey:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  toStageCompletionBlock = self->_toStageCompletionBlock;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](toStageCompletionBlock, "objectForKey:", v27);
  v28 = objc_claimAutoreleasedReturnValue();

  if (v25 | v28)
  {
    v29 = MEMORY[0x1E0C809B0];
    if (v25)
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke;
      v52[3] = &unk_1E8EB2E10;
      v53 = (id)v25;
      objc_msgSend(v16, "addAlongsideAnimationBlockForKeyPath:animationBlock:", v22, v52);

    }
    objc_initWeak(&location, self);
    v48[0] = v29;
    v48[1] = 3221225472;
    v48[2] = __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_2;
    v48[3] = &unk_1E8EAA3E8;
    objc_copyWeak(v50, &location);
    v50[1] = (id)a3;
    v49 = (id)v28;
    objc_msgSend(v16, "addAnimationCompletionBlockForKeyPath:animationCompletionBlock:", v22, v48);

    objc_destroyWeak(v50);
    objc_destroyWeak(&location);
  }
  -[SBCaptureButtonSettings preludeDropletRadius](self->_settings, "preludeDropletRadius");
  objc_msgSend(v16, "setDropletRadius:");
  if (a3 != 2)
  {
    -[SBCaptureButtonSettings preludeCornerRadius](self->_settings, "preludeCornerRadius");
    objc_msgSend(v16, "setContainerCornerRadius:");
    goto LABEL_28;
  }
  objc_msgSend(v16, "setContainerCornerRadius:", SBScreenDisplayCornerRadius());
  v30 = self->_expansionComponents;
  if ((v30 & 1) == 0)
  {
    if ((v30 & 2) == 0)
      goto LABEL_24;
LABEL_30:
    -[SBCaptureButtonSettings zoomUpPositionYSettings](self->_settings, "zoomUpPositionYSettings");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerY"), v46);

    if ((self->_expansionComponents & 4) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  -[SBCaptureButtonSettings zoomUpPositionXSettings](self->_settings, "zoomUpPositionXSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerX"), v45);

  v30 = self->_expansionComponents;
  if ((v30 & 2) != 0)
    goto LABEL_30;
LABEL_24:
  if ((v30 & 4) != 0)
  {
LABEL_25:
    -[SBCaptureButtonSettings zoomUpScaleSettings](self->_settings, "zoomUpScaleSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("containerTransform"), v31);

  }
LABEL_26:
  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self->_settings, "zoomUpCornerRadiusSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("cornerRadius"), v32);

LABEL_28:
  objc_msgSend(v16, "containerWidth");
  v34 = v33;
  objc_msgSend(v16, "containerHeight");
  v36 = v35;
  objc_msgSend(v16, "centerX");
  v38 = v37;
  objc_msgSend(v16, "centerY");
  v39 = v38 - v34 * 0.5;
  v41 = v40 - v36 * 0.5;
  v54.origin.x = v39;
  v54.origin.y = v41;
  v54.size.width = v34;
  v54.size.height = v36;
  objc_msgSend(v16, "setCenterX:", CGRectGetMidX(v54));
  v55.origin.x = v39;
  v55.origin.y = v41;
  v55.size.width = v34;
  v55.size.height = v36;
  objc_msgSend(v16, "setCenterY:", CGRectGetMidY(v55));
  v56.origin.x = v7;
  v56.origin.y = v9;
  v56.size.width = v11;
  v56.size.height = v13;
  objc_msgSend(v16, "setContainerWidth:", CGRectGetWidth(v56));
  v57.origin.x = v7;
  v57.origin.y = v9;
  v57.size.width = v11;
  v57.size.height = v13;
  objc_msgSend(v16, "setContainerHeight:", CGRectGetHeight(v57));
  CATransform3DMakeScale(&v47, v34 / v11, v36 / v13, 1.0);
  objc_msgSend(v16, "setContainerTransform:", &v47);
  objc_msgSend(v16, "setBoundaryEdges:", v20);
  objc_msgSend(v16, "keylineStyle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBHardwareButtonHintPrototypeDomain rootSettings](SBHardwareButtonHintPrototypeDomain, "rootSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "allButtonKeylineWidth");
  objc_msgSend(v42, "setOuterWidth:");

  objc_msgSend(v16, "defaultResetKeylineForCanvasSize:", v11, v13);
  return v16;
}

uint64_t __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", 1.0);
}

void __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[128];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_msgSend(v7, "isInvalidated") & 1) == 0)
        objc_msgSend(v7, "invalidate");
      v8 = (void *)v11[128];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
  }
  else
  {
    v7 = 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, void *, uint64_t, double, double))(v10 + 16))(v10, v7, a2, 1.79769313e308, 1.79769313e308);

}

- (id)_defaultConfigurationForStage:(unint64_t)a3
{
  unint64_t v5;
  SBButtonBezelGeometryInfo *buttonGeometryInfo;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v5 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:", 9);
  buttonGeometryInfo = self->_buttonGeometryInfo;
  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", 9);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SBCaptureButtonDropletLaunchViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;

  return (id)objc_msgSend(MEMORY[0x1E0D1D8F0], "hardwareButtonHintForButton:stage:keylineStyle:rectEdge:buttonRect:canvasSize:", 9, a3 != 0, 0, v5, v9, v11, v13, v15, v18, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toStageCompletionBlock, 0);
  objc_storeStrong((id *)&self->_toStageFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_appDropletContainer, 0);
  objc_storeStrong((id *)&self->_dropletContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_buttonGeometryInfo, 0);
}

@end
