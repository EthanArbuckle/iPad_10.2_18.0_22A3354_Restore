@implementation PKProgressBar

- (PKProgressBar)initWithFrame:(CGRect)a3
{
  PKProgressBar *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CAGradientLayer *fillLayer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKProgressBar;
  v3 = -[PKProgressBar initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProgressBar setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_cornerRadius = 5.0;
    -[PKProgressBar layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v5, "setCornerRadius:", v3->_cornerRadius);
    objc_msgSend(v5, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    fillLayer = v3->_fillLayer;
    v3->_fillLayer = (CAGradientLayer *)v6;

    -[CAGradientLayer setStartPoint:](v3->_fillLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_fillLayer, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v5, "addSublayer:", v3->_fillLayer);

  }
  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKProgressBar;
  -[PKProgressBar _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKProgressBar _updateLayerColors](self, "_updateLayerColors");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;

  -[PKProgressBar bounds](self, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v7 = CGRectGetHeight(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetWidth(v13);
  PKFloatRoundToPixel();
  v9 = v8;
  if (-[PKProgressBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    *(_OWORD *)&v10.b = 0uLL;
    v10.a = 1.0;
    *(_OWORD *)&v10.d = xmmword_19DF16010;
    v10.ty = height;
    CGAffineTransformRotate(&v11, &v10, 3.14159265);
    v10 = v11;
    -[PKProgressBar setTransform:](self, "setTransform:", &v10);
  }
  -[CAGradientLayer setFrame:](self->_fillLayer, "setFrame:", 0.0, 0.0, v9, v7);
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PKProgressBar layer](self, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", self->_cornerRadius);

  }
}

- (void)setGradientStartColor:(id)a3
{
  UIColor *v4;
  UIColor *originalStartColor;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    originalStartColor = self->_originalStartColor;
    self->_originalStartColor = v4;

    -[PKProgressBar _updateLayerColors](self, "_updateLayerColors");
  }

}

- (UIColor)gradientStartColor
{
  return self->_originalStartColor;
}

- (void)setGradientEndColor:(id)a3
{
  UIColor *v4;
  UIColor *originalEndColor;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    originalEndColor = self->_originalEndColor;
    self->_originalEndColor = v4;

    -[PKProgressBar _updateLayerColors](self, "_updateLayerColors");
  }

}

- (UIColor)gradientEndColor
{
  return self->_originalEndColor;
}

- (void)setProgress:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_progress != v3)
  {
    self->_progress = v3;
    -[PKProgressBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateLayerColors
{
  void *v3;
  _QWORD v4[5];

  -[PKProgressBar traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__PKProgressBar__updateLayerColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __35__PKProgressBar__updateLayerColors__block_invoke(uint64_t a1)
{
  id v2;
  CGColorRef v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = CGColorRetain((CGColorRef)objc_msgSend(v2, "CGColor"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "pkui_extendedLinearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "pkui_extendedLinearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGColor");
  if (v8)
    v9 = v8;
  else
    v9 = (uint64_t)v3;
  v14[0] = v9;
  v10 = objc_retainAutorelease(v5);
  v11 = objc_msgSend(v10, "CGColor");
  if (v11)
    v12 = v11;
  else
    v12 = (uint64_t)v3;
  v14[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColors:", v13);

  CFRelease(v3);
}

- (double)progress
{
  return self->_progress;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)roundEndCap
{
  return self->_roundEndCap;
}

- (void)setRoundEndCap:(BOOL)a3
{
  self->_roundEndCap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalEndColor, 0);
  objc_storeStrong((id *)&self->_originalStartColor, 0);
  objc_storeStrong((id *)&self->_fillLayer, 0);
}

@end
