@implementation SKUIIPhoneProductPageView

- (SKUIIPhoneProductPageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIIPhoneProductPageView *v8;
  void *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneProductPageView initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIIPhoneProductPageView;
  v8 = -[SKUIIPhoneProductPageView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPhoneProductPageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[SKUIIPhoneProductPageView addSubview:](v8, "addSubview:", v10);

  }
  return v8;
}

- (void)setView:(id)a3
{
  UIView *v5;
  UIView *view;
  UIView *v7;

  v5 = (UIView *)a3;
  view = self->_view;
  if (view != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](view, "removeFromSuperview");
    objc_storeStrong((id *)&self->_view, a3);
    -[SKUIIPhoneProductPageView addSubview:](self, "addSubview:", self->_view);
    -[SKUIIPhoneProductPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBannerView:(id)a3
{
  UIView *v5;
  UIView *bannerView;
  UIView *v7;

  v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[SKUIIPhoneProductPageView addSubview:](self, "addSubview:", self->_bannerView);
    -[SKUIIPhoneProductPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)animateYPosition:(double)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (a3 != 0.0 && self->_view != 0)
  {
    -[SKUIIPhoneProductPageView bounds](self, "bounds");
    v7 = v6;
    v9 = v8 - a3;
    -[SKUIIPhoneProductPageView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v19 = objc_alloc_init(MEMORY[0x1E0CD2710]);
    objc_msgSend(v19, "setKeyPath:", CFSTR("position"));
    objc_msgSend(v19, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v14);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v15);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v16);

    objc_msgSend(v19, "setDuration:", 0.200000003);
    -[UIView layer](self->_view, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    -[UIView layer](self->_view, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("ANIMATION_KEY"));

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *view;
  UIView *bannerView;
  double bannerOffset;
  double v12;
  double v13;

  -[SKUIIPhoneProductPageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  view = self->_view;
  if (view)
    -[UIView setFrame:](view, "setFrame:", v3);
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView frame](bannerView, "frame");
    bannerOffset = self->_bannerOffset;
    -[UIView sizeThatFits:](self->_bannerView, "sizeThatFits:", v6, v8);
    -[UIView setFrame:](self->_bannerView, "setFrame:", v4, bannerOffset, v12, v13);
    -[SKUIIPhoneProductPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_bannerView);
  }
}

- (UIView)view
{
  return self->_view;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (double)bannerOffset
{
  return self->_bannerOffset;
}

- (void)setBannerOffset:(double)a3
{
  self->_bannerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPhoneProductPageView initWithFrame:]";
}

@end
