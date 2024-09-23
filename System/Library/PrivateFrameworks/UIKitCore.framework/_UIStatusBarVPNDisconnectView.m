@implementation _UIStatusBarVPNDisconnectView

- (void)_setupForStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UIStatusBarImageView *v7;
  _UIStatusBarImageView *iconView;
  UIView *v9;
  UIView *v10;
  id v11;
  uint64_t v12;
  void *v13;
  CAShapeLayer *v14;
  CAShapeLayer *iconSlashMaskShapeLayer;
  id v16;
  CGPath *Mutable;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  UIView *v26;
  UIView *slashView;
  CAShapeLayer *v28;
  CAShapeLayer *slashShapeLayer;
  CGPath *v30;
  void *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (!self->_iconView)
  {
    v4 = a3;
    +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:styleAttributes:", CFSTR("VPN"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    v7 = -[UIImageView initWithImage:]([_UIStatusBarImageView alloc], "initWithImage:", v32);
    iconView = self->_iconView;
    self->_iconView = v7;

    -[UIView addSubview:](self, "addSubview:", self->_iconView);
    v9 = [UIView alloc];
    -[UIView frame](self->_iconView, "frame");
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    +[UIColor blackColor](UIColor, "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    -[UIView layer](v10, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v14 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    iconSlashMaskShapeLayer = self->_iconSlashMaskShapeLayer;
    self->_iconSlashMaskShapeLayer = v14;

    +[UIColor blackColor](UIColor, "blackColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_iconSlashMaskShapeLayer, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

    Mutable = CGPathCreateMutable();
    v33.origin.x = 5.0;
    v33.origin.y = -3.0;
    v33.size.width = 19.0;
    v33.size.height = 19.0;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = 5.0;
    v34.origin.y = -3.0;
    v34.size.width = 19.0;
    v34.size.height = 19.0;
    MinY = CGRectGetMinY(v34);
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    v35.origin.x = 5.0;
    v35.origin.y = -3.0;
    v35.size.width = 19.0;
    v35.size.height = 19.0;
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = 5.0;
    v36.origin.y = -3.0;
    v36.size.width = 19.0;
    v36.size.height = 19.0;
    MaxY = CGRectGetMaxY(v36);
    CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY);
    -[CAShapeLayer setPath:](self->_iconSlashMaskShapeLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    -[CAShapeLayer setLineWidth:](self->_iconSlashMaskShapeLayer, "setLineWidth:", 4.0);
    v22 = *MEMORY[0x1E0CD3010];
    -[CAShapeLayer setLineCap:](self->_iconSlashMaskShapeLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    +[UIColor blackColor](UIColor, "blackColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_iconSlashMaskShapeLayer, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

    -[CAShapeLayer setStrokeEnd:](self->_iconSlashMaskShapeLayer, "setStrokeEnd:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setCompositingFilter:](self->_iconSlashMaskShapeLayer, "setCompositingFilter:", v24);

    -[UIView layer](v10, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", self->_iconSlashMaskShapeLayer);

    -[UIView setMaskView:](self->_iconView, "setMaskView:", v10);
    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 5.0, -3.0, 19.0, 19.0);
    slashView = self->_slashView;
    self->_slashView = v26;

    -[UIView addSubview:](self, "addSubview:", self->_slashView);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v28 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    slashShapeLayer = self->_slashShapeLayer;
    self->_slashShapeLayer = v28;

    v30 = CGPathCreateMutable();
    CGPathMoveToPoint(v30, 0, 0.0, 0.0);
    CGPathAddLineToPoint(v30, 0, 19.0, 19.0);
    -[CAShapeLayer setPath:](self->_slashShapeLayer, "setPath:", v30);
    CGPathRelease(v30);
    -[CAShapeLayer setLineWidth:](self->_slashShapeLayer, "setLineWidth:", 1.0);
    -[CAShapeLayer setLineCap:](self->_slashShapeLayer, "setLineCap:", v22);
    -[CAShapeLayer setStrokeEnd:](self->_slashShapeLayer, "setStrokeEnd:", 0.0);
    -[UIView layer](self->_slashView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", self->_slashShapeLayer);

    -[UIImageView setImage:](self->_iconView, "setImage:", v32);
  }
}

- (void)updateFramesForStyleAttributes:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGRect v23;
  CGRect v24;

  -[_UIStatusBarImageView intrinsicContentSize](self->_iconView, "intrinsicContentSize", a3);
  v5 = v4;
  v7 = v6;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = UIRectIntegralWithScale(0.0, 0.0, v5, v7, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[UIView frame](self->_iconView, "frame");
  v24.origin.x = v18;
  v24.origin.y = v19;
  v24.size.width = v20;
  v24.size.height = v21;
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (!CGRectEqualToRect(v23, v24))
  {
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v11, v13, v15, v17);
    -[UIView maskView](self->_iconView, "maskView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v11, v13, v15, v17);

    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);
  -[_UIStatusBarImageView applyStyleAttributes:](self->_iconView, "applyStyleAttributes:", v4);
  -[_UIStatusBarVPNDisconnectView updateFramesForStyleAttributes:](self, "updateFramesForStyleAttributes:", v4);
  objc_msgSend(v4, "imageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  -[CAShapeLayer setStrokeColor:](self->_slashShapeLayer, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

}

- (void)resetSlashForUpdate:(id)a3
{
  void *v4;

  objc_msgSend(a3, "styleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  -[CAShapeLayer setStrokeEnd:](self->_iconSlashMaskShapeLayer, "setStrokeEnd:", 0.0);
  -[CAShapeLayer setStrokeEnd:](self->_slashShapeLayer, "setStrokeEnd:", 0.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)animateSlashForUpdate:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "styleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertTime:toLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v8, "setBeginTime:", v6 + 0.75);

  objc_msgSend(v8, "setFromValue:", &unk_1E1A958C0);
  objc_msgSend(v8, "setToValue:", &unk_1E1A958D0);
  objc_msgSend(v8, "setDuration:", 0.75);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v7);

  -[CAShapeLayer addAnimation:forKey:](self->_iconSlashMaskShapeLayer, "addAnimation:forKey:", v8, CFSTR("slash"));
  -[CAShapeLayer addAnimation:forKey:](self->_slashShapeLayer, "addAnimation:forKey:", v8, CFSTR("slash"));
  -[CAShapeLayer setStrokeEnd:](self->_iconSlashMaskShapeLayer, "setStrokeEnd:", 1.0);
  -[CAShapeLayer setStrokeEnd:](self->_slashShapeLayer, "setStrokeEnd:", 1.0);

}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIImageView alignmentRectInsets](self->_iconView, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_iconView;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIStatusBarImageView intrinsicContentSize](self->_iconView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIStatusBarImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (CAShapeLayer)iconSlashMaskShapeLayer
{
  return self->_iconSlashMaskShapeLayer;
}

- (void)setIconSlashMaskShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_iconSlashMaskShapeLayer, a3);
}

- (UIView)slashView
{
  return self->_slashView;
}

- (void)setSlashView:(id)a3
{
  objc_storeStrong((id *)&self->_slashView, a3);
}

- (CAShapeLayer)slashShapeLayer
{
  return self->_slashShapeLayer;
}

- (void)setSlashShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_slashShapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashShapeLayer, 0);
  objc_storeStrong((id *)&self->_slashView, 0);
  objc_storeStrong((id *)&self->_iconSlashMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
