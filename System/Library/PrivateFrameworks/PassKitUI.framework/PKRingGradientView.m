@implementation PKRingGradientView

- (PKRingGradientView)init
{
  PKRingGradientView *v2;
  PKRingGradientView *v3;
  CAGradientLayer *v4;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v6;
  void *v7;
  CAShapeLayer *v8;
  CAShapeLayer *gradientMaskLayer;
  CAShapeLayer *v10;
  id v11;
  CAShapeLayer *v12;
  void *v13;
  CAShapeLayer *v14;
  CAShapeLayer *strokeLayer;
  CAShapeLayer *v16;
  void *v17;
  CAShapeLayer *v18;
  CAShapeLayer *backgroundLayer;
  CAShapeLayer *v20;
  void *v21;
  CAShapeLayer *v22;
  CAShapeLayer *backgroundCap;
  CAShapeLayer *v24;
  void *v25;
  CAShapeLayer *v26;
  CAShapeLayer *gradientCap;
  CAShapeLayer *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKRingGradientView;
  v2 = -[PKRingGradientView init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKRingGradientView setOpaque:](v2, "setOpaque:", 0);
    -[PKRingGradientView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v3->_enabled = 1;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    -[CAGradientLayer setStartPoint:](v3->_gradientLayer, "setStartPoint:", 0.5, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_gradientLayer, "setEndPoint:", 0.5, 0.0);
    -[CAGradientLayer setType:](v3->_gradientLayer, "setType:", *MEMORY[0x1E0CD2F50]);
    v6 = v3->_gradientLayer;
    PKLayerNullActions();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setActions:](v6, "setActions:", v7);

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    gradientMaskLayer = v3->_gradientMaskLayer;
    v3->_gradientMaskLayer = v8;

    -[CAShapeLayer setFillColor:](v3->_gradientMaskLayer, "setFillColor:", 0);
    v10 = v3->_gradientMaskLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v10, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    v12 = v3->_gradientMaskLayer;
    PKLayerNullActions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v12, "setActions:", v13);

    -[CAGradientLayer setMask:](v3->_gradientLayer, "setMask:", v3->_gradientMaskLayer);
    v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    strokeLayer = v3->_strokeLayer;
    v3->_strokeLayer = v14;

    -[CAShapeLayer setFillColor:](v3->_strokeLayer, "setFillColor:", 0);
    v16 = v3->_strokeLayer;
    PKLayerNullActions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v16, "setActions:", v17);

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = v18;

    -[CAShapeLayer setFillColor:](v3->_backgroundLayer, "setFillColor:", 0);
    v20 = v3->_backgroundLayer;
    PKLayerNullActions();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v20, "setActions:", v21);

    v22 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backgroundCap = v3->_backgroundCap;
    v3->_backgroundCap = v22;

    -[CAShapeLayer setFillColor:](v3->_backgroundCap, "setFillColor:", 0);
    v24 = v3->_backgroundCap;
    PKLayerNullActions();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v24, "setActions:", v25);

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    gradientCap = v3->_gradientCap;
    v3->_gradientCap = v26;

    -[CAShapeLayer setFillColor:](v3->_gradientCap, "setFillColor:", 0);
    v28 = v3->_gradientCap;
    PKLayerNullActions();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v28, "setActions:", v29);

    -[PKRingGradientView layer](v3, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSublayer:", v3->_strokeLayer);
    objc_msgSend(v30, "addSublayer:", v3->_backgroundLayer);
    objc_msgSend(v30, "addSublayer:", v3->_gradientLayer);
    objc_msgSend(v30, "addSublayer:", v3->_backgroundCap);
    objc_msgSend(v30, "addSublayer:", v3->_gradientCap);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_effectiveStartColor);
  CGColorRelease(self->_effectiveEndColor);
  CGColorRelease(self->_effectiveFillColor);
  CGColorRelease(self->_effectiveStrokeColor);
  v3.receiver = self;
  v3.super_class = (Class)PKRingGradientView;
  -[PKRingGradientView dealloc](&v3, sel_dealloc);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRingGradientView;
  -[PKRingGradientView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKRingGradientView _updateEffectiveColors](self, "_updateEffectiveColors");
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CAShapeLayer *strokeLayer;
  CAShapeLayer *v25;
  id v26;
  void *v27;
  CAShapeLayer *backgroundLayer;
  id v29;
  void *v30;
  CAShapeLayer *backgroundCap;
  id v32;
  void *v33;
  CAShapeLayer *gradientCap;
  id v35;
  uint64_t BlendedLinearColor;
  const void *v37;
  void *v38;
  CAShapeLayer *v39;
  id v40;
  CGColor *effectiveFillColor;
  double v42;
  double v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)PKRingGradientView;
  -[PKRingGradientView layoutSubviews](&v44, sel_layoutSubviews);
  -[PKRingGradientView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKRingGradientView _center](self, "_center");
  v42 = v12;
  v43 = v11;
  -[PKRingGradientView _radius](self, "_radius");
  v14 = v13;
  -[PKRingGradientView totalWidth](self, "totalWidth");
  v16 = v14 + v15 * -0.5;
  -[PKRingGradientView ringWidth](self, "ringWidth");
  v18 = v17;
  -[PKRingGradientView _maskRadius](self, "_maskRadius");
  -[PKRingGradientView strokeWidth](self, "strokeWidth");
  v20 = v19;
  -[PKRingGradientView _offsetStartAngle](self, "_offsetStartAngle");
  -[PKRingGradientView _offsetEndAngle](self, "_offsetEndAngle");
  v22 = v21;
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setLineWidth:](self->_gradientMaskLayer, "setLineWidth:", v18);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v43, v42, v16, 0.0, 6.28318531);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  strokeLayer = self->_strokeLayer;
  -[PKRingGradientView totalWidth](self, "totalWidth");
  -[CAShapeLayer setLineWidth:](strokeLayer, "setLineWidth:");
  v25 = self->_strokeLayer;
  v26 = objc_retainAutorelease(v23);
  -[CAShapeLayer setPath:](v25, "setPath:", objc_msgSend(v26, "CGPath"));
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v43, v42, v16, 0.0, 6.28318531);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setLineWidth:](self->_backgroundLayer, "setLineWidth:", v18);
  backgroundLayer = self->_backgroundLayer;
  v29 = objc_retainAutorelease(v27);
  -[CAShapeLayer setPath:](backgroundLayer, "setPath:", objc_msgSend(v29, "CGPath"));
  -[CAShapeLayer setLineWidth:](self->_backgroundCap, "setLineWidth:", v20);
  -[PKRingGradientView _centerPointForMaskViewWithAngle:adjustToCover:](self, "_centerPointForMaskViewWithAngle:adjustToCover:", 0, 4.71238898);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundCap = self->_backgroundCap;
  v32 = objc_retainAutorelease(v30);
  -[CAShapeLayer setPath:](backgroundCap, "setPath:", objc_msgSend(v32, "CGPath"));
  -[PKRingGradientView _centerPointForMaskViewWithAngle:adjustToCover:](self, "_centerPointForMaskViewWithAngle:adjustToCover:", 1, v22);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  gradientCap = self->_gradientCap;
  v35 = objc_retainAutorelease(v33);
  -[CAShapeLayer setPath:](gradientCap, "setPath:", objc_msgSend(v35, "CGPath"));
  if (self->_effectiveStartColor
    && self->_effectiveEndColor
    && (BlendedLinearColor = PKColorCreateBlendedLinearColor()) != 0)
  {
    v37 = (const void *)BlendedLinearColor;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", BlendedLinearColor);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v37);
  }
  else
  {
    v38 = 0;
  }
  v39 = self->_gradientCap;
  v40 = objc_retainAutorelease(v38);
  effectiveFillColor = (CGColor *)objc_msgSend(v40, "CGColor");
  if (!effectiveFillColor)
    effectiveFillColor = self->_effectiveFillColor;
  -[CAShapeLayer setFillColor:](v39, "setFillColor:", effectiveFillColor);
  self->_gradientCapIsFillColor = v40 == 0;
  -[CAShapeLayer setLineWidth:](self->_gradientCap, "setLineWidth:", v20);
  -[PKRingGradientView _updateGradient](self, "_updateGradient");

}

- (double)_offsetStartAngle
{
  return 4.71238898;
}

- (double)_offsetEndAngle
{
  return self->_currentAngle + 4.71238898;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", !a3);
    -[CAShapeLayer setHidden:](self->_gradientCap, "setHidden:", !self->_enabled);
  }
}

- (void)setGradientStartColor:(id)a3
{
  UIColor *v4;
  UIColor *gradientStartColor;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    gradientStartColor = self->_gradientStartColor;
    self->_gradientStartColor = v4;

    -[PKRingGradientView _updateEffectiveColors](self, "_updateEffectiveColors");
  }

}

- (void)setGradientEndColor:(id)a3
{
  UIColor *v4;
  UIColor *gradientEndColor;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    gradientEndColor = self->_gradientEndColor;
    self->_gradientEndColor = v4;

    -[PKRingGradientView _updateEffectiveColors](self, "_updateEffectiveColors");
  }

}

- (void)setStrokeColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[PKRingGradientView _updateEffectiveColors](self, "_updateEffectiveColors");
  }

}

- (void)setFillColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[PKRingGradientView _updateEffectiveColors](self, "_updateEffectiveColors");
  }

}

- (void)setMinimumAngle:(double)a3
{
  if (self->_minimumAngle != a3)
  {
    self->_minimumAngle = a3;
    -[PKRingGradientView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCurrentAngle:(double)a3
{
  if (self->_currentAngle != a3)
  {
    self->_currentAngle = a3;
    -[PKRingGradientView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)ringWidth
{
  double result;

  -[PKRingGradientView _radius](self, "_radius");
  PKFloatRoundToPixel();
  return result;
}

- (double)strokeWidth
{
  double result;

  -[PKRingGradientView _radius](self, "_radius");
  PKFloatRoundToPixel();
  return result;
}

- (double)totalWidth
{
  double v3;
  double v4;
  double v5;

  -[PKRingGradientView strokeWidth](self, "strokeWidth");
  v4 = v3;
  -[PKRingGradientView ringWidth](self, "ringWidth");
  return v5 + v4 * 2.0;
}

- (void)_updateEffectiveColors
{
  void *v3;
  CGColor *effectiveStrokeColor;
  CGColor *effectiveFillColor;
  id v6;
  _QWORD v7[5];

  CGColorRelease(self->_effectiveStartColor);
  CGColorRelease(self->_effectiveEndColor);
  CGColorRelease(self->_effectiveFillColor);
  CGColorRelease(self->_effectiveStrokeColor);
  -[PKRingGradientView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PKRingGradientView__updateEffectiveColors__block_invoke;
  v7[3] = &unk_1E3E612E8;
  v7[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v7);

  effectiveStrokeColor = self->_effectiveStrokeColor;
  effectiveFillColor = self->_effectiveFillColor;
  if (effectiveStrokeColor)
  {
    if (!effectiveFillColor)
    {
      effectiveFillColor = CGColorRetain(effectiveStrokeColor);
      self->_effectiveFillColor = effectiveFillColor;
    }
  }
  else if (effectiveFillColor)
  {
    self->_effectiveStrokeColor = CGColorRetain(self->_effectiveFillColor);
    effectiveFillColor = self->_effectiveFillColor;
  }
  -[CAShapeLayer setStrokeColor:](self->_backgroundLayer, "setStrokeColor:", effectiveFillColor);
  -[CAShapeLayer setFillColor:](self->_backgroundCap, "setFillColor:", self->_effectiveFillColor);
  if (self->_gradientCapIsFillColor)
    -[CAShapeLayer setFillColor:](self->_gradientCap, "setFillColor:", self->_effectiveFillColor);
  -[CAShapeLayer setStrokeColor:](self->_strokeLayer, "setStrokeColor:", self->_effectiveStrokeColor);
  -[CAShapeLayer setStrokeColor:](self->_backgroundCap, "setStrokeColor:", self->_effectiveStrokeColor);
  -[CAShapeLayer setStrokeColor:](self->_gradientCap, "setStrokeColor:", self->_effectiveStrokeColor);
  if (self->_effectiveStartColor && self->_effectiveEndColor)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "addObject:", self->_effectiveStartColor);
    objc_msgSend(v6, "addObject:", self->_effectiveEndColor);
    -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v6);

  }
  -[PKRingGradientView setNeedsLayout](self, "setNeedsLayout");
}

CGColorRef __44__PKRingGradientView__updateEffectiveColors__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  CGColorRef result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "pkui_extendedLinearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) = CGColorRetain((CGColorRef)objc_msgSend(v2, "CGColor"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "pkui_extendedLinearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488) = CGColorRetain((CGColorRef)objc_msgSend(v3, "CGColor"));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496) = CGColorRetain((CGColorRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "CGColor"));
  result = CGColorRetain((CGColorRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) = result;
  return result;
}

- (void)_updateGradient
{
  CAGradientLayer *gradientLayer;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CAShapeLayer *gradientMaskLayer;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (self->_effectiveStartColor)
  {
    if (self->_effectiveEndColor)
    {
      gradientLayer = self->_gradientLayer;
      v21[0] = &unk_1E3FACE68;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(self->_minimumAngle, self->_currentAngle) / 6.28318531);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setLocations:](gradientLayer, "setLocations:", v5);

      -[PKRingGradientView _radius](self, "_radius");
      v7 = v6;
      -[PKRingGradientView totalWidth](self, "totalWidth");
      v9 = v7 + v8 * -0.5;
      v10 = (void *)MEMORY[0x1E0DC3508];
      -[PKRingGradientView _center](self, "_center");
      v12 = v11;
      v14 = v13;
      -[PKRingGradientView _offsetStartAngle](self, "_offsetStartAngle");
      v16 = v15;
      -[PKRingGradientView _offsetEndAngle](self, "_offsetEndAngle");
      objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v14, v9, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      gradientMaskLayer = self->_gradientMaskLayer;
      v20 = objc_retainAutorelease(v18);
      -[CAShapeLayer setPath:](gradientMaskLayer, "setPath:", objc_msgSend(v20, "CGPath"));

    }
  }
}

- (double)_radius
{
  double v2;
  double v3;
  double v4;

  -[PKRingGradientView bounds](self, "bounds");
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  return v4 * 0.5;
}

- (CGPoint)_center
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[PKRingGradientView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (double)_maskRadius
{
  double v3;
  double v4;
  double v5;

  -[PKRingGradientView ringWidth](self, "ringWidth");
  v4 = v3;
  -[PKRingGradientView strokeWidth](self, "strokeWidth");
  return (v4 + v5) * 0.5;
}

- (CGPoint)_centerPointForMaskViewWithAngle:(double)a3 adjustToCover:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
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
  __double2 v18;
  double v19;
  double v20;
  CGPoint result;

  v4 = a4;
  -[PKRingGradientView _center](self, "_center");
  v8 = v7;
  v10 = v9;
  -[PKRingGradientView _maskRadius](self, "_maskRadius");
  v12 = v11;
  -[PKRingGradientView _radius](self, "_radius");
  v14 = v13 - v12;
  -[PKRingGradientView strokeWidth](self, "strokeWidth");
  v16 = v14 + v15 * -0.5;
  if (v4)
  {
    v17 = PKUIPixelLength();
    a3 = a3 + asin(v17 / v16) * -5.0;
  }
  v18 = __sincos_stret(a3);
  v19 = v10 + v16 * v18.__sinval;
  v20 = v8 + v16 * v18.__cosval;
  result.y = v19;
  result.x = v20;
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (double)minimumAngle
{
  return self->_minimumAngle;
}

- (double)currentAngle
{
  return self->_currentAngle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_gradientCap, 0);
  objc_storeStrong((id *)&self->_backgroundCap, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_strokeLayer, 0);
  objc_storeStrong((id *)&self->_gradientMaskLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_originalEndColor, 0);
  objc_storeStrong((id *)&self->_originalStartColor, 0);
}

@end
