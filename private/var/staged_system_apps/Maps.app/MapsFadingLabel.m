@implementation MapsFadingLabel

- (MapsFadingLabel)initWithFrame:(CGRect)a3
{
  MapsFadingLabel *v3;
  MapsFadingLabel *v4;
  CAGradientLayer *v5;
  CAGradientLayer *gradientLayer;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CALayer *v13;
  CALayer *multiLineFillLayer;
  id v15;
  CALayer *v16;
  CALayer *maskLayer;
  id v18;
  CALayer *v19;
  CALayer *containerLayer;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];

  v28.receiver = self;
  v28.super_class = (Class)MapsFadingLabel;
  v3 = -[MapsFadingLabel initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MapsFadingLabel setLineBreakStrategy:](v3, "setLineBreakStrategy:", 0);
    -[MapsFadingLabel setLineBreakMode:](v4, "setLineBreakMode:", 2);
    v5 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v5;

    v7 = kCAFilterDestOut;
    -[CAGradientLayer setCompositingFilter:](v4->_gradientLayer, "setCompositingFilter:", kCAFilterDestOut);
    -[CAGradientLayer setLocations:](v4->_gradientLayer, "setLocations:", &off_101274070);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v31[0] = objc_msgSend(v8, "CGColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v31[1] = objc_msgSend(v9, "CGColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v31[2] = objc_msgSend(v10, "CGColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v31[3] = objc_msgSend(v11, "CGColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    -[CAGradientLayer setColors:](v4->_gradientLayer, "setColors:", v12);

    v13 = objc_opt_new(CALayer);
    multiLineFillLayer = v4->_multiLineFillLayer;
    v4->_multiLineFillLayer = v13;

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v4->_multiLineFillLayer, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    -[CALayer setCompositingFilter:](v4->_multiLineFillLayer, "setCompositingFilter:", v7);
    v16 = objc_opt_new(CALayer);
    maskLayer = v4->_maskLayer;
    v4->_maskLayer = v16;

    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v4->_maskLayer, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

    v19 = objc_opt_new(CALayer);
    containerLayer = v4->_containerLayer;
    v4->_containerLayer = v19;

    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v4->_containerLayer, "setBackgroundColor:", objc_msgSend(v21, "CGColor"));

    -[CALayer setCompositingFilter:](v4->_containerLayer, "setCompositingFilter:", v7);
    -[CALayer addSublayer:](v4->_containerLayer, "addSublayer:", v4->_multiLineFillLayer);
    -[CALayer addSublayer:](v4->_containerLayer, "addSublayer:", v4->_gradientLayer);
    -[CALayer addSublayer:](v4->_maskLayer, "addSublayer:", v4->_containerLayer);
    -[MapsFadingLabel _updateFadeDirection](v4, "_updateFadeDirection");
    -[MapsFadingLabel _updateFadeWidth](v4, "_updateFadeWidth");
    -[MapsFadingLabel _updateFadeVisibility](v4, "_updateFadeVisibility");
    v30 = objc_opt_class(UITraitPreferredContentSizeCategory);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v23 = -[MapsFadingLabel registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v22, "_preferredContentSizeCategoryDidChange");

    v29 = objc_opt_class(UITraitLayoutDirection);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v25 = -[MapsFadingLabel registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v24, "_updateFadeDirection");

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, "_localeDidChangeNotification:", NSCurrentLocaleDidChangeNotification, 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsFadingLabel;
  -[MapsFadingLabel layoutSubviews](&v3, "layoutSubviews");
  -[MapsFadingLabel _updateFadeWidth](self, "_updateFadeWidth");
  -[MapsFadingLabel _updateFadeVisibility](self, "_updateFadeVisibility");
}

- (void)setFont:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsFadingLabel;
  -[MapsFadingLabel setFont:](&v4, "setFont:", a3);
  -[MapsFadingLabel _updateFadeWidth](self, "_updateFadeWidth");
  -[MapsFadingLabel _updateFadeVisibility](self, "_updateFadeVisibility");
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsFadingLabel;
  -[MapsFadingLabel setText:](&v4, "setText:", a3);
  -[MapsFadingLabel _updateFadeVisibility](self, "_updateFadeVisibility");
}

- (void)_preferredContentSizeCategoryDidChange
{
  -[MapsFadingLabel _updateFadeWidth](self, "_updateFadeWidth");
  -[MapsFadingLabel _updateFadeVisibility](self, "_updateFadeVisibility");
}

- (void)_updateFadeWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  -[MapsFadingLabel bounds](self, "bounds");
  -[CALayer setFrame:](self->_maskLayer, "setFrame:");
  -[MapsFadingLabel bounds](self, "bounds");
  -[CALayer setFrame:](self->_containerLayer, "setFrame:");
  -[MapsFadingLabel _lineHeight](self, "_lineHeight");
  v4 = v3;
  -[MapsFadingLabel bounds](self, "bounds");
  v6 = v5 - v4;
  -[MapsFadingLabel bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", 0.0, v6);
  -[MapsFadingLabel bounds](self, "bounds");
  v8 = v7;
  -[MapsFadingLabel bounds](self, "bounds");
  -[CALayer setFrame:](self->_multiLineFillLayer, "setFrame:", 0.0, 0.0, v8, v9 - v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel font](self, "font"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel traitCollection](self, "traitCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v11));

  -[MapsFadingLabel trailingPadding](self, "trailingPadding");
  v14 = v13;
  -[MapsFadingLabel frame](self, "frame");
  v16 = v15;
  objc_msgSend(v12, "_bodyLeading");
  v18 = 100.0;
  if (v17 + v17 < 100.0)
  {
    objc_msgSend(v12, "_bodyLeading");
    v18 = v19 + v19;
  }
  -[MapsFadingLabel frame](self, "frame");
  v25[0] = &off_101275028;
  v21 = 1.0 - v14 / v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21 - v18 / v20));
  v25[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
  v25[2] = v23;
  v25[3] = &off_101275058;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v24);

  -[CALayer setNeedsDisplay](self->_maskLayer, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_containerLayer, "setNeedsDisplay");
  -[CAGradientLayer setNeedsDisplay](self->_gradientLayer, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_multiLineFillLayer, "setNeedsDisplay");

}

- (void)_updateFadeDirection
{
  id v3;
  double v4;
  double v5;

  v3 = -[MapsFadingLabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v3 == (id)1)
    v4 = 1.0;
  else
    v4 = 0.0;
  if (v3 == (id)1)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v4, 0.5);
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", v5, 0.5);
}

- (void)_updateFadeVisibility
{
  double v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel font](self, "font"));
  objc_msgSend(v4, "leading");
  -[MapsFadingLabel setTruncated:](self, "setTruncated:", -[MapsFadingLabel isTextTruncatedIgnoringLeading:](self, "isTextTruncatedIgnoringLeading:", v3 < 0.0));

}

- (double)_lineHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[MapsFadingLabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
  v4 = v3;
  -[MapsFadingLabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
  v6 = v4 + v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel font](self, "font"));
  objc_msgSend(v7, "lineHeight");
  if (v6 > v8)
  {
    -[MapsFadingLabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
    v13 = v12;
    -[MapsFadingLabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
    v11 = v13 + v14;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel font](self, "font"));
    objc_msgSend(v9, "lineHeight");
    v11 = v10;

  }
  return v11;
}

- (void)setTruncated:(BOOL)a3
{
  CALayer *maskLayer;
  void *v5;
  void *v6;
  CALayer *v7;
  id v8;

  if (self->_truncated != a3)
  {
    self->_truncated = a3;
    if (a3)
    {
      maskLayer = self->_maskLayer;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel layer](self, "layer"));
      v6 = v5;
      v7 = maskLayer;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel layer](self, "layer"));
      v6 = v5;
      v7 = 0;
    }
    objc_msgSend(v5, "setMask:", v7);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel delegate](self, "delegate"));
    objc_msgSend(v8, "fadingLabelTruncationChanged:", self);

  }
}

- (void)setTrailingPadding:(double)a3
{
  if (self->_trailingPadding != a3)
  {
    self->_trailingPadding = a3;
    -[MapsFadingLabel _updateFadeWidth](self, "_updateFadeWidth");
  }
}

- (void)_localeDidChangeNotification:(id)a3
{
  -[MapsFadingLabel _updateFadeWidth](self, "_updateFadeWidth", a3);
  -[MapsFadingLabel _updateFadeDirection](self, "_updateFadeDirection");
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (double)trailingPadding
{
  return self->_trailingPadding;
}

- (MapsFadingLabelDelegate)delegate
{
  return (MapsFadingLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_containerLayer, a3);
}

- (CALayer)multiLineFillLayer
{
  return self->_multiLineFillLayer;
}

- (void)setMultiLineFillLayer:(id)a3
{
  objc_storeStrong((id *)&self->_multiLineFillLayer, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_multiLineFillLayer, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
