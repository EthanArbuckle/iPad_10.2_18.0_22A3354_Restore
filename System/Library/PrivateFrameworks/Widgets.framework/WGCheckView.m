@implementation WGCheckView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (WGCheckView)initWithFrame:(CGRect)a3
{
  WGCheckView *v3;
  WGCheckView *v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGCheckView;
  v3 = -[WGCheckView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WGCheckView _shapeLayer](v3, "_shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setLineWidth:", 1.0);
    -[WGCheckView setChecked:](v4, "setChecked:", 0);

  }
  return v4;
}

- (BOOL)isChecked
{
  void *v2;
  double v3;
  BOOL v4;

  -[WGCheckView _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeEnd");
  v4 = fabs(v3 + -1.0) < 2.22044605e-16;

  return v4;
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  -[WGCheckView _shapeLayer](self, "_shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  objc_msgSend(v4, "setStrokeEnd:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  CGPath *v5;
  void *v6;

  -[WGCheckView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "path");

  if (!v4)
  {
    -[WGCheckView bounds](self, "bounds");
    v5 = -[WGCheckView _newPathForBounds:](self, "_newPathForBounds:");
    -[WGCheckView _shapeLayer](self, "_shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v5);

    CGPathRelease(v5);
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("strokeEnd")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WGCheckView;
    v5 = -[WGCheckView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_invalidatePath
{
  void *v3;

  -[WGCheckView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", 0);

  -[WGCheckView setNeedsLayout](self, "setNeedsLayout");
}

- (CGPath)_newPathForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = CGRectGetWidth(v15) * 0.2;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetHeight(v16);
  CGPathMoveToPoint(Mutable, 0, v8, v9 * 0.525);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetWidth(v17) * 0.375;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v11 = CGRectGetHeight(v18);
  CGPathAddLineToPoint(Mutable, 0, v10, v11 * 0.7);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v12 = CGRectGetWidth(v19) * 0.775;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = CGRectGetHeight(v20);
  CGPathAddLineToPoint(Mutable, 0, v12, v13 * 0.3);
  return Mutable;
}

@end
