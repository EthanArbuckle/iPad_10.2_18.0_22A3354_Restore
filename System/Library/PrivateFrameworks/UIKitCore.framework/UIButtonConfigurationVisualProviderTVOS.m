@implementation UIButtonConfigurationVisualProviderTVOS

- (void)cleanupForVisualProvider:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  -[UIButtonConfigurationVisualProvider cleanupForVisualProvider:](&v4, sel_cleanupForVisualProvider_, a3);
  -[UIView removeFromSuperview](self->_floatingContentView, "removeFromSuperview");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  -[UIButtonConfigurationVisualProvider layoutSubviews](&v3, sel_layoutSubviews);
  -[UIButtonConfigurationVisualProviderTVOS _layoutFloatingContentView](self, "_layoutFloatingContentView");
  -[UIButtonConfigurationVisualProviderTVOS _updateContentBackdropView](self, "_updateContentBackdropView");
}

- (id)effectiveContentView
{
  void *v2;
  void *v3;

  -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageEffectContainerView
{
  return self->super._imageView;
}

- (id)_floatingContentView
{
  _UIFloatingContentView *floatingContentView;
  _UIFloatingContentView *v4;
  _UIFloatingContentView *v5;
  _UIFloatingContentView *v6;
  void *v7;
  _QWORD v9[5];

  floatingContentView = self->_floatingContentView;
  if (!floatingContentView)
  {
    v4 = [_UIFloatingContentView alloc];
    v5 = -[_UIFloatingContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_floatingContentView;
    self->_floatingContentView = v5;

    -[_UIFloatingContentView setFloatingContentDelegate:](self->_floatingContentView, "setFloatingContentDelegate:", self);
    if (!_UIDeviceHasExternalTouchInput())
      -[UIView setUserInteractionEnabled:](self->_floatingContentView, "setUserInteractionEnabled:", 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__UIButtonConfigurationVisualProviderTVOS__floatingContentView__block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v9);
    -[UIButtonConfigurationVisualProvider button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_floatingContentView);

    floatingContentView = self->_floatingContentView;
  }
  return floatingContentView;
}

uint64_t __63__UIButtonConfigurationVisualProviderTVOS__floatingContentView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFocusAnimationConfiguration:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setShadowOpacity:", 0.2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setShadowRadius:", 16.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setShadowVerticalOffset:", 25.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setUseShadowImage:", 0);
}

- (void)_updateBackgroundViewWithConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _UISystemBackgroundView *v15;
  _UISystemBackgroundView *backgroundView;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  objc_msgSend(v4, "background");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cornerRadius");
  v6 = v5;
  v7 = objc_msgSend(v4, "cornerStyle");

  switch(v7)
  {
    case 0:
      +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButtonConfigurationVisualProvider button](self, "button");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scaledValueForValue:compatibleWithTraitCollection:", v10, v6);
      objc_msgSend(v19, "setCornerRadius:");

      goto LABEL_8;
    case 1:
      -[UIButtonConfigurationVisualProvider button](self, "button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v12 = 0.25;
      goto LABEL_5;
    case 2:
      -[UIButtonConfigurationVisualProvider button](self, "button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v12 = 0.35;
LABEL_5:
      v13 = v11 * v12 * 0.5;
      goto LABEL_7;
    case 3:
      -[UIButtonConfigurationVisualProvider button](self, "button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v13 = v14 * 0.5 * 0.5;
LABEL_7:
      objc_msgSend(v19, "setCornerRadius:", v13);
LABEL_8:

      break;
    case 4:
      objc_msgSend(v19, "setCornerRadius:", 1.79769313e308);
      break;
    default:
      break;
  }
  if (self->super._backgroundView)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __82__UIButtonConfigurationVisualProviderTVOS__updateBackgroundViewWithConfiguration___block_invoke;
    v20[3] = &unk_1E16B1B50;
    v20[4] = self;
    v21 = v19;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);

  }
  else
  {
    v15 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v19);
    backgroundView = self->super._backgroundView;
    self->super._backgroundView = v15;

    -[UIView setUserInteractionEnabled:](self->super._backgroundView, "setUserInteractionEnabled:", 0);
    -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "visualEffectContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->super._backgroundView);

  }
}

uint64_t __82__UIButtonConfigurationVisualProviderTVOS__updateBackgroundViewWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)_layoutFloatingContentView
{
  void *v3;
  void *v4;
  _UISystemBackgroundView *backgroundView;
  double currentlyAppliedCornerRadius;
  _UISystemBackgroundView *v7;
  _QWORD *v8;

  -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  backgroundView = self->super._backgroundView;
  if (backgroundView)
    currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
  else
    currentlyAppliedCornerRadius = 0.0;
  -[_UIFloatingContentView setCornerRadius:](self->_floatingContentView, "setCornerRadius:", currentlyAppliedCornerRadius);
  v7 = self->super._backgroundView;
  if (v7)
  {
    if ((*(_BYTE *)&v7->_systemBackgroundViewFlags & 1) != 0)
      v8 = (_QWORD *)MEMORY[0x1E0CD2A68];
    else
      v8 = (_QWORD *)MEMORY[0x1E0CD2A60];
  }
  else
  {
    v8 = (_QWORD *)MEMORY[0x1E0CD2A60];
  }
  -[_UIFloatingContentView setCornerCurve:](self->_floatingContentView, "setCornerCurve:", *v8);
}

- (BOOL)_hasRemovedPlatterForState:(unint64_t)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = dyld_program_sdk_at_least();
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = qword_186685A00[v6];
      -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "backgroundColorForState:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (v7 & ~a3) != 0 || v9 == 0;
    }
    while (v5 == 1 && v6++ != 2);
  }
  return v5;
}

- (void)_updateContentBackdropView
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4)
  {
    if (v4 == 2)
    {
      v5 = 0.5;
    }
    else
    {
      -[UIButtonConfigurationVisualProvider button](self, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIButtonConfigurationVisualProviderTVOS _hasRemovedPlatterForState:](self, "_hasRemovedPlatterForState:", objc_msgSend(v6, "state")))
      {
        v5 = 1.0;
      }
      else
      {
        v5 = 0.0;
      }

    }
  }
  else
  {
    v5 = 1.0;
  }
  -[UIView alpha](self->super._backgroundView, "alpha");
  v8 = v7;
  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v14);

  v18[0] = &unk_1E1A9B028;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 * 0.99);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyTimes:", v16);

  objc_msgSend(v11, "setDuration:", v10);
  objc_msgSend(v11, "setAdditive:", 1);
  -[UIView layer](self->super._backgroundView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v11, CFSTR("opacity"));

  -[UIView setAlpha:](self->super._backgroundView, "setAlpha:", v5);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextFocusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    -[UIButtonConfigurationVisualProvider button](self, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setHighlightedWithoutUpdatingState:", 0);

  }
  -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setControlState:withAnimationCoordinator:", objc_msgSend(v11, "_stateForFocusUpdateContext:", v13), v6);

  -[UIButtonConfigurationVisualProvider button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsUpdateConfiguration");

}

- (double)focusSizeIncrease
{
  double result;

  -[_UIFloatingContentView focusedSizeIncrease](self->_floatingContentView, "focusedSizeIncrease");
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
  -[_UIFloatingContentView setFocusedSizeIncrease:](self->_floatingContentView, "setFocusedSizeIncrease:", a3);
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  -[UIButtonConfigurationVisualProvider setSelected:](&v6, sel_setSelected_, a3);
  -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControlState:animated:", objc_msgSend(v5, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  -[UIButtonConfigurationVisualProvider setHighlighted:animated:](&v8, sel_setHighlighted_animated_, a3);
  -[UIButtonConfigurationVisualProviderTVOS _floatingContentView](self, "_floatingContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setControlState:animated:", objc_msgSend(v7, "state"), v4);

}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint result;

  v4 = a3;
  -[UIButtonConfigurationVisualProvider button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIControlMenuSupportTargetedPreviewOverViews(v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "target");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = round(v15 - v13 * 0.5);
  v18 = round(v17 - v11 * 0.5);
  objc_msgSend(v8, "_window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v19, v18, v16, v11, v13);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  LODWORD(v9) = objc_msgSend(v4, "prefersHorizontalAttachment");
  objc_msgSend(v8, "_window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if ((_DWORD)v9)
    v30 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v28, v21, v23, v25, v27);
  else
    v30 = _UIControlMenuAttachmentPointForRectInContainer(v28, v21, v23, v25, v27);
  v32 = v30;
  v33 = v31;

  v34 = v32;
  v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v7 = a5;
  if (v7)
  {
    v17 = v7;
    v8 = a4;
    -[UIButtonConfigurationVisualProvider button](self, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIControlMenuSupportTargetedPreviewOverViews(v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButtonConfigurationVisualProvider button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuAttachmentPointForConfiguration:", v8);
    v13 = v12;
    v15 = v14;

    LODWORD(v11) = objc_msgSend(v8, "prefersHorizontalAttachment");
    -[UIButtonConfigurationVisualProvider button](self, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v11)
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v17, v16, v10, v13, v15);
    else
      _UIControlMenuSupportUpdateStyle(v17, v16, v10, v13, v15);

    v7 = v17;
  }

}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;

  -[UIButtonConfigurationVisualProvider button](self, "button", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIControlMenuSupportTargetedPreviewOverViews(v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;

  -[UIButtonConfigurationVisualProvider button](self, "button", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIControlMenuSupportTargetedPreviewOverViews(v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

@end
