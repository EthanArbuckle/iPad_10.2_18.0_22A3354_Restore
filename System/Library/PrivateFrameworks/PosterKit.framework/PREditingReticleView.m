@implementation PREditingReticleView

+ (double)borderColor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRReticleBorderColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E21DD218;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

+ (double)minBorderColor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRReticleMinBorderColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E21DD228;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

+ (double)maxBorderColor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRReticleMaxBorderColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E21DD238;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

+ (double)vibrancyStrength
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRReticleVibrancyStrength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E21DD248;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

+ (id)reticleVibrancyForVibrancyConfiguration:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3658];
  +[PREditingReticleView vibrancyStrength](PREditingReticleView, "vibrancyStrength");
  objc_msgSend(v4, "colorWithWhite:alpha:", 1.0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = (void *)objc_msgSend(v3, "copyWithEffectType:color:", 0, v6);
    v8 = (void *)objc_msgSend(v7, "copyWithGroupName:", 0);

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01958]), "initWithEffectType:backgroundType:color:groupName:", 0, 0, v6, 0);
  }

  return v8;
}

- (PREditingReticleView)init
{
  PREditingReticleView *v2;
  PREditingReticleView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UIView *outlineBorderView;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PREditingReticleView;
  v2 = -[PREditingReticleView init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PREditingReticleView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PREditingReticleView bounds](v3, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    outlineBorderView = v3->_outlineBorderView;
    v3->_outlineBorderView = (UIView *)v6;

    -[UIView setAutoresizingMask:](v3->_outlineBorderView, "setAutoresizingMask:", 18);
    -[UIView layer](v3->_outlineBorderView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3658];
    +[PREditingReticleView borderColor](PREditingReticleView, "borderColor");
    objc_msgSend(v9, "colorWithWhite:alpha:");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    -[UIView layer](v3->_outlineBorderView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 3.0);

    -[UIView layer](v3->_outlineBorderView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    v15 = 16.0;
    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v15 = 20.0;
    objc_msgSend(v12, "setCornerRadius:", v15);

    -[UIView layer](v3->_outlineBorderView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[PREditingReticleView addSubview:](v3, "addSubview:", v3->_outlineBorderView);
    -[PREditingReticleView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("posterboard-editing-reticle-view"));
  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[PREditingReticleView _startActiveAnimation](self, "_startActiveAnimation");
    else
      -[PREditingReticleView _stopActiveAnimation](self, "_stopActiveAnimation");
  }
}

- (void)setOutlineBorderCornerRadius:(double)a3
{
  id v4;

  if (self->_outlineBorderCornerRadius != a3)
  {
    self->_outlineBorderCornerRadius = a3;
    -[UIView layer](self->_outlineBorderView, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", a3);

  }
}

- (void)_startActiveAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float minimum;
  float maximum;
  float preferred;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  CAFrameRateRange v27;

  -[PREditingReticleView outlineBorderView](self, "outlineBorderView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3658];
  +[PREditingReticleView minBorderColor](PREditingReticleView, "minBorderColor");
  objc_msgSend(v2, "colorWithWhite:alpha:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3658];
  +[PREditingReticleView maxBorderColor](PREditingReticleView, "maxBorderColor");
  objc_msgSend(v4, "colorWithWhite:alpha:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CAFrameRateRangeMake(20.0, 30.0, 24.0);
  minimum = v27.minimum;
  maximum = v27.maximum;
  preferred = v27.preferred;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("borderColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", objc_msgSend(v10, "borderColor"));

  v11 = objc_retainAutorelease(v3);
  objc_msgSend(v9, "setToValue:", objc_msgSend(v11, "CGColor"));
  objc_msgSend(v9, "setDuration:", 0.5);
  v12 = *MEMORY[0x1E0CD2950];
  objc_msgSend(v9, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  *(float *)&v13 = minimum;
  *(float *)&v14 = maximum;
  *(float *)&v15 = preferred;
  objc_msgSend(v9, "setPreferredFrameRateRange:", v13, v14, v15);
  objc_msgSend(v26, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v9, CFSTR("pre-active animation"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("borderColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_retainAutorelease(v11);
  objc_msgSend(v17, "setFromValue:", objc_msgSend(v18, "CGColor"));
  v19 = objc_retainAutorelease(v5);
  objc_msgSend(v17, "setToValue:", objc_msgSend(v19, "CGColor"));
  LODWORD(v20) = 2139095040;
  objc_msgSend(v17, "setRepeatCount:", v20);
  objc_msgSend(v17, "setDuration:", 0.7);
  objc_msgSend(v17, "setAutoreverses:", 1);
  objc_msgSend(v17, "setBeginTime:", 0.5);
  objc_msgSend(v17, "setBeginTimeMode:", v12);
  *(float *)&v21 = minimum;
  *(float *)&v22 = maximum;
  *(float *)&v23 = preferred;
  objc_msgSend(v17, "setPreferredFrameRateRange:", v21, v22, v23);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v24);

  objc_msgSend(v26, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAnimation:forKey:", v17, CFSTR("active animation"));

}

- (void)_stopActiveAnimation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  CAFrameRateRange v13;

  -[PREditingReticleView outlineBorderView](self, "outlineBorderView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v12, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("borderColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", objc_msgSend(v6, "borderColor"));
  v8 = (void *)MEMORY[0x1E0DC3658];
  +[PREditingReticleView borderColor](PREditingReticleView, "borderColor");
  objc_msgSend(v8, "colorWithWhite:alpha:");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setToValue:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
  if (v10 == 0.0)
    v10 = 0.3;
  objc_msgSend(v7, "setDuration:", v10);
  v13 = CAFrameRateRangeMake(20.0, 30.0, 24.0);
  objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  objc_msgSend(v12, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v7, CFSTR("active animation"));

}

- (BOOL)isActive
{
  return self->_active;
}

- (double)outlineBorderCornerRadius
{
  return self->_outlineBorderCornerRadius;
}

- (UIView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyView, a3);
}

- (UIView)outlineBorderView
{
  return self->_outlineBorderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineBorderView, 0);
  objc_storeStrong((id *)&self->_emptyView, 0);
}

@end
