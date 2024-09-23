@implementation STUIStatusBarActivityIconView

- (void)_setupRingingLayersForStyleAttributes:(id)a3
{
  double v4;
  CAShapeLayer *v5;
  CAShapeLayer *innerRingShapeLayer;
  CGPath *Mutable;
  CGPath *v8;
  CGPath *v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  CAShapeLayer *v15;
  CAShapeLayer *outerRingShapeLayer;
  CGPath *v17;
  CGPath *v18;
  CGPath *v19;
  double v20;
  id v21;
  id v22;
  id v23;

  if (!self->_innerRingShapeLayer)
  {
    objc_msgSend(a3, "iconScale");
    self->_ringingIconScale = v4;
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    innerRingShapeLayer = self->_innerRingShapeLayer;
    self->_innerRingShapeLayer = v5;

    Mutable = CGPathCreateMutable();
    v8 = CGPathCreateMutable();
    CGPathAddArc(v8, 0, self->_ringingIconScale * 9.0, 0.0, self->_ringingIconScale * 4.0, 0.785398163, -0.785398163, 1);
    CGPathAddPath(Mutable, 0, v8);
    CGPathRelease(v8);
    v9 = CGPathCreateMutable();
    CGPathAddArc(v9, 0, self->_ringingIconScale * -9.0, 0.0, self->_ringingIconScale * 4.0, 3.92699082, 2.35619449, 1);
    CGPathAddPath(Mutable, 0, v9);
    CGPathRelease(v9);
    -[CAShapeLayer setPath:](self->_innerRingShapeLayer, "setPath:", Mutable);
    -[CAShapeLayer setLineWidth:](self->_innerRingShapeLayer, "setLineWidth:", 0.0);
    LODWORD(v10) = 0;
    -[CAShapeLayer setOpacity:](self->_innerRingShapeLayer, "setOpacity:", v10);
    v11 = *MEMORY[0x1E0CD3010];
    -[CAShapeLayer setLineCap:](self->_innerRingShapeLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.75);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_innerRingShapeLayer, "setFillColor:", objc_msgSend(v13, "CGColor"));

    CGPathRelease(Mutable);
    -[STUIStatusBarActivityIconView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_innerRingShapeLayer);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v15 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    outerRingShapeLayer = self->_outerRingShapeLayer;
    self->_outerRingShapeLayer = v15;

    v17 = CGPathCreateMutable();
    v18 = CGPathCreateMutable();
    CGPathAddArc(v18, 0, self->_ringingIconScale * 11.0, 0.0, self->_ringingIconScale * 6.5, 0.785398163, -0.785398163, 1);
    CGPathAddPath(v17, 0, v18);
    CGPathRelease(v18);
    v19 = CGPathCreateMutable();
    CGPathAddArc(v19, 0, self->_ringingIconScale * -11.0, 0.0, self->_ringingIconScale * 6.5, 3.92699082, 2.35619449, 1);
    CGPathAddPath(v17, 0, v19);
    CGPathRelease(v19);
    -[CAShapeLayer setPath:](self->_outerRingShapeLayer, "setPath:", v17);
    -[CAShapeLayer setLineWidth:](self->_outerRingShapeLayer, "setLineWidth:", 0.0);
    LODWORD(v20) = 0;
    -[CAShapeLayer setOpacity:](self->_outerRingShapeLayer, "setOpacity:", v20);
    -[CAShapeLayer setLineCap:](self->_outerRingShapeLayer, "setLineCap:", v11);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", objc_msgSend(v21, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_outerRingShapeLayer, "setFillColor:", objc_msgSend(v22, "CGColor"));

    CGPathRelease(v17);
    -[STUIStatusBarActivityIconView layer](self, "layer");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", self->_outerRingShapeLayer);

  }
}

- (void)_teardownRingingLayers
{
  CAShapeLayer *innerRingShapeLayer;
  CAShapeLayer *v4;
  CAShapeLayer *outerRingShapeLayer;

  innerRingShapeLayer = self->_innerRingShapeLayer;
  if (innerRingShapeLayer)
  {
    -[CAShapeLayer removeFromSuperlayer](innerRingShapeLayer, "removeFromSuperlayer");
    v4 = self->_innerRingShapeLayer;
    self->_innerRingShapeLayer = 0;

    -[CAShapeLayer removeFromSuperlayer](self->_outerRingShapeLayer, "removeFromSuperlayer");
    outerRingShapeLayer = self->_outerRingShapeLayer;
    self->_outerRingShapeLayer = 0;

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarActivityIconView;
  -[STUIStatusBarActivityIconView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[STUIStatusBarActivityIconView bounds](self, "bounds");
  UIRectGetCenter();
  -[CAShapeLayer setPosition:](self->_innerRingShapeLayer, "setPosition:");
  -[STUIStatusBarActivityIconView bounds](self, "bounds");
  UIRectGetCenter();
  -[CAShapeLayer setPosition:](self->_outerRingShapeLayer, "setPosition:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  double ringingIconScale;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (self->_ringing)
  {
    ringingIconScale = self->_ringingIconScale;
    objc_msgSend(v4, "iconScale");
    if (ringingIconScale != v7)
    {
      v8 = self->_ringingIconScale;
      objc_msgSend(v5, "iconScale");
      if (v8 != v9)
      {
        -[STUIStatusBarActivityIconView _teardownRingingLayers](self, "_teardownRingingLayers");
        -[STUIStatusBarActivityIconView _setupRingingLayersForStyleAttributes:](self, "_setupRingingLayersForStyleAttributes:", v5);
        -[STUIStatusBarActivityIconView resumePersistentAnimation](self, "resumePersistentAnimation");
      }
      objc_msgSend(v5, "imageTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorWithAlphaComponent:", 0.75);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

      objc_msgSend(v5, "imageTintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarActivityIconView;
  -[STUIStatusBarImageView applyStyleAttributes:](&v14, sel_applyStyleAttributes_, v5);

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  STUIStatusBarActivityIconView *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3060]))
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __55__STUIStatusBarActivityIconView_actionForLayer_forKey___block_invoke;
    v15 = &unk_1E8D62A38;
    v16 = self;
    _StatusBar_UIBlockBasedCAAction();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarActivityIconView;
    -[STUIStatusBarActivityIconView actionForLayer:forKey:](&v11, sel_actionForLayer_forKey_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

uint64_t __55__STUIStatusBarActivityIconView_actionForLayer_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumePersistentAnimation");
}

- (void)resumePersistentAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  NSSymbolPulseEffect *symbolPulseEffect;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarActivityIconView setNeedsLayout](self, "setNeedsLayout");
  if (self->_ringing)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValues:", &unk_1E8D801C8);
    objc_msgSend(v3, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = &unk_1E8D80580;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ringingIconScale * 1.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v5;
    v22[2] = &unk_1E8D80580;
    v22[3] = &unk_1E8D80580;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValues:", v6);

    objc_msgSend(v4, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", 2.0);
    v21[0] = v3;
    v21[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimations:", v8);

    LODWORD(v9) = 2139095040;
    objc_msgSend(v7, "setRepeatCount:", v9);
    -[CAShapeLayer addAnimation:forKey:](self->_innerRingShapeLayer, "addAnimation:forKey:", v7, CFSTR("innerRing"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValues:", &unk_1E8D801E0);
    objc_msgSend(v10, "setBeginTime:", 0.15);
    objc_msgSend(v10, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = &unk_1E8D80580;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ringingIconScale + self->_ringingIconScale);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v20[2] = &unk_1E8D80580;
    v20[3] = &unk_1E8D80580;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValues:", v13);

    objc_msgSend(v11, "setBeginTime:", 0.15);
    objc_msgSend(v11, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDuration:", 2.0);
    v19[0] = v10;
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnimations:", v15);

    LODWORD(v16) = 2139095040;
    objc_msgSend(v14, "setRepeatCount:", v16);
    -[CAShapeLayer addAnimation:forKey:](self->_outerRingShapeLayer, "addAnimation:forKey:", v14, CFSTR("outerRing"));

  }
  symbolPulseEffect = self->_symbolPulseEffect;
  if (symbolPulseEffect)
  {
    objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithRepeating");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarActivityIconView addSymbolEffect:options:animated:](self, "addSymbolEffect:options:animated:", symbolPulseEffect, v18, 1);

  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  objc_super v11;
  UIEdgeInsets result;

  if (self->_ringing)
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarActivityIconView;
    -[STUIStatusBarActivityIconView alignmentRectInsets](&v11, sel_alignmentRectInsets);
    v5 = self->_ringingIconScale * 8.5;
    v7 = v6 - v5;
    v9 = v8 - v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STUIStatusBarActivityIconView;
    -[STUIStatusBarActivityIconView alignmentRectInsets](&v10, sel_alignmentRectInsets);
  }
  result.right = v9;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
}

- (BOOL)isRinging
{
  return self->_ringing;
}

- (void)setRinging:(BOOL)a3 forUpdate:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  if (self->_ringing != v4)
  {
    self->_ringing = v4;
    v8 = v6;
    if (v4)
    {
      objc_msgSend(v6, "styleAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarActivityIconView _setupRingingLayersForStyleAttributes:](self, "_setupRingingLayersForStyleAttributes:", v7);

      -[STUIStatusBarActivityIconView resumePersistentAnimation](self, "resumePersistentAnimation");
    }
    else
    {
      -[STUIStatusBarActivityIconView _teardownRingingLayers](self, "_teardownRingingLayers");
    }
    -[STUIStatusBarActivityIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v6 = v8;
  }

}

- (BOOL)isSymbolPulsing
{
  return self->_symbolPulseEffect != 0;
}

- (void)setSymbolPulsing:(BOOL)a3 forUpdate:(id)a4
{
  _BOOL4 v4;
  NSSymbolPulseEffect *v6;
  NSSymbolPulseEffect *symbolPulseEffect;
  NSSymbolPulseEffect *v8;
  NSSymbolPulseEffect *v9;
  NSSymbolPulseEffect *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (-[STUIStatusBarActivityIconView isSymbolPulsing](self, "isSymbolPulsing", a3, a4) != a3)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CE86F0], "effect");
      v6 = (NSSymbolPulseEffect *)objc_claimAutoreleasedReturnValue();
      symbolPulseEffect = self->_symbolPulseEffect;
      self->_symbolPulseEffect = v6;

      v8 = self->_symbolPulseEffect;
      objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithRepeating");
      v12 = objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarActivityIconView addSymbolEffect:options:animated:](self, "addSymbolEffect:options:animated:", v8, v12, 1);
      v9 = (NSSymbolPulseEffect *)v12;
    }
    else
    {
      v10 = self->_symbolPulseEffect;
      objc_msgSend(MEMORY[0x1E0CE86E8], "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarActivityIconView removeSymbolEffectOfType:options:animated:](self, "removeSymbolEffectOfType:options:animated:", v10, v11, 1);

      v9 = self->_symbolPulseEffect;
      self->_symbolPulseEffect = 0;
    }

  }
}

- (CAShapeLayer)innerRingShapeLayer
{
  return self->_innerRingShapeLayer;
}

- (void)setInnerRingShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerRingShapeLayer, a3);
}

- (CAShapeLayer)outerRingShapeLayer
{
  return self->_outerRingShapeLayer;
}

- (void)setOuterRingShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerRingShapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerRingShapeLayer, 0);
  objc_storeStrong((id *)&self->_innerRingShapeLayer, 0);
  objc_storeStrong((id *)&self->_symbolPulseEffect, 0);
}

@end
