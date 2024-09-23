@implementation UIStandardTextCursorView

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStandardTextCursorView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextCursorDictationAnimation setTintColor:](self->_dictationAnimation, "setTintColor:", v3);

}

- (void)resetBlinkAnimation
{
  -[_UITextCursorBlinkAnimation reset](self->_blinkAnimation, "reset");
}

- (void)_setShapeScale:(double)a3
{
  self->_shapeScale = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UIStandardTextCursorView)initWithFrame:(CGRect)a3
{
  UIStandardTextCursorView *v3;
  void *v4;
  UIView *v5;
  uint64_t v6;
  UIView *cursorShapeView;
  _UIAssertionController *v8;
  _UIAssertionController *assertionController;
  NSMutableSet *v10;
  NSMutableSet *cursorAnimations;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIStandardTextCursorView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v3, "setTintColor:", v4);

    v3->_shapeScale = 1.0;
    v5 = [UIView alloc];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    cursorShapeView = v3->_cursorShapeView;
    v3->_cursorShapeView = (UIView *)v6;

    -[UIView addSubview:](v3, "addSubview:", v3->_cursorShapeView);
    v8 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v3);
    assertionController = v3->_assertionController;
    v3->_assertionController = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cursorAnimations = v3->_cursorAnimations;
    v3->_cursorAnimations = v10;

  }
  return v3;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStandardTextCursorView;
  -[UIView setHidden:](&v3, sel_setHidden_, a3);
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
  _UITextCursorDictationAnimation *dictationAnimation;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  void *v22;
  _QWORD v23[8];
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)UIStandardTextCursorView;
  -[UIView layoutSubviews](&v24, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIStandardTextCursorView _cursorShapeRectForBounds:](self, "_cursorShapeRectForBounds:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  dictationAnimation = self->_dictationAnimation;
  if (dictationAnimation)
  {
    -[_UITextCursorDictationAnimation animatedCursorShapeBounds](dictationAnimation, "animatedCursorShapeBounds");
    if (!CGRectIsEmpty(v25))
    {
      -[_UITextCursorDictationAnimation animatedCursorShapeBounds](self->_dictationAnimation, "animatedCursorShapeBounds");
      v4 = v12;
      v6 = v13;
      v8 = v14;
      v10 = v15;
    }
  }
  -[UIView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  -[UIView setBounds:](self->_cursorShapeView, "setBounds:", 0.0, 0.0, v8, v10);
  -[UIView setCenter:](self->_cursorShapeView, "setCenter:", v4 + v17 * 0.5, v6 + v19 * 0.5);
  -[UIStandardTextCursorView _fillColorForEffects](self, "_fillColorForEffects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_cursorShapeView, "setBackgroundColor:", v20);

  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v21 = CGRectGetWidth(v26) * 0.5;
  -[UIView layer](self->_cursorShapeView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v23 = v21;
  *(CGFloat *)&v23[1] = v21;
  *(CGFloat *)&v23[2] = v21;
  *(CGFloat *)&v23[3] = v21;
  *(CGFloat *)&v23[4] = v21;
  *(CGFloat *)&v23[5] = v21;
  *(CGFloat *)&v23[6] = v21;
  *(CGFloat *)&v23[7] = v21;
  objc_msgSend(v22, "setCornerRadii:", v23);

  -[NSMutableSet makeObjectsPerformSelector:](self->_cursorAnimations, "makeObjectsPerformSelector:", sel_cursorShapeDidChange);
}

- ($6269591C569AE6F7CC7995ADEDD8665A)_shadowSpecForEffects
{
  if (BYTE3(self[11].var3.width))
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.274509804, 0.431372549, 0.725490196, 1.0);
    self = ($6269591C569AE6F7CC7995ADEDD8665A *)objc_claimAutoreleasedReturnValue();
    retstr->var0 = self;
    *(_OWORD *)&retstr->var1 = xmmword_18667D110;
    retstr->var3 = (CGSize)xmmword_18667D120;
  }
  else
  {
    retstr->var3.height = 0.0;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return self;
}

- (id)_fillColorForEffects
{
  if (self->_ghostEffectEnabled)
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_272);
  else
    -[UIView tintColor](self, "tintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBlinking:(BOOL)a3
{
  _BOOL8 v3;
  _UITextCursorBlinkAnimation *v5;
  _UITextCursorBlinkAnimation *blinkAnimation;

  v3 = a3;
  self->_blinking = a3;
  if (a3 && !self->_blinkAnimation)
  {
    v5 = -[_UITextCursorBlinkAnimation initWithCursorShapeView:]([_UITextCursorBlinkAnimation alloc], "initWithCursorShapeView:", self->_cursorShapeView);
    blinkAnimation = self->_blinkAnimation;
    self->_blinkAnimation = v5;

    -[NSMutableSet addObject:](self->_cursorAnimations, "addObject:", self->_blinkAnimation);
  }
  -[_UITextCursorBlinkAnimation setEnabled:](self->_blinkAnimation, "setEnabled:", v3);
}

- (BOOL)isGhostEffectEnabled
{
  return self->_ghostEffectEnabled;
}

- (BOOL)isBlinking
{
  return self->_blinking;
}

id __48__UIStandardTextCursorView__fillColorForEffects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = 0.0;
  if (v2 == 2)
    v3 = 1.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, 0.3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_cursorShapeRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v19 = *MEMORY[0x1E0C9D538];
  v9 = CGRectGetWidth(a3);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v10 = CGRectGetHeight(v20);
  if (v9 >= v10)
    v11 = v9;
  else
    v11 = v10;
  v12 = self->_shapeScale + self->_shapeScale;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v13 = CGRectGetWidth(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectGetHeight(v22);
  if (v13 <= v14)
    v15 = v12;
  else
    v15 = v11;
  if (v13 <= v14)
    v16 = v11;
  else
    v16 = v12;
  v17 = v19;
  v18 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_updateShadow
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[UIStandardTextCursorView _shadowSpecForEffects](self, "_shadowSpecForEffects");
  v3 = objc_msgSend(0, "CGColor");
  -[UIView layer](self->_cursorShapeView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v3);

  -[UIView layer](self->_cursorShapeView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);

  -[UIView layer](self->_cursorShapeView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", 0.0);

  -[UIView layer](self->_cursorShapeView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = 0.0;
  objc_msgSend(v7, "setShadowOpacity:", v8);

}

- (void)setFloatingEffectEnabled:(BOOL)a3
{
  self->_floatingEffectEnabled = a3;
  -[UIStandardTextCursorView _updateShadow](self, "_updateShadow");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGhostEffectEnabled:(BOOL)a3
{
  self->_ghostEffectEnabled = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createFloatingCursorView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)objc_opt_class());
  -[UIView frame](self, "frame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v4, "setFloatingEffectEnabled:", 1);
  -[UIStandardTextCursorView _shapeScale](self, "_shapeScale");
  objc_msgSend(v4, "_setShapeScale:");
  -[UIView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_storeWeak((id *)&self->_trackedFloatingCursorView, v4);
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)_dictationAnimation
{
  _UITextCursorDictationAnimation *dictationAnimation;
  _UITextCursorDictationAnimation *v4;
  _UITextCursorDictationAnimation *v5;

  dictationAnimation = self->_dictationAnimation;
  if (!dictationAnimation)
  {
    v4 = -[_UITextCursorDictationAnimation initWithCursorShapeView:]([_UITextCursorDictationAnimation alloc], "initWithCursorShapeView:", self->_cursorShapeView);
    v5 = self->_dictationAnimation;
    self->_dictationAnimation = v4;

    -[_UITextCursorDictationAnimation setCursorView:](self->_dictationAnimation, "setCursorView:", self);
    -[NSMutableSet addObject:](self->_cursorAnimations, "addObject:", self->_dictationAnimation);
    dictationAnimation = self->_dictationAnimation;
  }
  return dictationAnimation;
}

- (void)setGlowEffectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UITextCursorDictationAnimation *dictationAnimation;

  v3 = a3;
  self->_glowEffectEnabled = a3;
  -[UIStandardTextCursorView _dictationAnimation](self, "_dictationAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  if (!v3)
  {
    dictationAnimation = self->_dictationAnimation;
    self->_dictationAnimation = 0;

  }
}

- (void)_setNeedsInitialDictationAnimation
{
  id v2;

  -[UIStandardTextCursorView _dictationAnimation](self, "_dictationAnimation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsInitialDictationAnimation");

}

- (void)setAudioLevelProvider:(id)a3
{
  _UIStandardTextCursorViewAudioLevelProvider **p_audioLevelProvider;
  id v5;
  id v6;

  p_audioLevelProvider = &self->_audioLevelProvider;
  v5 = a3;
  objc_storeWeak((id *)p_audioLevelProvider, v5);
  -[UIStandardTextCursorView _dictationAnimation](self, "_dictationAnimation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioLevelProvider:", v5);

}

- (BOOL)_trackingFloatingCursorView
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_trackedFloatingCursorView);
  objc_msgSend(WeakRetained, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UIView)originView
{
  UIStandardTextCursorView *WeakRetained;

  if (-[UIStandardTextCursorView _trackingFloatingCursorView](self, "_trackingFloatingCursorView"))
    WeakRetained = (UIStandardTextCursorView *)objc_loadWeakRetained((id *)&self->_trackedFloatingCursorView);
  else
    WeakRetained = self;
  return (UIView *)WeakRetained;
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $1B3FB7A12BCE93AE4CB0A35ACEA563C0 *result;

  -[UIView bounds](self, "bounds");
  -[UIStandardTextCursorView _cursorShapeRectForBounds:](self, "_cursorShapeRectForBounds:");
  v6 = v5;
  v8 = v7;
  -[UIView bounds](self, "bounds");
  retstr->var0.x = v10 + v9 * 0.5;
  retstr->var0.y = v12 + v11 * 0.5;
  retstr->var1.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  retstr->var1.size.width = v6;
  retstr->var1.size.height = v8;
  retstr->var2 = v6 * 0.5;
  -[UIView tintColor](self, "tintColor");
  result = ($1B3FB7A12BCE93AE4CB0A35ACEA563C0 *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow
{
  retstr->var3.height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)obtainBlinkAnimationSuppressionAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 231, 0, a3, 1);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 != 231 || -[UIStandardTextCursorView isBlinking](self, "isBlinking");
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 231)
    -[UIStandardTextCursorView setBlinking:](self, "setBlinking:", a3);
}

- (double)_shapeScale
{
  return self->_shapeScale;
}

- (BOOL)hiddenForLoupeAnimation
{
  return self->_hiddenForLoupeAnimation;
}

- (BOOL)isGlowEffectEnabled
{
  return self->_glowEffectEnabled;
}

- (BOOL)isFloatingEffectEnabled
{
  return self->_floatingEffectEnabled;
}

- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider
{
  return (_UIStandardTextCursorViewAudioLevelProvider *)objc_loadWeakRetained((id *)&self->_audioLevelProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioLevelProvider);
  objc_destroyWeak((id *)&self->_trackedFloatingCursorView);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_cursorAnimations, 0);
  objc_storeStrong((id *)&self->_dictationAnimation, 0);
  objc_storeStrong((id *)&self->_blinkAnimation, 0);
  objc_storeStrong((id *)&self->_cursorShapeView, 0);
}

@end
