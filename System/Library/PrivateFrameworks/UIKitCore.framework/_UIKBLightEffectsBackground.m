@implementation _UIKBLightEffectsBackground

- (_UIKBLightEffectsBackground)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIKBLightEffectsBackground *v7;
  _UIKBLightEffectsBackground *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIKBLightEffectsBackground;
  v7 = -[UIKBInputBackdropView initWithFrame:](&v11, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_clientBackdropInUse = 0;
    -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](v7, "layoutInputBackdropToFullWithRect:", x, y, width, height);
    -[UIView _inheritedRenderConfig](v8, "_inheritedRenderConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_useLightConfigEffects = objc_msgSend(v9, "lightKeyboard");

  }
  return v8;
}

- (BOOL)shouldShowBackdrop
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || -[_UIKBLightEffectsBackground clippingStyle](self, "clippingStyle"))
  {
    return 1;
  }
  else
  {
    return !-[_UIKBLightEffectsBackground isClientBackdropInUse](self, "isClientBackdropInUse");
  }
}

- (void)setClientBackdropInUse:(BOOL)a3
{
  if (self->_clientBackdropInUse != a3)
    self->_clientBackdropInUse = a3;
}

- (BOOL)isClientBackdropInUse
{
  return (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 && self->_clientBackdropInUse;
}

- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  if (a3 == 3904)
  {
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", 1);
    -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground _addContentEffectsForConfig:](self, "_addContentEffectsForConfig:", v7);

    -[_UIKBLightEffectsBackground addLightSourceViews](self, "addLightSourceViews");
    if (-[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop"))
      a3 = 3904;
    else
      a3 = 3903;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIKBLightEffectsBackground;
  -[UIKBInputBackdropView transitionToStyle:isSplit:](&v8, sel_transitionToStyle_isSplit_, a3, v4);
}

- (void)_addContentEffectsForConfig:(id)a3
{
  id v4;
  int v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop"))
  {
    v5 = objc_msgSend(v4, "lightKeyboard");
    if (!v4 || v5)
    {
      v14 = xmmword_186681180;
      v15 = xmmword_186681190;
      v6 = xmmword_1866811A0;
      v7 = xmmword_1866811B0;
    }
    else
    {
      v14 = xmmword_186681140;
      v15 = xmmword_186681150;
      v6 = xmmword_186681160;
      v7 = xmmword_186681170;
    }
    v16 = v6;
    v17 = v7;
    v18 = xmmword_186678670;
    +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v14, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentEffects:", v11);

    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", 0);

  }
  else
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentEffects:", MEMORY[0x1E0C9AA60]);

    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", 0);

  }
}

- (void)updateEffectsForLightKeyboard:(BOOL)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v4 = a4;
  v5 = a3;
  if (!-[_UIKBLightEffectsBackground isAnimating](self, "isAnimating") || v4)
  {
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    if (v5)
      v9 = 0.62;
    else
      v9 = 0.25;
    -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

  }
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v14 = 80.0;
  if (v5)
    v14 = 140.0;
  v15 = v14 / v13;
  -[_UIKBLightEffectsBackground fullBackdropMaskView](self, "fullBackdropMaskView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowRadius:", v15);

}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKBLightEffectsBackground;
  -[UIKBInputBackdropView _setRenderConfig:](&v5, sel__setRenderConfig_, v4);
  if (-[_UIKBLightEffectsBackground isUsingAnimatedBackdrop](self, "isUsingAnimatedBackdrop")
    && (objc_msgSend(v4, "animatedBackground") & 1) == 0)
  {
    -[_UIKBLightEffectsBackground removeAnimatedBackdropEffects](self, "removeAnimatedBackdropEffects");
  }
  -[_UIKBLightEffectsBackground setUseLightConfigEffects:](self, "setUseLightConfigEffects:", objc_msgSend(v4, "lightKeyboard"));
  if (objc_msgSend(v4, "animatedBackground"))
  {
    -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", 1);
    -[UIView bounds](self, "bounds");
    -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:");
    -[_UIKBLightEffectsBackground updateEffectsForLightKeyboard:forceUpdate:](self, "updateEffectsForLightKeyboard:forceUpdate:", objc_msgSend(v4, "lightKeyboard"), 0);
  }
  -[_UIKBLightEffectsBackground transitionToStyle:isSplit:](self, "transitionToStyle:isSplit:", objc_msgSend(v4, "backdropStyle"), 0);

}

- (void)removeAnimatedBackdropEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", 0);
  -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentEffects:", MEMORY[0x1E0C9AA60]);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = (void *)MEMORY[0x1E0D156E0];
    -[_UIKBLightEffectsBackground lightSourceConstraints](self, "lightSourceConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:", v9);

    -[_UIKBLightEffectsBackground setLightSourceConstraints:](self, "setLightSourceConstraints:", 0);
    -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[_UIKBLightEffectsBackground setBehindFullBackdropView:](self, "setBehindFullBackdropView:", 0);
    -[_UIKBLightEffectsBackground setBehindAssistantView:](self, "setBehindAssistantView:", 0);
    -[_UIKBLightEffectsBackground setAssistantBarMaskView:](self, "setAssistantBarMaskView:", 0);
    -[_UIKBLightEffectsBackground setFullBackdropMaskView:](self, "setFullBackdropMaskView:", 0);
    -[_UIKBLightEffectsBackground setBackdropGradientMaskView:](self, "setBackdropGradientMaskView:", 0);
  }
}

- (void)performTransitionToRenderConfig:(id)a3 fromRenderConfig:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  _UIKBLightEffectsBackground *v39;
  id v40;
  id v41;
  double v42;
  _QWORD v43[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "animatedBackground"))
  {
    -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", 1);
    -[UIView bounds](self, "bounds");
    -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:");
    if (v11)
    {
      -[_UIKBLightEffectsBackground transitionStartBackdropView](self, "transitionStartBackdropView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[_UIKBLightEffectsBackground extraBackdropViewForConfig:](self, "extraBackdropViewForConfig:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKBLightEffectsBackground setTransitionStartBackdropView:](self, "setTransitionStartBackdropView:", v15);

      }
      -[_UIKBLightEffectsBackground transitionStartBackdropView](self, "transitionStartBackdropView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transitionToStyle:", objc_msgSend(v11, "backdropStyle"));

      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "transitionToStyle:", 3903);

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
        goto LABEL_9;
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAlpha:", 0.0);
    }
    else
    {
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transitionToStyle:", 3903);
    }

LABEL_9:
    -[_UIKBLightEffectsBackground setIsAnimating:](self, "setIsAnimating:", 1);
    -[UIView traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayScale");
    v21 = v20;

    -[_UIKBLightEffectsBackground bringupWaveEffectViewForDisplayScale:](self, "bringupWaveEffectViewForDisplayScale:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v22);
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 900.0 / v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setActive:", 1);
    v27 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke;
    v43[3] = &unk_1E16B1B28;
    v43[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v43);
    aBlock[0] = v27;
    aBlock[1] = 3221225472;
    aBlock[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_2;
    aBlock[3] = &unk_1E16D62C0;
    v28 = v22;
    v37 = v28;
    v38 = v26;
    v42 = v21;
    v39 = self;
    v40 = v10;
    v41 = v12;
    v29 = v26;
    v32[0] = v27;
    v32[1] = 3221225472;
    v32[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_3;
    v32[3] = &unk_1E16D62E8;
    v33 = v28;
    v34 = _Block_copy(aBlock);
    v32[4] = self;
    v35 = v13;
    v30 = v28;
    v31 = v34;
    +[UIView _performWithAnimation:](UIView, "_performWithAnimation:", v32);

  }
}

- (void)updateAlphaForAnimationStart:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    if (-[_UIKBLightEffectsBackground clippingStyle](self, "clippingStyle") == 3)
    {
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transitionToStyle:", 3903);

    }
    -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.2);

    -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.2);

  }
  else
  {
    -[_UIKBLightEffectsBackground updateEffectsForLightKeyboard:forceUpdate:](self, "updateEffectsForLightKeyboard:forceUpdate:", -[_UIKBLightEffectsBackground useLightConfigEffects](self, "useLightConfigEffects"), 1);
  }
}

- (void)animatedTransitionToRenderConfig:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", objc_msgSend(v4, "animatedBackground"));
  if (objc_msgSend(v4, "animatedBackground"))
  {
    -[_UIKBLightEffectsBackground transitionToStyle:isSplit:](self, "transitionToStyle:isSplit:", 3904, 0);
    -[_UIKBLightEffectsBackground setUseLightConfigEffects:](self, "setUseLightConfigEffects:", objc_msgSend(v4, "lightKeyboard"));
    -[_UIKBLightEffectsBackground updateAlphaForAnimationStart:](self, "updateAlphaForAnimationStart:", 0);
  }

}

- (void)completeTransitionToRenderConfig:(id)a3
{
  void *v4;
  id v5;

  -[_UIKBLightEffectsBackground transitionStartBackdropView](self, "transitionStartBackdropView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIKBLightEffectsBackground setTransitionStartBackdropView:](self, "setTransitionStartBackdropView:", 0);
  -[_UIKBLightEffectsBackground setIsAnimating:](self, "setIsAnimating:", 0);
  -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v5);

}

- (id)bringupWaveEffectViewForDisplayScale:(double)a3
{
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGColorRef SRGB;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 100.0 / a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValue:forKey:", v6, *MEMORY[0x1E0CD2D90]);

  v30[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v7);

  v9 = *MEMORY[0x1E0CD2EA0];
  -[UIView layer](v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompositingFilter:", v9);

  -[UIView layer](v5, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderWidth:", 100.0 / a3);

  SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  -[UIView layer](v5, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderColor:", SRGB);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](v5, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", 1500.0 / a3);

  -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 0);
  -[UIView layer](v5, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](self, "addSubview:", v5);
  v26 = (void *)MEMORY[0x1E0D156E0];
  -[UIView heightAnchor](v5, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", 3000.0 / a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  -[UIView centerXAnchor](v5, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v20;
  -[UIView widthAnchor](v5, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v5, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v24);

  return v5;
}

- (id)extraBackdropViewForConfig:(id)a3
{
  id v4;
  UIKBBackdropView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIKBBackdropView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [UIKBBackdropView alloc];
  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v4, "backdropStyle");

  v16 = -[UIKBBackdropView initWithFrame:style:](v5, "initWithFrame:style:", v15, v8, v10, v12, v14);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v16, v17);

  v29 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](v16, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  -[UIView leadingAnchor](v16, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v28;
  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v16, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v21;
  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v16, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v26);

  return v16;
}

- (id)layerForPositionMatchMove
{
  void *v3;
  void *v4;

  if (-[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop"))
  {
    -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)addLayoutGuidesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  UILayoutGuide *v21;
  UILayoutGuide *fullBackdropLayoutGuide;
  UILayoutGuide *v23;
  UILayoutGuide *assistantLayoutGuide;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILayoutGuide *v34;
  UILayoutGuide *aboveKeyboardLayoutGuide;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  UIView *v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD v70[5];
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v66 = objc_alloc_init(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIKBInputBackdropView captureView](self, "captureView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v66, v4 != 0);

    -[_UIKBLightEffectsBackground setBackdropClippingView:](self, "setBackdropClippingView:", v66);
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 1);

    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 0);

    -[_UIKBLightEffectsBackground changeClippingStyle:](self, "changeClippingStyle:", 0);
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v15;
    -[UIView trailingAnchor](self, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObjectsFromArray:", v20);

  }
  if (!self->_fullBackdropLayoutGuide)
  {
    v21 = objc_alloc_init(UILayoutGuide);
    fullBackdropLayoutGuide = self->_fullBackdropLayoutGuide;
    self->_fullBackdropLayoutGuide = v21;

    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_fullBackdropLayoutGuide);
  }
  if (!self->_assistantLayoutGuide)
  {
    v23 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = self->_assistantLayoutGuide;
    self->_assistantLayoutGuide = v23;

    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_assistantLayoutGuide);
    -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v26, 50.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v27;
    -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 50.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObjectsFromArray:", v33);

  }
  if (!self->_aboveKeyboardLayoutGuide)
  {
    v34 = objc_alloc_init(UILayoutGuide);
    aboveKeyboardLayoutGuide = self->_aboveKeyboardLayoutGuide;
    self->_aboveKeyboardLayoutGuide = v34;

    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_aboveKeyboardLayoutGuide);
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v41) = 1148829696;
    v65 = v40;
    objc_msgSend(v40, "setPriority:", v41);
    -[UIView traitCollection](self, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v42);
    v44 = v43;

    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:", v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground setMinimumAboveKeyboardHeightConstraint:](self, "setMinimumAboveKeyboardHeightConstraint:", v47);

    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v60;
    v70[1] = v40;
    -[_UIKBLightEffectsBackground minimumAboveKeyboardHeightConstraint](self, "minimumAboveKeyboardHeightConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v59;
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v51;
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObjectsFromArray:", v57);

  }
  if (objc_msgSend(v69, "count"))
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v69);

}

- (void)changeClippingStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  -[_UIKBLightEffectsBackground addLayoutGuidesIfNeeded](self, "addLayoutGuidesIfNeeded");
  v5 = (void *)MEMORY[0x1E0D156E0];
  -[_UIKBLightEffectsBackground backdropClippingConstraints](self, "backdropClippingConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  self->_clippingStyle = a3;
  switch(a3)
  {
    case -1:
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v10;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v11;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v14);
      v24 = objc_claimAutoreleasedReturnValue();
      v40[1] = v24;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = v40;
      goto LABEL_8;
    case 2:
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v11;
      -[_UIKBLightEffectsBackground assistantLayoutGuide](self, "assistantLayoutGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v24);
      v27 = v7;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v39[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v32;
      goto LABEL_9;
    case 3:
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setClipsToBounds:", 0);

      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v11;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 0.0);
      v24 = objc_claimAutoreleasedReturnValue();
      v38[1] = v24;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = v38;
LABEL_8:
      objc_msgSend(v25, "arrayWithObjects:count:", v26, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      v7 = (id)v24;
      v9 = v34;
LABEL_10:

      v23 = 0x1E0D15000uLL;
      goto LABEL_11;
    default:
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v17;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v18 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0x1E0D15000;
      if (!a3)
        goto LABEL_13;
LABEL_11:
      if (!-[_UIKBLightEffectsBackground isAnimating](self, "isAnimating"))
      {
        -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", 1);
        -[UIView bounds](self, "bounds");
        -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:");
        -[_UIKBLightEffectsBackground transitionToStyle:isSplit:](self, "transitionToStyle:isSplit:", 3904, 0);
      }
LABEL_13:
      -[_UIKBLightEffectsBackground setBackdropClippingConstraints:](self, "setBackdropClippingConstraints:", v15);
      v29 = *(void **)(v23 + 1760);
      -[_UIKBLightEffectsBackground backdropClippingConstraints](self, "backdropClippingConstraints");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "activateConstraints:", v30);

      return;
  }
}

- (void)showShadowEffects:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[_UIKBLightEffectsBackground mirroredShadowView](self, "mirroredShadowView");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          -[_UIKBLightEffectsBackground mirroredLightBorderView](self, "mirroredLightBorderView"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      if (a3)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __49___UIKBLightEffectsBackground_showShadowEffects___block_invoke;
        v10[3] = &unk_1E16B1B28;
        v10[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
      }
      else
      {
        -[_UIKBLightEffectsBackground mirroredShadowView](self, "mirroredShadowView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        -[_UIKBLightEffectsBackground mirroredLightBorderView](self, "mirroredLightBorderView");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

      }
    }
  }
}

- (void)addLightSourceViews
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UIIntelligenceSystemLightView *v22;
  void *v23;
  uint64_t v24;
  _UIIntelligenceSystemLightView *v25;
  uint64_t v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIView *v36;

  v3 = -[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop");
  -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = (void *)MEMORY[0x1E0D156E0];
        -[_UIKBLightEffectsBackground lightSourceConstraints](self, "lightSourceConstraints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deactivateConstraints:", v9);

        -[_UIKBLightEffectsBackground lightSourceConstraints](self, "lightSourceConstraints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllObjects");

        -[_UIKBLightEffectsBackground setBehindFullBackdropView:](self, "setBehindFullBackdropView:", 0);
        -[_UIKBLightEffectsBackground setBehindAssistantView:](self, "setBehindAssistantView:", 0);
      }
    }
    -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v36 = objc_alloc_init(UIView);
      v12 = objc_alloc_init(UIView);
      if (TIGetShowDebugBackdropValue_onceToken != -1)
        dispatch_once(&TIGetShowDebugBackdropValue_onceToken, &__block_literal_global_346);
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForPreferenceKey:", CFSTR("ShowDebugBackdrop"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && objc_msgSend(v14, "BOOLValue"))
      {
        +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v15);

        +[UIColor systemRedColor](UIColor, "systemRedColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v16);
      }
      else
      {
        v22 = [_UIIntelligenceSystemLightView alloc];
        -[UIView superview](self, "superview");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bounds");
        v24 = -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](v22, "initWithFrame:preferringAudioReactivity:", 0);

        v25 = [_UIIntelligenceSystemLightView alloc];
        -[UIView superview](self, "superview");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v26 = -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](v25, "initWithFrame:preferringAudioReactivity:", 0);

        v12 = (UIView *)v26;
        v36 = (UIView *)v24;
      }

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (-[_UIKBLightEffectsBackground isAnimating](self, "isAnimating"))
      {
        -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "lightKeyboard");
        v29 = 0.2;
        if (v28)
          v29 = 0.0;
        -[UIView setAlpha:](v36, "setAlpha:", v29);

      }
      else
      {
        -[UIView setAlpha:](v36, "setAlpha:", 1.0);
      }
      -[UIView layer](v36, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAllowsEdgeAntialiasing:", 0);

      -[UIView layer](v36, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAllowsGroupBlending:", 0);

      -[UIView layer](v36, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAllowsGroupOpacity:", 0);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView layer](v12, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAllowsEdgeAntialiasing:", 0);

      -[UIView layer](v12, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAllowsGroupBlending:", 0);

      -[UIView layer](v12, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAllowsGroupOpacity:", 0);

      -[_UIKBLightEffectsBackground useMaskedKeyplaneBackdrop:assistantBackdrop:](self, "useMaskedKeyplaneBackdrop:assistantBackdrop:", v36, v12);
    }
  }
  else
  {

    if (v5)
    {
      v17 = (void *)MEMORY[0x1E0D156E0];
      -[_UIKBLightEffectsBackground lightSourceConstraints](self, "lightSourceConstraints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deactivateConstraints:", v18);

      -[_UIKBLightEffectsBackground lightSourceConstraints](self, "lightSourceConstraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeAllObjects");

      -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeFromSuperview");

      -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      -[_UIKBLightEffectsBackground setBehindAssistantView:](self, "setBehindAssistantView:", 0);
      -[_UIKBLightEffectsBackground setBehindFullBackdropView:](self, "setBehindFullBackdropView:", 0);
    }
  }
}

- (void)useMaskedKeyplaneBackdrop:(id)a3 assistantBackdrop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  UIView *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIView *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
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
  UIView *v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[6];

  v101[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[_UIKBLightEffectsBackground behindFullBackdropView](self, "behindFullBackdropView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if ((v9 & 1) == 0)
    {
      v96 = v7;
      -[_UIKBLightEffectsBackground addLayoutGuidesIfNeeded](self, "addLayoutGuidesIfNeeded");
      v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[UIView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayScale");
      v12 = v11;

      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertSubview:belowSubview:", v6, v14);

      objc_msgSend(v6, "leadingAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:", v91);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v88;
      objc_msgSend(v6, "topAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v101[1] = v16;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v101[2] = v19;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v97 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v101[3] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addObjectsFromArray:", v23);

      -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "lightKeyboard"))
        v25 = 140.0;
      else
        v25 = 80.0;

      v26 = objc_alloc_init(UIView);
      +[UIColor clearColor](UIColor, "clearColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

      +[UIColor blackColor](UIColor, "blackColor");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "CGColor");
      -[UIView layer](v26, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setShadowColor:", v29);

      -[UIView layer](v26, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 1.0;
      objc_msgSend(v31, "setShadowOpacity:", v32);

      -[UIView layer](v26, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setShadowRadius:", v25 / v12);

      -[UIView layer](v26, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setShadowPathIsBounds:", 1);

      v35 = *MEMORY[0x1E0C9D820];
      v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      -[UIView layer](v26, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setShadowOffset:", v35, v36);

      -[UIView layer](v26, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAllowsGroupOpacity:", 0);

      -[UIView layer](v26, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAllowsGroupBlending:", 0);

      -[UIView layer](v26, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAllowsEdgeAntialiasing:", 0);

      objc_msgSend(v97, "setMaskView:", v26);
      -[_UIKBLightEffectsBackground setBehindFullBackdropView:](self, "setBehindFullBackdropView:", v97);
      v95 = v26;
      -[_UIKBLightEffectsBackground setFullBackdropMaskView:](self, "setFullBackdropMaskView:", v26);
      v41 = objc_alloc_init(UIView);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v41, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setCompositingFilter:", v42);

      if (-[_UIKBLightEffectsBackground isAnimating](self, "isAnimating"))
      {
        -[UIView setAlpha:](v41, "setAlpha:", 0.0);
      }
      else
      {
        -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "lightKeyboard");
        v46 = 0.62;
        if (!v45)
          v46 = 0.25;
        -[UIView setAlpha:](v41, "setAlpha:", v46);

      }
      -[UIView layer](v41, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAllowsGroupOpacity:", 0);

      -[UIView layer](v41, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAllowsGroupBlending:", 0);

      -[UIView addSubview:](v41, "addSubview:", v96);
      -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "insertSubview:aboveSubview:", v41, v50);

      objc_msgSend(v96, "topAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v41, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "constraintEqualToAnchor:", v89);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v86;
      objc_msgSend(v96, "leadingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v41, "leadingAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v81);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v100[1] = v51;
      -[UIView bottomAnchor](v41, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v100[2] = v54;
      -[UIView trailingAnchor](v41, "trailingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v100[3] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addObjectsFromArray:", v58);

      -[UIView topAnchor](v41, "topAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v87);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = v84;
      -[UIView leadingAnchor](v41, "leadingAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "constraintEqualToAnchor:", v80);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v59;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v41, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v99[2] = v62;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v41, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v99[3] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addObjectsFromArray:", v66);

      v67 = objc_alloc_init(UIView);
      +[UIColor clearColor](UIColor, "clearColor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v67, "setBackgroundColor:", v68);

      -[UIView layer](v67, "layer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setAllowsGroupBlending:", 0);

      -[UIView layer](v67, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setAllowsGroupOpacity:", 0);

      -[UIView layer](v67, "layer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setAllowsEdgeAntialiasing:", 0);

      +[UIColor blackColor](UIColor, "blackColor");
      v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v73 = objc_msgSend(v72, "CGColor");
      -[UIView layer](v67, "layer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setShadowColor:", v73);

      v7 = v96;
      -[UIView layer](v67, "layer");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v76) = 1.0;
      objc_msgSend(v75, "setShadowOpacity:", v76);

      -[UIView layer](v67, "layer");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setShadowRadius:", 80.0 / v12);

      -[UIView layer](v67, "layer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setShadowPathIsBounds:", 1);

      -[UIView layer](v67, "layer");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setShadowOffset:", v35, v36);

      objc_msgSend(v96, "setMaskView:", v67);
      -[_UIKBLightEffectsBackground setBehindAssistantView:](self, "setBehindAssistantView:", v41);
      -[_UIKBLightEffectsBackground setAssistantBarMaskView:](self, "setAssistantBarMaskView:", v67);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v98);
      -[_UIKBLightEffectsBackground setLightSourceConstraints:](self, "setLightSourceConstraints:", v98);
      -[UIView setNeedsLayout](self, "setNeedsLayout");

      v6 = v97;
    }
  }

}

- (void)layoutInputBackdropToFullWithRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  -[_UIKBLightEffectsBackground addLayoutGuidesIfNeeded](self, "addLayoutGuidesIfNeeded", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
  }
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

LABEL_5:
  -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKBLightEffectsBackground backdropClippingView](self, "backdropClippingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UIKBLightEffectsBackground behindAssistantView](self, "behindAssistantView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:belowSubview:", v12, v13);

  }
  else
  {
    objc_msgSend(v11, "addSubview:", v12);
  }

  -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leftAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leftAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v38;
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v17;
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setFullWidthConstraints:](self, "setFullWidthConstraints:", v23);

  }
  -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isActive");

  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v28);

  }
  if (!-[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop"))
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", 0);

    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v31, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContentEffects:", v32);

    -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeFromSuperview");

    -[_UIKBLightEffectsBackground setBackdropGradientMaskView:](self, "setBackdropGradientMaskView:", 0);
    return;
  }
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "animatedBackground") & 1) != 0)
  {

  }
  else
  {
    v35 = -[_UIKBLightEffectsBackground isUsingAnimatedBackdrop](self, "isUsingAnimatedBackdrop");

    if (!v35)
      return;
  }
  -[_UIKBLightEffectsBackground maskEffectsBackdrop](self, "maskEffectsBackdrop");
}

- (void)maskEffectsBackdrop
{
  BOOL v3;
  void *v4;
  void *v5;
  _UIGradientView *v6;
  uint64_t v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v45;
  _UIGradientView *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  _QWORD v50[2];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_UIKBLightEffectsBackground shouldShowBackdrop](self, "shouldShowBackdrop");
  -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      v6 = objc_alloc_init(_UIGradientView);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = *MEMORY[0x1E0CD2F48];
      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setType:", v7);

      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartPoint:", 0.5, 0.0);

      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEndPoint:", 0.5, 0.2);

      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInterpolations:", v12);

      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.1491, 0.0, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2549, 0.5725, 0.9647, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_retainAutorelease(v14);
      v50[0] = objc_msgSend(v48, "CGColor");
      v47 = objc_retainAutorelease(v15);
      v50[1] = objc_msgSend(v47, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColors:", v16);

      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAllowsEdgeAntialiasing:", 0);

      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAllowsGroupBlending:", 0);

      v46 = v6;
      -[_UIGradientView gradientLayer](v6, "gradientLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAllowsGroupOpacity:", 0);

      -[_UIKBLightEffectsBackground setBackdropGradientMaskView:](self, "setBackdropGradientMaskView:", v6);
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

      v36 = (void *)MEMORY[0x1E0D156E0];
      -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "topAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v41;
      -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v35;
      -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v27;
      -[_UIKBLightEffectsBackground backdropGradientMaskView](self, "backdropGradientMaskView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "activateConstraints:", v33);

    }
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[_UIKBLightEffectsBackground setBackdropGradientMaskView:](self, "setBackdropGradientMaskView:", 0);
  }
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v3);
  v5 = v4;

  -[_UIKBLightEffectsBackground minimumAboveKeyboardHeightConstraint](self, "minimumAboveKeyboardHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  v7.receiver = self;
  v7.super_class = (Class)_UIKBLightEffectsBackground;
  -[UIView updateConstraints](&v7, sel_updateConstraints);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
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
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_UIKBLightEffectsBackground;
  -[UIView layoutSubviews](&v26, sel_layoutSubviews);
  -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;

  -[_UIKBLightEffectsBackground fullBackdropMaskView](self, "fullBackdropMaskView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self, "fullBackdropLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[_UIKBLightEffectsBackground fullBackdropMaskView](self, "fullBackdropMaskView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9 + -100.0, v11 - v5, v13 + 200.0, v15 - (-100.0 - v5));

  }
  -[_UIKBLightEffectsBackground assistantBarMaskView](self, "assistantBarMaskView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_UIKBLightEffectsBackground aboveKeyboardLayoutGuide](self, "aboveKeyboardLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[_UIKBLightEffectsBackground assistantBarMaskView](self, "assistantBarMaskView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v20 + 0.0, v5 - v5 * 0.5, v22, v24 - (v5 * 0.5 - v5 * 0.5));

  }
}

- (BOOL)clientBackdropInUse
{
  return self->_clientBackdropInUse;
}

- (UILayoutGuide)fullBackdropLayoutGuide
{
  return self->_fullBackdropLayoutGuide;
}

- (void)setFullBackdropLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_fullBackdropLayoutGuide, a3);
}

- (UILayoutGuide)assistantLayoutGuide
{
  return self->_assistantLayoutGuide;
}

- (void)setAssistantLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_assistantLayoutGuide, a3);
}

- (UIView)fullBackdropMaskView
{
  return self->_fullBackdropMaskView;
}

- (void)setFullBackdropMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_fullBackdropMaskView, a3);
}

- (UIView)assistantBarMaskView
{
  return self->_assistantBarMaskView;
}

- (void)setAssistantBarMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_assistantBarMaskView, a3);
}

- (_UIGradientView)backdropGradientMaskView
{
  return self->_backdropGradientMaskView;
}

- (void)setBackdropGradientMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropGradientMaskView, a3);
}

- (UIView)behindFullBackdropView
{
  return self->_behindFullBackdropView;
}

- (void)setBehindFullBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_behindFullBackdropView, a3);
}

- (UIView)behindAssistantView
{
  return self->_behindAssistantView;
}

- (void)setBehindAssistantView:(id)a3
{
  objc_storeStrong((id *)&self->_behindAssistantView, a3);
}

- (UIView)mirroredShadowView
{
  return self->_mirroredShadowView;
}

- (void)setMirroredShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredShadowView, a3);
}

- (UIView)mirroredLightBorderView
{
  return self->_mirroredLightBorderView;
}

- (void)setMirroredLightBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredLightBorderView, a3);
}

- (UILayoutGuide)aboveKeyboardLayoutGuide
{
  return self->_aboveKeyboardLayoutGuide;
}

- (void)setAboveKeyboardLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_aboveKeyboardLayoutGuide, a3);
}

- (NSLayoutConstraint)minimumAboveKeyboardHeightConstraint
{
  return self->_minimumAboveKeyboardHeightConstraint;
}

- (void)setMinimumAboveKeyboardHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minimumAboveKeyboardHeightConstraint, a3);
}

- (UIView)backdropClippingView
{
  return self->_backdropClippingView;
}

- (void)setBackdropClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropClippingView, a3);
}

- (NSArray)backdropClippingConstraints
{
  return self->_backdropClippingConstraints;
}

- (void)setBackdropClippingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_backdropClippingConstraints, a3);
}

- (NSMutableArray)lightSourceConstraints
{
  return self->_lightSourceConstraints;
}

- (void)setLightSourceConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_lightSourceConstraints, a3);
}

- (UIKBBackdropView)transitionStartBackdropView
{
  return self->_transitionStartBackdropView;
}

- (void)setTransitionStartBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionStartBackdropView, a3);
}

- (int64_t)clippingStyle
{
  return self->_clippingStyle;
}

- (void)setClippingStyle:(int64_t)a3
{
  self->_clippingStyle = a3;
}

- (BOOL)isUsingAnimatedBackdrop
{
  return self->_isUsingAnimatedBackdrop;
}

- (void)setIsUsingAnimatedBackdrop:(BOOL)a3
{
  self->_isUsingAnimatedBackdrop = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)useLightConfigEffects
{
  return self->_useLightConfigEffects;
}

- (void)setUseLightConfigEffects:(BOOL)a3
{
  self->_useLightConfigEffects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionStartBackdropView, 0);
  objc_storeStrong((id *)&self->_lightSourceConstraints, 0);
  objc_storeStrong((id *)&self->_backdropClippingConstraints, 0);
  objc_storeStrong((id *)&self->_backdropClippingView, 0);
  objc_storeStrong((id *)&self->_minimumAboveKeyboardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_aboveKeyboardLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mirroredLightBorderView, 0);
  objc_storeStrong((id *)&self->_mirroredShadowView, 0);
  objc_storeStrong((id *)&self->_behindAssistantView, 0);
  objc_storeStrong((id *)&self->_behindFullBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropGradientMaskView, 0);
  objc_storeStrong((id *)&self->_assistantBarMaskView, 0);
  objc_storeStrong((id *)&self->_fullBackdropMaskView, 0);
  objc_storeStrong((id *)&self->_assistantLayoutGuide, 0);
  objc_storeStrong((id *)&self->_fullBackdropLayoutGuide, 0);
}

@end
