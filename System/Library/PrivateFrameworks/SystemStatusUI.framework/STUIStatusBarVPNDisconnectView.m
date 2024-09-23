@implementation STUIStatusBarVPNDisconnectView

- (void)_setupForStyleAttributes:(id)a3
{
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *vpnView;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CAShapeLayer *v10;
  CAShapeLayer *vpnSlashMaskShapeLayer;
  id v12;
  CGPath *Mutable;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *slashView;
  CAShapeLayer *v24;
  CAShapeLayer *slashShapeLayer;
  CGPath *v26;
  void *v27;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (!self->_vpnView)
  {
    v4 = objc_alloc_init(STUIStatusBarStringView);
    vpnView = self->_vpnView;
    self->_vpnView = v4;

    -[STUIStatusBarStringView setText:](self->_vpnView, "setText:", CFSTR("VPN"));
    -[STUIStatusBarStringView setEncapsulated:](self->_vpnView, "setEncapsulated:", 1);
    -[STUIStatusBarStringView sizeToFit](self->_vpnView, "sizeToFit");
    -[STUIStatusBarVPNDisconnectView addSubview:](self, "addSubview:", self->_vpnView);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[STUIStatusBarStringView frame](self->_vpnView, "frame");
    v28 = (id)objc_msgSend(v6, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    objc_msgSend(v28, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v10 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    vpnSlashMaskShapeLayer = self->_vpnSlashMaskShapeLayer;
    self->_vpnSlashMaskShapeLayer = v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_vpnSlashMaskShapeLayer, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    Mutable = CGPathCreateMutable();
    v29.origin.x = 5.0;
    v29.origin.y = 0.0;
    v29.size.width = 19.0;
    v29.size.height = 19.0;
    MinX = CGRectGetMinX(v29);
    v30.origin.x = 5.0;
    v30.origin.y = 0.0;
    v30.size.width = 19.0;
    v30.size.height = 19.0;
    MinY = CGRectGetMinY(v30);
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    v31.origin.x = 5.0;
    v31.origin.y = 0.0;
    v31.size.width = 19.0;
    v31.size.height = 19.0;
    MaxX = CGRectGetMaxX(v31);
    v32.origin.x = 5.0;
    v32.origin.y = 0.0;
    v32.size.width = 19.0;
    v32.size.height = 19.0;
    MaxY = CGRectGetMaxY(v32);
    CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY);
    -[CAShapeLayer setPath:](self->_vpnSlashMaskShapeLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    -[CAShapeLayer setLineWidth:](self->_vpnSlashMaskShapeLayer, "setLineWidth:", 4.0);
    v18 = *MEMORY[0x1E0CD3010];
    -[CAShapeLayer setLineCap:](self->_vpnSlashMaskShapeLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_vpnSlashMaskShapeLayer, "setStrokeColor:", objc_msgSend(v19, "CGColor"));

    -[CAShapeLayer setStrokeEnd:](self->_vpnSlashMaskShapeLayer, "setStrokeEnd:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setCompositingFilter:](self->_vpnSlashMaskShapeLayer, "setCompositingFilter:", v20);

    objc_msgSend(v28, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", self->_vpnSlashMaskShapeLayer);

    -[STUIStatusBarStringView setMaskView:](self->_vpnView, "setMaskView:", v28);
    v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 5.0, 0.0, 19.0, 19.0);
    slashView = self->_slashView;
    self->_slashView = v22;

    -[STUIStatusBarVPNDisconnectView addSubview:](self, "addSubview:", self->_slashView);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v24 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    slashShapeLayer = self->_slashShapeLayer;
    self->_slashShapeLayer = v24;

    v26 = CGPathCreateMutable();
    CGPathMoveToPoint(v26, 0, 0.0, 0.0);
    CGPathAddLineToPoint(v26, 0, 19.0, 19.0);
    -[CAShapeLayer setPath:](self->_slashShapeLayer, "setPath:", v26);
    CGPathRelease(v26);
    -[CAShapeLayer setLineWidth:](self->_slashShapeLayer, "setLineWidth:", 1.0);
    -[CAShapeLayer setLineCap:](self->_slashShapeLayer, "setLineCap:", v18);
    -[CAShapeLayer setStrokeEnd:](self->_slashShapeLayer, "setStrokeEnd:", 0.0);
    -[UIView layer](self->_slashView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSublayer:", self->_slashShapeLayer);

  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[STUIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);
  -[STUIStatusBarStringView applyStyleAttributes:](self->_vpnView, "applyStyleAttributes:", v4);
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
  -[STUIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  -[CAShapeLayer setStrokeEnd:](self->_vpnSlashMaskShapeLayer, "setStrokeEnd:", 0.0);
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
  -[STUIStatusBarVPNDisconnectView _setupForStyleAttributes:](self, "_setupForStyleAttributes:", v4);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVPNDisconnectView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertTime:toLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v8, "setBeginTime:", v6 + 0.75);

  objc_msgSend(v8, "setFromValue:", &unk_1E8D805A0);
  objc_msgSend(v8, "setToValue:", &unk_1E8D805B0);
  objc_msgSend(v8, "setDuration:", 0.75);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v7);

  -[CAShapeLayer addAnimation:forKey:](self->_vpnSlashMaskShapeLayer, "addAnimation:forKey:", v8, CFSTR("slash"));
  -[CAShapeLayer addAnimation:forKey:](self->_slashShapeLayer, "addAnimation:forKey:", v8, CFSTR("slash"));
  -[CAShapeLayer setStrokeEnd:](self->_vpnSlashMaskShapeLayer, "setStrokeEnd:", 1.0);
  -[CAShapeLayer setStrokeEnd:](self->_slashShapeLayer, "setStrokeEnd:", 1.0);

}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[STUIStatusBarStringView alignmentRectInsets](self->_vpnView, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_vpnView;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[STUIStatusBarStringView intrinsicContentSize](self->_vpnView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (STUIStatusBarStringView)vpnView
{
  return self->_vpnView;
}

- (void)setVpnView:(id)a3
{
  objc_storeStrong((id *)&self->_vpnView, a3);
}

- (CAShapeLayer)vpnSlashMaskShapeLayer
{
  return self->_vpnSlashMaskShapeLayer;
}

- (void)setVpnSlashMaskShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_vpnSlashMaskShapeLayer, a3);
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
  objc_storeStrong((id *)&self->_vpnSlashMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_vpnView, 0);
}

@end
