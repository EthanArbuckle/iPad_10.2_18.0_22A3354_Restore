@implementation SimpleSignView

- (SimpleSignView)initWithFrame:(CGRect)a3
{
  SimpleSignView *v3;
  SimpleSignView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  UIImageView *v9;
  UIImageView *backgroundView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SimpleSignView;
  v3 = -[SimpleSignView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[SimpleSignView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_alloc((Class)UIImageView);
    -[SimpleSignView bounds](v4, "bounds");
    v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v9;

    -[UIImageView setAutoresizingMask:](v4->_backgroundView, "setAutoresizingMask:", 18);
    -[SimpleSignView addSubview:](v4, "addSubview:", v4->_backgroundView);
  }
  return v4;
}

- (void)setStyle:(id)a3
{
  void *v5;
  SignStyle *v6;

  v6 = (SignStyle *)a3;
  if (self->_style != v6)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignStyle squareSignImage](v6, "squareSignImage"));
    -[UIImageView setImage:](self->_backgroundView, "setImage:", v5);

    -[SimpleSignView updateStyleForTheme](self, "updateStyleForTheme");
  }

}

- (void)updateStyleForTheme
{
  void *v3;
  GuidanceManeuverView **p_maneuverView;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GuidanceManeuverView *v12;
  GuidanceManeuverView *v13;
  GuidanceManeuverView *v14;
  void *v15;
  void *v16;
  GuidanceManeuverView *v17;
  _BYTE v18[496];
  _QWORD v19[62];
  _BYTE __dst[496];
  _QWORD __src[62];
  _BYTE v22[496];
  _OWORD v23[31];
  _BYTE v24[496];
  _OWORD v25[31];

  if (-[SimpleSignView isHighlighted](self, "isHighlighted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    p_maneuverView = &self->_maneuverView;
    -[GuidanceManeuverView setArrowColor:](self->_maneuverView, "setArrowColor:", v3);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "foregroundColor"));
    p_maneuverView = &self->_maneuverView;
    -[GuidanceManeuverView setArrowColor:](self->_maneuverView, "setArrowColor:", v5);

  }
  if (-[SimpleSignView isHighlighted](self, "isHighlighted"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.800000012));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accentColor"));
  }
  v8 = (void *)v7;
  -[GuidanceManeuverView setAccentColor:](*p_maneuverView, "setAccentColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
    v11 = (void *)objc_opt_class(v10);
    if (v11)
      objc_msgSend(v11, "arrowMetricsForStyle:", 0);
    else
      memset(v25, 0, sizeof(v25));
    v14 = *p_maneuverView;
    memcpy(v24, v25, sizeof(v24));
    -[GuidanceManeuverView setArrowMetrics:](v14, "setArrowMetrics:", v24);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
    v16 = (void *)objc_opt_class(v15);
    if (v16)
      objc_msgSend(v16, "junctionArrowMetricsForStyle:", 0);
    else
      memset(v23, 0, sizeof(v23));
    v17 = *p_maneuverView;
    memcpy(v22, v23, sizeof(v22));
    -[GuidanceManeuverView setJunctionArrowMetrics:](v17, "setJunctionArrowMetrics:", v22);

  }
  else
  {
    MKDefaultGuidanceManeuverMetrics(__src);
    v12 = *p_maneuverView;
    memcpy(__dst, __src, sizeof(__dst));
    MKDefaultJunctionManeuverMetrics(v19, -[GuidanceManeuverView setArrowMetrics:](v12, "setArrowMetrics:", __dst));
    v13 = *p_maneuverView;
    memcpy(v18, v19, sizeof(v18));
    -[GuidanceManeuverView setJunctionArrowMetrics:](v13, "setJunctionArrowMetrics:", v18);
  }
}

- (GuidanceManeuverView)maneuverView
{
  GuidanceManeuverView *maneuverView;
  GuidanceManeuverView *v4;
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
  GuidanceManeuverView *v17;
  GuidanceManeuverView *v18;
  void *v19;
  void *v20;
  void *v21;
  GuidanceManeuverView *v22;
  void *v23;
  void *v24;
  GuidanceManeuverView *v25;
  _BYTE v27[496];
  _OWORD v28[31];
  _BYTE __dst[496];
  _OWORD __src[31];

  maneuverView = self->_maneuverView;
  if (!maneuverView)
  {
    v4 = [GuidanceManeuverView alloc];
    -[SimpleSignView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SimpleSignView maneuverViewEdgeInsets](self, "maneuverViewEdgeInsets");
    v17 = -[GuidanceManeuverView initWithFrame:textureProvider:](v4, "initWithFrame:textureProvider:", 0, v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
    v18 = self->_maneuverView;
    self->_maneuverView = v17;

    -[GuidanceManeuverView setAutoresizingMask:](self->_maneuverView, "setAutoresizingMask:", 18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
      v21 = (void *)objc_opt_class(v20);
      if (v21)
        objc_msgSend(v21, "arrowMetricsForStyle:", 0);
      else
        memset(__src, 0, sizeof(__src));
      v22 = self->_maneuverView;
      memcpy(__dst, __src, sizeof(__dst));
      -[GuidanceManeuverView setArrowMetrics:](v22, "setArrowMetrics:", __dst);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView style](self, "style"));
      v24 = (void *)objc_opt_class(v23);
      if (v24)
        objc_msgSend(v24, "junctionArrowMetricsForStyle:", 0);
      else
        memset(v28, 0, sizeof(v28));
      v25 = self->_maneuverView;
      memcpy(v27, v28, sizeof(v27));
      -[GuidanceManeuverView setJunctionArrowMetrics:](v25, "setJunctionArrowMetrics:", v27);

    }
    -[SimpleSignView addSubview:](self, "addSubview:", self->_maneuverView);
    maneuverView = self->_maneuverView;
  }
  return maneuverView;
}

- (void)setManeuverViewEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_maneuverViewEdgeInsets = a3;
  -[SimpleSignView bounds](self, "bounds");
  v9 = left + v8;
  v11 = top + v10;
  v13 = v12 - (left + right);
  v15 = v14 - (top + bottom);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (UIImageView)shieldImageView
{
  return self->_shieldView;
}

- (UIImage)shieldImage
{
  return -[UIImageView image](self->_shieldView, "image");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat MidX;
  uint64_t v8;
  double v9;
  CGFloat MidY;
  uint64_t v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)SimpleSignView;
  -[SimpleSignView layoutSubviews](&v12, "layoutSubviews");
  -[UIImageView bounds](self->_shieldView, "bounds");
  v4 = v3;
  v6 = v5;
  -[SimpleSignView bounds](self, "bounds");
  MidX = CGRectGetMidX(v13);
  v9 = UIRoundToViewScale(self, v8, MidX - v4 * 0.5);
  -[SimpleSignView bounds](self, "bounds");
  MidY = CGRectGetMidY(v14);
  -[UIImageView setFrame:](self->_shieldView, "setFrame:", v9, UIRoundToViewScale(self, v11, MidY - v6 * 0.5), v4, v6);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (sub_1002A8AA0(self) == 5 && self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[SimpleSignView updateStyleForTheme](self, "updateStyleForTheme");
  }
}

- (void)setShieldImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *shieldView;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_shieldView, "image"));

  v5 = v11;
  if (v4 != v11)
  {
    shieldView = self->_shieldView;
    if (!shieldView)
    {
      v7 = objc_alloc((Class)UIImageView);
      -[SimpleSignView bounds](self, "bounds");
      v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
      v9 = self->_shieldView;
      self->_shieldView = v8;

      -[SimpleSignView addSubview:](self, "addSubview:", self->_shieldView);
      shieldView = self->_shieldView;
    }
    -[UIImageView setImage:](shieldView, "setImage:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self, "maneuverView"));
    objc_msgSend(v10, "setHidden:", v11 != 0);

    -[UIImageView sizeToFit](self->_shieldView, "sizeToFit");
    -[SimpleSignView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (UIEdgeInsets)maneuverViewEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_maneuverViewEdgeInsets.top;
  left = self->_maneuverViewEdgeInsets.left;
  bottom = self->_maneuverViewEdgeInsets.bottom;
  right = self->_maneuverViewEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SignStyle)style
{
  return self->_style;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
