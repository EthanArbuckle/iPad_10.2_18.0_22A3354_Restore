@implementation _UITextCursorTrailingGlowView

- (void)setTransitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (_UITextCursorTrailingGlowView)initWithFrame:(CGRect)a3
{
  _UITextCursorTrailingGlowView *v3;
  _UITextCursorTrailingGlowView *v4;
  _UIShapeView *v5;
  uint64_t v6;
  _UIShapeView *shapeView;
  UIDictationGlowEffect *v8;
  UIDictationGlowEffect *dictationGlowEffect;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UITextCursorTrailingGlowView;
  v3 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = [_UIShapeView alloc];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    shapeView = v4->_shapeView;
    v4->_shapeView = (_UIShapeView *)v6;

    -[UIView addSubview:](v4, "addSubview:", v4->_shapeView);
    v8 = -[UIDictationGlowEffect initWithView:]([UIDictationGlowEffect alloc], "initWithView:", v4);
    dictationGlowEffect = v4->_dictationGlowEffect;
    v4->_dictationGlowEffect = v8;

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingGlowBlurRadius");
    -[UIDictationGlowEffect setBlurRadius:](v4->_dictationGlowEffect, "setBlurRadius:");

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingGlowAlpha");
    -[UIView setAlpha:](v4, "setAlpha:");

    -[UIView tintColor](v4, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView alpha](v4, "alpha");
    objc_msgSend(v12, "colorWithAlphaComponent:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationGlowEffect setTintColor:](v4->_dictationGlowEffect, "setTintColor:", v13);

  }
  return v4;
}

- (void)setTrailingAnimationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  CABasicAnimation *animation;

  v3 = a3;
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trailAnimationEnabled");

  if (v6)
  {
    self->_trailingAnimationEnabled = v3;
    if (v3)
    {
      if (-[UIView isHidden](self, "isHidden"))
        -[UIView setHidden:](self, "setHidden:", 0);
      -[_UITextCursorTrailingGlowView _updateShapeAndAnimate](self, "_updateShapeAndAnimate");
    }
    else if (self->_animation)
    {
      -[UIView layer](self->_shapeView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("mask animation"));

      animation = self->_animation;
      self->_animation = 0;

      -[UIView setHidden:](self, "setHidden:", 1);
    }
  }
}

- (void)_updateShapeAndAnimate
{
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (self->_needsToUpdateAnimation)
  {
    self->_needsToUpdateAnimation = 0;
    -[UIView bounds](self, "bounds");
    -[UIView bounds](self, "bounds");
    -[UIView bounds](self, "bounds");
    v4 = v3;
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_shapeView, "setFrame:", 0.0, 0.0, v4);
    -[UIView tintColor](self, "tintColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[_UIShapeView shapeLayer](self->_shapeView, "shapeLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillColor:", v6);

    -[_UITextCursorTrailingGlowView _animate](self, "_animate");
  }
}

- (void)_animate
{
  double x;
  CGFloat y;
  double width;
  double height;
  double MaxX;
  CABasicAnimation *v8;
  CABasicAnimation *animation;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  float v16;
  void *v17;
  double v18;
  CAFrameRateRange v19;
  CGRect v20;

  -[UIView bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MaxX = CGRectGetMaxX(v20);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
  v8 = (CABasicAnimation *)objc_claimAutoreleasedReturnValue();
  animation = self->_animation;
  self->_animation = v8;

  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingGlowDuration");
  -[CABasicAnimation setDuration:](self->_animation, "setDuration:");

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABasicAnimation setTimingFunction:](self->_animation, "setTimingFunction:", v11);

  -[CABasicAnimation setFromValue:](self->_animation, "setFromValue:", -[_UITextCursorTrailingGlowView pathForRect:](self, "pathForRect:", x, y, width, height));
  -[CABasicAnimation setToValue:](self->_animation, "setToValue:", -[_UITextCursorTrailingGlowView pathForRect:](self, "pathForRect:", MaxX, y, 0.0, height));
  -[CABasicAnimation setDelegate:](self->_animation, "setDelegate:", self);
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailFrameRate");
  *(float *)&y = v13;
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailFrameRate");
  v16 = v15;
  v19 = CAFrameRateRangeMake(30.0, *(float *)&y, v16);
  -[CABasicAnimation setPreferredFrameRateRange:](self->_animation, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);

  -[_UIShapeView shapeLayer](self->_shapeView, "shapeLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", self->_animation, CFSTR("mask animation"));

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_animationStartTime = v18;
}

- (CGPath)pathForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double MinX;
  double v15;
  double MaxX;
  double v17;
  id v18;
  CGPath *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headHeight");
  v10 = (1.0 - v9) * 0.5;

  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tailHeight");
  v13 = (1.0 - v12) * 0.5;

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMaxY(v22) * (1.0 - v13));
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = CGRectGetMinX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", v15, v13 * CGRectGetMaxY(v24));
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, v10 * CGRectGetMaxY(v26));
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v17 = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", v17, (1.0 - v10) * CGRectGetMaxY(v28));
  objc_msgSend(v7, "closePath");
  v18 = objc_retainAutorelease(v7);
  v19 = (CGPath *)objc_msgSend(v18, "CGPath");

  return v19;
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextCursorTrailingGlowView;
  v4 = a3;
  -[UIView setTintColor:](&v7, sel_setTintColor_, v4);
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingGlowAlpha");
  objc_msgSend(v4, "colorWithAlphaComponent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationGlowEffect setTintColor:](self->_dictationGlowEffect, "setTintColor:", v6);
}

- (void)cursorDidMoveToFrame:(CGRect)a3 fromPreviousFrame:(CGRect)a4 isNewLine:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  if (a5 && self->_animation)
    -[_UITextCursorTrailingGlowView setTrailingAnimationEnabled:](self, "setTrailingAnimationEnabled:", 0);
  if (v11 == y)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v21.origin.x = v12;
    v21.origin.y = v11;
    v21.size.width = v10;
    v21.size.height = v9;
    if (!CGRectEqualToRect(v18, v21) && x < v12)
    {
      if (self->_animation)
      {
        -[_UITextCursorTrailingGlowView estimatedCurrentFrame](self, "estimatedCurrentFrame");
        x = v14;
        y = v15;
        width = v16;
        height = v17;
      }
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v22.origin.x = v12;
      v22.origin.y = v11;
      v22.size.width = v10;
      v22.size.height = v9;
      v20 = CGRectUnion(v19, v22);
      -[UIView setFrame:](self, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
      self->_needsToUpdateAnimation = 1;
    }
  }
}

- (CGRect)estimatedCurrentFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  float v17;
  double v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v11;
  -[CABasicAnimation duration](self->_animation, "duration");
  v14 = fmax(fmin((v12 - self->_animationStartTime) / v13, 1.0), 0.0);
  -[CABasicAnimation timingFunction](self->_animation, "timingFunction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = v14;
  objc_msgSend(v15, "_solveForInput:", v16);
  v18 = v17;

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v20 = MaxX * v18 + (1.0 - v18) * CGRectGetMinX(v25);
  v21 = MaxX - v20;
  v22 = v6;
  v23 = v10;
  result.size.height = v23;
  result.size.width = v21;
  result.origin.y = v22;
  result.origin.x = v20;
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  CABasicAnimation *animation;
  void *v6;
  void (**v7)(void);

  if (a4)
  {
    animation = self->_animation;
    self->_animation = 0;

    -[UIView setHidden:](self, "setHidden:", 1);
    -[_UITextCursorTrailingGlowView transitionBlock](self, "transitionBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UITextCursorTrailingGlowView transitionBlock](self, "transitionBlock");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (BOOL)isTrailingAnimationEnabled
{
  return self->_trailingAnimationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_dictationGlowEffect, 0);
  objc_storeStrong((id *)&self->_shapeView, 0);
}

@end
