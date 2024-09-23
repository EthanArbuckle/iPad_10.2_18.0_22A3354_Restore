@implementation BSUIProgressSeparatorController

- (BSUIProgressSeparatorController)initWithProgressView:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  BSUIProgressSeparatorController *v11;
  BSUIProgressSeparatorController *v12;
  uint64_t v13;
  BSUIWeeklyProgressMetrics *metrics;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BSUIProgressSeparatorController;
  v11 = -[BSUIProgressSeparatorController init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_progressView, a3);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
    metrics = v12->_metrics;
    v12->_metrics = (BSUIWeeklyProgressMetrics *)v13;

    v12->_frame.origin.x = x;
    v12->_frame.origin.y = y;
    v12->_frame.size.width = width;
    v12->_frame.size.height = height;
  }

  return v12;
}

- (void)updateProgress:(double)a3 animate:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGColor *v14;
  id v15;
  void *v16;
  id v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController metrics](self, "metrics", a4));
  v7 = v6;
  if (a3 >= 1.0)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progressColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controlColor"));
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController progressView](self, "progressView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolvedColorWithTraitCollection:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController separatorLayer](self, "separatorLayer"));
  v14 = (CGColor *)objc_msgSend(v13, "backgroundColor");
  v17 = objc_retainAutorelease(v12);
  LOBYTE(v14) = CGColorEqualToColor(v14, (CGColorRef)objc_msgSend(v17, "CGColor"));

  if ((v14 & 1) == 0)
  {
    v15 = objc_msgSend(objc_retainAutorelease(v17), "CGColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController separatorLayer](self, "separatorLayer"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

  }
}

- (void)configureWithType:(int64_t)a3
{
  double Width;
  CGRect v6;
  CGRect v7;

  -[BSUIProgressSeparatorController frame](self, "frame");
  Width = CGRectGetWidth(v6);
  -[BSUIProgressSeparatorController frame](self, "frame");
  -[BSUIProgressSeparatorController setBounds:](self, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v7));
  -[BSUIProgressSeparatorController _setupBackgroundLayer](self, "_setupBackgroundLayer");
  -[BSUIProgressSeparatorController _setupSeparatorForLayoutType:](self, "_setupSeparatorForLayoutType:", a3);
}

- (void)_setupBackgroundLayer
{
  void *v3;
  CALayer *v4;
  CALayer *backgroundLayer;
  id v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController backgroundLayer](self, "backgroundLayer"));

  if (!v3)
  {
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v4;

  }
  -[BSUIProgressSeparatorController bounds](self, "bounds");
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  -[BSUIProgressSeparatorController frame](self, "frame");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  if (self->_debugBounds)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor")));
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    -[CALayer setBorderWidth:](self->_backgroundLayer, "setBorderWidth:", 0.5);
  }
  -[CALayer setMasksToBounds:](self->_backgroundLayer, "setMasksToBounds:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController progressView](self, "progressView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentationLayer"));
  objc_msgSend(v8, "addSublayer:", self->_backgroundLayer);

}

- (void)_setupSeparatorForLayoutType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController separatorLayer](self, "separatorLayer"));
  objc_msgSend(v5, "removeFromSuperlayer");

  -[BSUIProgressSeparatorController setSeparatorLayer:](self, "setSeparatorLayer:", 0);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController metrics](self, "metrics"));
    v10 = v9;
    if (a3 == 6)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "controlColor"));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "progressColor"));
    v17 = (void *)v11;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController progressView](self, "progressView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resolvedColorWithTraitCollection:", v19));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController metrics](self, "metrics"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController _gradientSeparatorWithColors:backgroundColor:](self, "_gradientSeparatorWithColors:backgroundColor:", v15, v20));
    -[BSUIProgressSeparatorController setSeparatorLayer:](self, "setSeparatorLayer:", v21);

    goto LABEL_11;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController metrics](self, "metrics"));
    v7 = v6;
    if (a3 == 4)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controlColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progressColor"));
    v12 = (void *)v8;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController progressView](self, "progressView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resolvedColorWithTraitCollection:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController _separatorWithColor:](self, "_separatorWithColor:", v15));
    -[BSUIProgressSeparatorController setSeparatorLayer:](self, "setSeparatorLayer:", v16);
LABEL_11:

  }
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController backgroundLayer](self, "backgroundLayer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController separatorLayer](self, "separatorLayer"));
  objc_msgSend(v23, "addSublayer:", v22);

}

- (id)_gradientSeparatorWithColors:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSeparatorController metrics](self, "metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightToLeft"));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = objc_alloc_init((Class)CAGradientLayer);
  v12 = objc_retainAutorelease(v6);
  v13 = objc_msgSend(v12, "CGColor");

  v18[0] = v13;
  v14 = objc_retainAutorelease(v7);
  v15 = objc_msgSend(v14, "CGColor");

  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  objc_msgSend(v11, "setColors:", v16);

  -[BSUIProgressSeparatorController bounds](self, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v11, "setStartPoint:", (double)v10, 0.5);
  objc_msgSend(v11, "setEndPoint:", (double)(v10 ^ 1), 0.5);
  return v11;
}

- (id)_separatorWithColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "CGColor");

  objc_msgSend(v5, "setBackgroundColor:", v7);
  -[BSUIProgressSeparatorController bounds](self, "bounds");
  objc_msgSend(v5, "setBounds:");
  -[BSUIProgressSeparatorController bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  return v5;
}

- (id)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  void *v6;
  CGRect v8;

  v3 = objc_opt_class(self, a2);
  -[BSUIProgressSeparatorController frame](self, "frame");
  v4 = NSStringFromCGRect(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p frame=%@"), v3, self, v5));

  return v6;
}

- (BSUIWeeklyProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BSUIWeeklyProgressMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CALayer)separatorLayer
{
  return self->_separatorLayer;
}

- (void)setSeparatorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
