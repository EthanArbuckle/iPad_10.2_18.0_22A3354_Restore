@implementation SKUIProductPageFeatureView

- (UIImage)icon
{
  return -[UIImageView image](self->_iconView, "image");
}

- (void)setIcon:(id)a3
{
  id v4;
  UIImageView *iconView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v4 = a3;
  iconView = self->_iconView;
  v11 = v4;
  if (v4)
  {
    if (!iconView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v7 = self->_iconView;
      self->_iconView = v6;

      v8 = self->_iconView;
      -[SKUIProductPageFeatureView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SKUIProductPageFeatureView addSubview:](self, "addSubview:", self->_iconView);
      v4 = v11;
      iconView = self->_iconView;
    }
    -[UIImageView setImage:](iconView, "setImage:", v4);
    -[UIImageView sizeToFit](self->_iconView, "sizeToFit");
  }
  else
  {
    -[UIImageView removeFromSuperview](iconView, "removeFromSuperview");
    v10 = self->_iconView;
    self->_iconView = 0;

  }
  -[SKUIProductPageFeatureView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  UILabel *subtitleLabel;
  UILabel *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIProductPageFeatureView subtitle](self, "subtitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v7 = objc_msgSend(v4, "length");
    subtitleLabel = self->_subtitleLabel;
    if (v7)
    {
      if (!subtitleLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v10 = self->_subtitleLabel;
        self->_subtitleLabel = v9;

        v11 = self->_subtitleLabel;
        -[SKUIProductPageFeatureView backgroundColor](self, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

        v13 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v13, "setFont:", v14);

        -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
        v15 = self->_subtitleLabel;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[UILabel setTextColor:](v15, "setTextColor:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v15, "setTextColor:", v18);

        }
        -[SKUIProductPageFeatureView addSubview:](self, "addSubview:", self->_subtitleLabel);
      }
      v19 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v19, "setMaximumLineHeight:", 16.0);
      objc_msgSend(v19, "setMinimumLineHeight:", 16.0);
      v20 = *MEMORY[0x1E0DC1178];
      v28[0] = v19;
      v21 = *MEMORY[0x1E0DC1140];
      v27[0] = v20;
      v27[1] = v21;
      -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)

      v25 = self->_subtitleLabel;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v24);
      -[UILabel setAttributedText:](v25, "setAttributedText:", v26);

    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
      v17 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

    }
    -[SKUIProductPageFeatureView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  id v18;

  v18 = a3;
  -[SKUIProductPageFeatureView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    v5 = objc_msgSend(v18, "length");
    titleLabel = self->_titleLabel;
    if (v5)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        -[SKUIProductPageFeatureView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_titleLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          SKUIColorWithAlpha(v15, 0.7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v15);
        }

        -[SKUIProductPageFeatureView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v18);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v17 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIProductPageFeatureView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *iconView;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UILabel *titleLabel;
  double v15;
  CGFloat v16;
  UILabel *subtitleLabel;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;

  -[SKUIProductPageFeatureView bounds](self, "bounds");
  v4 = v3;
  iconView = self->_iconView;
  v6 = 0.0;
  v7 = 0.0;
  if (iconView)
  {
    -[UIImageView frame](iconView, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIImageView setFrame:](self->_iconView, "setFrame:");
    v20.origin.y = 2.0;
    v20.origin.x = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    v7 = CGRectGetMaxX(v20) + 10.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v16 = v15;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v7, 0.0, v4 - v7);
    v21.origin.y = 0.0;
    v21.origin.x = v7;
    v21.size.width = v4 - v7;
    v21.size.height = v16;
    v6 = CGRectGetMaxY(v21) + -2.0 + 5.0 + -2.0;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[UILabel frame](subtitleLabel, "frame");
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4 - v7, 1.79769313e308);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v7, v6, v18, v19);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *iconView;
  id v5;
  objc_super v6;

  iconView = self->_iconView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](iconView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPageFeatureView;
  -[SKUIProductPageFeatureView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UIImageView *iconView;
  double v6;
  double v7;
  UILabel *titleLabel;
  double v9;
  double v10;
  UILabel *subtitleLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  iconView = self->_iconView;
  v6 = a3.width;
  if (iconView)
  {
    -[UIImageView frame](iconView, "frame");
    v6 = width - (v7 + 10.0);
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v10 = v9 + -2.0 + 5.0;
  }
  else
  {
    v10 = 5.0;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[UILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", v6, 1.79769313e308);
    v13 = v12 + -2.0;
  }
  else
  {
    v13 = 0.0;
  }
  v14 = v10 + v13;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
