@implementation SBFluidSwitcherIconOverlayView

- (void)dealloc
{
  objc_super v3;

  -[SBFluidSwitcherIconOverlayView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherIconOverlayView;
  -[SBFluidSwitcherIconOverlayView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  UIViewFloatAnimatableProperty *iconCrossfadeAnimatableProperty;
  UIViewFloatAnimatableProperty *v4;
  NSArray *crossfadeViews;

  iconCrossfadeAnimatableProperty = self->_iconCrossfadeAnimatableProperty;
  if (iconCrossfadeAnimatableProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](iconCrossfadeAnimatableProperty, "invalidate");
    v4 = self->_iconCrossfadeAnimatableProperty;
    self->_iconCrossfadeAnimatableProperty = 0;

  }
  -[SBIconView cleanupAfterCrossfade](self->_iconOverlayView, "cleanupAfterCrossfade");
  -[SBIconView setIcon:](self->_iconOverlayView, "setIcon:", 0);
  -[SBFluidSwitcherIconOverlayView _setCrossfadeViewsAlpha:](self, "_setCrossfadeViewsAlpha:", 1.0);
  crossfadeViews = self->_crossfadeViews;
  self->_crossfadeViews = 0;

}

void __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  double v4;
  double v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[68];
    if (v3)
    {
      v6 = v2;
      objc_msgSend(v3, "value");
      v5 = v4;
      objc_msgSend(v6, "_setCrossfadeViewsAlpha:");
      objc_msgSend(v6[56], "setAlpha:", 1.0 - v5);
      v2 = v6;
    }
  }

}

void __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  float v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_19;
  v4 = WeakRetained[68];
  if (!v4)
    goto LABEL_19;
  objc_msgSend(v4, "value");
  v6 = v5;
  objc_msgSend(v3[68], "presentationValue");
  v8 = v7;
  if (v6 == 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gridSizeClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *MEMORY[0x1E0DAA770];
    if (v10 == (void *)*MEMORY[0x1E0DAA770])
    {

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "icon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "gridSizeClass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v12);

      if (!v15)
      {
        v16 = (v8 + -0.25) / 0.35;
LABEL_10:
        v17 = fmin(fmax(v16 + 0.0, 0.0), 1.0);
        goto LABEL_11;
      }
    }
    v16 = (v8 + -0.05) * 4.0;
    goto LABEL_10;
  }
  v17 = fmin(fmax((v7 + -0.15) / 0.45 + 0.0, 0.0), 1.0);
LABEL_11:
  *(float *)&v17 = v17;
  objc_msgSend(v3[69], "_solveForInput:", v17);
  v19 = 1.0 - v18;
  v20 = v3[56];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setPresentationValue:forKey:", v21, CFSTR("opacity"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v3[63];
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v23)
  {
    v24 = v23;
    v25 = fmin(fmax((v19 + -0.9) / -0.1 + 1.0, 0.0), 1.0);
    v26 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25, (_QWORD)v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_setPresentationValue:forKey:", v29, CFSTR("opacity"));

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v24);
  }

LABEL_19:
}

- (void)_setCrossfadeViewsAlpha:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_crossfadeViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAlpha:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __48__SBFluidSwitcherIconOverlayView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setValue:", *(double *)(a1 + 40));
}

- (void)_setUpIconCrossfadeView
{
  double x;
  double y;
  double width;
  double height;
  int64_t v7;
  int64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  double v18;
  UIView *v19;
  UIView *iconCrossfadeView;
  id v21;

  -[SBIconView setEnabled:](self->_iconOverlayView, "setEnabled:", 0);
  -[UIView addSubview:](self->_iconOverlayContainerView, "addSubview:", self->_iconOverlayView);
  x = self->_crossfadeViewFrame.origin.x;
  y = self->_crossfadeViewFrame.origin.y;
  width = self->_crossfadeViewFrame.size.width;
  height = self->_crossfadeViewFrame.size.height;
  v7 = -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  v8 = -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  -[SBIconView icon](self->_iconOverlayView, "icon");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DAA750];

  if ((unint64_t)v9 <= v10)
  {
    v16 = 3;
  }
  else
  {
    v11 = objc_opt_class();
    SBSafeCast(v11, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeWidget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

    if (v15)
      v16 = 11;
    else
      v16 = 3;

  }
  v17 = ((unint64_t)(v7 - 1) < 2) ^ ((unint64_t)(v8 - 1) < 2);
  if (v17)
    v18 = height;
  else
    v18 = width;
  if (!v17)
    width = height;
  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, v18, width);
  iconCrossfadeView = self->_iconCrossfadeView;
  self->_iconCrossfadeView = v19;

  -[SBIconView sizeToFit](self->_iconOverlayView, "sizeToFit");
  -[SBIconView prepareToCrossfadeImageWithView:options:](self->_iconOverlayView, "prepareToCrossfadeImageWithView:options:", self->_iconCrossfadeView, v16);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SBFluidSwitcherIconOverlayView _applyIconOverlayViewOverlayScaleProperties](self, "_applyIconOverlayViewOverlayScaleProperties");
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
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  _QWORD v17[6];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherIconOverlayView;
  -[BSUIOrientationTransformWrapperView layoutSubviews](&v18, sel_layoutSubviews);
  -[SBFluidSwitcherIconOverlayView _applyIconOverlayViewOverlayScaleProperties](self, "_applyIconOverlayViewOverlayScaleProperties");
  -[SBFluidSwitcherIconOverlayView _currentFadeValue](self, "_currentFadeValue");
  v4 = v3;
  -[SBIconView setMorphFraction:](self->_iconOverlayView, "setMorphFraction:");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__SBFluidSwitcherIconOverlayView_layoutSubviews__block_invoke;
  v17[3] = &unk_1E8E9DE88;
  v17[4] = self;
  *(double *)&v17[5] = v4;
  LODWORD(v5) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v6) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v17, COERCE_DOUBLE((unint64_t)*MEMORY[0x1E0CD23C0]), v5, v6);
  -[SBIconView sizeToFit](self->_iconOverlayView, "sizeToFit");
  -[UIView bounds](self->_iconOverlayContainerView, "bounds");
  UIRectGetCenter();
  v8 = v7;
  v10 = v9;
  -[SBIconView bounds](self->_iconOverlayView, "bounds");
  v12 = v11 - self->_initialIconOverlayViewBounds.size.height;
  -[SBIconView customIconImageViewController](self->_iconOverlayView, "customIconImageViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "imageViewAlignment");

  if (v14 == 1)
    v15 = -(v12 * 0.5);
  else
    v15 = v12 * 0.5;
  -[SBFluidSwitcherIconOverlayView _iconOverlayScale](self, "_iconOverlayScale");
  -[SBIconView setCenter:](self->_iconOverlayView, "setCenter:", v8, v10 + (1.0 - v4) * (v15 * v16));
}

- (double)_iconOverlayScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double v10;
  double v11;
  double height;
  double v13;
  double result;

  -[UIView bounds](self->_iconOverlayContainerView, "bounds");
  v4 = v3;
  v6 = v5;
  -[SBFluidSwitcherIconOverlayView _currentFadeValue](self, "_currentFadeValue");
  v8 = v7;
  width = self->_initialIconOverlayViewBounds.size.width;
  -[SBIconView iconImageFrame](self->_iconOverlayView, "iconImageFrame");
  v11 = v8 * v10 + (1.0 - v8) * width;
  height = self->_initialIconOverlayViewBounds.size.height;
  -[SBIconView iconImageFrame](self->_iconOverlayView, "iconImageFrame");
  result = v6 / (v8 * v13 + (1.0 - v8) * height);
  if (v4 / v11 <= result)
    return v4 / v11;
  return result;
}

- (double)_currentFadeValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  int64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[SBFluidSwitcherIconOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  width = self->_initialIconOverlayViewBounds.size.width;
  height = self->_initialIconOverlayViewBounds.size.height;
  v9 = -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  v10 = ((unint64_t)(v9 - 1) < 2) ^ ((unint64_t)(-[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation")- 1) < 2);
  if (v10)
    v11 = width;
  else
    v11 = height;
  if (v10)
    v12 = height;
  else
    v12 = width;
  v13 = v12 / v11;
  v14 = 1.0;
  if (v11 == 0.0)
    v15 = 1.0;
  else
    v15 = v13;
  v16 = self->_crossfadeViewFrame.size.height;
  if (v16 == 0.0)
    v17 = 1.0;
  else
    v17 = self->_crossfadeViewFrame.size.width / v16;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    v18 = v4 / v6;
    if (v6 == 0.0)
      v18 = v15;
    return (v18 - v15) / (v17 - v15) + 0.0;
  }
  return v14;
}

- (void)_applyIconOverlayViewOverlayScaleProperties
{
  CGFloat v3;
  double v4;
  SBIconView *iconOverlayView;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CGAffineTransform v12;

  -[SBFluidSwitcherIconOverlayView _iconOverlayScale](self, "_iconOverlayScale");
  v4 = v3;
  iconOverlayView = self->_iconOverlayView;
  CGAffineTransformMakeScale(&v12, v3, v3);
  -[SBIconView setTransform:](iconOverlayView, "setTransform:", &v12);
  -[SBIconView setCrossfadeCornerRadius:](self->_iconOverlayView, "setCrossfadeCornerRadius:", self->_cornerRadius / v4);
  -[SBIconView icon](self->_iconOverlayView, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DAA750];
  if (v7 == (void *)*MEMORY[0x1E0DAA750])
  {
    v11 = 0;
  }
  else
  {
    -[SBIconView icon](self->_iconOverlayView, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gridSizeClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v8) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[SBIconView iconImageFrame](self->_iconOverlayView, "iconImageFrame");
      v11 = BSSizeEqualToSize() ^ 1;
    }

  }
  -[SBFluidSwitcherIconOverlayView setClipsToBounds:](self, "setClipsToBounds:", v11);
  -[SBFluidSwitcherIconOverlayView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", self->_cornerRadius);
}

- (SBFluidSwitcherIconOverlayView)initWithIconView:(id)a3 crossfadeViews:(id)a4 crossfadeViewFrame:(CGRect)a5 contentOrientation:(int64_t)a6 containerOrientation:(int64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  void *v19;
  SBFluidSwitcherIconOverlayView *v20;
  SBFluidSwitcherIconOverlayView *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  NSArray *crossfadeViews;
  id v28;
  uint64_t v29;
  UIView *iconOverlayContainerView;
  uint64_t v31;
  CAMediaTimingFunction *iconCrossfadeTimingFunction;
  void *v34;
  void *v35;
  objc_super v36;
  objc_super v37;
  objc_super v38;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = v18;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherIconOverlayView.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconView"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherIconOverlayView.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("crossfadeViews"));

LABEL_3:
  v38.receiver = self;
  v38.super_class = (Class)SBFluidSwitcherIconOverlayView;
  v20 = -[SBFluidSwitcherIconOverlayView init](&v38, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_iconOverlayView, a3);
    objc_msgSend(v17, "bounds");
    v21->_initialIconOverlayViewBounds.origin.x = v22;
    v21->_initialIconOverlayViewBounds.origin.y = v23;
    v21->_initialIconOverlayViewBounds.size.width = v24;
    v21->_initialIconOverlayViewBounds.size.height = v25;
    v26 = objc_msgSend(v19, "copy");
    crossfadeViews = v21->_crossfadeViews;
    v21->_crossfadeViews = (NSArray *)v26;

    v21->_crossfadeViewFrame.origin.x = x;
    v21->_crossfadeViewFrame.origin.y = y;
    v21->_crossfadeViewFrame.size.width = width;
    v21->_crossfadeViewFrame.size.height = height;
    v37.receiver = v21;
    v37.super_class = (Class)SBFluidSwitcherIconOverlayView;
    -[BSUIOrientationTransformWrapperView setContentOrientation:](&v37, sel_setContentOrientation_, a6);
    v36.receiver = v21;
    v36.super_class = (Class)SBFluidSwitcherIconOverlayView;
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](&v36, sel_setContainerOrientation_, a7);
    -[SBFluidSwitcherIconOverlayView setUserInteractionEnabled:](v21, "setUserInteractionEnabled:", 0);
    v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBFluidSwitcherIconOverlayView bounds](v21, "bounds");
    v29 = objc_msgSend(v28, "initWithFrame:");
    iconOverlayContainerView = v21->_iconOverlayContainerView;
    v21->_iconOverlayContainerView = (UIView *)v29;

    -[UIView setUserInteractionEnabled:](v21->_iconOverlayContainerView, "setUserInteractionEnabled:", 0);
    -[BSUIOrientationTransformWrapperView addContentView:](v21, "addContentView:", v21->_iconOverlayContainerView);
    -[SBFluidSwitcherIconOverlayView _setUpIconCrossfadeView](v21, "_setUpIconCrossfadeView");
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v31 = objc_claimAutoreleasedReturnValue();
    iconCrossfadeTimingFunction = v21->_iconCrossfadeTimingFunction;
    v21->_iconCrossfadeTimingFunction = (CAMediaTimingFunction *)v31;

    -[SBFluidSwitcherIconOverlayView _setUpIconCrossfadeAnimatableProperty](v21, "_setUpIconCrossfadeAnimatableProperty");
  }

  return v21;
}

- (void)_setUpIconCrossfadeAnimatableProperty
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *iconCrossfadeAnimatableProperty;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  iconCrossfadeAnimatableProperty = self->_iconCrossfadeAnimatableProperty;
  self->_iconCrossfadeAnimatableProperty = v3;

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = self->_iconCrossfadeAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke_2;
  v8[3] = &unk_1E8E9F280;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCrossfadeTimingFunction, 0);
  objc_storeStrong((id *)&self->_iconCrossfadeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_crossfadeViews, 0);
  objc_storeStrong((id *)&self->_iconOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_iconCrossfadeView, 0);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
}

- (CGRect)crossfadeViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_crossfadeViewFrame.origin.x;
  y = self->_crossfadeViewFrame.origin.y;
  width = self->_crossfadeViewFrame.size.width;
  height = self->_crossfadeViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SBIconView)iconView
{
  return self->_iconOverlayView;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
