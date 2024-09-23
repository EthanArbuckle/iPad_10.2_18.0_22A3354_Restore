@implementation SKUITrailersCell

- (SKUITrailersCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUITrailersCell *v8;
  UIImageView *v9;
  UIImageView *imageView;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrailersCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUITrailersCell;
  v8 = -[SKUITrailersCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    -[SKUITrailersCell addSubview:](v8, "addSubview:", v8->_imageView);
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  id v14;

  v14 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v4 != v14)
  {
    titleLabel = self->_titleLabel;
    if (v14)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v9, "setFont:", v10);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
        v11 = self->_titleLabel;
        -[SKUITrailersCell backgroundColor](self, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

        -[SKUITrailersCell addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v14);
      -[SKUITrailersCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v13 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    v5 = v14;
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;
  UILabel *subtitleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  id v14;

  v14 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v4 != v14)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v14)
    {
      if (!subtitleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v8 = self->_subtitleLabel;
        self->_subtitleLabel = v7;

        v9 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v9, "setFont:", v10);

        -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
        v11 = self->_subtitleLabel;
        -[SKUITrailersCell backgroundColor](self, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

        -[SKUITrailersCell addSubview:](self, "addSubview:", self->_subtitleLabel);
        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:", v14);
      -[SKUITrailersCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
      v13 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

    }
    v5 = v14;
  }

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    -[SKUITrailersCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGRect)imageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_imageView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double MaxY;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)SKUITrailersCell;
  -[SKUITrailersCell layoutSubviews](&v28, sel_layoutSubviews);
  -[SKUITrailersCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = 7.5;
  v10 = 10.0;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v9 = 10.0;
  v11 = floor(v9);
  -[UIImageView frame](self->_imageView, "frame");
  v13 = v12;
  v15 = v14;
  -[SKUITrailersCell bounds](self, "bounds");
  v17 = floor((v16 - v13) * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = 15.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v17, v10, v13, v15);
  v29.origin.x = v17;
  v29.origin.y = v10;
  v29.size.width = v13;
  v29.size.height = v15;
  MaxY = CGRectGetMaxY(v29);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4, v6);
  v22 = v21;
  v24 = v23;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, MaxY, v21, v23);
  v30.origin.x = v11;
  v30.origin.y = MaxY;
  v30.size.width = v22;
  v30.size.height = v24;
  v25 = CGRectGetMaxY(v30);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4, v6);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v11, v25, v26, v27);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUITrailersCell;
  v4 = a3;
  -[SKUITrailersCell setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v4);

}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITrailersCell initWithFrame:]";
}

@end
