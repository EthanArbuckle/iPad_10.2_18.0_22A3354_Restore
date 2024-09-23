@implementation _UIBarCustomizationChicletAnchorView

- (_UIBarCustomizationChicletAnchorView)init
{
  _UIBarCustomizationChicletAnchorView *v2;
  UIView *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  v2 = -[UIView init](&v10, sel_init);
  if (v2)
  {
    v3 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 4.0, 4.0);
    -[_UIBarCustomizationChicletAnchorView setPositionAdaptorView:](v2, "setPositionAdaptorView:", v3);

    -[_UIBarCustomizationChicletAnchorView positionAdaptorView](v2, "positionAdaptorView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v2, "addSubview:", v4);

    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v5 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (v9 = _UIInternalPreference_BarCustomizationDebugEnabled,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_BarCustomizationDebugEnabled))
    {
      v6 = 0;
    }
    else
    {
      do
      {
        v6 = v5 < v9;
        if (v5 < v9)
          break;
        _UIInternalPreferenceSync(v5, &_UIInternalPreference_BarCustomizationDebugEnabled, (uint64_t)CFSTR("BarCustomizationDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v9 = _UIInternalPreference_BarCustomizationDebugEnabled;
      }
      while (v5 != _UIInternalPreference_BarCustomizationDebugEnabled);
    }
    if (byte_1EDDA7DE4)
      v7 = v6;
    else
      v7 = 0;
    -[_UIBarCustomizationChicletAnchorView setDebugUIEnabled:](v2, "setDebugUIEnabled:", v7);
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  -[UIView layoutSubviews](&v18, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v5 = v4 + v3 * 0.5;
  v8 = v7 + v6 * 0.5;
  -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v5, v8);

  -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v13 = v12 + v11 * 0.5;
  v16 = v15 + v14 * 0.5;
  -[_UIBarCustomizationChicletAnchorView chiclet](self, "chiclet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", v13, v16);

}

- (void)setChiclet:(id)a3
{
  _UIBarCustomizationChiclet *v5;
  _UIBarCustomizationChiclet **p_chiclet;
  _UIBarCustomizationChiclet *chiclet;
  void *v8;
  _UIBarCustomizationChiclet *v9;

  v5 = (_UIBarCustomizationChiclet *)a3;
  p_chiclet = &self->_chiclet;
  chiclet = self->_chiclet;
  v9 = v5;
  if (chiclet != v5)
  {
    -[_UIBarCustomizationChiclet setAnchorView:](chiclet, "setAnchorView:", 0);
    objc_storeStrong((id *)&self->_chiclet, a3);
    if (*p_chiclet)
    {
      -[_UIBarCustomizationChiclet setAnchorView:](*p_chiclet, "setAnchorView:", self);
      -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_chiclet);

      -[UIView sizeToFit](self, "sizeToFit");
    }
  }

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", a3 == 1);
  }
}

- (BOOL)isUserInteractionEnabled
{
  objc_super v4;

  if (-[_UIBarCustomizationChicletAnchorView state](self, "state"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  return -[UIView isUserInteractionEnabled](&v4, sel_isUserInteractionEnabled);
}

- (void)setContentPadding:(double)a3
{
  if (self->_contentPadding != a3)
  {
    self->_contentPadding = a3;
    -[UIView sizeToFit](self, "sizeToFit");
    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setJiggling:(BOOL)a3
{
  int v3;
  int jiggling;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;

  v3 = a3;
  -[_UIBarCustomizationChicletAnchorView chiclet](self, "chiclet");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "fixed") & 1) == 0)
  {
    jiggling = self->_jiggling;

    if (jiggling == v3)
      return;
    self->_jiggling = v3;
    -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_jiggling)
    {
      -[_UIBarCustomizationChicletAnchorView chiclet](self, "chiclet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v8 = 60.0 / CGRectGetWidth(v13);

      if (v8 > 1.0)
        v8 = 1.0;
      objc_msgSend((id)objc_opt_class(), "_jitterRotationAnimationWithStrength:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_jitterXTranslationAnimationWithStrength:", 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_jitterYTranslationAnimationWithStrength:", 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("RotationJitterAnimation"));
      objc_msgSend(v12, "addAnimation:forKey:", v10, CFSTR("XTranslationJitterAnimation"));
      objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("YTranslationJitterAnimation"));

    }
    else
    {
      objc_msgSend(v12, "removeAllAnimations");
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;

  -[_UIBarCustomizationChicletAnchorView chiclet](self, "chiclet", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v11);
  -[_UIBarCustomizationChicletAnchorView contentPadding](self, "contentPadding");
  v7 = Width + v6;

  v8 = 100.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[_UIBarCustomizationChicletAnchorView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    -[_UIBarCustomizationChicletAnchorView chiclet](self, "chiclet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "fixed") & 1) == 0)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
      objc_msgSend(v9, "hitTest:withEvent:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIView frame](self, "frame");
  v5 = v4;
  -[UIView frame](self, "frame");
  v7 = v6;
  -[UIView frame](self, "frame");
  v9 = v8;
  -[UIView frame](self, "frame");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%g %g; %g %g)"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIBarCustomizationChicletAnchorView state](self, "state");
  v13 = CFSTR("Dragging");
  if (v12 != 1)
    v13 = 0;
  if (v12)
    v14 = v13;
  else
    v14 = CFSTR("Default");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; frame = %@; state = %@>"),
    objc_opt_class(),
    self,
    v11,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterXTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.134);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterYTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.142);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterRotationAnimationWithAmount:", a3 * 0.03);
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.128);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (void)setDebugUIEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_debugUIEnabled != a3)
  {
    self->_debugUIEnabled = a3;
    if (a3)
    {
      +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", (double)arc4random_uniform(0x167u) / 359.0, 0.6, 0.9, 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBorderWidth:", 1.0);

      v6 = objc_retainAutorelease(v4);
      v7 = objc_msgSend(v6, "CGColor");
      -[UIView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderColor:", v7);

      -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderWidth:", 1.0);

      v15 = objc_retainAutorelease(v6);
      v11 = objc_msgSend(v15, "CGColor");
      -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", v11);

    }
    else
    {
      -[UIView layer](self, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBorderWidth:", 0.0);

      -[_UIBarCustomizationChicletAnchorView positionAdaptorView](self, "positionAdaptorView");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderWidth:", 0.0);
    }

  }
}

- (int64_t)state
{
  return self->_state;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (BOOL)jiggling
{
  return self->_jiggling;
}

- (_UIBarCustomizationChiclet)chiclet
{
  return self->_chiclet;
}

- (UIView)positionAdaptorView
{
  return self->_positionAdaptorView;
}

- (void)setPositionAdaptorView:(id)a3
{
  objc_storeStrong((id *)&self->_positionAdaptorView, a3);
}

- (BOOL)debugUIEnabled
{
  return self->_debugUIEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionAdaptorView, 0);
  objc_storeStrong((id *)&self->_chiclet, 0);
}

@end
