@implementation _UITextCursorDictationAnimation

- (_UITextCursorDictationAnimation)initWithCursorShapeView:(id)a3
{
  id v4;
  _UITextCursorDictationAnimation *v5;
  _UITextCursorDictationAnimation *v6;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIView *glowShapeView;
  UIView *v14;
  UIView *glowContainerView;
  UIDictationGlowEffect *v16;
  UIDictationGlowEffect *glowEffect;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UITextCursorDictationAnimation;
  v5 = -[_UITextCursorDictationAnimation init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cursorShapeView, v4);
    v7 = [UIView alloc];
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    glowShapeView = v6->_glowShapeView;
    v6->_glowShapeView = (UIView *)v12;

    v14 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v9, v10, v11);
    glowContainerView = v6->_glowContainerView;
    v6->_glowContainerView = v14;

    -[UIView addSubview:](v6->_glowContainerView, "addSubview:", v6->_glowShapeView);
    v16 = -[UIDictationGlowEffect initWithView:]([UIDictationGlowEffect alloc], "initWithView:", v6->_glowShapeView);
    glowEffect = v6->_glowEffect;
    v6->_glowEffect = v16;

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cursorGlowBlurRadius");
    -[UIDictationGlowEffect setBlurRadius:](v6->_glowEffect, "setBlurRadius:");

    -[UIView setHidden:](v6->_glowContainerView, "setHidden:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_cursorShapeView);
    objc_msgSend(WeakRetained, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cursorGlowAlphaMin");
    objc_msgSend(v20, "colorWithAlphaComponent:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationGlowEffect setTintColor:](v6->_glowEffect, "setTintColor:", v22);

    -[_UITextCursorDictationAnimation setAnimatedCursorShapeBounds:](v6, "setAnimatedCursorShapeBounds:", v8, v9, v10, v11);
    -[_UITextCursorDictationAnimation cursorShapeDidChange](v6, "cursorShapeDidChange");
  }

  return v6;
}

- (void)setNeedsInitialDictationAnimation
{
  self->_needsInitialDictationAnimation = 1;
}

- (void)cursorShapeDidChange
{
  UIView **p_cursorShapeView;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  CGRect v11;
  CGRect v12;

  p_cursorShapeView = &self->_cursorShapeView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
  objc_msgSend(WeakRetained, "frame");
  -[UIView setFrame:](self->_glowShapeView, "setFrame:");

  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cursorGlowBorderPadding");
  v7 = v6;

  if (v7 > 0.0)
  {
    v8 = objc_loadWeakRetained((id *)p_cursorShapeView);
    objc_msgSend(v8, "frame");
    v12 = CGRectInset(v11, v7 * -0.5, v7 * -0.5);
    -[UIView setFrame:](self->_glowShapeView, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);

  }
  v10 = objc_loadWeakRetained((id *)p_cursorShapeView);
  objc_msgSend(v10, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_glowShapeView, "setBackgroundColor:", v9);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _UITextCursorDictationAnimation *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  CGRect v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;

  v3 = a3;
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pulseAnimationEnabled");

  if (v6 && self->_enabled != v3)
  {
    self->_enabled = v3;
    -[_UITextCursorDictationAnimation _setCursorGlowEffectEnabled:](self, "_setCursorGlowEffectEnabled:", v3);
    if (v3)
    {
      if (self->_needsInitialDictationAnimation)
      {
        v7 = objc_loadWeakRetained((id *)&self->_cursorView);
        objc_msgSend(v7, "bounds");
        objc_msgSend(v7, "_cursorShapeRectForBounds:");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        memset(&v22, 0, sizeof(v22));
        CGAffineTransformMakeScale(&v22, (v13 + 2.0) / v13, (v15 + 7.0) / v15);
        v21 = v22;
        v23.origin.x = v9;
        v23.origin.y = v11;
        v23.size.width = v13;
        v23.size.height = v15;
        v24 = CGRectApplyAffineTransform(v23, &v21);
        v18[4] = self;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke;
        v19[3] = &unk_1E16B20D8;
        v20 = v24;
        v19[4] = self;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_2;
        v18[3] = &unk_1E16B3FD8;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v19, v18, 0.175, 0.0);
        return;
      }
      v16 = self;
      v17 = 1;
    }
    else
    {
      v16 = self;
      v17 = 0;
    }
    -[_UITextCursorDictationAnimation _setSoundReactiveCursorEnabled:](v16, "_setSoundReactiveCursorEnabled:", v17);
  }
}

- (void)_setCursorGlowEffectEnabled:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UIDictationGlowEffect *glowEffect;
  void *v13;
  double v14;
  id v15;
  void *v16;
  id v17;

  if (a3)
  {
    -[_UITextCursorDictationAnimation cursorView](self, "cursorView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_glowContainerView);

    -[UIView setHidden:](self->_glowContainerView, "setHidden:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    objc_msgSend(WeakRetained, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cursorGlowAlphaMin");
    objc_msgSend(v6, "colorWithAlphaComponent:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationGlowEffect setTintColor:](self->_glowEffect, "setTintColor:", v8);

    v9 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    objc_msgSend(v9, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cursorGlowAlphaMax");
    objc_msgSend(v10, "colorWithAlphaComponent:");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    glowEffect = self->_glowEffect;
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pulseDuration");
    -[UIDictationGlowEffect setTintColor:animated:duration:autoreverses:repeatCount:](glowEffect, "setTintColor:animated:duration:autoreverses:repeatCount:", v17, 1, 1, v14 * 0.5, 3.40282347e38);

  }
  else
  {
    v15 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    objc_msgSend(v15, "tintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationGlowEffect setTintColor:](self->_glowEffect, "setTintColor:", v16);

    -[UIView removeFromSuperview](self->_glowContainerView, "removeFromSuperview");
  }
}

- (void)_setSoundReactiveCursorEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  _UIDictationAudioLevelSmoother *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIDictationAudioLevelSmoother *v13;
  _UIDictationAudioLevelSmoother *levelSmoother;
  void *v15;
  CADisplayLink *v16;
  CADisplayLink *soundReactiveCursorDisplayLink;
  void *v18;
  double v19;
  CADisplayLink *v20;
  void *v21;
  CADisplayLink *v22;
  _DWORD v23[2];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "soundReactiveCursorEnabled");

  if (v6 && self->_soundReactiveCursorEnabled != v3)
  {
    self->_soundReactiveCursorEnabled = v3;
    _UIDictationControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v3;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Dictation sound reactive cursor is enabled(%d)", (uint8_t *)v23, 8u);
    }

    if (v3)
    {
      if (!self->_levelSmoother)
      {
        v8 = [_UIDictationAudioLevelSmoother alloc];
        LODWORD(v9) = -1032847360;
        LODWORD(v10) = 1051931443;
        LODWORD(v11) = 1063675494;
        LODWORD(v12) = -10.0;
        v13 = -[_UIDictationAudioLevelSmoother initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:](v8, "initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:", 5, v9, v12, v10, v11);
        levelSmoother = self->_levelSmoother;
        self->_levelSmoother = v13;

      }
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v16 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      soundReactiveCursorDisplayLink = self->_soundReactiveCursorDisplayLink;
      self->_soundReactiveCursorDisplayLink = v16;

      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "audioPollingRate");
      -[CADisplayLink setPreferredFramesPerSecond:](self->_soundReactiveCursorDisplayLink, "setPreferredFramesPerSecond:", (uint64_t)v19);

      v20 = self->_soundReactiveCursorDisplayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v20, "addToRunLoop:forMode:", v21, *MEMORY[0x1E0C99860]);

      self->_animationStartTime = CACurrentMediaTime();
    }
    else
    {
      -[CADisplayLink invalidate](self->_soundReactiveCursorDisplayLink, "invalidate");
      v22 = self->_soundReactiveCursorDisplayLink;
      self->_soundReactiveCursorDisplayLink = 0;

      -[_UITextCursorDictationAnimation setAnimatedCursorShapeBounds:](self, "setAnimatedCursorShapeBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
  }
}

- (void)_displayLinkFired:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  CFTimeInterval v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  int v25;
  int v26;
  double v27;
  float v28;
  float v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  _QWORD v46[5];
  CGAffineTransform v47;
  CGAffineTransform v48;

  v4 = a3;
  if (self->_soundReactiveCursorDisplayLink)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    objc_msgSend(WeakRetained, "bounds");
    v7 = v6;

    v8 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    objc_msgSend(v8, "bounds");
    v10 = v9;

    if (v7 > 0.0 && v10 > 0.0)
    {
      v11 = CACurrentMediaTime();
      v12 = v11 - self->_animationStartTime;
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pulseDuration");
      v15 = v14;

      if (v12 <= v15)
      {
        v18 = v15 - v12;
        if (v12 < v15 * 0.5)
          v18 = v12;
        v19 = -((v18 / (v15 * 0.5) + -2.0) * (v18 / (v15 * 0.5)));
        +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pulseWidthMaxBump");
        v17 = v19 * v21 / v10;

        +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pulseHeightMaxBump");
        v16 = v19 * v23 / v7;

      }
      else
      {
        self->_animationStartTime = v11;
        v16 = 0.0;
        v17 = 0.0;
      }
      v24 = objc_loadWeakRetained((id *)&self->_audioLevelProvider);
      objc_msgSend(v24, "audioLevel");
      v26 = v25;

      LODWORD(v27) = v26;
      -[_UIDictationAudioLevelSmoother smoothedLevelForMicPower:](self->_levelSmoother, "smoothedLevelForMicPower:", v27);
      v29 = v28 * 0.95 + 0.05;
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "audioHeightMaxBump");
      v32 = (v7 + v31) / v7;

      v33 = v29;
      v34 = v16 + (v32 + -1.0) * v33 + 1.0;
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "audioWidthMaxBump");
      v37 = (v10 + v36) / v10;

      v38 = v17 + (v37 + -1.0) * v33 + 1.0;
      if (v37 < v38)
        v38 = v37;
      if (v32 >= v34)
        v39 = v34;
      else
        v39 = v32;
      if (v38 > 0.0 && v39 > 0.0)
      {
        memset(&v48, 0, sizeof(v48));
        CGAffineTransformMakeScale(&v48, v38, v39);
        +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "audioScaleAnimationDampingRatio");
        v42 = v41;
        +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "audioScaleAnimationResponse");
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", v42, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46[1] = 3221225472;
        v47 = v48;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[2] = __53___UITextCursorDictationAnimation__displayLinkFired___block_invoke;
        v46[3] = &unk_1E16BF720;
        v46[4] = self;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v45, 0, v46, 0);

      }
    }
  }

}

- (UIView)cursorShapeView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cursorShapeView);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIStandardTextCursorView)cursorView
{
  return (UIStandardTextCursorView *)objc_loadWeakRetained((id *)&self->_cursorView);
}

- (void)setCursorView:(id)a3
{
  objc_storeWeak((id *)&self->_cursorView, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider
{
  return (_UIStandardTextCursorViewAudioLevelProvider *)objc_loadWeakRetained((id *)&self->_audioLevelProvider);
}

- (void)setAudioLevelProvider:(id)a3
{
  objc_storeWeak((id *)&self->_audioLevelProvider, a3);
}

- (CGRect)animatedCursorShapeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_animatedCursorShapeBounds.origin.x;
  y = self->_animatedCursorShapeBounds.origin.y;
  width = self->_animatedCursorShapeBounds.size.width;
  height = self->_animatedCursorShapeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnimatedCursorShapeBounds:(CGRect)a3
{
  self->_animatedCursorShapeBounds = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioLevelProvider);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_cursorView);
  objc_destroyWeak((id *)&self->_cursorShapeView);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_glowEffect, 0);
  objc_storeStrong((id *)&self->_glowShapeView, 0);
  objc_storeStrong((id *)&self->_glowContainerView, 0);
  objc_storeStrong((id *)&self->_soundReactiveCursorDisplayLink, 0);
}

@end
