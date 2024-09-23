@implementation SKUIPreviewProgressIndicator

- (SKUIPreviewProgressIndicator)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIPreviewProgressIndicator *v8;
  SKUIPreviewProgressIndicator *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  SKUIShapeView *backgroundView;
  uint64_t v20;
  SKUIShapeView *foregroundView;
  SKUIShapeView *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIImageView *cancelImageView;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewProgressIndicator initWithFrame:].cold.1();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIPreviewProgressIndicator;
  v8 = -[SKUIPreviewProgressIndicator initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIPreviewProgressIndicator bounds](v8, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = -[SKUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v9, "_newShapeViewWithBounds:lineWidth:");
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (SKUIShapeView *)v18;

    -[SKUIShapeView setUserInteractionEnabled:](v9->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SKUIPreviewProgressIndicator addSubview:](v9, "addSubview:", v9->_backgroundView);
    v20 = -[SKUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v9, "_newShapeViewWithBounds:lineWidth:", v11, v13, v15, v17, 4.0);
    foregroundView = v9->_foregroundView;
    v9->_foregroundView = (SKUIShapeView *)v20;

    v22 = v9->_foregroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShapeView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[SKUIShapeView setUserInteractionEnabled:](v9->_foregroundView, "setUserInteractionEnabled:", 0);
    -[SKUIShapeView layer](v9->_foregroundView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "setFillColor:", objc_msgSend(v25, "CGColor"));

    objc_msgSend(v24, "setStrokeEnd:", 0.0);
    -[SKUIPreviewProgressIndicator addSubview:](v9, "addSubview:", v9->_foregroundView);
    v26 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonConnecting"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageWithRenderingMode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v29);
    cancelImageView = v9->_cancelImageView;
    v9->_cancelImageView = (UIImageView *)v30;

    -[UIImageView setAutoresizingMask:](v9->_cancelImageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v9->_cancelImageView, "setContentMode:", 4);
    -[UIImageView setFrame:](v9->_cancelImageView, "setFrame:", v11, v13, v15, v17);
    -[SKUIPreviewProgressIndicator addSubview:](v9, "addSubview:", v9->_cancelImageView);

  }
  return v9;
}

- (void)beginIndeterminateAnimation
{
  _BOOL4 isIndeterminate;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  isIndeterminate = self->_isIndeterminate;
  -[SKUIShapeView layer](self->_backgroundView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (isIndeterminate)
  {
    objc_msgSend(v4, "animationKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      return;
  }
  else
  {
    objc_msgSend(v4, "setStrokeStart:", 0.119999997);
    self->_isIndeterminate = 1;

  }
  -[SKUIPreviewProgressIndicator window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SKUIPreviewProgressIndicator _beginIndeterminateAnimation](self, "_beginIndeterminateAnimation");
}

- (void)endIndeterminateAnimation
{
  void *v3;
  SKUIShapeView *backgroundView;
  CGAffineTransform v5;

  if (self->_isIndeterminate)
  {
    -[SKUIShapeView layer](self->_backgroundView, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStrokeStart:", 0.0);
    objc_msgSend(v3, "removeAllAnimations");
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    -[SKUIShapeView setTransform:](backgroundView, "setTransform:", &v5);
    self->_isIndeterminate = 0;

  }
}

- (void)reloadWithPlayerStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "playerState") == 1)
  {
    -[SKUIPreviewProgressIndicator beginIndeterminateAnimation](self, "beginIndeterminateAnimation");
  }
  else
  {
    objc_msgSend(v9, "duration");
    v6 = v7;
    HIDWORD(v7) = 1018167296;
    if (v6 >= 2.22044605e-16)
    {
      objc_msgSend(v9, "currentTime");
      v7 = v8 / v6;
      *(float *)&v7 = v7;
    }
    else
    {
      LODWORD(v7) = 0;
    }
    -[SKUIPreviewProgressIndicator setProgress:animated:](self, "setProgress:animated:", v4, v7);
  }

}

- (void)setProgress:(float)a3
{
  -[SKUIPreviewProgressIndicator setProgress:animated:](self, "setProgress:animated:", 0);
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  float v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921)
      -[SKUIPreviewProgressIndicator endIndeterminateAnimation](self, "endIndeterminateAnimation");
    v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    -[SKUIShapeView layer](self->_foregroundView, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDuration:", 0.2);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v8, "setRemovedOnCompletion:", 0);
      *(float *)&v9 = self->_progress;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToValue:", v10);

      objc_msgSend(v11, "addAnimation:forKey:", v8, 0);
    }
    else
    {
      objc_msgSend(v11, "removeAllAnimations");
      objc_msgSend(v11, "setStrokeEnd:", self->_progress);
    }

  }
}

- (void)setBackgroundColor:(id)a3
{
  SKUIShapeView *backgroundView;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  backgroundView = self->_backgroundView;
  v5 = a3;
  -[SKUIShapeView setBackgroundColor:](backgroundView, "setBackgroundColor:", v5);
  -[SKUIShapeView layer](self->_backgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  v8.receiver = self;
  v8.super_class = (Class)SKUIPreviewProgressIndicator;
  -[SKUIPreviewProgressIndicator setBackgroundColor:](&v8, sel_setBackgroundColor_, v7);

}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SKUIPreviewProgressIndicator tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  -[SKUIShapeView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v4);

  -[SKUIShapeView layer](self->_foregroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v4);

  v7.receiver = self;
  v7.super_class = (Class)SKUIPreviewProgressIndicator;
  -[SKUIPreviewProgressIndicator tintColorDidChange](&v7, sel_tintColorDidChange);
}

- (void)_beginIndeterminateAnimation
{
  void *v3;
  SKUIShapeView *backgroundView;
  _QWORD v5[5];
  CGAffineTransform v6;

  -[SKUIShapeView layer](self->_backgroundView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  -[SKUIShapeView setTransform:](backgroundView, "setTransform:", &v6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke;
  v5[3] = &unk_1E739FD38;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 197228, v5, 0, 1.0, 0.0);
}

uint64_t __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[6];

  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E73A4960;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    result = objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)v2++ * 0.25, 0.25);
  }
  while (v2 != 4);
  return result;
}

uint64_t __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SKUIShapeView *v10;
  SKUIShapeView *v11;
  void *v12;
  id v13;
  const CGPath *v14;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = [SKUIShapeView alloc];
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18 = CGRectInset(v17, a4 * 0.5, a4 * 0.5);
  v11 = -[SKUIShapeView initWithFrame:](v10, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  CGAffineTransformMakeRotation(&v16, -1.57079633);
  -[SKUIShapeView setTransform:](v11, "setTransform:", &v16);
  -[SKUIShapeView layer](v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineWidth:", a4);
  -[SKUIPreviewProgressIndicator tintColor](self, "tintColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  -[SKUIShapeView bounds](v11, "bounds");
  v14 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(v12, "setPath:", v14);
  CGPathRelease(v14);

  return v11;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_cancelImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPreviewProgressIndicator initWithFrame:]";
}

@end
