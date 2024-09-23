@implementation UISwitchModernVisualElement

void __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPosition:", *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __72__UISwitchModernVisualElement__transitionWellViewToPressed_on_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

uint64_t __66__UISwitchModernVisualElement__dynamicUserInterfaceTraitDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateControl");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISwitchModernVisualElement;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v4, sel__dynamicUserInterfaceTraitDidChange);
  if (dyld_program_sdk_at_least())
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66__UISwitchModernVisualElement__dynamicUserInterfaceTraitDidChange__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  }
}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  const __CFArray *v6;
  CGGradient *v7;
  CGContext *v8;
  _QWORD v9[3];
  CGPoint v10;
  CGPoint v11;

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v9[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v7 = CGGradientCreateWithColors(0, v6, 0);
  v8 = (CGContext *)objc_msgSend(v5, "CGContext");

  v11.x = *(double *)(a1 + 48) + -51.0;
  v10.x = 51.0;
  v10.y = 0.0;
  v11.y = 0.0;
  CGContextDrawLinearGradient(v8, v7, v10, v11, 3u);
  CGGradientRelease(v7);

}

void __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  const CGPath *v9;
  _QWORD *ContextStack;
  CGContext *v11;
  void *v12;
  id v13;
  CGSize v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  if (v4)
  {
    v5 = -19.0;
    if (v4 == 1)
      v5 = 6.0;
    v6 = 0x404C000000000000;
    v7 = 3.0;
    v8 = 31.0;
    v9 = CGPathCreateWithRoundedRect(*(CGRect *)&v5, 15.5, 15.5, 0);
    CGContextAddPath((CGContextRef)objc_msgSend(v13, "CGContext"), v9);
    CGContextClip((CGContextRef)objc_msgSend(v13, "CGContext"));
    CGPathRelease(v9);
  }
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v11 = 0;
  else
    v11 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v14.width = 0.0;
  v14.height = 2.5;
  CGContextSetShadowWithColor(v11, v14, 6.0, *(CGColorRef *)(a1 + 40));
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v13, "CGContext"), *(CGColorRef *)(a1 + 48));
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 5.0, 27.0, 27.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fill");

}

- (void)setOnTintColor:(id)a3
{
  UIImageView *switchWellOnImageView;
  void *v6;
  UIImageView *switchWellImageView;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[UIColor isEqual:](self->_onTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_onTintColor, a3);
    switchWellOnImageView = self->_switchWellOnImageView;
    -[UISwitchModernVisualElement _effectiveOnImageTintColor](self, "_effectiveOnImageTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](switchWellOnImageView, "setTintColor:", v6);

    if (dyld_program_sdk_at_least())
    {
      switchWellImageView = self->_switchWellImageView;
      -[UISwitchModernVisualElement _effectiveGradientImage](self, "_effectiveGradientImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](switchWellImageView, "setImage:", v8);

    }
  }
  -[UISwitchModernVisualElement _updateDisplayWithAnimationIfNeeded](self, "_updateDisplayWithAnimationIfNeeded");

}

- (void)setTintColor:(id)a3
{
  UIImageView *switchWellOffImageView;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[UIColor isEqual:](self->_tintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    switchWellOffImageView = self->_switchWellOffImageView;
    -[UISwitchModernVisualElement _effectiveOffImageTintColor](self, "_effectiveOffImageTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](switchWellOffImageView, "setTintColor:", v6);

  }
  -[UISwitchModernVisualElement _updateDisplayWithAnimationIfNeeded](self, "_updateDisplayWithAnimationIfNeeded");

}

- (void)_invalidateControl
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v7 = _invalidateControl___s_category;
    if (!_invalidateControl___s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_invalidateControl___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v9, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[UISwitchModernVisualElement _invalidateWell](self, "_invalidateWell");
  -[UISwitchModernVisualElement _invalidateKnob](self, "_invalidateKnob");
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);
  -[UISwitchModernVisualElement _invalidateOnOffImages](self, "_invalidateOnOffImages");

}

- (void)_orderSubviews
{
  UIImageView **p_knobView;
  UISwitchModernVisualElement *switchWellContainerView;

  if (dyld_program_sdk_at_least())
  {
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_switchWellView, 0);
    -[UIView insertSubview:above:](self, "insertSubview:above:", self->_switchWellContainerView, self->_switchWellView);
    p_knobView = &self->_knobView;
    -[UIView bringSubviewToFront:](self->_switchWellContainerView, "bringSubviewToFront:", self->_knobView);
    switchWellContainerView = (UISwitchModernVisualElement *)self->_switchWellContainerView;
  }
  else
  {
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_switchWellContainerView, 0);
    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_leftSwitchWellContainerView, self->_switchWellContainerView);
    p_knobView = &self->_knobView;
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_knobView);
    switchWellContainerView = self;
  }
  -[UIView insertSubview:belowSubview:](switchWellContainerView, "insertSubview:belowSubview:", self->_switchWellImageViewContainer, *p_knobView);
}

- (void)_invalidateWell
{
  int v3;
  void *v4;
  UIImageView *v5;
  UIImageView *switchWellImageView;
  double v7;
  UIView *v8;
  UIView *v9;
  UIView *switchWellContainerView;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *switchWellView;
  UIView *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  UIView *v23;
  UIView *v24;
  UIView *v25;
  UIView *leftSwitchWellView;
  void *v27;
  UIView *v28;
  void *v29;
  UIView *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIView *v42;
  UIView *leftSwitchWellContainerView;
  UIView *v44;
  UIView *v45;

  v3 = dyld_program_sdk_at_least();
  -[UIView removeFromSuperview](self->_switchWellView, "removeFromSuperview");
  if (v3)
  {
    -[UIView removeFromSuperview](self->_switchWellImageView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_switchWellContainerView, "removeFromSuperview");
    -[UISwitchModernVisualElement _effectiveGradientImage](self, "_effectiveGradientImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v4);
    switchWellImageView = self->_switchWellImageView;
    self->_switchWellImageView = v5;

    objc_msgSend(v4, "size");
    -[UIImageView setFrame:](self->_switchWellImageView, "setFrame:", 0.0, 0.0, v7, 31.0);
    -[UIImageView setHidden:](self->_switchWellImageView, "setHidden:", 1);
    v8 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    switchWellContainerView = self->_switchWellContainerView;
    self->_switchWellContainerView = v9;

    -[UIView _setAllowsHighContrastForBackgroundColor:](self->_switchWellContainerView, "_setAllowsHighContrastForBackgroundColor:", 1);
    -[UIView _setShouldAdaptToMaterials:](self->_switchWellContainerView, "_setShouldAdaptToMaterials:", 0);
    -[UIView layer](self->_switchWellContainerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 15.5);

    -[UIView setClipsToBounds:](self->_switchWellContainerView, "setClipsToBounds:", 0);
    -[UIView addSubview:](self->_switchWellContainerView, "addSubview:", self->_switchWellImageView);
    v12 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
    switchWellView = self->_switchWellView;
    self->_switchWellView = v13;

    -[UISwitchModernVisualElement _invalidateUserInterfaceRenderingMode](self, "_invalidateUserInterfaceRenderingMode");
    v15 = self->_switchWellView;
    -[UISwitchModernVisualElement _effectiveTintColor](self, "_effectiveTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView layer](self->_switchWellView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 15.5);

    -[UISwitchModernVisualElement _orderSubviews](self, "_orderSubviews");
    -[UISwitchModernVisualElement _transitionWellViewToPressed:on:animated:](self, "_transitionWellViewToPressed:on:animated:", 0, self->_on, 0);
  }
  else
  {
    -[UIView removeFromSuperview](self->_leftSwitchWellView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_switchWellContainerView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_leftSwitchWellContainerView, "removeFromSuperview");
    -[UIView bounds](self, "bounds");
    v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v19 - v18 * 0.5, v20, v18, v21);
    v23 = self->_switchWellView;
    self->_switchWellView = v22;

    v24 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v25 = -[UIView initWithFrame:](v24, "initWithFrame:");
    leftSwitchWellView = self->_leftSwitchWellView;
    self->_leftSwitchWellView = v25;

    -[UIView layer](self->_leftSwitchWellView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitchModernVisualElement _wellBorderWidthPressed:on:](self, "_wellBorderWidthPressed:on:", 1, 1);
    objc_msgSend(v27, "setBorderWidth:");

    v28 = self->_switchWellView;
    +[UIColor clearColor](UIColor, "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    v30 = self->_leftSwitchWellView;
    +[UIColor clearColor](UIColor, "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[UIView layer](self->_switchWellView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", 15.5);

    -[UIView layer](self->_leftSwitchWellView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerRadius:", 15.5);

    -[UIView bounds](self, "bounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40 * 0.5;
    v42 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v34, v36, v40 * 0.5, v38);
    leftSwitchWellContainerView = self->_leftSwitchWellContainerView;
    self->_leftSwitchWellContainerView = v42;

    -[UIView setClipsToBounds:](self->_leftSwitchWellContainerView, "setClipsToBounds:", 1);
    v44 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v35 + v41, v37, v41, v39);
    v45 = self->_switchWellContainerView;
    self->_switchWellContainerView = v44;

    -[UIView setClipsToBounds:](self->_switchWellContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](self->_switchWellContainerView, "addSubview:", self->_switchWellView);
    -[UIView addSubview:](self->_leftSwitchWellContainerView, "addSubview:", self->_leftSwitchWellView);
    -[UISwitchModernVisualElement _orderSubviews](self, "_orderSubviews");
    -[UISwitchModernVisualElement _transitionWellViewToPressed:animated:](self, "_transitionWellViewToPressed:animated:", 0, 0);
    -[UISwitchModernVisualElement _transitionWellViewToOn:animated:](self, "_transitionWellViewToOn:animated:", self->_on, 0);
  }
  -[UISwitchModernVisualElement _transitionKnobToPressed:on:animated:](self, "_transitionKnobToPressed:on:animated:", self->_pressed, self->_on, 0);
}

- (void)_invalidateUserInterfaceRenderingMode
{
  void *v3;
  _BOOL4 v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_userInterfaceRenderingMode") == 0;

  -[UIView _setOverrideUserInterfaceRenderingMode:](self->_switchWellView, "_setOverrideUserInterfaceRenderingMode:", 2 * v4);
}

- (id)_effectiveGradientImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UISwitchModernVisualElement _effectiveOnTintColor](self, "_effectiveOnTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISwitchModernVisualElement _modernGradientImageWithOnColor:traitCollection:](UISwitchModernVisualElement, "_modernGradientImageWithOnColor:traitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    objc_msgSend(v5, "imageWithHorizontallyFlippedOrientation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)_effectiveOnTintColor
{
  UIColor *onTintColor;

  onTintColor = self->_onTintColor;
  if (onTintColor)
    return onTintColor;
  -[UISwitchModernVisualElement _defaultOnTintColor](self, "_defaultOnTintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultOnTintColor
{
  return +[UIColor systemGreenColor](UIColor, "systemGreenColor");
}

- (void)_invalidateKnob
{
  UIImageView *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *knobView;
  UISwitchModernVisualElement *switchWellContainerView;
  UIImageView *v8;

  -[UIView removeFromSuperview](self->_knobView, "removeFromSuperview");
  v3 = [UIImageView alloc];
  -[UISwitchModernVisualElement _effectiveThumbImage](self, "_effectiveThumbImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIImageView initWithImage:](v3, "initWithImage:", v4);
  knobView = self->_knobView;
  self->_knobView = v5;

  -[UISwitchModernVisualElement _transitionKnobToPressed:animated:](self, "_transitionKnobToPressed:animated:", 0, 0);
  -[UISwitchModernVisualElement _transitionKnobToOn:animated:](self, "_transitionKnobToOn:animated:", self->_on, 0);
  if (dyld_program_sdk_at_least())
  {
    switchWellContainerView = (UISwitchModernVisualElement *)self->_switchWellContainerView;
    v8 = self->_knobView;
  }
  else
  {
    v8 = self->_knobView;
    switchWellContainerView = self;
  }
  -[UIView addSubview:](switchWellContainerView, "addSubview:", v8);
  -[UISwitchModernVisualElement _orderSubviews](self, "_orderSubviews");
}

- (id)_effectiveTintColor
{
  UIColor *v3;
  UIColor *tintColor;

  if (dyld_program_sdk_at_least())
  {
    +[UIColor _switchOffColor](UIColor, "_switchOffColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tintColor = self->_tintColor;
    if (tintColor)
    {
      v3 = tintColor;
    }
    else
    {
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.9, 1.0);
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_updateDisplayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UISwitchModernVisualElement *v11;
  _BOOL8 v12;
  _BOOL8 v13;

  v3 = a3;
  v5 = -[UISwitchModernVisualElement on](self, "on");
  v6 = -[UISwitchModernVisualElement pressed](self, "pressed");
  if (dyld_program_sdk_at_least())
  {
    if (v3)
    {
      -[UIView layer](self->_knobView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentationLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[UIView layer](self->_switchWellImageView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentationLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v10 != 0;

      }
      else
      {
        v3 = 0;
      }

      v11 = self;
      v12 = v5;
      v13 = v3;
    }
    else
    {
      v11 = self;
      v12 = v5;
      v13 = 0;
    }
    -[UISwitchModernVisualElement _transitionKnobToOn:animated:](v11, "_transitionKnobToOn:animated:", v12, v13);
    -[UISwitchModernVisualElement _transitionKnobToPressed:animated:](self, "_transitionKnobToPressed:animated:", v6, v3);
    -[UISwitchModernVisualElement _transitionWellViewToPressed:on:animated:](self, "_transitionWellViewToPressed:on:animated:", v6, v5, v3);
  }
  else
  {
    -[UISwitchModernVisualElement _transitionKnobToOn:animated:](self, "_transitionKnobToOn:animated:", v5, 0);
    -[UISwitchModernVisualElement _transitionWellViewToOn:animated:](self, "_transitionWellViewToOn:animated:", v5, 0);
    -[UISwitchModernVisualElement _transitionKnobToPressed:animated:](self, "_transitionKnobToPressed:animated:", v6, 0);
    -[UISwitchModernVisualElement _transitionWellViewToPressed:animated:](self, "_transitionWellViewToPressed:animated:", v6, 0);
    v3 = 0;
  }
  -[UISwitchModernVisualElement _transitionImagesToPressed:on:animated:](self, "_transitionImagesToPressed:on:animated:", v6, v5, v3);
}

- (void)_transitionWellViewToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD aBlock[7];

  v6 = a4;
  -[UIView layer](self->_switchWellImageView, "layer", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  v11 = v10;
  v13 = v12;

  -[UIView layer](self->_switchWellImageView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[UISwitchModernVisualElement _wellPositionOn:forBounds:](self, "_wellPositionOn:forBounds:", v6);
  v16 = v15;
  v18 = v17;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UISwitchModernVisualElement__transitionWellViewToPressed_on_animated___block_invoke;
  aBlock[3] = &unk_1E16B4E70;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v16;
  *(double *)&aBlock[6] = v18;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (a5)
  {
    (*((void (**)(void *))v19 + 2))(v19);
    -[UISwitchModernVisualElement _switchToStaticMode:](self, "_switchToStaticMode:", 0);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v16, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitchModernVisualElement _switchTrackPositionSpringAnimationFromValue:toValue:on:](self, "_switchTrackPositionSpringAnimationFromValue:toValue:on:", v21, v22, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setDelegate:", self);
    -[UIView layer](self->_switchWellImageView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAnimation:forKey:", v23, CFSTR("SwitchWellPosition"));

  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
    -[UISwitchModernVisualElement _switchToStaticMode:](self, "_switchToStaticMode:", 1);
  }

}

- (CGPoint)_wellPositionOn:(BOOL)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double v7;
  void *switchWellImageView;
  void *v9;
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
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  if (((((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) ^ a3) & 1) != 0)
    -[UIView size](self, "size", a4.origin.x, a4.origin.y);
  else
    v7 = 0.5;
  if (self->_switchWellImageView)
    switchWellImageView = self->_switchWellImageView;
  else
    switchWellImageView = self;
  objc_msgSend(switchWellImageView, "layer", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoint");
  v11 = v10;
  v13 = v12;

  v14 = width * v11;
  UIRoundToViewScale(self);
  v16 = v15;
  UIRoundToViewScale(self);
  v18 = height * v13 + v17;
  v19 = v16 + v14;
  result.y = v18;
  result.x = v19;
  return result;
}

- (void)_transitionKnobToPressed:(BOOL)a3 animated:(BOOL)a4
{
  -[UISwitchModernVisualElement _transitionKnobToPressed:on:animated:](self, "_transitionKnobToPressed:on:animated:", a3, self->_on, a4);
}

- (void)_transitionKnobToOn:(BOOL)a3 animated:(BOOL)a4
{
  -[UISwitchModernVisualElement _transitionKnobToPressed:on:animated:](self, "_transitionKnobToPressed:on:animated:", self->_pressed, a3, a4);
}

- (CGPoint)_offImagePosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIView bounds](self, "bounds");
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 1, 0);
  -[UIView bounds](self, "bounds");
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 1, 1);
  UIFloorToViewScale(self);
  v4 = v3;
  UIFloorToViewScale(self);
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)_onImagePosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIView bounds](self, "bounds");
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 0, 0);
  -[UIView bounds](self, "bounds");
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 0, 1);
  UIFloorToViewScale(self);
  v4 = v3;
  UIFloorToViewScale(self);
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)_transitionKnobToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
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
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  _QWORD v144[25];
  _QWORD aBlock[12];

  v6 = a4;
  v7 = a3;
  -[UIView layer](self->_knobView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v140 = v11;
  v141 = v12;
  v142 = v13;
  v143 = v14;

  -[UIView layer](self->_knobView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "position");
  v18 = v17;
  v20 = v19;

  -[UISwitchModernVisualElement _knobBoundsPressed:](self, "_knobBoundsPressed:", v7);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", v6, v7);
  v30 = v29;
  v32 = v31;
  if (dyld_program_sdk_at_least())
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke;
    aBlock[3] = &unk_1E16BF720;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v22;
    *(double *)&aBlock[6] = v24;
    *(double *)&aBlock[7] = v26;
    *(double *)&aBlock[8] = v28;
    *(double *)&aBlock[9] = v30;
    *(double *)&aBlock[10] = v32;
    v33 = _Block_copy(aBlock);
    v34 = v33;
    if (a5)
    {
      (*((void (**)(void *))v33 + 2))(v33);
      -[UISwitchModernVisualElement _switchToStaticMode:](self, "_switchToStaticMode:", 0);
      -[UIView layer](self->_knobView, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v140, v141, v142, v143);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v22, v24, v26, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchKnobWidthSpringAnimationFromValue:toValue:pressed:](self, "_switchKnobWidthSpringAnimationFromValue:toValue:pressed:", v36, v37, v7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAnimation:forKey:", v38, CFSTR("TouchKnobBoundsAnimation"));

      -[UIView layer](self->_knobView, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v20);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v30, v32);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchKnobPositionSpringAnimationFromValue:toValue:](self, "_switchKnobPositionSpringAnimationFromValue:toValue:", v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAnimation:forKey:", v42, CFSTR("TouchKnobPositionAnimation"));

    }
    else
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v33);
      -[UISwitchModernVisualElement _switchToStaticMode:](self, "_switchToStaticMode:", 1);
    }
  }
  else
  {
    v128 = v18;
    v129 = v20;
    -[UIView layer](self->_switchWellContainerView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "presentationLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bounds");
    v114 = v46;
    v115 = v45;
    v112 = v48;
    v113 = v47;

    -[UIView layer](self->_switchWellContainerView, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "presentationLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "position");
    v116 = v52;
    v117 = v51;

    -[UIView layer](self->_leftSwitchWellContainerView, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "presentationLayer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v120 = v56;
    v121 = v55;
    v118 = v58;
    v119 = v57;

    -[UIView layer](self->_leftSwitchWellContainerView, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "presentationLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "position");
    v126 = v62;
    v127 = v61;

    -[UISwitchModernVisualElement _switchWellContainerBoundsOn:pressed:](self, "_switchWellContainerBoundsOn:pressed:", v6, v7);
    v136 = v63;
    v137 = v64;
    v138 = v66;
    v139 = v65;
    -[UISwitchModernVisualElement _switchWellContainerPositionOn:pressed:](self, "_switchWellContainerPositionOn:pressed:", v6, v7);
    v135 = v67;
    v132 = v68;
    -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:", v6, v7);
    v70 = v69;
    v133 = v72;
    v134 = v71;
    v130 = v73;
    -[UISwitchModernVisualElement _leftSwitchWellContainerPositionOn:pressed:](self, "_leftSwitchWellContainerPositionOn:pressed:", v6, v7);
    v75 = v74;
    v131 = v76;
    -[UIView _backing_outermostLayer](&self->_switchWellView->super.super.isa);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "presentationLayer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "position");
    v124 = v80;
    v125 = v79;

    -[UISwitchModernVisualElement _switchWellPositionOn:pressed:](self, "_switchWellPositionOn:pressed:", v6, v7);
    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke_2;
    v144[3] = &unk_1E16C3460;
    v144[4] = self;
    *(double *)&v144[5] = v22;
    *(double *)&v144[6] = v24;
    *(double *)&v144[7] = v26;
    *(double *)&v144[8] = v28;
    *(double *)&v144[9] = v30;
    *(double *)&v144[10] = v32;
    *(double *)&v144[11] = v136;
    *(double *)&v144[12] = v139;
    *(double *)&v144[13] = v138;
    *(double *)&v144[14] = v137;
    *(double *)&v144[15] = v135;
    *(double *)&v144[16] = v132;
    *(double *)&v144[17] = v70;
    *(double *)&v144[18] = v134;
    *(double *)&v144[19] = v133;
    *(double *)&v144[20] = v130;
    *(double *)&v144[21] = v75;
    *(double *)&v144[22] = v131;
    *(double *)&v144[23] = v81;
    v122 = v82;
    v123 = v81;
    *(double *)&v144[24] = v82;
    v83 = _Block_copy(v144);
    v34 = v83;
    if (a5)
    {
      (*((void (**)(void *))v83 + 2))(v83);
      -[UIView layer](self->_knobView, "layer");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v140, v141, v142, v143);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v22, v24, v26, v28);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("bounds"), v85, v86, v7);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addAnimation:forKey:", v87, CFSTR("TouchKnobBoundsAnimation"));

      -[UIView layer](self->_knobView, "layer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v128, v129);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v30, v32);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("position"), v89, v90, v7);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "addAnimation:forKey:", v91, CFSTR("TouchKnobPositionAnimation"));

      -[UIView layer](self->_switchWellContainerView, "layer");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v115, v114, v113, v112);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v136, v139, v138, v137);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("bounds"), v93, v94, v7);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "addAnimation:forKey:", v95, CFSTR("WellContainerBounds"));

      -[UIView layer](self->_switchWellContainerView, "layer");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v117, v116);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v135, v132);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("position"), v97, v98, v7);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addAnimation:forKey:", v99, CFSTR("WellContainerPosition"));

      -[UIView layer](self->_leftSwitchWellContainerView, "layer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v121, v120, v119, v118);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v70, v134, v133, v130);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("bounds"), v101, v102, v7);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "addAnimation:forKey:", v103, CFSTR("LeftWellContainerBounds"));

      -[UIView layer](self->_leftSwitchWellContainerView, "layer");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v127, v126);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v75, v131);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("position"), v105, v106, v7);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "addAnimation:forKey:", v107, CFSTR("LeftWellContainerPosition"));

      -[UIView _backing_outermostLayer](&self->_switchWellView->super.super.isa);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v125, v124);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v123, v122);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:](self, "_switchSpringAnimationWithKeyPath:fromValue:toValue:pressed:", CFSTR("position"), v109, v110, v7);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "addAnimation:forKey:", v111, CFSTR("WellPosition"));

    }
    else
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v83);
    }
  }

}

- (CGPoint)_knobPositionOn:(BOOL)a3 pressed:(BOOL)a4 forBounds:(CGRect)a5
{
  double height;
  double width;
  void *knobView;
  void *v9;
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
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  dyld_program_sdk_at_least();
  if (self->_knobView)
    knobView = self->_knobView;
  else
    knobView = self;
  objc_msgSend(knobView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoint");
  v11 = v10;
  v13 = v12;

  v14 = width * v11;
  UIRoundToViewScale(self);
  v16 = v15;
  UIRoundToViewScale(self);
  v18 = height * v13 + v17;
  v19 = v16 + v14;
  result.y = v18;
  result.x = v19;
  return result;
}

- (void)_switchToStaticMode:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = !a3;
  -[UIView setClipsToBounds:](self->_switchWellContainerView, "setClipsToBounds:", !a3);
  -[UIImageView setHidden:](self->_switchWellImageView, "setHidden:", v3);
  -[UISwitchModernVisualElement _effectiveThumbImage](self, "_effectiveThumbImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_knobView, "setImage:", v6);

  if (v5 || !self->_on)
  {
    -[UIView setBackgroundColor:](self->_switchWellContainerView, "setBackgroundColor:", 0);
  }
  else
  {
    -[UISwitchModernVisualElement _effectiveOnTintColor](self, "_effectiveOnTintColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_switchWellContainerView, "setBackgroundColor:", v7);

  }
}

- (id)_effectiveThumbImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  UIColor *thumbTintColor;
  void *v10;

  if (dyld_program_sdk_at_least())
  {
    if (-[UIView clipsToBounds](self->_switchWellContainerView, "clipsToBounds"))
    {
      v3 = 0;
    }
    else
    {
      v7 = 1;
      if (!self->_on)
        v7 = 2;
      v8 = 1;
      if (self->_on)
        v8 = 2;
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
        v3 = v7;
      else
        v3 = v8;
    }
    thumbTintColor = self->_thumbTintColor;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwitchModernVisualElement _modernThumbImageWithColor:mask:traitCollection:](UISwitchModernVisualElement, "_modernThumbImageWithColor:mask:traitCollection:", thumbTintColor, v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UIImageWithName(CFSTR("UISwitchKnob"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_thumbTintColor)
    {
      objc_msgSend(v4, "_flatImageWithColor:");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
      v5 = v6;
    }
  }
  v10 = v6;

  return v10;
}

+ (id)_modernThumbImageWithColor:(id)a3 mask:(unint64_t)a4 traitCollection:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _UIModernSwitchVisualElementCacheKey *v11;
  void *v12;
  id v13;
  uint64_t v14;
  UIGraphicsImageRenderer *v15;
  void *v16;
  _QWORD v18[7];

  v7 = a3;
  v8 = a5;
  if (qword_1ECD7B4E8 == -1)
  {
    if (v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_1ECD7B4E8, &__block_literal_global_168);
  if (!v7)
  {
LABEL_3:
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");

  v11 = -[_UIModernSwitchVisualElementCacheKey initWithMask:color:]([_UIModernSwitchVisualElementCacheKey alloc], "initWithMask:color:", a4, v10);
  objc_msgSend((id)qword_1ECD7B4E0, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[UIColor _controlShadowColor](UIColor, "_controlShadowColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");

    v15 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 43.0, 43.0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke_2;
    v18[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = a4;
    v18[5] = v14;
    v18[6] = v10;
    -[UIGraphicsImageRenderer imageWithActions:](v15, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resizableImageWithCapInsets:", 0.0, 21.0, 0.0, 21.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend((id)qword_1ECD7B4E0, "setObject:forKey:", v12, v11);

  }
  return v12;
}

- (CGRect)_knobBoundsPressed:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = a3;
  v5 = dyld_program_sdk_at_least();
  v6 = 50.0;
  if (!v5)
    v6 = 48.0;
  if (v3)
    v7 = v6;
  else
    v7 = 43.0;
  UIRoundToViewScale(self);
  v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  v12 = v7;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)pressed
{
  return self->_pressed;
}

+ (id)_modernGradientImageWithOnColor:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _UICGColorCacheKey *v9;
  _UICGColorCacheKey *v10;
  void *v11;
  UIGraphicsImageRenderer *v12;
  _QWORD v14[6];
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v6 = a4;
  if (qword_1ECD7B4D8 != -1)
    dispatch_once(&qword_1ECD7B4D8, &__block_literal_global_152);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_2;
  v16[3] = &unk_1E16C3488;
  v18 = &v24;
  v8 = v5;
  v17 = v8;
  v19 = &v20;
  +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v6, (uint64_t)v16);
  v9 = [_UICGColorCacheKey alloc];
  v10 = -[_UICGColorCacheKey initWithColors:](v9, "initWithColors:", v25[3], v21[3], 0);
  objc_msgSend((id)qword_1ECD7B4D0, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 510.0, 1.0);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_3;
    v14[3] = &unk_1E16C34B0;
    v14[4] = &v24;
    v14[5] = &v20;
    v15 = xmmword_18667ACB0;
    -[UIGraphicsImageRenderer imageWithActions:](v12, "imageWithActions:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend((id)qword_1ECD7B4D0, "setObject:forKey:", v11, v10);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_2(uint64_t a1)
{
  id v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cgColor");
  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 0.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "cgColor");

}

- (BOOL)on
{
  return self->_on;
}

+ (UIEdgeInsets)preferredAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 51.0;
  v3 = 31.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_invalidateOnOffImages
{
  UIImageView *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *switchWellOffImageView;
  UIImageView *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *switchWellOnImageView;
  UIView *v11;
  UIView *v12;
  UIView *switchWellImageViewContainer;
  UIImageView *v14;
  UIImageView *v15;
  UIImageView *v16;
  void *v17;
  UIImageView *v18;
  void *v19;

  -[UIView removeFromSuperview](self->_switchWellOffImageView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_switchWellOnImageView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_switchWellImageViewContainer, "removeFromSuperview");
  v3 = [UIImageView alloc];
  -[UISwitchModernVisualElement _effectiveOffImage](self, "_effectiveOffImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIImageView initWithImage:](v3, "initWithImage:", v4);
  switchWellOffImageView = self->_switchWellOffImageView;
  self->_switchWellOffImageView = v5;

  v7 = [UIImageView alloc];
  -[UISwitchModernVisualElement _effectiveOnImage](self, "_effectiveOnImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIImageView initWithImage:](v7, "initWithImage:", v8);
  switchWellOnImageView = self->_switchWellOnImageView;
  self->_switchWellOnImageView = v9;

  v11 = [UIView alloc];
  -[UIView bounds](self, "bounds");
  v12 = -[UIView initWithFrame:](v11, "initWithFrame:");
  switchWellImageViewContainer = self->_switchWellImageViewContainer;
  self->_switchWellImageViewContainer = v12;

  v14 = self->_switchWellOffImageView;
  -[UISwitchModernVisualElement _offImagePosition](self, "_offImagePosition");
  -[UIImageView setCenter:](v14, "setCenter:");
  v15 = self->_switchWellOnImageView;
  -[UISwitchModernVisualElement _onImagePosition](self, "_onImagePosition");
  -[UIImageView setCenter:](v15, "setCenter:");
  v16 = self->_switchWellOffImageView;
  -[UISwitchModernVisualElement _effectiveOffImageTintColor](self, "_effectiveOffImageTintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v16, "setTintColor:", v17);

  v18 = self->_switchWellOnImageView;
  -[UISwitchModernVisualElement _effectiveOnImageTintColor](self, "_effectiveOnImageTintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v18, "setTintColor:", v19);

  -[UIView addSubview:](self->_switchWellImageViewContainer, "addSubview:", self->_switchWellOffImageView);
  -[UIView addSubview:](self->_switchWellImageViewContainer, "addSubview:", self->_switchWellOnImageView);
  -[UIView addSubview:](self, "addSubview:", self->_switchWellImageViewContainer);
  -[UISwitchModernVisualElement _transitionImagesToPressed:on:animated:](self, "_transitionImagesToPressed:on:animated:", self->_pressed, self->_on, 0);
  -[UISwitchModernVisualElement _orderSubviews](self, "_orderSubviews");
}

- (void)_transitionImagesToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  BOOL v20;

  v5 = a5;
  if (a4)
    v8 = 10;
  else
    v8 = 9;
  v9 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UISwitchModernVisualElement__on[v8]);
  if (a4)
    v10 = 9;
  else
    v10 = 10;
  v11 = v9;
  v12 = *(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UISwitchModernVisualElement__on[v10]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UISwitchModernVisualElement__transitionImagesToPressed_on_animated___block_invoke;
  aBlock[3] = &unk_1E16B4008;
  v20 = a3;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = _Block_copy(aBlock);
  v16 = v15;
  if (v5)
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v15, 0, 0.2, 0.0);
  else
    (*((void (**)(void *))v15 + 2))(v15);

}

uint64_t __70__UISwitchModernVisualElement__transitionImagesToPressed_on_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

- (id)_effectiveOffImageTintColor
{
  if (dyld_program_sdk_at_least())
    +[UIColor _switchOffImageColor](UIColor, "_switchOffImageColor");
  else
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_effectiveOnImageTintColor
{
  void *v2;

  if (self->_onTintColor
    && !-[UISwitchModernVisualElement _shouldUseLightTintOverColor:](self, "_shouldUseLightTintOverColor:"))
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_effectiveOnImage
{
  void *v3;

  if (-[UISwitchModernVisualElement showsOnOffLabel](self, "showsOnOffLabel"))
  {
    -[UISwitchModernVisualElement _accessibleOnImage](self, "_accessibleOnImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_effectiveOffImage
{
  void *v3;

  if (-[UISwitchModernVisualElement showsOnOffLabel](self, "showsOnOffLabel"))
  {
    -[UISwitchModernVisualElement _accessibleOffImage](self, "_accessibleOffImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)showsOnOffLabel
{
  return self->_showsOnOffLabel;
}

- (void)setSwitchControl:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UISwitchModernVisualElement _uninstallSelectGestureRecognizer](self, "_uninstallSelectGestureRecognizer");
  v6.receiver = self;
  v6.super_class = (Class)UISwitchModernVisualElement;
  -[UISwitchVisualElement setSwitchControl:](&v6, sel_setSwitchControl_, v4);

  -[UISwitchVisualElement switchControl](self, "switchControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[UISwitchModernVisualElement _installSelectGestureRecognizer](self, "_installSelectGestureRecognizer");
}

- (void)setShowsOnOffLabel:(BOOL)a3
{
  self->_showsOnOffLabel = a3;
  -[UISwitchModernVisualElement _invalidateOnOffImages](self, "_invalidateOnOffImages");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  UISemanticContentAttribute v5;
  objc_super v6;

  v5 = -[UIView semanticContentAttribute](self, "semanticContentAttribute");
  v6.receiver = self;
  v6.super_class = (Class)UISwitchModernVisualElement;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_, a3);
  if (v5 != -[UIView semanticContentAttribute](self, "semanticContentAttribute"))
    -[UISwitchModernVisualElement _invalidateControl](self, "_invalidateControl");
}

- (void)_uninstallSelectGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;

  -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISwitchVisualElement switchControl](self, "switchControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", v5);

    -[UISwitchModernVisualElement setSelectGestureRecognizer:](self, "setSelectGestureRecognizer:", 0);
  }
}

- (void)_installSelectGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__selectGestureChanged_);
    -[UISwitchModernVisualElement setSelectGestureRecognizer:](self, "setSelectGestureRecognizer:", v4);

    -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowedPressTypes:", &unk_1E1A93308);

    -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);

    -[UISwitchModernVisualElement selectGestureRecognizer](self, "selectGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[UISwitchVisualElement switchControl](self, "switchControl");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", self->_selectGestureRecognizer);

  }
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return self->_selectGestureRecognizer;
}

- (void)setSelectGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectGestureRecognizer, a3);
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayedOnValue:", v5);

  self->_on = v5;
  -[UISwitchModernVisualElement _updateDisplayAnimated:](self, "_updateDisplayAnimated:", v4);
}

- (UISwitchMVEGestureTrackingSession)gestureTrackingSession
{
  return self->_gestureTrackingSession;
}

- (UISwitchModernVisualElement)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  UISwitchModernVisualElement *v8;
  UILongPressGestureRecognizer *v9;
  UIPanGestureRecognizer *v10;
  void *v11;
  void *v12;
  UIImpactFeedbackGenerator *v13;
  UISwitchMVEGestureTrackingSession *v14;
  UISwitchMVEGestureTrackingSession *gestureTrackingSession;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];

  y = a3.origin.y;
  x = a3.origin.x;
  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "preferredContentSize");
  v19.receiver = self;
  v19.super_class = (Class)UISwitchModernVisualElement;
  v8 = -[UISwitchVisualElement initWithFrame:](&v19, sel_initWithFrame_, x, y, v6, v7);
  -[UISwitchModernVisualElement _invalidateControl](v8, "_invalidateControl");
  -[UISwitchModernVisualElement setPressed:](v8, "setPressed:", 0);
  v9 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v8, sel__handleLongPress_);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v9, "setMinimumPressDuration:", 0.01);
  -[UIGestureRecognizer _setCanExcludeWithActiveRequirements:](v9, "_setCanExcludeWithActiveRequirements:", 0);
  -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("UISwitch-longPress"));
  -[UIView addGestureRecognizer:](v8, "addGestureRecognizer:", v9);
  -[UISwitchModernVisualElement setLongPress:](v8, "setLongPress:", v9);
  -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v8);
  v10 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v8, sel__handlePan_);
  -[UIGestureRecognizer _setCanExcludeWithActiveRequirements:](v10, "_setCanExcludeWithActiveRequirements:", 0);
  -[UIGestureRecognizer setName:](v10, "setName:", CFSTR("UISwitch-pan"));
  -[UIView addGestureRecognizer:](v8, "addGestureRecognizer:", v10);
  -[UISwitchModernVisualElement setPan:](v8, "setPan:", v10);
  -[UIPanGestureRecognizer setDelegate:](v10, "setDelegate:", v8);
  +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration](_UIImpactFeedbackGeneratorConfiguration, "lightConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("valueChange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[UIFeedbackGenerator initWithConfiguration:view:]([UIImpactFeedbackGenerator alloc], "initWithConfiguration:view:", v12, v8);
  -[UISwitchVisualElement setImpactFeedbackGenerator:](v8, "setImpactFeedbackGenerator:", v13);
  v14 = -[UISwitchMVEGestureTrackingSession initWithVisualElement:]([UISwitchMVEGestureTrackingSession alloc], "initWithVisualElement:", v8);
  gestureTrackingSession = v8->_gestureTrackingSession;
  v8->_gestureTrackingSession = v14;

  v20[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIView registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v16, v8, sel__invalidateUserInterfaceRenderingMode);

  return v8;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (void)setPan:(id)a3
{
  objc_storeStrong((id *)&self->_pan, a3);
}

- (void)setLongPress:(id)a3
{
  objc_storeStrong((id *)&self->_longPress, a3);
}

- (BOOL)_shouldUseLightTintOverColor:(id)a3
{
  void *v4;
  void *v5;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  if (a3)
    objc_msgSend(a3, "getWhite:alpha:", &v8, 0);
  -[UISwitchModernVisualElement _defaultOnTintColor](self, "_defaultOnTintColor", *(_QWORD *)&v7, *(_QWORD *)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "getWhite:alpha:", &v7, 0);

  return v8 <= v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_gestureTrackingSession, 0);
  objc_storeStrong((id *)&self->_offImage, 0);
  objc_storeStrong((id *)&self->_onImage, 0);
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_onTintColor, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_switchWellOnImageView, 0);
  objc_storeStrong((id *)&self->_switchWellOffImageView, 0);
  objc_storeStrong((id *)&self->_switchWellImageViewContainer, 0);
  objc_storeStrong((id *)&self->_switchWellImageView, 0);
  objc_storeStrong((id *)&self->_leftSwitchWellContainerView, 0);
  objc_storeStrong((id *)&self->_switchWellContainerView, 0);
  objc_storeStrong((id *)&self->_leftSwitchWellView, 0);
  objc_storeStrong((id *)&self->_switchWellView, 0);
}

- (void)_updateDisplayWithAnimationIfNeeded
{
  double v3;

  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  -[UISwitchModernVisualElement _updateDisplayAnimated:](self, "_updateDisplayAnimated:", v3 > 0.0);
}

void __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7B4E0;
  qword_1ECD7B4E0 = (uint64_t)v0;

}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7B4D0;
  qword_1ECD7B4D0 = (uint64_t)v0;

}

- (void)sendStateChangeActions
{
  id v3;

  -[UISwitchVisualElement switchControl](self, "switchControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualElement:transitionedToOn:", self, -[UISwitchModernVisualElement on](self, "on"));

}

- (void)performStateChangeFeedback
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v7[5];

  if (-[UISwitchModernVisualElement _feedbackEnabled](self, "_feedbackEnabled"))
  {
    -[UISwitchModernVisualElement _settings](self, "_settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hapticDelay");
    v5 = v4;

    -[UISwitchVisualElement impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__UISwitchModernVisualElement_performStateChangeFeedback__block_invoke;
    v7[3] = &unk_1E16B1B28;
    v7[4] = self;
    objc_msgSend(v6, "performFeedbackWithDelay:insideBlock:", v7, v5);

  }
}

void __57__UISwitchModernVisualElement_performStateChangeFeedback__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "impactFeedbackGenerator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "impactIntensity");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "center");
  objc_msgSend(v7, "impactOccurredWithIntensity:atLocation:", v4, v5, v6);

}

- (void)interactiveChangeToDisplayedOn:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UISwitchModernVisualElement on](self, "on") != a3)
  {
    -[UISwitchModernVisualElement setOn:animated:](self, "setOn:animated:", v3, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    -[UISwitchModernVisualElement performStateChangeFeedback](self, "performStateChangeFeedback");
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "type"))
  {
    -[UISwitchModernVisualElement longPress](self, "longPress");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
    {
      objc_msgSend(v7, "allTouches");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 == 1)
      {
        objc_msgSend(v7, "allTouches");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "_isPointerTouch"))
          v13 = 0.0;
        else
          v13 = 0.01;

      }
      else
      {
        v13 = 0.01;
      }
      -[UISwitchModernVisualElement longPress](self, "longPress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMinimumPressDuration:", v13);

    }
  }
  v15 = objc_msgSend(v6, "_shouldReceiveEvent:", v7);

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;

  v7 = a3;
  v8 = a4;
  -[UISwitchModernVisualElement longPress](self, "longPress");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {
    -[UISwitchModernVisualElement pan](self, "pan");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v8)
    {
      v11 = 1;
      v4 = v8;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[UISwitchModernVisualElement pan](self, "pan");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v7)
  {
    -[UISwitchModernVisualElement longPress](self, "longPress");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12 == v8;

  }
  else
  {
    v11 = 0;
  }

  if (v9 == v7)
    goto LABEL_9;
LABEL_10:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  char isKindOfClass;

  v6 = a3;
  v7 = a4;
  -[UISwitchModernVisualElement longPress](self, "longPress");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {
    -[UISwitchModernVisualElement pan](self, "pan");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 != v6)
    {
      isKindOfClass = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v6;
  if (v8 != v6)
    goto LABEL_5;
LABEL_6:

  return isKindOfClass & 1;
}

- (void)_handleLongPress:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  -[UISwitchModernVisualElement _handleLongPressWithGestureLocationInBounds:gestureState:](self, "_handleLongPressWithGestureLocationInBounds:gestureState:", v9, v6, v8);
}

- (void)_handleLongPressWithGestureLocationInBounds:(CGPoint)a3 gestureState:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  _BOOL4 v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  UISwitchModernVisualElement *v29;
  char v30;
  BOOL v31;
  char v32;

  y = a3.y;
  x = a3.x;
  -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchVisualElement switchControl](self, "switchControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pointMostlyInside:", x, y);

  v11 = -[UISwitchModernVisualElement on](self, "on");
  v12 = -[UISwitchModernVisualElement pressed](self, "pressed");
  if (v10)
  {
    -[UISwitchModernVisualElement setPressed:](self, "setPressed:", 1);
    if (a4 == 1)
    {
      objc_msgSend(v8, "reset");
      -[UISwitchVisualElement impactFeedbackGenerator](self, "impactFeedbackGenerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateWithCompletionBlock:", 0);

      v18 = -[UISwitchModernVisualElement on](self, "on") ^ 1;
      -[UISwitchModernVisualElement longPress](self, "longPress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPendingDisplayedOnValue:forGesture:", v18, v19);

      goto LABEL_12;
    }
    if (a4 != 3)
    {
      if (a4 != 2)
      {
LABEL_12:
        LOBYTE(v14) = 0;
LABEL_13:
        v20 = 0;
        goto LABEL_14;
      }
      -[UISwitchModernVisualElement pan](self, "pan");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "canApplyPendingOnValueForGesture:", v13);

      if (!v14)
        goto LABEL_13;
LABEL_10:
      objc_msgSend(v8, "applyPendingDisplayedOnValueWithoutSendingActions");
      goto LABEL_12;
    }
    -[UISwitchModernVisualElement longPress](self, "longPress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "canApplyPendingOnValueForGesture:", v26);

    if (!v14)
      goto LABEL_13;
    objc_msgSend(v8, "applyPendingDisplayedOnValueWithoutSendingActions");
    LOBYTE(v14) = 1;
  }
  else
  {
    -[UISwitchModernVisualElement setPressed:](self, "setPressed:", 0);
    if (a4 != 3)
      goto LABEL_10;
    -[UISwitchModernVisualElement longPress](self, "longPress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "canApplyPendingOnValueForGesture:", v15);

    if (!v16)
      goto LABEL_10;
    objc_msgSend(v8, "applyPendingDisplayedOnValueWithoutSendingActions");
    LOBYTE(v14) = 0;
  }
  v20 = 1;
LABEL_14:
  v21 = +[UISwitchMVEGestureTrackingSession gestureIsInEndState:](UISwitchMVEGestureTrackingSession, "gestureIsInEndState:", a4);
  v22 = v21;
  if (v21)
  {
    -[UISwitchModernVisualElement setPressed:](self, "setPressed:", 0);
    objc_msgSend(v8, "applyPendingDisplayedOnValueWithoutSendingActions");
    -[UISwitchVisualElement impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isActive"))
      objc_msgSend(v23, "deactivate");

    v20 = 1;
  }
  if (v11 != -[UISwitchModernVisualElement on](self, "on")
    || v12 != -[UISwitchModernVisualElement pressed](self, "pressed"))
  {
    -[UISwitchModernVisualElement _updateDisplayAnimated:](self, "_updateDisplayAnimated:", 1);
  }
  v24 = (void *)UIApp;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__UISwitchModernVisualElement__handleLongPressWithGestureLocationInBounds_gestureState___block_invoke;
  v27[3] = &unk_1E16B4E48;
  v30 = v20;
  v31 = v22;
  v32 = v14;
  v28 = v8;
  v29 = self;
  v25 = v8;
  objc_msgSend(v24, "_performBlockAfterCATransactionCommits:", v27);

}

uint64_t __88__UISwitchModernVisualElement__handleLongPressWithGestureLocationInBounds_gestureState___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E0C9B270], 0.0, 1u);
    result = objc_msgSend(*(id *)(v1 + 32), "applyPendingDisplayedOnValueAndSendActions");
  }
  if (*(_BYTE *)(v1 + 49))
  {
    if (*(_BYTE *)(v1 + 50))
    {
      objc_msgSend(*(id *)(v1 + 40), "switchControl");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "visualElementHadTouchUpInside:", *(_QWORD *)(v1 + 40));

    }
    return objc_msgSend(*(id *)(v1 + 32), "reset");
  }
  return result;
}

- (void)_handlePan:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UISwitchModernVisualElement *v15;

  v4 = a3;
  objc_msgSend(v4, "translationInView:", self);
  v6 = v5;
  objc_msgSend(v4, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v4, "state");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__UISwitchModernVisualElement__handlePan___block_invoke;
  v13[3] = &unk_1E16B1B50;
  v14 = v4;
  v15 = self;
  v12 = v4;
  -[UISwitchModernVisualElement _handlePanWithGestureLocationInBounds:horizontalTranslation:gestureState:resetPanTranslationBlock:](self, "_handlePanWithGestureLocationInBounds:horizontalTranslation:gestureState:resetPanTranslationBlock:", v11, v13, v8, v10, v6);

}

uint64_t __42__UISwitchModernVisualElement__handlePan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTranslation:inView:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_handlePanWithGestureLocationInBounds:(CGPoint)a3 horizontalTranslation:(double)a4 gestureState:(int64_t)a5 resetPanTranslationBlock:(id)a6
{
  void *v9;
  void *v10;
  int v11;
  void (**v12)(void);

  v12 = (void (**)(void))a6;
  -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 2)
  {
    -[UISwitchModernVisualElement pan](self, "pan");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "updatePendingDisplayedOnValueIfMovementIsEnoughToInitiateChange:forGesture:", v10, a4);

    if (v11)
      v12[2]();
  }
  else if (+[UISwitchMVEGestureTrackingSession gestureIsInEndState:](UISwitchMVEGestureTrackingSession, "gestureIsInEndState:", a5))
  {
    objc_msgSend(v9, "invalidatePendingOnValue");
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  UITargetedPreview *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_opt_new();
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 5.0, 27.0, 27.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v6);

  v7 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self->_knobView, v5);
  +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setThumbTintColor:(id)a3
{
  UIImageView *knobView;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[UIColor isEqual:](self->_thumbTintColor, "isEqual:"))
    objc_storeStrong((id *)&self->_thumbTintColor, a3);
  knobView = self->_knobView;
  -[UISwitchModernVisualElement _effectiveThumbImage](self, "_effectiveThumbImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](knobView, "setImage:", v6);

}

- (void)setOnImage:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIImage isEqual:](self->_onImage, "isEqual:"))
    objc_storeStrong((id *)&self->_onImage, a3);
  -[UISwitchModernVisualElement _invalidateOnOffImages](self, "_invalidateOnOffImages");

}

- (void)setOffImage:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIImage isEqual:](self->_offImage, "isEqual:"))
    objc_storeStrong((id *)&self->_offImage, a3);
  -[UISwitchModernVisualElement _invalidateOnOffImages](self, "_invalidateOnOffImages");

}

uint64_t __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPosition:", *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBounds:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", *(double *)(a1 + 120), *(double *)(a1 + 128));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounds:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", *(double *)(a1 + 168), *(double *)(a1 + 176));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setCenter:", *(double *)(a1 + 184), *(double *)(a1 + 192));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[UISwitchModernVisualElement _switchToStaticMode:](self, "_switchToStaticMode:", 1);
}

- (void)_transitionWellViewToPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v5 = a3;
  -[UIView layer](self->_switchWellView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "borderWidth");
  v10 = v9;

  -[UIView layer](self->_switchWellView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderWidth");
  v13 = v12;

  -[UISwitchModernVisualElement _wellBorderWidthPressed:on:](self, "_wellBorderWidthPressed:on:", v5, self->_on);
  if (v10 != v14 && v14 != v13)
  {
    v16 = v14;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__UISwitchModernVisualElement__transitionWellViewToPressed_animated___block_invoke;
    v23[3] = &unk_1E16B1888;
    v23[4] = self;
    *(double *)&v23[5] = v14;
    v17 = _Block_copy(v23);
    v18 = v17;
    if (a4)
    {
      (*((void (**)(void *))v17 + 2))(v17);
      -[UIView layer](self->_switchWellView, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitchModernVisualElement _switchTrackAnimationWithFromValue:toValue:on:](self, "_switchTrackAnimationWithFromValue:toValue:on:", v20, v21, self->_on);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAnimation:forKey:", v22, CFSTR("SwitchWellBorderWidth"));

    }
    else
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    }

  }
}

void __69__UISwitchModernVisualElement__transitionWellViewToPressed_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBorderWidth:", *(double *)(a1 + 40));

}

- (void)_transitionWellViewToOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  CGColor *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v5 = a3;
  -[UIView layer](self->_switchWellView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "borderColor");

  v10 = -[UISwitchModernVisualElement _wellColorOn:](self, "_wellColorOn:", v5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__UISwitchModernVisualElement__transitionWellViewToOn_animated___block_invoke;
  v17[3] = &unk_1E16B1888;
  v17[4] = self;
  v17[5] = v10;
  v11 = _Block_copy(v17);
  v12 = v11;
  if (a4)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    -[UIView layer](self->_switchWellView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitchModernVisualElement _switchTrackColorAnimationWithFromValue:toValue:](self, "_switchTrackColorAnimationWithFromValue:toValue:", v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v14, CFSTR("SwitchWellColor"));

    -[UIView layer](self->_leftSwitchWellView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitchModernVisualElement _switchTrackColorAnimationWithFromValue:toValue:](self, "_switchTrackColorAnimationWithFromValue:toValue:", v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v16, CFSTR("SwitchWellColor"));

  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  }

}

void __64__UISwitchModernVisualElement__transitionWellViewToOn_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBorderColor:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorderColor:", *(_QWORD *)(a1 + 40));

}

- (CGRect)_switchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:", a3, a4);
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v8 = v7 - v6;
  -[UIView bounds](self, "bounds");
  v10 = 0.0;
  v11 = 0.0;
  v12 = v8;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPoint)_switchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v4 = a4;
  v5 = a3;
  -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:");
  v8 = v7;
  -[UISwitchModernVisualElement _switchWellContainerBoundsOn:pressed:](self, "_switchWellContainerBoundsOn:pressed:", v5, v4);
  v10 = -0.0;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
    v10 = v8;
  v11 = v9 * 0.5 + v10;
  -[UIView bounds](self, "bounds");
  v13 = v12 * 0.5;
  v14 = v11;
  result.y = v13;
  result.x = v14;
  return result;
}

- (CGPoint)_switchWellPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UISwitchModernVisualElement _switchWellContainerBoundsOn:pressed:](self, "_switchWellContainerBoundsOn:pressed:", a3, a4);
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    -[UIView bounds](self->_switchWellView, "bounds");
    v8 = v9 * 0.5;
  }
  else
  {
    v6 = v5;
    -[UIView bounds](self->_switchWellView, "bounds");
    v8 = v6 + v7 * -0.5;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10 * 0.5;
  v12 = v8;
  result.y = v11;
  result.x = v12;
  return result;
}

- (CGRect)_leftSwitchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v4 = a4;
  v5 = a3;
  -[UISwitchModernVisualElement _knobBoundsPressed:](self, "_knobBoundsPressed:", a4);
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", v5, v4);
  v8 = v7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    -[UIView bounds](self, "bounds");
    v9 = v10 - v8;
  }
  else
  {
    v9 = v7;
    v8 = 0.0;
  }
  -[UIView bounds](self, "bounds");
  v12 = 0.0;
  v13 = v8;
  v14 = v9;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGPoint)_leftSwitchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a4;
  v5 = a3;
  -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:");
  v8 = v7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    -[UISwitchModernVisualElement _switchWellContainerBoundsOn:pressed:](self, "_switchWellContainerBoundsOn:pressed:", v5, v4);
    v9 = v8 * 0.5 + v10;
  }
  else
  {
    v9 = v7 * 0.5;
  }
  -[UIView bounds](self, "bounds");
  v12 = v11 * 0.5;
  v13 = v9;
  result.y = v12;
  result.x = v13;
  return result;
}

- (double)_wellBorderWidthPressed:(BOOL)a3 on:(BOOL)a4
{
  double result;

  result = 2.0;
  if (a3 || a4)
    return 15.5;
  return result;
}

- (CGColor)_wellColorOn:(BOOL)a3
{
  id v3;
  CGColor *v4;

  if (a3)
    -[UISwitchModernVisualElement _effectiveOnTintColor](self, "_effectiveOnTintColor");
  else
    -[UISwitchModernVisualElement _effectiveTintColor](self, "_effectiveTintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  return v4;
}

- (id)_switchTrackPositionAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;

  v8 = (void *)MEMORY[0x1E0CD2710];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "animationWithKeyPath:", CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    objc_msgSend(v12, "trackBorderGoingOnAnimationDuration");
    v15 = v14;

    objc_msgSend(v11, "setDuration:", v15);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v16);

  }
  else
  {
    objc_msgSend(v12, "trackBorderGoingOffAnimationDuration");
    v18 = v17;

    objc_msgSend(v11, "setDuration:", v18);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v19);

    -[UISwitchModernVisualElement _settings](self, "_settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trackBorderGoingOffAnimationBeginTimeOffset");
    objc_msgSend(v11, "setBeginTime:");

    objc_msgSend(v11, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  }
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v11, "setFromValue:", v10);

  objc_msgSend(v11, "setToValue:", v9);
  *(float *)&v21 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v11, "setSpeed:", v21);
  return v11;
}

- (id)_switchTrackAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;

  v8 = (void *)MEMORY[0x1E0CD2710];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "animationWithKeyPath:", CFSTR("borderWidth"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    objc_msgSend(v12, "trackBorderGoingOnAnimationDuration");
    v15 = v14;

    objc_msgSend(v11, "setDuration:", v15);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v16);

  }
  else
  {
    objc_msgSend(v12, "trackBorderGoingOffAnimationDuration");
    v18 = v17;

    objc_msgSend(v11, "setDuration:", v18);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v19);

    -[UISwitchModernVisualElement _settings](self, "_settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trackBorderGoingOffAnimationBeginTimeOffset");
    objc_msgSend(v11, "setBeginTime:");

    objc_msgSend(v11, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  }
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v11, "setFromValue:", v10);

  objc_msgSend(v11, "setToValue:", v9);
  *(float *)&v21 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v11, "setSpeed:", v21);
  return v11;
}

- (id)_switchTrackColorAnimationWithFromValue:(id)a3 toValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  v6 = (void *)MEMORY[0x1E0CD2710];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "animationWithKeyPath:", CFSTR("borderColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackColorAnimationDuration");
  objc_msgSend(v9, "setDuration:");

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v11);

  objc_msgSend(v9, "setFromValue:", v8);
  objc_msgSend(v9, "setToValue:", v7);

  *(float *)&v12 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v9, "setSpeed:", v12);
  return v9;
}

- (id)_switchSpringAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 pressed:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  id v11;
  id v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0CD2848];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "animationWithKeyPath:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
  {
    objc_msgSend(v14, "knobSpringMassAnimationTouchDown");
    v17 = v16;
    objc_msgSend(v15, "knobSpringStiffnessAnimationTouchDown");
    v19 = v18;
    objc_msgSend(v15, "knobSpringDampingAnimationTouchDown");
    v21 = v20;
    objc_msgSend(v15, "knobSpringDurationAnimationTouchDown");
  }
  else
  {
    objc_msgSend(v14, "knobSpringMassAnimationTouchUp");
    v17 = v23;
    objc_msgSend(v15, "knobSpringStiffnessAnimationTouchUp");
    v19 = v24;
    objc_msgSend(v15, "knobSpringDampingAnimationTouchUp");
    v21 = v25;
    objc_msgSend(v15, "knobSpringDurationAnimationTouchUp");
  }
  v26 = v22;
  objc_msgSend(v13, "setMass:", v17);
  objc_msgSend(v13, "setStiffness:", v19);
  objc_msgSend(v13, "setDamping:", v21);
  objc_msgSend(v13, "setDuration:", v26);
  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v13, "setFromValue:", v12);

  objc_msgSend(v13, "setToValue:", v11);
  *(float *)&v27 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v13, "setSpeed:", v27);

  return v13;
}

- (id)_switchKnobPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v6 = (void *)MEMORY[0x1E0CD2848];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "animationWithKeyPath:", CFSTR("position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "knobSpringAnimationMass");
  v12 = v11;
  objc_msgSend(v10, "knobSpringAnimationStiffness");
  v14 = v13;
  objc_msgSend(v10, "knobSpringAnimationDamping");
  v16 = v15;
  objc_msgSend(v10, "knobSpringAnimationDuration");
  v18 = v17;
  objc_msgSend(v9, "setMass:", v12);
  objc_msgSend(v9, "setStiffness:", v14);
  objc_msgSend(v9, "setDamping:", v16);
  objc_msgSend(v9, "setDuration:", v18);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v9, "setFromValue:", v8);

  objc_msgSend(v9, "setToValue:", v7);
  *(float *)&v19 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v9, "setSpeed:", v19);

  return v9;
}

- (id)_switchKnobWidthSpringAnimationFromValue:(id)a3 toValue:(id)a4 pressed:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CD2848];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "animationWithKeyPath:", CFSTR("bounds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    objc_msgSend(v12, "knobTouchDownSpringAnimationMass");
    v15 = v14;
    objc_msgSend(v13, "knobTouchDownSpringAnimationStiffness");
    v17 = v16;
    objc_msgSend(v13, "knobTouchDownSpringAnimationDamping");
    v19 = v18;
    objc_msgSend(v13, "knobTouchDownSpringAnimationDuration");
  }
  else
  {
    objc_msgSend(v12, "knobSpringAnimationMass");
    v15 = v21;
    objc_msgSend(v13, "knobSpringAnimationStiffness");
    v17 = v22;
    objc_msgSend(v13, "knobSpringAnimationDamping");
    v19 = v23;
    objc_msgSend(v13, "knobSpringAnimationDuration");
  }
  v24 = v20;
  objc_msgSend(v11, "setMass:", v15);
  objc_msgSend(v11, "setStiffness:", v17);
  objc_msgSend(v11, "setDamping:", v19);
  objc_msgSend(v11, "setDuration:", v24);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v11, "setFromValue:", v10);

  objc_msgSend(v11, "setToValue:", v9);
  *(float *)&v25 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v11, "setSpeed:", v25);

  return v11;
}

- (id)_switchTrackPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CD2848];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "animationWithKeyPath:", CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitchModernVisualElement _settings](self, "_settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    objc_msgSend(v12, "trackGoingOffSpringAnimationMass");
    v15 = v14;
    objc_msgSend(v13, "trackGoingOffSpringAnimationStiffness");
    v17 = v16;
    objc_msgSend(v13, "trackGoingOffSpringAnimationDamping");
    v19 = v18;
    objc_msgSend(v13, "trackGoingOffSpringAnimationDuration");
  }
  else
  {
    objc_msgSend(v12, "trackGoingOnSpringAnimationMass");
    v15 = v21;
    objc_msgSend(v13, "trackGoingOnSpringAnimationStiffness");
    v17 = v22;
    objc_msgSend(v13, "trackGoingOnSpringAnimationDamping");
    v19 = v23;
    objc_msgSend(v13, "trackGoingOnSpringAnimationDuration");
  }
  v24 = v20;
  objc_msgSend(v11, "setMass:", v15);
  objc_msgSend(v11, "setStiffness:", v17);
  objc_msgSend(v11, "setDamping:", v19);
  objc_msgSend(v11, "setDuration:", v24);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v11, "setFromValue:", v10);

  objc_msgSend(v11, "setToValue:", v9);
  *(float *)&v25 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v11, "setSpeed:", v25);

  return v11;
}

- (id)_labelOpacityAnimation
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDuration:", 1.27);
  objc_msgSend(v2, "setValues:", &unk_1E1A932D8);
  objc_msgSend(v2, "setKeyTimes:", &unk_1E1A932F0);
  *(float *)&v3 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v2, "setSpeed:", v3);
  return v2;
}

- (id)_effectiveOffTextColor
{
  if (self->_tintColor)
    -[UISwitchModernVisualElement _effectiveTintColor](self, "_effectiveTintColor");
  else
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibleOnImage
{
  void *v2;
  void *v3;

  _UIImageWithName(CFSTR("UISwitchAccessibilityOnImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibleOffImage
{
  void *v2;
  void *v3;

  _UIImageWithName(CFSTR("UISwitchAccessibilityOffImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5 shouldAnimateLabels:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  char v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = a7;
  if (__PAIR64__(self->_pressed, self->_on) != __PAIR64__(v9, v8))
  {
    v13 = v11;
    self->_pressed = v9;
    self->_on = v8;
    v12 = dyld_program_sdk_at_least();
    -[UISwitchModernVisualElement _transitionKnobToOn:animated:](self, "_transitionKnobToOn:animated:", v8, v7);
    if ((v12 & 1) != 0)
    {
      -[UISwitchModernVisualElement _transitionKnobToPressed:animated:](self, "_transitionKnobToPressed:animated:", v9, v7);
      -[UISwitchModernVisualElement _transitionWellViewToPressed:on:animated:](self, "_transitionWellViewToPressed:on:animated:", v9, v8, v7);
    }
    else
    {
      -[UISwitchModernVisualElement _transitionWellViewToOn:animated:](self, "_transitionWellViewToOn:animated:", v8, v7);
      -[UISwitchModernVisualElement _transitionKnobToPressed:animated:](self, "_transitionKnobToPressed:animated:", v9, v7);
      -[UISwitchModernVisualElement _transitionWellViewToPressed:animated:](self, "_transitionWellViewToPressed:animated:", v9, v7);
    }
    -[UISwitchModernVisualElement _transitionImagesToPressed:on:animated:](self, "_transitionImagesToPressed:on:animated:", v9, v8, v7);
    v11 = v13;
    if (v13)
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      v11 = v13;
    }
  }

}

- (id)_settings
{
  return +[_UISwitchSettings sharedSettings](_UISwitchSettings, "sharedSettings");
}

- (BOOL)_feedbackEnabled
{
  void *v2;
  char v3;

  -[UISwitchModernVisualElement _settings](self, "_settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "feedbackEnabled");

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_selectGestureRecognizer != a3
      || objc_msgSend(a3, "_buttonType") != 4
      || -[UIView isEnabled](self, "isEnabled");
}

- (void)_selectGestureChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

    -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPendingDisplayedOnValue:forGesture:", -[UISwitchModernVisualElement on](self, "on") ^ 1, v4);

    -[UISwitchModernVisualElement gestureTrackingSession](self, "gestureTrackingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyPendingDisplayedOnValueWithoutSendingActions");

    objc_initWeak(&location, self);
    v8 = (void *)UIApp;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__UISwitchModernVisualElement__selectGestureChanged___block_invoke;
    v9[3] = &unk_1E16B3F40;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "_performBlockAfterCATransactionCommits:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __53__UISwitchModernVisualElement__selectGestureChanged___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E0C9B270], 0.0, 1u);
    objc_msgSend(WeakRetained, "gestureTrackingSession");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "applyPendingDisplayedOnValueAndSendActions");

    objc_msgSend(WeakRetained, "switchControl");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "visualElementHadTouchUpInside:", WeakRetained);

    objc_msgSend(WeakRetained, "gestureTrackingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reset");

  }
}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (UIImage)onImage
{
  return self->_onImage;
}

- (UIImage)offImage
{
  return self->_offImage;
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
}

- (void)setGestureTrackingSession:(id)a3
{
  objc_storeStrong((id *)&self->_gestureTrackingSession, a3);
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (UIPanGestureRecognizer)pan
{
  return self->_pan;
}

@end
