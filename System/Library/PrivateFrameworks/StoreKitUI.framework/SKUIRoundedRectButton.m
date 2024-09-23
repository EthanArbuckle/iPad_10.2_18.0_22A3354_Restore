@implementation SKUIRoundedRectButton

- (SKUIRoundedRectButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIRoundedRectButton *v8;
  SKUIRoundedRectButton *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *borderView;
  UIView *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRoundedRectButton initWithFrame:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIRoundedRectButton;
  v8 = -[SKUIRoundedRectButton initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIRoundedRectButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    -[SKUIRoundedRectButton titleLabel](v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    -[SKUIRoundedRectButton titleLabel](v9, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumScaleFactor:", 0.933333333);

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v9->_borderView;
    v9->_borderView = v12;

    -[UIView setAutoresizingMask:](v9->_borderView, "setAutoresizingMask:", 18);
    v14 = v9->_borderView;
    -[SKUIRoundedRectButton bounds](v9, "bounds");
    -[UIView setFrame:](v14, "setFrame:");
    -[UIView setUserInteractionEnabled:](v9->_borderView, "setUserInteractionEnabled:", 0);
    -[SKUIRoundedRectButton addSubview:](v9, "addSubview:", v9->_borderView);
    -[UIView layer](v9->_borderView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRoundedRectButton tintColor](v9, "tintColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    objc_msgSend(v15, "setBorderWidth:", 1.0 / v18);

    objc_msgSend(v15, "setCornerRadius:", 7.0);
    -[SKUIRoundedRectButton _reloadColors](v9, "_reloadColors");
    -[SKUIRoundedRectButton _reloadFonts](v9, "_reloadFonts");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__reloadFonts, *MEMORY[0x1E0DC48E8], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton dealloc](&v4, sel_dealloc);
}

- (void)setSubtitleWithLabel:(id)a3
{
  UILabel *v5;
  UILabel **p_subtitleLabel;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v5 = (UILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    -[SKUIRoundedRectButton titleEdgeInsets](self, "titleEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (-[UILabel isDescendantOfView:](*p_subtitleLabel, "isDescendantOfView:", self))
    {
      -[UILabel removeFromSuperview](*p_subtitleLabel, "removeFromSuperview");
      v8 = v8 + 14.0;
    }
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      -[SKUIRoundedRectButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", *p_subtitleLabel, self->_borderView);
      -[SKUIRoundedRectButton _reloadColors](self, "_reloadColors");
      v8 = v8 + -14.0;
    }
    v15.receiver = self;
    v15.super_class = (Class)SKUIRoundedRectButton;
    -[SKUIRoundedRectButton setTitleEdgeInsets:](&v15, sel_setTitleEdgeInsets_, v8, v10, v12, v14);
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;

  if (self->_subtitleLabel)
  {
    -[SKUIRoundedRectButton bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v12 = v11;
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, CGRectGetMaxY(v14) - v12 + -5.0, v8, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton layoutSubviews](&v13, sel_layoutSubviews);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton setEnabled:](&v6, sel_setEnabled_);
  v5 = 0.33;
  if (v3)
    v5 = 1.0;
  -[SKUIRoundedRectButton setAlpha:](self, "setAlpha:", v5);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v3 = a3;
  if (-[SKUIRoundedRectButton isHighlighted](self, "isHighlighted") != a3)
  {
    -[UIView layer](self->_borderView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("borderWidth"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v6);

    -[SKUIRoundedRectButton _basicAnimationWithKeyPath:](self, "_basicAnimationWithKeyPath:", CFSTR("backgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", 0.12);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "CGColor"));

      -[SKUIRoundedRectButton tintColor](self, "tintColor");
    }
    else
    {
      -[SKUIRoundedRectButton tintColor](self, "tintColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v9, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    }
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setToValue:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v5, "addAnimation:forKey:", v7, CFSTR("borderWidth"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton setHighlighted:](&v11, sel_setHighlighted_, v3);
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  if (self->_subtitleLabel)
    a3.top = a3.top + -14.0;
  v3.receiver = self;
  v3.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton setTitleEdgeInsets:](&v3, sel_setTitleEdgeInsets_, a3.top, a3.left, a3.bottom, a3.right);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, 45.0);
  v4 = 45.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  -[SKUIRoundedRectButton _reloadColors](self, "_reloadColors");
  v3.receiver = self;
  v3.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton tintColorDidChange](&v3, sel_tintColorDidChange);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  int v5;
  void *v6;
  id v7;

  v5 = -[SKUIRoundedRectButton isHighlighted](self, "isHighlighted", a3, a4);
  -[UIView layer](self->_borderView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v6);

  }
  else
  {
    objc_msgSend(v7, "setCompositingFilter:", 0);
  }

}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  void *v3;
  float v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  UIAnimationDragCoefficient();
  *(float *)&v5 = 1.0 / v4;
  objc_msgSend(v3, "setSpeed:", v5);
  return v3;
}

- (void)_reloadColors
{
  void *v3;
  void *v4;
  id v5;

  -[SKUIRoundedRectButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_borderView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);
  -[SKUIRoundedRectButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);

}

- (void)_reloadFonts
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRoundedRectButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRoundedRectButton initWithFrame:]";
}

@end
