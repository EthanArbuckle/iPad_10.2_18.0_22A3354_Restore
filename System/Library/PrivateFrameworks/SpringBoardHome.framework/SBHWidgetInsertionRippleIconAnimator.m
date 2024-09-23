@implementation SBHWidgetInsertionRippleIconAnimator

- (SBHWidgetInsertionRippleIconAnimator)initWithIconListView:(id)a3 widgetIcon:(id)a4 referenceLayout:(id)a5 referenceIconView:(id)a6 additionalIconListView:(id)a7 preludeBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SBHWidgetInsertionRippleIconAnimator *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unsigned __int16 v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  int v39;
  _BOOL8 v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  SBHRippleSimulation *v46;
  SBHRippleSimulation *rippleSimulation;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  uint64_t v52;
  SBHWidgetSettings *settings;
  uint64_t v54;
  id preludeBlock;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id obj;
  objc_super v64;

  v15 = a3;
  obj = a4;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v64.receiver = self;
  v64.super_class = (Class)SBHWidgetInsertionRippleIconAnimator;
  v21 = -[SBHWidgetInsertionRippleIconAnimator init](&v64, sel_init);
  if (v21)
  {
    v57 = a6;
    v59 = v20;
    v60 = v18;
    objc_msgSend(v15, "gridCellInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "numberOfUsedColumns");
    v58 = v22;
    v24 = objc_msgSend(v22, "numberOfUsedRows");
    v62 = v17;
    if (v19)
    {
      objc_msgSend(v19, "model");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "numberOfIcons"))
      {
        v26 = objc_msgSend(v25, "gridSize");
        if (v23 <= v26)
          v23 = v26;
        v27 = objc_msgSend(v25, "gridSize") >> 16;
        v24 += v27;
        v28 = SBIconCoordinateMake(0, v27);
        objc_msgSend(v19, "centerForIconCoordinate:", v28, v29);
        objc_msgSend(v15, "convertPoint:fromView:", v19);
        objc_msgSend(v15, "fractionalCoordinateAtPoint:");
        v31 = vcvtpd_u64_f64(v30);
        if (v24 <= v31)
          v24 = v31;
        objc_msgSend(v19, "frame");
        v33 = v32;
        objc_msgSend(v15, "frame");
        if (v33 < v34)
          v21->_rowOffset = v27;
        v17 = v62;
      }
      else
      {

        v25 = 0;
      }

    }
    SBHIconListLayoutIconGridSizeClassSizes(v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v16;
    objc_msgSend(v16, "gridSizeClass");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "gridSizeForGridSizeClass:", v36) >> 16;

    v21->_widgetIconSizeIsLarge = v37 >= objc_msgSend(v35, "gridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge")) >> 16;
    objc_msgSend(v15, "iconLocation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("SBIconLocationStackConfiguration"));

    if (v39)
    {
      v40 = 0;
      v41 = !v21->_widgetIconSizeIsLarge;
      v42 = 8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "userInterfaceIdiom");

      v41 = (v44 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v40 = v41;
      v42 = 2;
    }
    if (v41)
      v45 = 4;
    else
      v45 = v42;
    v46 = -[SBHRippleSimulation initWithRows:columns:resolution:style:]([SBHRippleSimulation alloc], "initWithRows:columns:resolution:style:", v24, v23, v45, v40);
    rippleSimulation = v21->_rippleSimulation;
    v21->_rippleSimulation = v46;

    objc_storeStrong((id *)&v21->_iconListView, a3);
    objc_storeStrong((id *)&v21->_widgetIcon, obj);
    objc_storeStrong((id *)&v21->_additionalIconListView, a7);
    v21->_startedAnimation = 0;
    objc_storeStrong((id *)&v21->_referenceIconView, v57);
    objc_msgSend(v15, "window");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v60;
    objc_msgSend(v60, "convertPoint:toView:", v48, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v21->_referenceIconViewOriginInWindow.x = v49;
    v21->_referenceIconViewOriginInWindow.y = v50;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "widgetSettings");
    v52 = objc_claimAutoreleasedReturnValue();
    settings = v21->_settings;
    v21->_settings = (SBHWidgetSettings *)v52;

    v20 = v59;
    v54 = objc_msgSend(v59, "copy");
    preludeBlock = v21->_preludeBlock;
    v21->_preludeBlock = (id)v54;

    v16 = v61;
    v17 = v62;
  }

  return v21;
}

- (void)animateWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void (**preludeBlock)(void);
  void *v8;
  id animationCompletion;
  SBIconListView *v10;
  SBIconView *v11;
  SBIconView *widgetIconView;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_startedAnimation)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_startedAnimation == NO"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHWidgetInsertionRippleIconAnimator animateWithCompletion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0008C04);
  }
  v6 = v5;
  preludeBlock = (void (**)(void))self->_preludeBlock;
  if (preludeBlock)
    preludeBlock[2]();
  self->_startedAnimation = 1;
  v8 = _Block_copy(v6);
  animationCompletion = self->_animationCompletion;
  self->_animationCompletion = v8;

  v10 = self->_iconListView;
  -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](v10, "layoutIconsIfNeededWithAnimationType:options:", 1, 0);
  -[SBIconListView iconViewForIcon:](v10, "iconViewForIcon:", self->_widgetIcon);
  v11 = (SBIconView *)objc_claimAutoreleasedReturnValue();
  widgetIconView = self->_widgetIconView;
  self->_widgetIconView = v11;

  SBLogWidgets();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    -[SBWidgetIcon activeWidget](self->_widgetIcon, "activeWidget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", "activeWidget=%{public, name=activeWidget}@", buf, 0xCu);

  }
  -[SBHWidgetSettings dropInsertionImpactDelay](self->_settings, "dropInsertionImpactDelay");
  if (self->_referenceIconView)
  {
    -[SBHWidgetInsertionRippleIconAnimator _performJumpAnimationWithCompletion:](self, "_performJumpAnimationWithCompletion:", 0);
    -[SBHWidgetSettings animatedInsertionImpactDelay](self->_settings, "animatedInsertionImpactDelay");
    v17 = v16;
  }
  else
  {
    v17 = v15;
    -[SBHWidgetInsertionRippleIconAnimator _performWidgetIconScaleOvershootAnimation](self, "_performWidgetIconScaleOvershootAnimation");
  }
  -[SBHWidgetInsertionRippleIconAnimator _playImpactHapticAfterDelay:](self, "_playImpactHapticAfterDelay:", v17);
  -[SBHWidgetInsertionRippleIconAnimator _startRippleAnimationWithDelay:](self, "_startRippleAnimationWithDelay:", v17);

}

- (void)_performWidgetIconScaleOvershootAnimation
{
  CGFloat v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  _QWORD v18[5];
  CGAffineTransform v19;
  CGAffineTransform v20;

  -[SBHWidgetSettings dropInsertionImpactScale](self->_settings, "dropInsertionImpactScale");
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeScale(&v20, v3, v3);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings dropInsertionSlamDuration](self->_settings, "dropInsertionSlamDuration");
  v6 = v5;
  -[SBHWidgetSettings dropInsertionSlamDelay](self->_settings, "dropInsertionSlamDelay");
  v8 = v7;
  -[SBHWidgetSettings dropInsertionSlamDampingRatio](self->_settings, "dropInsertionSlamDampingRatio");
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v19 = v20;
  v18[1] = 3221225472;
  v18[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke;
  v18[3] = &unk_1E8D88798;
  v18[4] = self;
  objc_msgSend(v4, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v18, 0, v6, v8, v10, 0.0);
  v11 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings dropInsertionScaleResetDuration](self->_settings, "dropInsertionScaleResetDuration");
  v13 = v12;
  -[SBHWidgetSettings dropInsertionScaleResetDelay](self->_settings, "dropInsertionScaleResetDelay");
  v15 = v14;
  -[SBHWidgetSettings dropInsertionScaleResetDampingRatio](self->_settings, "dropInsertionScaleResetDampingRatio");
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_3;
  v17[3] = &unk_1E8D84C50;
  v17[4] = self;
  objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, 0, v13, v15, v16, 0.0);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CAFrameRateRange v9;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_2;
  v5[3] = &unk_1E8D88798;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_4;
  v4[3] = &unk_1E8D84C50;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (CGPoint)_centerOfIconViewAssumingCenteredAnchorPoint:(id)a3
{
  id v3;
  void *v4;
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
  double v20;
  double v21;
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorPoint");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "bounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "center");
  v14 = v13;
  v16 = v15;

  v17 = 0.5 - v6;
  v18 = 0.5 - v8;
  if (BSFloatIsZero())
    v19 = v14;
  else
    v19 = v14 + v17 * v10;
  if (BSFloatIsZero())
    v20 = v16;
  else
    v20 = v16 + v18 * v12;
  v21 = v19;
  result.y = v20;
  result.x = v21;
  return result;
}

- (void)_createPortalViewsForIconViewsInIconListView:(id)a3 dropIconListView:(id)a4 withPortalContainerView:(id)a5 widgetIconCenter:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;

  y = a6.y;
  x = a6.x;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __143__SBHWidgetInsertionRippleIconAnimator__createPortalViewsForIconViewsInIconListView_dropIconListView_withPortalContainerView_widgetIconCenter___block_invoke;
  v17[3] = &unk_1E8D88A60;
  v17[4] = self;
  v18 = v11;
  v21 = x;
  v22 = y;
  v19 = v12;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v16, "enumerateIconViewsUsingBlock:", v17);

}

void __143__SBHWidgetInsertionRippleIconAnimator__createPortalViewsForIconViewsInIconListView_dropIconListView_withPortalContainerView_widgetIconCenter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", v14);
    objc_msgSend(*(id *)(a1 + 32), "_centerOfIconViewAssumingCenteredAnchorPoint:", v14);
    v8 = *(void **)(a1 + 48);
    if (*(void **)(a1 + 40) != v8)
      objc_msgSend(v8, "convertPoint:fromView:");
    objc_msgSend(v5, "setCenter:", v6 - *(double *)(a1 + 64), v7 - *(double *)(a1 + 72));
    objc_msgSend(v5, "setHidesSourceView:", 1);
    objc_msgSend(v5, "setMatchesTransform:", 1);
    objc_msgSend(v5, "setAllowsBackdropGroups:", 1);
    objc_msgSend(*(id *)(a1 + 56), "addSubview:", v5);
    objc_msgSend(v14, "addObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKey:", v5, v14);
    objc_msgSend(v14, "center");
    v10 = *(void **)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    if (v10 != v9)
    {
      objc_msgSend(v9, "convertPoint:fromView:");
      v10 = *(void **)(a1 + 48);
    }
    objc_msgSend(v10, "fractionalCoordinateAtPoint:");
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

  }
}

- (void)_createPortalViewsForIconViews
{
  NSMapTable *v3;
  NSMapTable *portalViewsForIconViews;
  NSMapTable *v5;
  NSMapTable *gridCoordinateForIcons;
  SBIconListView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *rippleIconsPortalContainerView;
  void *v19;
  uint64_t v20;
  SBIconListView *additionalIconListView;
  SBIconListView *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIView *v27;
  UIView *rippleIconsPortalContainerViewForAdditionalIconListView;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  portalViewsForIconViews = self->_portalViewsForIconViews;
  self->_portalViewsForIconViews = v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  gridCoordinateForIcons = self->_gridCoordinateForIcons;
  self->_gridCoordinateForIcons = v5;

  v7 = self->_iconListView;
  -[SBHWidgetInsertionRippleIconAnimator _centerOfIconViewAssumingCenteredAnchorPoint:](self, "_centerOfIconViewAssumingCenteredAnchorPoint:", self->_widgetIconView);
  v9 = v8;
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
  rippleIconsPortalContainerView = self->_rippleIconsPortalContainerView;
  self->_rippleIconsPortalContainerView = v17;

  -[UIView setCenter:](self->_rippleIconsPortalContainerView, "setCenter:", v9, v11);
  -[SBIconListView addSubview:](v7, "addSubview:", self->_rippleIconsPortalContainerView);
  -[UIView layer](self->_rippleIconsPortalContainerView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v39 = v36;
  v40 = v35;
  v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v41 = v34;
  v20 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v33 = *MEMORY[0x1E0CD2610];
  v37 = *MEMORY[0x1E0CD2610];
  v38 = v32;
  v42 = v20;
  v43 = 0xBF58904FD503744BLL;
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v44 = v31;
  v45 = v30;
  objc_msgSend(v19, "setSublayerTransform:", &v37);

  -[SBHWidgetInsertionRippleIconAnimator _createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:](self, "_createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:", v7, v7, self->_rippleIconsPortalContainerView, v9, v11);
  additionalIconListView = self->_additionalIconListView;
  if (additionalIconListView)
  {
    v22 = additionalIconListView;
    -[SBIconListView convertPoint:fromView:](v22, "convertPoint:fromView:", v7, v9, v11);
    v24 = v23;
    v26 = v25;
    v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v13, v14, v15, v16);
    rippleIconsPortalContainerViewForAdditionalIconListView = self->_rippleIconsPortalContainerViewForAdditionalIconListView;
    self->_rippleIconsPortalContainerViewForAdditionalIconListView = v27;

    -[UIView setCenter:](self->_rippleIconsPortalContainerViewForAdditionalIconListView, "setCenter:", v24, v26);
    -[SBIconListView addSubview:](v22, "addSubview:", self->_rippleIconsPortalContainerViewForAdditionalIconListView);
    -[UIView layer](self->_rippleIconsPortalContainerViewForAdditionalIconListView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v36;
    v40 = v35;
    v41 = v34;
    v37 = v33;
    v38 = v32;
    v42 = v20;
    v43 = 0xBF58904FD503744BLL;
    v44 = v31;
    v45 = v30;
    objc_msgSend(v29, "setSublayerTransform:", &v37);

    -[SBHWidgetInsertionRippleIconAnimator _createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:](self, "_createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:", v22, v7, self->_rippleIconsPortalContainerViewForAdditionalIconListView, v9, v11);
  }

}

- (void)_startRippleAnimationWithDelay:(double)a3
{
  float v5;
  dispatch_time_t v6;
  _QWORD block[5];

  UIAnimationDragCoefficient();
  v6 = dispatch_time(0, (uint64_t)(v5 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SBHWidgetInsertionRippleIconAnimator__startRippleAnimationWithDelay___block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

uint64_t __71__SBHWidgetInsertionRippleIconAnimator__startRippleAnimationWithDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRippleAnimationNow");
}

- (void)_startRippleAnimationNow
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  void *v7;
  CAFrameRateRange v8;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
  v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v3;

  v5 = self->_displayLink;
  v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
  -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1114119);
  v6 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  -[SBHWidgetInsertionRippleIconAnimator _createPortalViewsForIconViews](self, "_createPortalViewsForIconViews");
  -[SBIconView center](self->_widgetIconView, "center");
  -[SBIconListView fractionalCoordinateAtPoint:](self->_iconListView, "fractionalCoordinateAtPoint:");
  -[SBHRippleSimulation createRippleAtGridCoordinate:strength:](self->_rippleSimulation, "createRippleAtGridCoordinate:strength:");
}

- (void)_finishRippleAnimationEarlyForIconView:(id)a3
{
  SBIconView *v4;
  _UIPortalView *v5;
  NSObject *v6;
  _UIPortalView *widgetIconPortalView;
  uint8_t v8[16];

  v4 = (SBIconView *)a3;
  if (self->_widgetIconView != v4)
  {
    -[NSMapTable objectForKey:](self->_portalViewsForIconViews, "objectForKey:", v4);
    v5 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_portalViewsForIconViews, "removeObjectForKey:", v4);
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = self->_widgetIconPortalView;
  widgetIconPortalView = self->_widgetIconPortalView;
  self->_widgetIconPortalView = 0;

  if (v5)
  {
LABEL_3:
    -[_UIPortalView setSourceView:](v5, "setSourceView:", 0);
    -[_UIPortalView removeFromSuperview](v5, "removeFromSuperview");
  }
LABEL_4:
  SBLogWidgets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", "EndedEarly=YES isAnimation=YES ", v8, 2u);
  }

}

- (void)_finishRippleAnimation
{
  CADisplayLink *displayLink;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMapTable *portalViewsForIconViews;
  NSMapTable *gridCoordinateForIcons;
  UIView *rippleIconsPortalContainerView;
  UIView *rippleIconsPortalContainerViewForAdditionalIconListView;
  UIView *portalContainerView;
  NSObject *v20;
  void (**animationCompletion)(id, uint64_t);
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[SBIconView removeObserver:](self->_widgetIconView, "removeObserver:", self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMapTable objectEnumerator](self->_portalViewsForIconViews, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "setSourceView:", 0);
        objc_msgSend(v9, "removeFromSuperview");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMapTable keyEnumerator](self->_portalViewsForIconViews, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "removeObserver:", self);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v12);
  }

  -[NSMapTable removeAllObjects](self->_portalViewsForIconViews, "removeAllObjects");
  portalViewsForIconViews = self->_portalViewsForIconViews;
  self->_portalViewsForIconViews = 0;

  -[NSMapTable removeAllObjects](self->_gridCoordinateForIcons, "removeAllObjects");
  gridCoordinateForIcons = self->_gridCoordinateForIcons;
  self->_gridCoordinateForIcons = 0;

  -[UIView removeFromSuperview](self->_rippleIconsPortalContainerView, "removeFromSuperview");
  rippleIconsPortalContainerView = self->_rippleIconsPortalContainerView;
  self->_rippleIconsPortalContainerView = 0;

  -[UIView removeFromSuperview](self->_rippleIconsPortalContainerViewForAdditionalIconListView, "removeFromSuperview");
  rippleIconsPortalContainerViewForAdditionalIconListView = self->_rippleIconsPortalContainerViewForAdditionalIconListView;
  self->_rippleIconsPortalContainerViewForAdditionalIconListView = 0;

  -[UIView removeFromSuperview](self->_portalContainerView, "removeFromSuperview");
  portalContainerView = self->_portalContainerView;
  self->_portalContainerView = 0;

  SBLogWidgets();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", " isAnimation=YES ", v22, 2u);
  }

  animationCompletion = (void (**)(id, uint64_t))self->_animationCompletion;
  if (animationCompletion)
    animationCompletion[2](animationCompletion, 1);
}

- (void)_layoutRippleIconViews
{
  SBIconListView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_iconListView;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeAddObject:", self->_additionalIconListView);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __62__SBHWidgetInsertionRippleIconAnimator__layoutRippleIconViews__block_invoke;
        v12[3] = &unk_1E8D87340;
        v12[4] = self;
        objc_msgSend(v11, "enumerateIconViewsUsingBlock:", v12);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __62__SBHWidgetInsertionRippleIconAnimator__layoutRippleIconViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(v3, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGPointValue");
    v9 = v8;
    v11 = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "zPositionForGridCoordinate:", v9, v11);
    v13 = v12;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    if (v14)
      objc_msgSend(v14, "transformForGridCoordinate:", v9, v11);
    objc_msgSend(v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setZPosition:", v13);

    objc_msgSend(v4, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v22;
    v17[5] = v23;
    v17[6] = v24;
    v17[7] = v25;
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    v17[3] = v21;
    objc_msgSend(v16, "setTransform:", v17);

  }
}

- (void)_displayLinkFired:(id)a3
{
  SBHRippleSimulation *rippleSimulation;

  rippleSimulation = self->_rippleSimulation;
  objc_msgSend(a3, "duration");
  -[SBHRippleSimulation step:](rippleSimulation, "step:");
  -[SBHWidgetInsertionRippleIconAnimator _layoutRippleIconViews](self, "_layoutRippleIconViews");
  if (-[SBHRippleSimulation isSettled](self->_rippleSimulation, "isSettled"))
    -[SBHWidgetInsertionRippleIconAnimator _finishRippleAnimation](self, "_finishRippleAnimation");
}

- (void)_performJumpAnimationWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  id v9;
  void *v10;
  UIView *v11;
  UIView *portalContainerView;
  void *v13;
  _UIPortalView *v14;
  _UIPortalView *widgetIconPortalView;
  double v16;
  double v17;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  NSObject *v32;
  CGFloat v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  NSObject *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD block[4];
  id v62;
  _QWORD v63[4];
  NSObject *v64;
  _QWORD v65[5];
  _QWORD v66[4];
  NSObject *v67;
  _QWORD v68[5];
  CGAffineTransform v69;
  CGAffineTransform v70;
  _QWORD v71[4];
  NSObject *v72;
  _QWORD v73[5];
  CGAffineTransform v74;
  CGAffineTransform v75;
  _QWORD v76[4];
  NSObject *v77;
  _QWORD v78[5];
  _QWORD v79[4];

  v79[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_referenceIconView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_referenceIconView != nil"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHWidgetInsertionRippleIconAnimator _performJumpAnimationWithCompletion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D000A328);
  }
  if (!self->_widgetIconView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_widgetIconView != nil"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHWidgetInsertionRippleIconAnimator _performJumpAnimationWithCompletion:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D000A38CLL);
  }
  v60 = v5;
  v6 = dispatch_group_create();
  -[SBIconView setHidden:](self->_referenceIconView, "setHidden:", 1);
  v7 = -[SBIconView allowsLabelArea](self->_referenceIconView, "allowsLabelArea");
  v8 = 0.0;
  if (v7)
    -[SBIconView iconLabelAlpha](self->_referenceIconView, "iconLabelAlpha", 0.0);
  -[SBIconView setIconLabelAlpha:](self->_widgetIconView, "setIconLabelAlpha:", v8);
  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[SBIconListView window](self->_iconListView, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  portalContainerView = self->_portalContainerView;
  self->_portalContainerView = v11;

  -[UIView bs_setHitTestingDisabled:](self->_portalContainerView, "bs_setHitTestingDisabled:", 1);
  -[SBIconListView window](self->_iconListView, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_portalContainerView);

  v14 = (_UIPortalView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", self->_widgetIconView);
  widgetIconPortalView = self->_widgetIconPortalView;
  self->_widgetIconPortalView = v14;

  -[_UIPortalView setHidesSourceView:](self->_widgetIconPortalView, "setHidesSourceView:", 1);
  -[_UIPortalView setMatchesTransform:](self->_widgetIconPortalView, "setMatchesTransform:", 1);
  -[_UIPortalView setAllowsBackdropGroups:](self->_widgetIconPortalView, "setAllowsBackdropGroups:", 1);
  -[SBIconView addObserver:](self->_widgetIconView, "addObserver:", self);
  -[SBIconView bounds](self->_widgetIconView, "bounds");
  -[_UIPortalView setCenter:](self->_widgetIconPortalView, "setCenter:", self->_referenceIconViewOriginInWindow.x + v16 * 0.5, self->_referenceIconViewOriginInWindow.y + v17 * 0.5);
  -[UIView addSubview:](self->_portalContainerView, "addSubview:", self->_widgetIconPortalView);
  objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView layer](self->_iconListView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceLayer:", v19);

  objc_msgSend(v18, "setDuration:", INFINITY);
  objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v18, "setRemovedOnCompletion:", 0);
  objc_msgSend(v18, "setAppliesY:", 1);
  objc_msgSend(v18, "setAppliesX:", 1);
  v20 = self->_portalContainerView;
  -[UIView bounds](v20, "bounds");
  UIRectGetCenter();
  -[UIView convertPoint:toView:](v20, "convertPoint:toView:", self->_iconListView);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourcePoints:", v22);

  -[UIView addAnimation:forKey:](self->_portalContainerView, "addAnimation:forKey:", v18, CFSTR("SBHWidgetInsertionRippleIconAnimatorMatchMove"));
  LODWORD(v21) = -[SBHWidgetInsertionRippleIconAnimator keepsJumpingIconAboveListViewAsLongAsPossible](self, "keepsJumpingIconAboveListViewAsLongAsPossible");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  v25 = 0.2;
  if ((_DWORD)v21)
    v25 = 0.4;
  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v25 = 0.5;
  -[SBHWidgetInsertionRippleIconAnimator _reparentPortalViewIntoIconListViewAfterDelay:](self, "_reparentPortalViewIntoIconListViewAfterDelay:", v25);
  dispatch_group_enter(v6);
  v26 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings animatedInsertionPositionDuration](self->_settings, "animatedInsertionPositionDuration");
  v28 = v27;
  -[SBHWidgetSettings animatedInsertionPositionDampingRatio](self->_settings, "animatedInsertionPositionDampingRatio");
  v30 = v29;
  v31 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke;
  v78[3] = &unk_1E8D84C50;
  v78[4] = self;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_3;
  v76[3] = &unk_1E8D84F68;
  v32 = v6;
  v77 = v32;
  objc_msgSend(v26, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v78, v76, v28, 0.0, v30, 0.0);
  -[SBHWidgetSettings animatedInsertionJumpScale](self->_settings, "animatedInsertionJumpScale");
  memset(&v75, 0, sizeof(v75));
  CGAffineTransformMakeScale(&v75, v33, v33);
  dispatch_group_enter(v32);
  v34 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings animatedInsertionJumpDuration](self->_settings, "animatedInsertionJumpDuration");
  v36 = v35;
  -[SBHWidgetSettings animatedInsertionJumpDampingRatio](self->_settings, "animatedInsertionJumpDampingRatio");
  v38 = v37;
  v74 = v75;
  v73[0] = v31;
  v73[1] = 3221225472;
  v73[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_4;
  v73[3] = &unk_1E8D88798;
  v73[4] = self;
  v71[0] = v31;
  v71[1] = 3221225472;
  v71[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_6;
  v71[3] = &unk_1E8D84F68;
  v39 = v32;
  v72 = v39;
  objc_msgSend(v34, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v73, v71, v36, 0.0, v38, 0.0);
  -[SBHWidgetSettings animatedInsertionImpactScale](self->_settings, "animatedInsertionImpactScale");
  CGAffineTransformMakeScale(&v70, v40, v40);
  v75 = v70;
  dispatch_group_enter(v39);
  v41 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings animatedInsertionSlamDuration](self->_settings, "animatedInsertionSlamDuration");
  v43 = v42;
  -[SBHWidgetSettings animatedInsertionSlamDelay](self->_settings, "animatedInsertionSlamDelay");
  v45 = v44;
  -[SBHWidgetSettings animatedInsertionSlamDampingRatio](self->_settings, "animatedInsertionSlamDampingRatio");
  v47 = v46;
  v69 = v75;
  v68[0] = v31;
  v68[1] = 3221225472;
  v68[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_7;
  v68[3] = &unk_1E8D88798;
  v68[4] = self;
  v66[0] = v31;
  v66[1] = 3221225472;
  v66[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_9;
  v66[3] = &unk_1E8D84F68;
  v48 = v39;
  v67 = v48;
  objc_msgSend(v41, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v68, v66, v43, v45, v47, 0.0);
  dispatch_group_enter(v48);
  v49 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings animatedInsertionScaleResetDuration](self->_settings, "animatedInsertionScaleResetDuration");
  v51 = v50;
  -[SBHWidgetSettings animatedInsertionScaleResetDelay](self->_settings, "animatedInsertionScaleResetDelay");
  v53 = v52;
  -[SBHWidgetSettings animatedInsertionScaleResetDampingRatio](self->_settings, "animatedInsertionScaleResetDampingRatio");
  v55 = v54;
  v64 = v48;
  v65[0] = v31;
  v65[1] = 3221225472;
  v65[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_10;
  v65[3] = &unk_1E8D84C50;
  v65[4] = self;
  v63[0] = v31;
  v63[1] = 3221225472;
  v63[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_12;
  v63[3] = &unk_1E8D84F68;
  v56 = v48;
  objc_msgSend(v49, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v65, v63, v51, v53, v55, 0.0);
  block[0] = v31;
  block[1] = 3221225472;
  block[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_13;
  block[3] = &unk_1E8D859C0;
  v62 = v60;
  v57 = v60;
  dispatch_group_notify(v56, MEMORY[0x1E0C80D38], block);

}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_2;
  v4[3] = &unk_1E8D84C50;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bounds");
  UIRectGetCenter();
  objc_msgSend(v2, "convertPoint:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v4 = v3;
  v6 = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setCenter:", v4, v6);
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CAFrameRateRange v9;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_5;
  v5[3] = &unk_1E8D88798;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_5(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_7(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CAFrameRateRange v9;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_8;
  v5[3] = &unk_1E8D88798;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_8(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_10(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_11;
  v4[3] = &unk_1E8D84C50;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_11(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setIconLabelAlpha:", 1.0);
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_12(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_reparentPortalViewIntoIconListViewAfterDelay:(double)a3
{
  float v5;
  dispatch_time_t v6;
  _QWORD block[5];

  UIAnimationDragCoefficient();
  v6 = dispatch_time(0, (uint64_t)(v5 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SBHWidgetInsertionRippleIconAnimator__reparentPortalViewIntoIconListViewAfterDelay___block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

uint64_t __86__SBHWidgetInsertionRippleIconAnimator__reparentPortalViewIntoIconListViewAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reparentPortalViewIntoIconListViewNow");
}

- (void)_reparentPortalViewIntoIconListViewNow
{
  UIView *portalContainerView;

  portalContainerView = self->_portalContainerView;
  -[UIView bounds](portalContainerView, "bounds");
  -[UIView convertRect:toView:](portalContainerView, "convertRect:toView:", self->_iconListView);
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
  -[SBIconListView addSubview:](self->_iconListView, "addSubview:", self->_portalContainerView);
}

- (void)_playImpactHapticAfterDelay:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0DC3898]);
  objc_msgSend(MEMORY[0x1E0DC4208], "softConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithConfiguration:", v5);

  objc_msgSend(v6, "prepare");
  UIAnimationDragCoefficient();
  v8 = dispatch_time(0, (uint64_t)(v7 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SBHWidgetInsertionRippleIconAnimator__playImpactHapticAfterDelay___block_invoke;
  block[3] = &unk_1E8D84C50;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

uint64_t __68__SBHWidgetInsertionRippleIconAnimator__playImpactHapticAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "impactOccurred");
}

- (BOOL)keepsJumpingIconAboveListViewAsLongAsPossible
{
  return self->_keepsJumpingIconAboveListViewAsLongAsPossible;
}

- (void)setKeepsJumpingIconAboveListViewAsLongAsPossible:(BOOL)a3
{
  self->_keepsJumpingIconAboveListViewAsLongAsPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preludeBlock, 0);
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_rippleSimulation, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_widgetIconPortalView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_gridCoordinateForIcons, 0);
  objc_storeStrong((id *)&self->_portalViewsForIconViews, 0);
  objc_storeStrong((id *)&self->_rippleIconsPortalContainerViewForAdditionalIconListView, 0);
  objc_storeStrong((id *)&self->_rippleIconsPortalContainerView, 0);
  objc_storeStrong((id *)&self->_additionalIconListView, 0);
  objc_storeStrong((id *)&self->_widgetIconView, 0);
  objc_storeStrong((id *)&self->_widgetIcon, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
}

- (void)animateWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1CFEF3000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_performJumpAnimationWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1CFEF3000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_performJumpAnimationWithCompletion:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1CFEF3000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
