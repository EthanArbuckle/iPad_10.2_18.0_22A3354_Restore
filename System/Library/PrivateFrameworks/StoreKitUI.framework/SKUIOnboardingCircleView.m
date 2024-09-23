@implementation SKUIOnboardingCircleView

- (SKUIOnboardingCircleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIOnboardingCircleView *v8;
  UIImageView *v9;
  UIImageView *backgroundImageView;
  UIImageView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOnboardingCircleView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIOnboardingCircleView;
  v8 = -[SKUIOnboardingCircleView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundImageView = v8->_backgroundImageView;
    v8->_backgroundImageView = v9;

    -[UIImageView setAlpha:](v8->_backgroundImageView, "setAlpha:", 0.0);
    v11 = v8->_backgroundImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SKUIOnboardingCircleView addSubview:](v8, "addSubview:", v8->_backgroundImageView);
  }
  return v8;
}

- (void)setBackgroundImage:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_backgroundImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v6);
    -[SKUIOnboardingCircleView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBackgroundImageAlpha:(double)a3
{
  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", a3);
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    -[SKUIOnboardingCircleView setNeedsDisplay](self, "setNeedsDisplay");
    -[SKUIOnboardingCircleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFillColor:(id)a3
{
  UIColor *v4;
  UIColor *fillColor;

  if (self->_fillColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    fillColor = self->_fillColor;
    self->_fillColor = v4;

    -[SKUIOnboardingCircleView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTitlePosition:(int64_t)a3
{
  if (self->_titlePosition != a3)
  {
    self->_titlePosition = a3;
    -[SKUIOnboardingCircleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v10 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[SKUIOnboardingCircleView addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SKUIOnboardingCircleView;
  -[SKUIOnboardingCircleView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
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
  void *v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0DC3508];
  -[SKUIOnboardingCircleView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SKUIOnboardingCircleView edgeInsets](self, "edgeInsets");
  objc_msgSend(v4, "bezierPathWithOvalInRect:", v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingCircleView fillColor](self, "fillColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "set");

  objc_msgSend(v18, "fill");
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UILabel *titleLabel;
  double minimumDiameter;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  int64_t titlePosition;
  void *v27;
  int64_t v28;
  float v29;
  double v30;
  float v31;
  double v32;
  UILabel *v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t rect;
  double rect_8;
  double rect_16;
  double rect_24;
  CGRect v41;

  -[SKUIOnboardingCircleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIOnboardingCircleView edgeInsets](self, "edgeInsets");
  v14 = v13;
  v15 = v11;
  v17 = v16;
  v18 = v12;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    minimumDiameter = self->_minimumDiameter;
    if (minimumDiameter < 0.00000011920929)
      minimumDiameter = v8;
    rect_24 = v4;
    v21 = minimumDiameter - v11 - v12 + -6.0;
    rect_8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v21, 1.79769313e308);
    rect_16 = v6;
    v24 = v23;
    if (v22 < v21)
      v21 = v22;
    v25 = (v8 - v21) * 0.5;
    titlePosition = self->_titlePosition;
    -[UIImageView image](self->_backgroundImageView, "image", floorf(v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      v28 = titlePosition;
    else
      v28 = 0;
    v29 = (v10 - v24) * 0.5;
    v30 = floorf(v29);
    v31 = v10 - v17 + -15.0 - v24;
    v32 = floorf(v31);
    if (v28 != 1)
      v32 = rect_8;
    if (!v28)
      v32 = v30;
    v33 = self->_titleLabel;
    v34 = rect;
    v35 = v21;
    v36 = v24;
    v6 = rect_16;
    v4 = rect_24;
    v41 = CGRectIntegral(*(CGRect *)(&v32 - 1));
    -[UILabel setFrame:](v33, "setFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  }
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4 + v15, v6 + v14, v8 - (v15 + v18), v10 - (v14 + v17));
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)minimumDiameter
{
  return self->_minimumDiameter;
}

- (void)setMinimumDiameter:(double)a3
{
  self->_minimumDiameter = a3;
}

- (int64_t)titlePosition
{
  return self->_titlePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIOnboardingCircleView initWithFrame:]";
}

@end
