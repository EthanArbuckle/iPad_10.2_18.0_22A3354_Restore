@implementation _UIStatusBarActivityIconView

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
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.75);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    +[UIColor clearColor](UIColor, "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_innerRingShapeLayer, "setFillColor:", objc_msgSend(v13, "CGColor"));

    CGPathRelease(Mutable);
    -[UIView layer](self, "layer");
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
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", objc_msgSend(v21, "CGColor"));

    +[UIColor clearColor](UIColor, "clearColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_outerRingShapeLayer, "setFillColor:", objc_msgSend(v22, "CGColor"));

    CGPathRelease(v17);
    -[UIView layer](self, "layer");
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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarActivityIconView;
  -[UIImageView layoutSubviews](&v11, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[UIView bounds](self, "bounds");
  -[CAShapeLayer setPosition:](self->_innerRingShapeLayer, "setPosition:", v4 + v3 * 0.5, v6 + v5 * 0.5);
  -[UIView bounds](self, "bounds");
  -[CAShapeLayer setPosition:](self->_outerRingShapeLayer, "setPosition:", v8 + v7 * 0.5, v10 + v9 * 0.5);
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
        -[_UIStatusBarActivityIconView _teardownRingingLayers](self, "_teardownRingingLayers");
        -[_UIStatusBarActivityIconView _setupRingingLayersForStyleAttributes:](self, "_setupRingingLayersForStyleAttributes:", v5);
        -[_UIStatusBarActivityIconView resumePersistentAnimation](self, "resumePersistentAnimation");
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
  v14.super_class = (Class)_UIStatusBarActivityIconView;
  -[_UIStatusBarImageView applyStyleAttributes:](&v14, sel_applyStyleAttributes_, v5);

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  UIViewBlockBasedCAAction *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3060]))
  {
    v8 = [UIViewBlockBasedCAAction alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54___UIStatusBarActivityIconView_actionForLayer_forKey___block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    v9 = -[UIViewBlockBasedCAAction initWithEmptyBlock:](v8, "initWithEmptyBlock:", v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarActivityIconView;
    -[UIView actionForLayer:forKey:](&v12, sel_actionForLayer_forKey_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
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
  _QWORD v17[2];
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (self->_ringing)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValues:", &unk_1E1A94B80);
    objc_msgSend(v3, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = &unk_1E1A960C0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ringingIconScale * 1.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v5;
    v20[2] = &unk_1E1A960C0;
    v20[3] = &unk_1E1A960C0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValues:", v6);

    objc_msgSend(v4, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", 2.0);
    v19[0] = v3;
    v19[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimations:", v8);

    LODWORD(v9) = 2139095040;
    objc_msgSend(v7, "setRepeatCount:", v9);
    -[CAShapeLayer addAnimation:forKey:](self->_innerRingShapeLayer, "addAnimation:forKey:", v7, CFSTR("innerRing"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValues:", &unk_1E1A94B98);
    objc_msgSend(v10, "setBeginTime:", 0.15);
    objc_msgSend(v10, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = &unk_1E1A960C0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ringingIconScale + self->_ringingIconScale);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    v18[2] = &unk_1E1A960C0;
    v18[3] = &unk_1E1A960C0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValues:", v13);

    objc_msgSend(v11, "setBeginTime:", 0.15);
    objc_msgSend(v11, "setDuration:", 1.85);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDuration:", 2.0);
    v17[0] = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnimations:", v15);

    LODWORD(v16) = 2139095040;
    objc_msgSend(v14, "setRepeatCount:", v16);
    -[CAShapeLayer addAnimation:forKey:](self->_outerRingShapeLayer, "addAnimation:forKey:", v14, CFSTR("outerRing"));

  }
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
      -[_UIStatusBarActivityIconView _setupRingingLayersForStyleAttributes:](self, "_setupRingingLayersForStyleAttributes:", v7);

      -[_UIStatusBarActivityIconView resumePersistentAnimation](self, "resumePersistentAnimation");
    }
    else
    {
      -[_UIStatusBarActivityIconView _teardownRingingLayers](self, "_teardownRingingLayers");
    }
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v6 = v8;
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
    v11.super_class = (Class)_UIStatusBarActivityIconView;
    -[UIImageView alignmentRectInsets](&v11, sel_alignmentRectInsets);
    v5 = self->_ringingIconScale * 8.5;
    v7 = v6 - v5;
    v9 = v8 - v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIStatusBarActivityIconView;
    -[UIImageView alignmentRectInsets](&v10, sel_alignmentRectInsets);
  }
  result.right = v9;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
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
}

@end
