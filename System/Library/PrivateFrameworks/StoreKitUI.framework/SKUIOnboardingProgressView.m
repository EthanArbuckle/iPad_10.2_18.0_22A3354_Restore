@implementation SKUIOnboardingProgressView

- (SKUIOnboardingProgressView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIOnboardingProgressView *v16;
  SKUIOnboardingProgressView *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SKUIShapeView *v26;
  SKUIShapeView *borderView;
  void *v28;
  id v29;
  id v30;
  SKUIShapeView *v31;
  SKUIShapeView *progressView;
  SKUIShapeView *v33;
  void *v34;
  SKUIShapeView *v35;
  void *v36;
  id v37;
  id v38;
  CGAffineTransform v40;
  objc_super v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIOnboardingProgressView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)SKUIOnboardingProgressView;
  v16 = -[SKUIOnboardingProgressView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    -[SKUIOnboardingProgressView bounds](v16, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = -[SKUIShapeView initWithFrame:]([SKUIShapeView alloc], "initWithFrame:", v18, v20, v22, v24);
    borderView = v17->_borderView;
    v17->_borderView = v26;

    -[SKUIOnboardingProgressView addSubview:](v17, "addSubview:", v17->_borderView);
    -[SKUIShapeView layer](v17->_borderView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v28, "setFillColor:", objc_msgSend(v29, "CGColor"));

    objc_msgSend(v28, "setLineWidth:", 3.0);
    -[SKUIOnboardingProgressView _borderColor](v17, "_borderColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v28, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    v31 = -[SKUIShapeView initWithFrame:]([SKUIShapeView alloc], "initWithFrame:", v19, v21, v23, v25);
    progressView = v17->_progressView;
    v17->_progressView = v31;

    v33 = v17->_progressView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShapeView setBackgroundColor:](v33, "setBackgroundColor:", v34);

    v35 = v17->_progressView;
    CGAffineTransformMakeRotation(&v40, -1.57079633);
    -[SKUIShapeView setTransform:](v35, "setTransform:", &v40);
    -[SKUIOnboardingProgressView addSubview:](v17, "addSubview:", v17->_progressView);
    -[SKUIShapeView layer](v17->_progressView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v36, "setFillColor:", objc_msgSend(v37, "CGColor"));

    objc_msgSend(v36, "setLineWidth:", 6.0);
    -[SKUIOnboardingProgressView tintColor](v17, "tintColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v36, "setStrokeColor:", objc_msgSend(v38, "CGColor"));

    objc_msgSend(v36, "setStrokeEnd:", 0.0);
    objc_msgSend(v36, "setStrokeStart:", 0.0);

  }
  return v17;
}

+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3
{
  double width;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIOnboardingProgressView preferredImageSizeForViewSize:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = width + -12.0 + -8.0;
  v13 = v12;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIColor)fillColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[SKUIShapeView layer](self->_borderView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fillColor");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGSize)preferredImageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_opt_class();
  -[SKUIOnboardingProgressView frame](self, "frame");
  objc_msgSend(v3, "preferredImageSizeForViewSize:", v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setFillColor:(id)a3
{
  SKUIShapeView *borderView;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  borderView = self->_borderView;
  v4 = a3;
  -[SKUIShapeView layer](borderView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (void)setImage:(id)a3
{
  id v4;
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v4 = a3;
  imageView = self->_imageView;
  v11 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v7 = self->_imageView;
      self->_imageView = v6;

      v8 = self->_imageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SKUIOnboardingProgressView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setImage:](imageView, "setImage:", v11);
    -[SKUIOnboardingProgressView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    v10 = self->_imageView;
    self->_imageView = 0;

  }
}

- (void)setProgress:(double)a3
{
  -[SKUIOnboardingProgressView setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  progress = self->_progress;
  if (progress != a3)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    v7 = fmax(a3, 0.0);
    self->_progress = v7;
    -[SKUIShapeView layer](self->_progressView, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDuration:", vabdd_f64(progress, v7) * 0.6);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v8, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimingFunction:", v9);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_progress);
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

- (void)setTitle:(id)a3
{
  uint64_t v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "length");
  titleLabel = self->_titleLabel;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      v12 = self->_titleLabel;
      -[SKUIOnboardingProgressView tintColor](self, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v12, "setTextColor:", v13);

      -[SKUIOnboardingProgressView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v15);
    -[SKUIOnboardingProgressView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    v14 = self->_titleLabel;
    self->_titleLabel = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
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
  CGFloat v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  UIImageView *imageView;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel **p_titleLabel;
  double v26;
  double v27;
  float v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[SKUIOnboardingProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIShapeView setFrame:](self->_borderView, "setFrame:");
  -[SKUIShapeView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
  -[SKUIShapeView layer](self->_borderView, "layer");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineWidth");
  v12 = v11 * 0.5;
  v13 = (void *)MEMORY[0x1E0DC3508];
  -[SKUIShapeView bounds](self->_borderView, "bounds");
  v31 = CGRectInset(v30, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "setPath:", objc_msgSend(v14, "CGPath"));

  -[SKUIShapeView layer](self->_progressView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineWidth");
  v17 = v16 * 0.5;
  v18 = (void *)MEMORY[0x1E0DC3508];
  -[SKUIShapeView bounds](self->_progressView, "bounds");
  v33 = CGRectInset(v32, v17, v17);
  objc_msgSend(v18, "bezierPathWithOvalInRect:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setPath:", objc_msgSend(v19, "CGPath"));

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v8, v10);
    v22 = v21;
    v24 = v23;
    *(float *)&v21 = (v8 - v21) * 0.5;
    *(float *)&v23 = (v10 - v23) * 0.5;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", floorf(*(float *)&v21), floorf(*(float *)&v23), v22, v24);
    p_titleLabel = &self->_titleLabel;
LABEL_5:
    -[UILabel setHidden:](*p_titleLabel, "setHidden:", imageView != 0);
    goto LABEL_6;
  }
  p_titleLabel = &self->_titleLabel;
  if (*p_titleLabel)
  {
    v26 = *MEMORY[0x1E0C9D648];
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v8, v10);
    v28 = (v10 - v27) * 0.5;
    -[UILabel setFrame:](*p_titleLabel, "setFrame:", v26, floorf(v28), v8, v27);
    goto LABEL_5;
  }
LABEL_6:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  -[SKUIOnboardingProgressView traitCollection](self, "traitCollection", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  v5 = 78.0;
  if (v4 == 2)
    v5 = 120.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  -[SKUIOnboardingProgressView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShapeView layer](self->_borderView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingProgressView _borderColor](self, "_borderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  -[SKUIShapeView layer](self->_progressView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);
  v8.receiver = self;
  v8.super_class = (Class)SKUIOnboardingProgressView;
  -[SKUIOnboardingProgressView tintColorDidChange](&v8, sel_tintColorDidChange);

}

- (id)_borderColor
{
  void *v2;
  void *v3;

  -[SKUIOnboardingProgressView tintColor](self, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredImageSizeForViewSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
