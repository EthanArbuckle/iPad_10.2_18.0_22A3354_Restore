@implementation TrailingFadeLabel

- (TrailingFadeLabel)initWithFrame:(CGRect)a3
{
  TrailingFadeLabel *v3;
  CAGradientLayer *v4;
  CAGradientLayer *gradientLayer;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  objc_super v16;
  _QWORD v17[4];

  v16.receiver = self;
  v16.super_class = (Class)TrailingFadeLabel;
  v3 = -[TrailingFadeLabel initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "colorWithAlphaComponent:", 1.0)));
    v17[0] = objc_msgSend(v6, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 1.0)));
    v17[1] = objc_msgSend(v8, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.0)));
    v17[2] = objc_msgSend(v10, "CGColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.0)));
    v17[3] = objc_msgSend(v12, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
    -[CAGradientLayer setColors:](v3->_gradientLayer, "setColors:", v13);

    -[TrailingFadeLabel _updateFadeDirection](v3, "_updateFadeDirection");
    -[TrailingFadeLabel _updateFadeWidth](v3, "_updateFadeWidth");
    -[TrailingFadeLabel _updateFadeVisibility](v3, "_updateFadeVisibility");
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TrailingFadeLabel;
  -[TrailingFadeLabel layoutSubviews](&v3, "layoutSubviews");
  -[TrailingFadeLabel _updateFadeWidth](self, "_updateFadeWidth");
  -[TrailingFadeLabel _updateFadeVisibility](self, "_updateFadeVisibility");
  -[TrailingFadeLabel _updateFadeDirection](self, "_updateFadeDirection");
}

- (void)_updateFadeWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  -[TrailingFadeLabel bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  -[TrailingFadeLabel bounds](self, "bounds");
  v4 = -14.0 / v3;
  -[TrailingFadeLabel bounds](self, "bounds");
  v11[0] = &off_1001BCA60;
  v5 = v4 + 1.0;
  v7 = -2.0 / v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 + 1.0));
  v11[2] = v9;
  v11[3] = &off_1001BCA70;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));
  -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v10);

  -[CAGradientLayer setNeedsDisplay](self->_gradientLayer, "setNeedsDisplay");
}

- (void)_updateFadeDirection
{
  id v3;
  double v4;
  double v5;

  v3 = -[TrailingFadeLabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v3 == (id)1)
    v4 = 1.0;
  else
    v4 = 0.0;
  if (v3 == (id)1)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v4);
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", v5, 0.0);
}

- (void)_updateFadeVisibility
{
  CAGradientLayer *gradientLayer;
  void *v4;
  CAGradientLayer *v5;
  id v6;

  if (-[TrailingFadeLabel isTextTruncated](self, "isTextTruncated"))
  {
    gradientLayer = self->_gradientLayer;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrailingFadeLabel layer](self, "layer"));
    v6 = v4;
    v5 = gradientLayer;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrailingFadeLabel layer](self, "layer"));
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setMask:", v5);

}

- (BOOL)isTextTruncated
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrailingFadeLabel attributedText](self, "attributedText"));
  -[TrailingFadeLabel bounds](self, "bounds");
  objc_msgSend(v3, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, v4);
  v6 = v5;

  -[TrailingFadeLabel bounds](self, "bounds");
  return v6 > v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
