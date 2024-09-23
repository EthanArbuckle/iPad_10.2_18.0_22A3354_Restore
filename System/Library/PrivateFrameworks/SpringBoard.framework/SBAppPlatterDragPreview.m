@implementation SBAppPlatterDragPreview

- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4
{
  return -[SBAppPlatterDragPreview initWithReferenceIconView:sourceView:sourceViewScale:](self, "initWithReferenceIconView:sourceView:sourceViewScale:", a3, a4, 1.0);
}

- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4 sourceViewScale:(double)a5
{
  id v10;
  id v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBAppPlatterDragPreview *v28;
  SBAppPlatterDragPreview *v29;
  void *v35;
  id *p_anchorPointAdjustmentContainerView;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  UIView *cornerMaskingView;
  void *v44;
  SBAsymmetricalCornerRadiusWrapperView *v45;
  uint64_t v46;
  SBFView *rimShadowView;
  void *v48;
  uint64_t v49;
  SBFView *diffuseShadowView;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v57;
  double v58;
  CGAffineTransform v59;
  objc_super v60;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppPlatterDragPreview.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceIconView != nil"));

  }
  objc_msgSend(v10, "iconImageInfo");
  SBRectWithSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "frame");
  v58 = a5;
  SBTransformedRectWithScale();
  v20 = v19;
  v21 = v17;
  v22 = v15;
  v23 = v13;
  if (v11)
  {
    SBRectWithSize();
    v23 = v24;
    v22 = v25;
    v21 = v26;
    v20 = v27;
  }
  v60.receiver = self;
  v60.super_class = (Class)SBAppPlatterDragPreview;
  v28 = -[SBAppPlatterDragPreview initWithFrame:](&v60, sel_initWithFrame_, v23, v22, v21, v20);
  v29 = v28;
  if (v28)
  {
    __asm { FMOV            V0.2D, #0.5 }
    v28->_anchorPoint = _Q0;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v23, v22, v21, v20);
    -[SBAppPlatterDragPreview addSubview:](v29, "addSubview:", v35);
    p_anchorPointAdjustmentContainerView = (id *)&v29->_anchorPointAdjustmentContainerView;
    objc_storeStrong((id *)&v29->_anchorPointAdjustmentContainerView, v35);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v15, v17, v19);
    objc_msgSend(v37, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAllowsGroupOpacity:", 1);

    objc_msgSend(v37, "setClipsToBounds:", 0);
    objc_msgSend(v10, "iconImageInfo");
    objc_msgSend(v37, "_setContinuousCornerRadius:", v39);
    -[UIView addSubview:](v29->_anchorPointAdjustmentContainerView, "addSubview:", v37);
    objc_storeStrong((id *)&v29->_iconContainerView, v37);
    v29->_mode = 2 * (v11 != 0);
    objc_storeStrong((id *)&v29->_referenceIconView, a3);
    v29->_sourceViewScale = v58;
    v29->_iconAllowsLabelArea = objc_msgSend(v10, "allowsLabelArea");
    v29->_iconAllowsAccessory = objc_msgSend(v10, "allowsAccessoryView");
    v29->_iconIsHighlighted = objc_msgSend(v10, "isHighlighted");
    v29->_iconCanShowCloseBox = objc_msgSend(v10, "canShowCloseBox");
    v29->_iconCanShowResizeHandle = objc_msgSend(v10, "canShowResizeHandle");
    objc_msgSend(v10, "iconContentScale");
    v29->_iconContentScale = v40;
    v29->_iconInitiallyShowingCloseBox = objc_msgSend(v10, "shouldShowCloseBox");
    v29->_iconInitiallyShowingResizeHandle = objc_msgSend(v10, "shouldShowResizeHandle");
    -[SBAppPlatterDragPreview layer](v29, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAllowsGroupOpacity:", 1);

    SBScreenDisplayCornerRadius();
    if (BSFloatIsZero())
    {
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v23, v22, v21, v20);
      cornerMaskingView = v29->_cornerMaskingView;
      v29->_cornerMaskingView = (UIView *)v42;

      -[UIView layer](v29->_cornerMaskingView, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    }
    else
    {
      v45 = -[SBAsymmetricalCornerRadiusWrapperView initWithFrame:]([SBAsymmetricalCornerRadiusWrapperView alloc], "initWithFrame:", v23, v22, v21, v20);
      v44 = v29->_cornerMaskingView;
      v29->_cornerMaskingView = &v45->super.super;
    }

    -[UIView setClipsToBounds:](v29->_cornerMaskingView, "setClipsToBounds:", 1);
    objc_msgSend(*p_anchorPointAdjustmentContainerView, "insertSubview:atIndex:", v29->_cornerMaskingView, 0);
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F58]), "initWithFrame:", v23, v22, v21, v20);
    rimShadowView = v29->_rimShadowView;
    v29->_rimShadowView = (SBFView *)v46;

    -[SBFView setAnimatedLayerProperties:](v29->_rimShadowView, "setAnimatedLayerProperties:", &unk_1E91CE818);
    -[SBFView layer](v29->_rimShadowView, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShadowPathIsBounds:", 1);

    objc_msgSend(*p_anchorPointAdjustmentContainerView, "insertSubview:atIndex:", v29->_rimShadowView, 0);
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F58]), "initWithFrame:", v23, v22, v21, v20);
    diffuseShadowView = v29->_diffuseShadowView;
    v29->_diffuseShadowView = (SBFView *)v49;

    -[SBFView setAnimatedLayerProperties:](v29->_diffuseShadowView, "setAnimatedLayerProperties:", &unk_1E91CE830);
    -[SBFView layer](v29->_diffuseShadowView, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setShadowPathIsBounds:", 1);

    objc_msgSend(*p_anchorPointAdjustmentContainerView, "insertSubview:atIndex:", v29->_diffuseShadowView, 0);
    -[SBAppPlatterDragPreview updateSourceView:](v29, "updateSourceView:", v11);
    objc_msgSend(v10, "icon");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isWidgetIcon");

    if (!-[SBAppPlatterDragPreview _effectiveMode](v29, "_effectiveMode") && (v53 & 1) == 0)
    {
      objc_msgSend(v10, "listLayoutProvider");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "iconImageInfo");
      CGAffineTransformMakeScale(&v59, 1.1, 1.1);
      SBRectWithSize();
      -[SBAppPlatterDragPreview setFrame:](v29, "setFrame:");

    }
    -[SBAppPlatterDragPreview setNeedsLayout](v29, "setNeedsLayout");
    -[SBAppPlatterDragPreview layoutIfNeeded](v29, "layoutIfNeeded");

  }
  return v29;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_matchMoveView:(id)a3 toContainerView:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA9D88];
  v6 = a3;
  objc_msgSend(v5, "matchMoveAnimationForPinningToView:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("MatchMove-SBAppPlatterDragPreview"));
}

- (void)updateSourceView:(id)a3
{
  UIView *v5;
  SBPortalView *v6;
  SBPortalView *v7;
  SBPortalView *sourcePortalView;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView **p_sourceView;
  UIView *sourceView;
  UIView *v22;
  UIView *v23;
  UIView *v24;
  UIView *unclippedSourceContainerView;
  void *v26;
  SBPortalView *v27;
  void *v28;
  UIView *v29;
  UIView *v30;
  UIView *v31;
  UIView *v32;
  SBPortalView *v33;
  void *v34;
  UIView *v35;

  v5 = (UIView *)a3;
  v35 = v5;
  if (!self->_sourcePortalView)
  {
    v6 = [SBPortalView alloc];
    -[UIView bounds](self->_cornerMaskingView, "bounds");
    v7 = -[SBPortalView initWithFrame:](v6, "initWithFrame:");
    sourcePortalView = self->_sourcePortalView;
    self->_sourcePortalView = v7;

    -[SBPortalView setHidesSourceView:](self->_sourcePortalView, "setHidesSourceView:", 1);
    -[SBPortalView setAllowsBackdropGroups:](self->_sourcePortalView, "setAllowsBackdropGroups:", 1);
    v9 = objc_opt_class();
    SBSafeCast(v9, self->_cornerMaskingView);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "addContentView:", self->_sourcePortalView);
      objc_msgSend(v11, "bringContentViewToFront:", self->_platterView);
    }
    else
    {
      -[UIView addSubview:](self->_cornerMaskingView, "addSubview:", self->_sourcePortalView);
      -[UIView bringSubviewToFront:](self->_cornerMaskingView, "bringSubviewToFront:", self->_platterView);
    }
    -[SBAppPlatterDragPreview _matchMoveView:toContainerView:](self, "_matchMoveView:toContainerView:", self->_sourcePortalView, self->_cornerMaskingView);

    v5 = v35;
  }
  -[UIView frame](v5, "frame");
  SBRectWithSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  p_sourceView = &self->_sourceView;
  sourceView = self->_sourceView;
  v22 = v35;
  if (sourceView != v35)
  {
    v23 = sourceView;
    if (v23)
    {
      -[UIView superview](*p_sourceView, "superview");
      v24 = (UIView *)objc_claimAutoreleasedReturnValue();
      unclippedSourceContainerView = self->_unclippedSourceContainerView;

      if (v24 == unclippedSourceContainerView)
        -[UIView removeFromSuperview](*p_sourceView, "removeFromSuperview");
      -[SBPortalView setSourceView:](self->_sourcePortalView, "setSourceView:", 0);
    }
    objc_storeStrong((id *)&self->_sourceView, a3);
    -[UIView superview](*p_sourceView, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = self->_sourcePortalView;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPortalView setBackgroundColor:](v27, "setBackgroundColor:", v28);

      -[SBPortalView setSourceView:](self->_sourcePortalView, "setSourceView:", *p_sourceView);
      -[SBPortalView setHidesSourceView:](self->_sourcePortalView, "setHidesSourceView:", 1);
    }
    else
    {
      v29 = self->_unclippedSourceContainerView;
      if (!v29)
      {
        v30 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v15, v17, v19);
        v31 = self->_unclippedSourceContainerView;
        self->_unclippedSourceContainerView = v30;

        -[UIView insertSubview:aboveSubview:](self->_anchorPointAdjustmentContainerView, "insertSubview:aboveSubview:", self->_unclippedSourceContainerView, self->_cornerMaskingView);
        -[SBAppPlatterDragPreview _matchMoveView:toContainerView:](self, "_matchMoveView:toContainerView:", self->_unclippedSourceContainerView, self->_cornerMaskingView);
        v29 = self->_unclippedSourceContainerView;
      }
      -[UIView addSubview:](v29, "addSubview:", *p_sourceView);
      v32 = *p_sourceView;
      -[UIView bounds](self->_unclippedSourceContainerView, "bounds");
      UIRectGetCenter();
      -[UIView setCenter:](v32, "setCenter:");
      -[UIView alpha](*p_sourceView, "alpha");
      if (BSFloatIsOne())
      {
        v33 = self->_sourcePortalView;
        objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBPortalView setBackgroundColor:](v33, "setBackgroundColor:", v34);

      }
    }

    v22 = *p_sourceView;
  }
  -[UIView _removeAllRetargetableAnimations:](v22, "_removeAllRetargetableAnimations:", 1);
  -[SBPortalView setBounds:](self->_sourcePortalView, "setBounds:", v13, v15, v17, v19);
  -[UIView setBounds:](self->_unclippedSourceContainerView, "setBounds:", v13, v15, v17, v19);

}

- (void)invalidateSourceView
{
  UIView *v3;
  UIView *unclippedSourceContainerView;
  UIView *sourceView;

  -[SBPortalView setSourceView:](self->_sourcePortalView, "setSourceView:", 0);
  -[UIView superview](self->_sourceView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  unclippedSourceContainerView = self->_unclippedSourceContainerView;

  if (v3 == unclippedSourceContainerView)
    -[UIView removeFromSuperview](self->_sourceView, "removeFromSuperview");
  sourceView = self->_sourceView;
  self->_sourceView = 0;

}

- (BOOL)isAnimatingPlatterViewAlpha
{
  return self->_platterViewAlphaAnimationCount != 0;
}

- (void)configurePlatterForSceneHandle:(id)a3 withTargetView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SBApplicationBlurContentView *v12;
  SBApplicationBlurContentView *v13;
  SBApplicationBlurContentView *platterView;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  UIView *v19;
  UIView *unclippedSourceContainerView;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  SBAppPlatterDragPreview *v28;
  id v29;

  v8 = a5;
  self->_isBlurredPlatterReady = 0;
  self->_hasAnimatedToBlurredPlatter = 0;
  v9 = a4;
  objc_msgSend(a3, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [SBApplicationBlurContentView alloc];
  objc_msgSend(v9, "bounds");
  v13 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](v12, "initWithFrame:bundleIdentifier:targetViewToBlur:", v11, v9);

  platterView = self->_platterView;
  self->_platterView = v13;

  -[SBApplicationBlurContentView iconView](self->_platterView, "iconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  -[SBApplicationBlurContentView bs_setHitTestingDisabled:](self->_platterView, "bs_setHitTestingDisabled:", 1);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke;
  v27 = &unk_1E8EA02D8;
  v28 = self;
  v17 = v8;
  v29 = v17;
  v18 = (void *)MEMORY[0x1D17E5550](&v24);
  if (self->_mode != 2
    || (-[UIView superview](self->_sourceView, "superview", v24, v25, v26, v27, v28),
        v19 = (UIView *)objc_claimAutoreleasedReturnValue(),
        unclippedSourceContainerView = self->_unclippedSourceContainerView,
        v19,
        v19 == unclippedSourceContainerView))
  {
    -[SBApplicationBlurContentView generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:](self->_platterView, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", 0, v18, v24, v25, v26, v27, v28);
    self->_hasAnimatedToBlurredPlatter = 1;
  }
  else
  {
    -[SBApplicationBlurContentView generateBlurredSnapshotWithCompletion:](self->_platterView, "generateBlurredSnapshotWithCompletion:", v18);
  }
  v21 = objc_opt_class();
  SBSafeCast(v21, self->_cornerMaskingView);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    objc_msgSend(v22, "addContentView:", self->_platterView);
  else
    -[UIView addSubview:](self->_cornerMaskingView, "addSubview:", self->_platterView);
  -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  -[SBAppPlatterDragPreview layoutIfNeeded](self, "layoutIfNeeded");

}

uint64_t __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  _QWORD v8[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 1;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke_2;
  v8[3] = &unk_1E8E9DED8;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_animateUsingSpringBehavior:tracking:animations:completion:", v6, 0, v8, 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setPlatterSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_platterSize;

  height = a3.height;
  width = a3.width;
  p_platterSize = &self->_platterSize;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    p_platterSize->width = width;
    p_platterSize->height = height;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  SBDragPreviewShadowParameters *p_diffuseShadowParameters;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_diffuseShadowParameters = &self->_diffuseShadowParameters;
  if ((SBDragPreviewShadowParametersEqualToShadowParameters() & 1) == 0)
  {
    p_diffuseShadowParameters->shadowOpacity = v10;
    p_diffuseShadowParameters->shadowRadius = v9;
    p_diffuseShadowParameters->shadowOffset.width = v8;
    p_diffuseShadowParameters->shadowOffset.height = v7;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRimShadowParameters:(SBDragPreviewShadowParameters *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  SBDragPreviewShadowParameters *p_rimShadowParameters;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_rimShadowParameters = &self->_rimShadowParameters;
  if ((SBDragPreviewShadowParametersEqualToShadowParameters() & 1) == 0)
  {
    p_rimShadowParameters->shadowOpacity = v10;
    p_rimShadowParameters->shadowRadius = v9;
    p_rimShadowParameters->shadowOffset.width = v8;
    p_rimShadowParameters->shadowOffset.height = v7;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDiffuseShadowFilters:(id)a3
{
  NSArray *v4;
  NSArray *diffuseShadowFilters;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_diffuseShadowFilters, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    diffuseShadowFilters = self->_diffuseShadowFilters;
    self->_diffuseShadowFilters = v4;

    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setRimShadowFilters:(id)a3
{
  NSArray *v4;
  NSArray *rimShadowFilters;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_rimShadowFilters, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    rimShadowFilters = self->_rimShadowFilters;
    self->_rimShadowFilters = v4;

    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cornerRadiusConfiguration, a3);
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (SBIcon)icon
{
  return (SBIcon *)-[SBIconView icon](self->_iconView, "icon");
}

- (void)setIcon:(id)a3
{
  -[SBIconView setIcon:](self->_iconView, "setIcon:", a3);
}

- (void)setDragState:(unint64_t)a3
{
  SBIconView *referenceIconView;
  void *v7;
  _QWORD v8[5];

  if (self->_dragState != a3)
  {
    if (a3 < 2 || self->_iconView)
      goto LABEL_6;
    if (self->_referenceIconView)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__SBAppPlatterDragPreview_setDragState___block_invoke;
      v8[3] = &unk_1E8E9DED8;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v8);
      referenceIconView = self->_referenceIconView;
      self->_referenceIconView = 0;

LABEL_6:
      self->_dragState = a3;
      -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
      -[SBAppPlatterDragPreview layoutIfNeeded](self, "layoutIfNeeded");
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_referenceIconView != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAppPlatterDragPreview setDragState:].cold.1(a2, (uint64_t)self, (uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __40__SBAppPlatterDragPreview_setDragState___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "customIconImageViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowingContextMenu:", 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_configureIconViewWithReferenceIconView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
}

- (void)setFlocked:(BOOL)a3
{
  if (self->_flocked != a3)
  {
    self->_flocked = a3;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateDestinationIconLocation:(id)a3 allowsLabelArea:(BOOL)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;
  BOOL v27;

  v8 = a3;
  -[SBIconView location](self->_iconView, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke;
    v24[3] = &unk_1E8EA9330;
    v24[4] = self;
    v25 = v8;
    v26 = a5;
    v27 = a4;
    v12 = MEMORY[0x1D17E5550](v24);
    v13 = (void *)v12;
    if (a5)
    {
      -[SBIconView startForbiddingAccessoryUpdatesWithReason:animated:](self->_iconView, "startForbiddingAccessoryUpdatesWithReason:animated:", CFSTR("dragPlatterUpdatingLocation"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CEABC8];
      v16 = *MEMORY[0x1E0DAAA30];
      v19 = v11;
      v20 = 3221225472;
      v21 = __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke_2;
      v22 = &unk_1E8EA2880;
      v23 = v14;
      v17 = v14;
      objc_msgSend(v15, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 2, v13, &v19, v16, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startAnimation", v19, v20, v21, v22);

    }
    else
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }

  }
}

uint64_t __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *v11;
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
  double v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setLocation:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 442) = *(_BYTE *)(a1 + 49);
  objc_msgSend(*(id *)(a1 + 32), "_updateIconViewComponentVisibility");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "iconImageInfo");
  v23 = v2;
  SBRectWithSize();
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = *(id **)(a1 + 32);
  if (v11[61])
  {
    objc_msgSend(v11[61], "frame");
    SBRectWithSize();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v11 = *(id **)(a1 + 32);
  }
  else
  {
    v13 = v3;
    v15 = v4;
    v17 = v5;
    v19 = v6;
  }
  objc_msgSend(v11, "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v13, v15, v17, v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "_setContinuousCornerRadius:", v23);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "sb_setBoundsAndPositionFromFrame:", v7, v8, v9, v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  v20 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_updateShowDebugIconBorderWithColor:", v21);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_configureIconViewWithReferenceIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBIconViewCustomImageViewControlling *customIconImageViewController;
  SBIconViewCustomImageViewControlling *v8;
  void *v9;
  void *v10;
  UIView *v11;
  UIView *captureOnlyBackgroundView;
  void *v13;
  double v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfigurationOptions:", 4);
  objc_msgSend(v5, "setCustomIconImageViewControllerPriority:", 3);
  objc_msgSend(v5, "borrowIconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureMatchingIconView:", v5);
  if (self)
    customIconImageViewController = self->_customIconImageViewController;
  else
    customIconImageViewController = 0;
  v8 = customIconImageViewController;
  objc_msgSend(v5, "setOverrideCustomIconImageViewController:", v8);
  objc_msgSend(v6, "invalidate");
  if (!v8)
  {
    objc_msgSend(v5, "customIconImageViewController");
    v8 = (SBIconViewCustomImageViewControlling *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewCustomImageViewControlling setShowsSnapshotWhenDeactivated:](v8, "setShowsSnapshotWhenDeactivated:", 1);
  objc_msgSend(v5, "setEditing:", objc_msgSend(v4, "isEditing"));
  objc_msgSend(v4, "accessibilityTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTintColor:", v9);

  objc_msgSend(v5, "setAllowsEditingAnimation:", 0);
  objc_msgSend(v5, "setIconContentScalingEnabled:", 0);
  objc_msgSend(v5, "bs_setHitTestingDisabled:", 1);
  objc_msgSend(v5, "sizeToFit");
  objc_storeStrong((id *)&self->_iconView, v5);
  -[SBAppPlatterDragPreview _effectiveIconViewFrame](self, "_effectiveIconViewFrame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "layoutIfNeeded");
  -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  v14 = 1.0;
  -[SBAppPlatterDragPreview _getIconAlpha:platterAlpha:](self, "_getIconAlpha:platterAlpha:", &v14, 0);
  objc_msgSend(v5, "setAlpha:", v14);
  -[UIView addSubview:](self->_iconContainerView, "addSubview:", v5);
  objc_msgSend(v5, "backgroundViewGroupNameBase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (UIView *)objc_msgSend(v5, "newCaptureOnlyBackgroundView");
    objc_msgSend(v5, "frame");
    -[UIView setFrame:](v11, "setFrame:");
    -[UIView addSubview:](self->_iconContainerView, "addSubview:", v11);
    -[UIView sendSubviewToBack:](self->_iconContainerView, "sendSubviewToBack:", v11);
    captureOnlyBackgroundView = self->_captureOnlyBackgroundView;
    self->_captureOnlyBackgroundView = v11;

  }
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppPlatterDragPreview _updateShowDebugIconBorderWithColor:](self, "_updateShowDebugIconBorderWithColor:", v13);

}

- (uint64_t)customIconImageViewController
{
  if (result)
    return *(_QWORD *)(result + 576);
  return result;
}

- (void)_updateShowDebugIconBorderWithColor:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconEditingSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showDragPlatterIconBorder");

  if (v6)
  {
    -[SBIconView _iconImageView](self->_iconView, "_iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView iconImageInfo](self->_iconView, "iconImageInfo");
    objc_msgSend(v7, "_setContinuousCornerRadius:", v8);

    -[SBIconView _iconImageView](self->_iconView, "_iconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v11), "CGColor"));
    if (!v14)

    -[SBIconView _iconImageView](self->_iconView, "_iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderWidth:", 4.0);

  }
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  if (self->_iconAllowsLabelArea != a3)
  {
    self->_iconAllowsLabelArea = a3;
    -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  }
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  if (self->_iconAllowsAccessory != a3)
  {
    self->_iconAllowsAccessory = a3;
    -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  }
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
  if (self->_iconCanShowCloseBox != a3)
  {
    self->_iconCanShowCloseBox = a3;
    -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  }
}

- (void)setIconCanShowResizeHandle:(BOOL)a3
{
  if (self->_iconCanShowResizeHandle != a3)
  {
    self->_iconCanShowResizeHandle = a3;
    -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  }
}

- (void)setIconContentScale:(double)a3
{
  if (self->_iconContentScale != a3)
  {
    self->_iconContentScale = a3;
    -[SBAppPlatterDragPreview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)iconIsEditing
{
  return -[SBIconView isEditing](self->_iconView, "isEditing");
}

- (void)setIconIsEditing:(BOOL)a3
{
  -[SBAppPlatterDragPreview setIconIsEditing:animated:](self, "setIconIsEditing:animated:", a3, 1);
}

- (void)setIconIsEditing:(BOOL)a3 animated:(BOOL)a4
{
  -[SBIconView setEditing:animated:](self->_iconView, "setEditing:animated:", a3, a4);
}

- (void)handleCleanup
{
  UIView *captureOnlyBackgroundView;
  void (**cleanUpHandler)(id, SBAppPlatterDragPreview *);
  id v5;
  SBPortalView *sourcePortalView;

  if (self)
    self->_delayingCleanup = 0;
  -[SBIconView setIcon:](self->_iconView, "setIcon:", 0);
  -[UIView removeFromSuperview](self->_captureOnlyBackgroundView, "removeFromSuperview");
  captureOnlyBackgroundView = self->_captureOnlyBackgroundView;
  self->_captureOnlyBackgroundView = 0;

  cleanUpHandler = (void (**)(id, SBAppPlatterDragPreview *))self->_cleanUpHandler;
  if (cleanUpHandler)
  {
    cleanUpHandler[2](cleanUpHandler, self);
    v5 = self->_cleanUpHandler;
    self->_cleanUpHandler = 0;

  }
  if (self->_sourcePortalView)
  {
    -[SBAppPlatterDragPreview invalidateSourceView](self, "invalidateSourceView");
    -[SBPortalView removeFromSuperview](self->_sourcePortalView, "removeFromSuperview");
    sourcePortalView = self->_sourcePortalView;
    self->_sourcePortalView = 0;

  }
}

- (uint64_t)setDelayingCleanup:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 448) = a2;
  return result;
}

- (id)delayCleanUpForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *cleanupDelayAssertions;
  SBAppPlatterDragPreviewDelayCleanupAssertion *v7;

  v4 = a3;
  if (!self->_cleanupDelayAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    cleanupDelayAssertions = self->_cleanupDelayAssertions;
    self->_cleanupDelayAssertions = v5;

  }
  v7 = -[SBAppPlatterDragPreviewDelayCleanupAssertion initWithDragPreview:reason:]([SBAppPlatterDragPreviewDelayCleanupAssertion alloc], "initWithDragPreview:reason:", self, v4);
  -[NSHashTable addObject:](self->_cleanupDelayAssertions, "addObject:", v7);

  return v7;
}

- (void)_removeDelayCleanupAssertion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_cleanupDelayAssertions, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_cleanupDelayAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_cleanupDelayAssertions, "count") && self->_delayingCleanup)
      -[SBAppPlatterDragPreview handleCleanup](self, "handleCleanup");
  }

}

- (BOOL)isDelayingCleanup
{
  if (result)
    return *(_BYTE *)(result + 448) != 0;
  return result;
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  dispatch_time_t v5;
  SBIconView *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  SBIconView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBAppPlatterDragPreview_draggingSourceDroppedWithOperation___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  if (!a3)
  {
    v6 = self->_iconView;
    -[SBIconView customIconImageViewController](v6, "customIconImageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      SBLogIconDragging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Drop cancelled; replacing platter of icon image view controller with snapshot: %@",
          buf,
          0xCu);
      }

      -[SBIconView snapshotView](v6, "snapshotView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView superview](v6, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v9);

      -[SBIconView frame](v6, "frame");
      objc_msgSend(v9, "setFrame:");
      -[SBIconView setIcon:](v6, "setIcon:", 0);

    }
  }
}

_BYTE *__62__SBAppPlatterDragPreview_draggingSourceDroppedWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "count");
  result = *(_BYTE **)(a1 + 32);
  if (!v2)
    return (_BYTE *)objc_msgSend(result, "handleCleanup");
  if (result)
    result[448] = 1;
  return result;
}

- (void)setIconViewDelegate:(id)a3
{
  if (self)
    self = (SBAppPlatterDragPreview *)self->_iconView;
  -[SBAppPlatterDragPreview setDelegate:](self, "setDelegate:", a3);
}

- (uint64_t)iconView
{
  if (result)
    return *(_QWORD *)(result + 560);
  return result;
}

- (void)setIconViewListLayoutProvider:(id)a3
{
  if (self)
    self = (SBAppPlatterDragPreview *)self->_iconView;
  -[SBAppPlatterDragPreview setListLayoutProvider:](self, "setListLayoutProvider:", a3);
}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  SBIconView *iconView;
  id v5;

  v5 = a3;
  -[SBAppPlatterDragPreview setCustomIconImageViewController:]((uint64_t)self, v5);
  if (self)
    iconView = self->_iconView;
  else
    iconView = 0;
  -[SBIconView setOverrideCustomIconImageViewController:](iconView, "setOverrideCustomIconImageViewController:", v5);

}

- (void)setCustomIconImageViewController:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 576), a2);
}

- (void)layoutSubviews
{
  UIView *iconContainerView;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  SBApplicationBlurContentView *platterView;
  SBPortalView *sourcePortalView;
  SBPortalView *v16;
  UIView *unclippedSourceContainerView;
  UIView *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBAppPlatterDragPreview;
  -[SBAppPlatterDragPreview layoutSubviews](&v23, sel_layoutSubviews);
  -[SBAppPlatterDragPreview _effectiveIconContentScale](self, "_effectiveIconContentScale");
  iconContainerView = self->_iconContainerView;
  CGAffineTransformMakeScale(&v22, v4, v4);
  -[UIView setTransform:](iconContainerView, "setTransform:", &v22);
  -[SBAppPlatterDragPreview _effectiveIconViewFrame](self, "_effectiveIconViewFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBIconView setFrame:](self->_iconView, "setFrame:");
  -[UIView setFrame:](self->_captureOnlyBackgroundView, "setFrame:", v6, v8, v10, v12);
  v13 = self->_iconContainerView;
  -[SBAppPlatterDragPreview _effectiveIconContainerCenter](self, "_effectiveIconContainerCenter");
  -[UIView setCenter:](v13, "setCenter:");
  -[SBAppPlatterDragPreview _effectivePlatterFrame](self, "_effectivePlatterFrame");
  -[UIView setFrame:](self->_cornerMaskingView, "setFrame:");
  platterView = self->_platterView;
  SBRectWithSize();
  -[SBApplicationBlurContentView setFrame:](platterView, "setFrame:");
  sourcePortalView = self->_sourcePortalView;
  -[UIView frame](self->_sourceView, "frame");
  SBRectWithSize();
  -[SBPortalView setBounds:](sourcePortalView, "setBounds:");
  v16 = self->_sourcePortalView;
  SBRectWithSize();
  UIRectGetCenter();
  -[SBPortalView setCenter:](v16, "setCenter:");
  unclippedSourceContainerView = self->_unclippedSourceContainerView;
  -[SBPortalView bounds](self->_sourcePortalView, "bounds");
  -[UIView setBounds:](unclippedSourceContainerView, "setBounds:");
  v18 = self->_unclippedSourceContainerView;
  -[UIView center](self->_cornerMaskingView, "center");
  -[UIView setCenter:](v18, "setCenter:");
  v19 = objc_opt_class();
  SBSafeCast(v19, self->_cornerMaskingView);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[SBAppPlatterDragPreview _effectiveCornerRadiusConfiguration](self, "_effectiveCornerRadiusConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadiusConfiguration:", v21);
  }
  else
  {
    -[UIView layer](self->_cornerMaskingView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppPlatterDragPreview _effectiveCornerRadius](self, "_effectiveCornerRadius");
    objc_msgSend(v21, "setCornerRadius:");
  }

  -[SBAppPlatterDragPreview _updateSubviewVisibility](self, "_updateSubviewVisibility");
  -[SBAppPlatterDragPreview _updateIconViewComponentVisibility](self, "_updateIconViewComponentVisibility");
  -[SBAppPlatterDragPreview _updateShadowView](self, "_updateShadowView");
  -[SBAppPlatterDragPreview _updateContainerViewPositionForAnchorPoint](self, "_updateContainerViewPositionForAnchorPoint");

}

- (void)_updateContainerViewPositionForAnchorPoint
{
  double v3;
  double v4;
  double x;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *anchorPointAdjustmentContainerView;
  UIView *v16;
  CGAffineTransform v17;

  if (self->_dragState == 3)
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    x = self->_anchorPoint.x;
    y = self->_anchorPoint.y;
    -[SBAppPlatterDragPreview _effectivePlatterFrame](self, "_effectivePlatterFrame");
    v8 = v7;
    v10 = v9;
    -[SBAppPlatterDragPreview bounds](self, "bounds");
    v3 = (x + x + -1.0) * ((v11 - v8) * 0.5);
    v4 = (y + y + -1.0) * ((v12 - v10) * 0.5);
  }
  -[SBAppPlatterDragPreview bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](self->_anchorPointAdjustmentContainerView, "setCenter:", v3 + v13, v4 + v14);
  anchorPointAdjustmentContainerView = self->_anchorPointAdjustmentContainerView;
  -[SBAppPlatterDragPreview bounds](self, "bounds");
  -[UIView setBounds:](anchorPointAdjustmentContainerView, "setBounds:");
  v16 = self->_anchorPointAdjustmentContainerView;
  CGAffineTransformMakeRotation(&v17, self->_rotation);
  -[UIView setTransform:](v16, "setTransform:", &v17);
}

- (BOOL)_isDragging
{
  return self->_dragState > 1;
}

- (unint64_t)_effectiveMode
{
  unint64_t mode;

  mode = self->_mode;
  if (mode == 1)
  {
    if (self->_isBlurredPlatterReady)
      return 1;
    else
      return 2 * (self->_sourceView != 0);
  }
  return mode;
}

- (void)_updateShadowView
{
  double shadowRadius;
  double shadowOpacity;
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  NSArray *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t dragState;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSArray *v39;

  shadowOpacity = self->_diffuseShadowParameters.shadowOpacity;
  shadowRadius = self->_diffuseShadowParameters.shadowRadius;
  width = self->_diffuseShadowParameters.shadowOffset.width;
  height = self->_diffuseShadowParameters.shadowOffset.height;
  v8 = self->_rimShadowParameters.shadowOpacity;
  v7 = self->_rimShadowParameters.shadowRadius;
  v9 = self->_rimShadowParameters.shadowOffset.width;
  v10 = self->_rimShadowParameters.shadowOffset.height;
  v39 = self->_diffuseShadowFilters;
  v11 = self->_rimShadowFilters;
  if (self->_mode)
  {
    v37 = v9;
    v38 = height;
    v35 = width;
    v36 = v10;
    v12 = v8;
    -[SBAppPlatterDragPreview _effectivePlatterFrame](self, "_effectivePlatterFrame", *(_QWORD *)&v7);
  }
  else
  {
    dragState = self->_dragState;
    if (dragState <= 4)
    {
      if (dragState == 2)
      {
        shadowRadius = 14.0;
        width = 0.0;
        height = 10.0;
        shadowOpacity = 0.225;
      }
      else
      {
        width = *MEMORY[0x1E0C9D820];
        height = *(double *)(MEMORY[0x1E0C9D820] + 8);
        shadowRadius = 0.0;
        shadowOpacity = 0.0;
      }
    }
    v37 = *MEMORY[0x1E0C9D820];
    v38 = height;
    v35 = width;
    v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    v39 = 0;
    v11 = 0;
    v12 = 0.0;
    -[SBAppPlatterDragPreview _effectivePlatterFrame](self, "_effectivePlatterFrame", 0);
  }
  v18 = v13;
  v19 = v14;
  v20 = v15;
  v21 = v16;
  -[SBAppPlatterDragPreview _effectiveCornerRadius](self, "_effectiveCornerRadius");
  v23 = v22;
  -[SBFView setFrame:](self->_diffuseShadowView, "setFrame:", v18, v19, v20, v21);
  -[SBFView setFrame:](self->_rimShadowView, "setFrame:", v18, v19, v20, v21);
  -[SBFView _setContinuousCornerRadius:](self->_diffuseShadowView, "_setContinuousCornerRadius:", v23);
  -[SBFView _setContinuousCornerRadius:](self->_rimShadowView, "_setContinuousCornerRadius:", v23);
  -[SBFView layer](self->_diffuseShadowView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = shadowOpacity;
  objc_msgSend(v24, "setShadowOpacity:", v25);

  -[SBFView layer](self->_diffuseShadowView, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowRadius:", shadowRadius);

  -[SBFView layer](self->_diffuseShadowView, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowOffset:", v35, v38);

  -[SBFView layer](self->_rimShadowView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v29 = v12;
  objc_msgSend(v28, "setShadowOpacity:", v29);

  -[SBFView layer](self->_rimShadowView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setShadowRadius:", v34);

  -[SBFView layer](self->_rimShadowView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setShadowOffset:", v37, v36);

  -[SBFView layer](self->_diffuseShadowView, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFilters:", v39);

  -[SBFView layer](self->_rimShadowView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFilters:", v11);

}

- (void)_getIconAlpha:(double *)a3 platterAlpha:(double *)a4
{
  unint64_t v7;
  double v8;
  unint64_t dragState;
  double v10;
  double v11;

  v7 = -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode");
  if (v7 == 2)
  {
    v10 = 0.0;
    goto LABEL_7;
  }
  v8 = 1.0;
  if (v7)
  {
    v10 = 1.0;
    goto LABEL_9;
  }
  dragState = self->_dragState;
  v10 = 0.0;
  if (dragState >= 3)
  {
    if (dragState != 4)
      goto LABEL_9;
LABEL_7:
    v8 = 0.0;
    goto LABEL_9;
  }
  if (!-[SBAppPlatterDragPreview isFlocked](self, "isFlocked"))
  {
    -[SBAppPlatterDragPreview iconDragAlpha](self, "iconDragAlpha");
    v8 = v11;
  }
LABEL_9:
  if (a3)
    *a3 = v8;
  if (a4)
    *a4 = v10;
}

- (double)iconDragAlpha
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self)
    self = (SBAppPlatterDragPreview *)self->_iconView;
  -[SBAppPlatterDragPreview icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.5;
  if (v3 != (void *)*MEMORY[0x1E0DAA778] && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DAA620], "iconLiftAlpha");
    v5 = v6;
  }

  return v5;
}

- (void)_updateSubviewVisibility
{
  int v3;
  uint64_t v4;
  uint64_t (**v5)(_QWORD, double);
  double v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[5];
  uint64_t (**v12)(_QWORD, double);
  double v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[5];
  double v17;
  double v18;

  v17 = 1.0;
  v18 = 1.0;
  -[SBAppPlatterDragPreview _getIconAlpha:platterAlpha:](self, "_getIconAlpha:platterAlpha:", &v18, &v17);
  if (-[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode") == 1 && !self->_hasAnimatedToBlurredPlatter)
  {
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationBlurContentView animateToBlurredSnapshotWithFactory:completion:](self->_platterView, "animateToBlurredSnapshotWithFactory:completion:", v9, 0);
    v3 = 1;
    self->_hasAnimatedToBlurredPlatter = 1;

  }
  else
  {
    v3 = 0;
  }
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke;
  v16[3] = &unk_1E8EADFD8;
  v16[4] = self;
  v5 = (uint64_t (**)(_QWORD, double))MEMORY[0x1D17E5550](v16);
  v6 = 1.0 - v17;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v7, "setDampingRatio:", 1.0);
    objc_msgSend(v7, "setResponse:", 0.25);
    if (v3)
    {
      v15[0] = v4;
      v15[1] = 3221225472;
      v15[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_2;
      v15[3] = &unk_1E8E9DE88;
      v15[4] = self;
      *(double *)&v15[5] = v17;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v15);
      -[SBAppPlatterDragPreview _setSourcePortalViewHidden:](self, "_setSourcePortalViewHidden:", v5[2](v5, v17));
    }
    else
    {
      if (!self->_platterViewAlphaAnimationCount)
      {
        -[SBApplicationBlurContentView alpha](self->_platterView, "alpha");
        if ((BSFloatEqualToFloat() & 1) == 0)
          -[SBAppPlatterDragPreview _setSourcePortalViewHidden:](self, "_setSourcePortalViewHidden:", 0);
      }
      ++self->_platterViewAlphaAnimationCount;
      v8 = (void *)MEMORY[0x1E0CEABB0];
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_3;
      v14[3] = &unk_1E8E9DE88;
      v14[4] = self;
      *(double *)&v14[5] = v17;
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_4;
      v11[3] = &unk_1E8E9E7F8;
      v11[4] = self;
      v12 = v5;
      v13 = v17;
      objc_msgSend(v8, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v14, v11);

    }
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_5;
    v10[3] = &unk_1E8EAD3C0;
    v10[4] = self;
    *(double *)&v10[5] = v18;
    *(double *)&v10[6] = v17;
    *(double *)&v10[7] = v6;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v10, 0);

  }
  else
  {
    -[SBIconView setAlpha:](self->_iconView, "setAlpha:", v18);
    -[SBApplicationBlurContentView setAlpha:](self->_platterView, "setAlpha:", v17);
    -[UIView setAlpha:](self->_unclippedSourceContainerView, "setAlpha:", v6);
    -[SBAppPlatterDragPreview _setSourcePortalViewHidden:](self, "_setSourcePortalViewHidden:", v5[2](v5, v17));
  }

}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t IsOne;

  if (!objc_msgSend(*(id *)(a1 + 32), "_isDragging"))
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(a1 + 32) + 616))
    IsOne = 0;
  else
    IsOne = BSFloatIsOne();

  return IsOne;
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", *(double *)(a1 + 40));
}

void __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[53])
  {
    objc_msgSend(v1, "_setSourcePortalViewHidden:", (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48)));
    v5 = (void (**)(void))MEMORY[0x1D17E5550](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
    if (v5)
      v5[2]();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 512);
    *(_QWORD *)(v3 + 512) = 0;

  }
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "setAlpha:", *(double *)(a1 + 56));
}

- (void)_setSourcePortalViewHidden:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SBAppPlatterDragPreview__setSourcePortalViewHidden___block_invoke;
  v3[3] = &unk_1E8E9F508;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v3);
}

uint64_t __54__SBAppPlatterDragPreview__setSourcePortalViewHidden___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "setAlpha:", v1);
}

- (double)_effectiveIconContentScale
{
  unint64_t v3;
  double result;
  unint64_t dragState;

  v3 = -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode");
  result = 1.0;
  if (!v3)
  {
    dragState = self->_dragState;
    if (dragState >= 3)
    {
      if (dragState == 3)
      {
        return self->_iconContentScale;
      }
      else if (dragState == 4)
      {
        return 3.0;
      }
    }
    else
    {
      return self->_iconContentScale * 1.1;
    }
  }
  return result;
}

- (double)_blurContentViewIconViewCenterYOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBApplicationBlurContentView iconView](self->_platterView, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_iconContainerView, "bounds");
  v5 = v4;
  objc_msgSend(v3, "bounds");
  v7 = (v5 - v6) * 0.5;

  return v7;
}

- (CGPoint)_effectiveIconContainerCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[SBAppPlatterDragPreview bounds](self, "bounds");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  if (self->_sourceView || -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode") && self->_dragState == 3)
  {
    -[SBAppPlatterDragPreview _blurContentViewIconViewCenterYOffset](self, "_blurContentViewIconViewCenterYOffset");
    v6 = v6 + v7;
  }
  v8 = v4;
  v9 = v6;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)_effectiveIconViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self->_iconContainerView, "bounds");
  -[SBIconView bounds](self->_iconView, "bounds");
  SBRectWithSize();
  UIRectCenteredXInRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_effectivePlatterFrame
{
  unint64_t v3;
  unint64_t v4;
  SBIconView *iconView;
  CGFloat v6;
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
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect result;

  v3 = -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode");
  v4 = v3;
  if (v3 == 2)
  {
    -[UIView frame](self->_sourceView, "frame");
    CGAffineTransformMakeScale(&v20, self->_sourceViewScale, self->_sourceViewScale);
  }
  else if (!v3)
  {
    iconView = self->_iconView;
    if (!iconView)
      iconView = self->_referenceIconView;
    -[SBIconView iconImageFrame](iconView, "iconImageFrame");
    -[SBAppPlatterDragPreview _effectiveIconContentScale](self, "_effectiveIconContentScale");
    CGAffineTransformMakeScale(&v21, v6, v6);
  }
  SBRectWithSize();
  -[SBAppPlatterDragPreview bounds](self, "bounds");
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v4 && !self->_sourceView && self->_dragState != 3)
  {
    -[SBAppPlatterDragPreview _blurContentViewIconViewCenterYOffset](self, "_blurContentViewIconViewCenterYOffset");
    v10 = v10 - v15;
  }
  v16 = v8;
  v17 = v10;
  v18 = v12;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_effectiveCornerRadiusConfiguration
{
  unint64_t v3;
  BSCornerRadiusConfiguration *v4;
  SBIconView *iconView;
  double v6;
  double v7;
  double v8;

  v3 = -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode");
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      iconView = self->_iconView;
      if (!iconView)
        iconView = self->_referenceIconView;
      -[SBIconView iconImageInfo](iconView, "iconImageInfo");
      v7 = v6;
      -[SBAppPlatterDragPreview _effectiveIconContentScale](self, "_effectiveIconContentScale");
      v4 = (BSCornerRadiusConfiguration *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", v7 * v8);
    }
  }
  else
  {
    v4 = self->_cornerRadiusConfiguration;
  }
  return v4;
}

- (double)_effectiveCornerRadius
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBAppPlatterDragPreview _effectiveCornerRadiusConfiguration](self, "_effectiveCornerRadiusConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLeft");
  v4 = v3;
  objc_msgSend(v2, "topRight");
  v11 = v5;
  objc_msgSend(v2, "bottomLeft");
  v12 = v6;
  objc_msgSend(v2, "bottomRight");
  v13 = v7;
  for (i = 8; i != 32; i += 8)
  {
    if (v4 < *(double *)&v10[i])
      v4 = *(double *)&v10[i];
  }

  return v4;
}

- (void)_updateIconViewComponentVisibility
{
  SBIconView *iconView;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  SBIconView *v10;

  if (self)
    iconView = self->_iconView;
  else
    iconView = 0;
  v10 = iconView;
  -[SBAppPlatterDragPreview _effectiveIconAccessoryAlpha](self, "_effectiveIconAccessoryAlpha");
  v5 = v4;
  if (-[SBAppPlatterDragPreview _effectiveIconAllowsLabelArea](self, "_effectiveIconAllowsLabelArea"))
    v6 = 1.0;
  else
    v6 = 0.0;
  v7 = -[SBAppPlatterDragPreview _effectiveIconIsHighlighted](self, "_effectiveIconIsHighlighted");
  v8 = -[SBAppPlatterDragPreview _effectiveIconCanShowCloseBox](self, "_effectiveIconCanShowCloseBox");
  v9 = -[SBAppPlatterDragPreview _effectiveIconCanShowResizeHandle](self, "_effectiveIconCanShowResizeHandle");
  -[SBIconView setIconAccessoryAlpha:](v10, "setIconAccessoryAlpha:", v5);
  -[SBIconView setIconLabelAlpha:](v10, "setIconLabelAlpha:", v6);
  -[SBIconView setHighlighted:](v10, "setHighlighted:", v7);
  -[SBIconView setAllowsCloseBox:](v10, "setAllowsCloseBox:", v8);
  -[SBIconView setAllowsResizeHandle:](v10, "setAllowsResizeHandle:", v9);

}

- (double)_effectiveIconAccessoryAlpha
{
  unint64_t v3;
  double result;
  unint64_t dragState;

  v3 = -[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode");
  result = 0.0;
  if (!v3)
  {
    dragState = self->_dragState;
    if (dragState >= 3)
    {
      if (dragState == 3)
      {
        if (!self->_iconAllowsAccessory)
          return result;
        return 1.0;
      }
      if (dragState != 4)
        return result;
    }
    if (!self->_iconAllowsAccessory || self->_flocked)
      return result;
    return 1.0;
  }
  return result;
}

- (BOOL)_effectiveIconAllowsLabelArea
{
  unint64_t dragState;

  if (-[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode"))
    return 0;
  dragState = self->_dragState;
  if (dragState < 2)
  {
LABEL_6:
    if (self->_iconAllowsLabelArea)
      return !self->_flocked;
    return 0;
  }
  if (dragState != 3)
  {
    if (dragState != 4)
      return 0;
    goto LABEL_6;
  }
  return self->_iconAllowsLabelArea;
}

- (BOOL)_effectiveIconIsHighlighted
{
  return !-[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode")
      && !self->_dragState
      && self->_iconIsHighlighted;
}

- (BOOL)_effectiveIconCanShowCloseBox
{
  unint64_t dragState;
  uint64_t v5;

  if (-[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode"))
    return 0;
  dragState = self->_dragState;
  if (dragState >= 2)
  {
    if (dragState != 3)
      return 0;
    v5 = 444;
  }
  else
  {
    v5 = 446;
  }
  if (!*((_BYTE *)&self->super.super.super.isa + v5))
    return 0;
  return !self->_flocked;
}

- (BOOL)_effectiveIconCanShowResizeHandle
{
  unint64_t dragState;
  uint64_t v5;

  if (-[SBAppPlatterDragPreview _effectiveMode](self, "_effectiveMode"))
    return 0;
  dragState = self->_dragState;
  if (dragState >= 2)
  {
    if (dragState != 3)
      return 0;
    v5 = 441;
  }
  else
  {
    v5 = 447;
  }
  if (!*((_BYTE *)&self->super.super.super.isa + v5))
    return 0;
  return !self->_flocked;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAppPlatterDragPreview succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAppPlatterDragPreview descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  unint64_t v9;
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  -[SBAppPlatterDragPreview succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBAppPlatterDragPreview mode](self, "mode");
  v6 = CFSTR("SBAppPlatterDragPreviewModeIcon");
  if (v5 == 2)
    v6 = CFSTR("SBAppPlatterDragPreviewModeSourceView");
  if (v5 == 1)
    v7 = CFSTR("SBAppPlatterDragPreviewModePlatter");
  else
    v7 = v6;
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("mode"));
  v9 = -[SBAppPlatterDragPreview dragState](self, "dragState");
  if (v9 > 4)
    v10 = 0;
  else
    v10 = off_1E8EADFF8[v9];
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("dragState"));
  -[SBAppPlatterDragPreview platterSize](self, "platterSize");
  v12 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("platterSize"));
  -[SBAppPlatterDragPreview sourceViewScale](self, "sourceViewScale");
  v13 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("sourceViewScale"));
  -[SBAppPlatterDragPreview rotation](self, "rotation");
  v14 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("rotation"));
  return v4;
}

- (unint64_t)dragState
{
  return self->_dragState;
}

- (BOOL)isFlocked
{
  return self->_flocked;
}

- (BOOL)iconCanShowResizeHandle
{
  return self->_iconCanShowResizeHandle;
}

- (BOOL)iconAllowsLabelArea
{
  return self->_iconAllowsLabelArea;
}

- (BOOL)iconAllowsAccessory
{
  return self->_iconAllowsAccessory;
}

- (BOOL)iconCanShowCloseBox
{
  return self->_iconCanShowCloseBox;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (id)cleanUpHandler
{
  return self->_cleanUpHandler;
}

- (void)setCleanUpHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 488), a2);
}

- (double)sourceViewScale
{
  return self->_sourceViewScale;
}

- (void)setSourceViewScale:(double)a3
{
  self->_sourceViewScale = a3;
}

- (SBApplicationBlurContentView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 504), a2);
}

- (id)platterViewAlphaAnimationCompletionBlock
{
  return self->_platterViewAlphaAnimationCompletionBlock;
}

- (void)setPlatterViewAlphaAnimationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (CGSize)platterSize
{
  double width;
  double height;
  CGSize result;

  width = self->_platterSize.width;
  height = self->_platterSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SBDragPreviewShadowParameters)diffuseShadowParameters
{
  return self;
}

- (SBDragPreviewShadowParameters)rimShadowParameters
{
  return self;
}

- (NSArray)diffuseShadowFilters
{
  return self->_diffuseShadowFilters;
}

- (NSArray)rimShadowFilters
{
  return self->_rimShadowFilters;
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (uint64_t)referenceIconView
{
  if (result)
    return *(_QWORD *)(result + 552);
  return result;
}

- (void)setReferenceIconView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 552), a2);
}

- (void)setIconView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 560), a2);
}

- (uint64_t)captureOnlyBackgroundView
{
  if (result)
    return *(_QWORD *)(result + 568);
  return result;
}

- (void)setCaptureOnlyBackgroundView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 568), a2);
}

- (BOOL)iconIsHighlighted
{
  if (result)
    return *(_BYTE *)(result + 445) != 0;
  return result;
}

- (uint64_t)setIconIsHighlighted:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 445) = a2;
  return result;
}

- (BOOL)iconInitiallyShowingCloseBox
{
  if (result)
    return *(_BYTE *)(result + 446) != 0;
  return result;
}

- (uint64_t)setIconInitiallyShowingCloseBox:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 446) = a2;
  return result;
}

- (BOOL)iconInitiallyShowingResizeHandle
{
  if (result)
    return *(_BYTE *)(result + 447) != 0;
  return result;
}

- (uint64_t)setIconInitiallyShowingResizeHandle:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 447) = a2;
  return result;
}

- (uint64_t)anchorPointAdjustmentContainerView
{
  if (result)
    return *(_QWORD *)(result + 584);
  return result;
}

- (void)setAnchorPointAdjustmentContainerView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 584), a2);
}

- (uint64_t)iconContainerView
{
  if (result)
    return *(_QWORD *)(result + 592);
  return result;
}

- (void)setIconContainerView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 592), a2);
}

- (uint64_t)cornerMaskingView
{
  if (result)
    return *(_QWORD *)(result + 600);
  return result;
}

- (void)setCornerMaskingView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 600), a2);
}

- (uint64_t)sourcePortalView
{
  if (result)
    return *(_QWORD *)(result + 608);
  return result;
}

- (void)setSourcePortalView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 608), a2);
}

- (uint64_t)unclippedSourceContainerView
{
  if (result)
    return *(_QWORD *)(result + 616);
  return result;
}

- (void)setUnclippedSourceContainerView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 616), a2);
}

- (uint64_t)diffuseShadowView
{
  if (result)
    return *(_QWORD *)(result + 624);
  return result;
}

- (void)setDiffuseShadowView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 624), a2);
}

- (uint64_t)rimShadowView
{
  if (result)
    return *(_QWORD *)(result + 632);
  return result;
}

- (void)setRimShadowView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 632), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_unclippedSourceContainerView, 0);
  objc_storeStrong((id *)&self->_sourcePortalView, 0);
  objc_storeStrong((id *)&self->_cornerMaskingView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_anchorPointAdjustmentContainerView, 0);
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_captureOnlyBackgroundView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
  objc_storeStrong((id *)&self->_rimShadowFilters, 0);
  objc_storeStrong((id *)&self->_diffuseShadowFilters, 0);
  objc_storeStrong(&self->_platterViewAlphaAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_cleanUpHandler, 0);
  objc_storeStrong((id *)&self->_cleanupDelayAssertions, 0);
}

- (void)setDragState:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBAppPlatterDragPreview.m");
  v16 = 1024;
  v17 = 381;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
