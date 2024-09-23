@implementation SKUIStarRatingView

- (SKUIStarRatingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIStarRatingView *result;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStarRatingView initWithFrame:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStarRatingView;
  result = -[SKUIStarRatingView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  if (result)
    result->_elementSpacing = 3.0;
  return result;
}

- (UIImage)ratingStarsImage
{
  return -[UIImageView image](self->_ratingStarsImageView, "image");
}

- (void)setRatingStarsImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *ratingStarsImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_ratingStarsImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    ratingStarsImageView = self->_ratingStarsImageView;
    if (v12)
    {
      if (!ratingStarsImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_ratingStarsImageView;
        self->_ratingStarsImageView = v7;

        v9 = self->_ratingStarsImageView;
        -[SKUIStarRatingView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SKUIStarRatingView addSubview:](self, "addSubview:", self->_ratingStarsImageView);
        ratingStarsImageView = self->_ratingStarsImageView;
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    -[UIImageView setImage:](ratingStarsImageView, "setImage:", v11);
    v5 = v12;
  }

}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    v6 = self->_textLabel;
    -[SKUIStarRatingView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUIStarRatingView addSubview:](self, "addSubview:", self->_textLabel);
    textLabel = self->_textLabel;
  }
  return textLabel;
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
  CGFloat v10;
  CGFloat v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  CGRect v16;

  -[SKUIStarRatingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView image](self->_ratingStarsImageView, "image");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[UIImageView frame](self->_ratingStarsImageView, "frame");
    objc_msgSend(v15, "size");
    v8 = v7;
    v10 = v9;
    *(float *)&v7 = (v6 - v9) * 0.5;
    v11 = ceilf(*(float *)&v7);
    -[UIImageView setFrame:](self->_ratingStarsImageView, "setFrame:", -1.0, v11, v8, v9);
    v16.origin.x = -1.0;
    v16.origin.y = v11;
    v16.size.width = v8;
    v16.size.height = v10;
    v12 = CGRectGetMaxX(v16) + self->_elementSpacing;
  }
  else
  {
    v12 = 0.0;
  }
  -[UILabel text](self->_textLabel, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[UILabel frame](self->_textLabel, "frame");
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v12, 0.0, v4 - v12, v6);
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *ratingStarsImageView;
  id v5;
  objc_super v6;

  ratingStarsImageView = self->_ratingStarsImageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](ratingStarsImageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIStarRatingView;
  -[SKUIStarRatingView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  -[UIImageView image](self->_ratingStarsImageView, "image", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UILabel text](self->_textLabel, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    if (v6)
    {
      v8 = v8 + self->_elementSpacing;
      width = width - v8;
    }
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, 1.79769313e308);
    if (v10 < v14)
      v10 = v14;
    v8 = v8 + v13;
  }

  v15 = v8;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(double)a3
{
  self->_elementSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_ratingStarsImageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStarRatingView initWithFrame:]";
}

@end
