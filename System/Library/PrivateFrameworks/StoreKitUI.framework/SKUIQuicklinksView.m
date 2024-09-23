@implementation SKUIQuicklinksView

- (SKUIQuicklinksView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIQuicklinksView *v8;
  UIView *v9;
  UIView *borderView;
  UIView *v11;
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
    -[SKUIQuicklinksView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIQuicklinksView;
  v8 = -[SKUIQuicklinksView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v8->_borderView;
    v8->_borderView = v9;

    v11 = v8->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SKUIQuicklinksView addSubview:](v8, "addSubview:", v8->_borderView);
  }
  return v8;
}

- (void)setCollectionView:(id)a3
{
  UIView *v5;
  UIView *collectionView;
  UIView *v7;

  v5 = (UIView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    -[UIView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView)
      -[SKUIQuicklinksView addSubview:](self, "addSubview:");
  }

}

- (void)setColoringWithColorScheme:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIColor *v8;
  UIColor *titleColor;
  UILabel *titleLabel;
  UIColor *v11;
  UIColor *v12;
  void *v13;
  UIView *borderView;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[SKUIQuicklinksView setBackgroundColor:](self, "setBackgroundColor:", v7);
  -[UIView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);
  objc_msgSend(v17, "secondaryTextColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  titleColor = self->_titleColor;
  self->_titleColor = v8;

  if (self->_titleColor)
  {
    titleLabel = self->_titleLabel;
LABEL_7:
    -[UILabel setTextColor:](titleLabel, "setTextColor:");
    goto LABEL_8;
  }
  objc_msgSend(v17, "primaryTextColor");
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v12 = self->_titleColor;
  self->_titleColor = v11;

  titleLabel = self->_titleLabel;
  if (self->_titleColor)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](titleLabel, "setTextColor:", v16);

LABEL_8:
  objc_msgSend(v17, "primaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  borderView = self->_borderView;
  if (v13)
  {
    -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v15);

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v4, "isEqualToString:", v15) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SKUIQuicklinksView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v14);

        }
        -[SKUIQuicklinksView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v13 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIQuicklinksView setNeedsLayout](self, "setNeedsLayout");
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
  UILabel *titleLabel;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGRect v12;

  -[SKUIQuicklinksView bounds](self, "bounds");
  v4 = v3;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v7 = v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 15.0, v4 + -15.0 + -15.0);
    v12.origin.x = 15.0;
    v12.origin.y = 15.0;
    v12.size.width = v4 + -15.0 + -15.0;
    v12.size.height = v7;
    v8 = CGRectGetMaxY(v12) + 11.0;
  }
  else
  {
    v8 = 15.0;
  }
  -[UIView frame](self->_collectionView, "frame");
  -[UIView setFrame:](self->_collectionView, "setFrame:", 0.0, v8, v4);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = 1.0 / v10;

  -[UIView setFrame:](self->_borderView, "setFrame:", 0.0, v8 - v11, v4, v11);
}

- (void)setBackgroundColor:(id)a3
{
  UIView *collectionView;
  id v5;
  objc_super v6;

  collectionView = self->_collectionView;
  v5 = a3;
  -[UIView setBackgroundColor:](collectionView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIQuicklinksView;
  -[SKUIQuicklinksView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  UILabel *titleLabel;
  double v6;
  double v7;
  UIView *collectionView;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame", a3.width, a3.height);
    v7 = v6 + 30.0;
  }
  else
  {
    v7 = 30.0;
  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UIView frame](collectionView, "frame");
    v7 = v7 + v9;
  }
  if (self->_titleLabel && self->_collectionView)
    v7 = v7 + 11.0;
  v10 = width;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIQuicklinksView initWithFrame:]";
}

@end
