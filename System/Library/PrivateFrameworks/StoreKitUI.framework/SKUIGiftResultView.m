@implementation SKUIGiftResultView

- (SKUIGiftResultView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIGiftResultView *v8;
  uint64_t v9;
  UIButton *giftAgainButton;
  void *v11;
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
    -[SKUIGiftResultView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIGiftResultView;
  v8 = -[SKUIGiftResultView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    giftAgainButton = v8->_giftAgainButton;
    v8->_giftAgainButton = (UIButton *)v9;

    -[UIButton setAutoresizingMask:](v8->_giftAgainButton, "setAutoresizingMask:", 5);
    -[UIButton titleLabel](v8->_giftAgainButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[SKUIGiftResultView addSubview:](v8, "addSubview:", v8->_giftAgainButton);
  }
  return v8;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *imageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_imageView;
        self->_imageView = v7;

        v9 = self->_imageView;
        -[SKUIGiftResultView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SKUIGiftResultView addSubview:](self, "addSubview:", self->_imageView);
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:");
      -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v11 = self->_imageView;
      self->_imageView = 0;

    }
    -[SKUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setItemView:(id)a3
{
  SKUIGiftItemView *v5;
  SKUIGiftItemView **p_itemView;
  SKUIGiftItemView *itemView;
  SKUIGiftItemView *v8;
  void *v9;
  SKUIGiftItemView *v10;

  v5 = (SKUIGiftItemView *)a3;
  p_itemView = &self->_itemView;
  itemView = self->_itemView;
  if (itemView != v5)
  {
    v10 = v5;
    if (itemView)
      -[SKUIGiftItemView removeFromSuperview](itemView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_itemView, a3);
    v8 = *p_itemView;
    -[SKUIGiftResultView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    if (*p_itemView)
      -[SKUIGiftResultView addSubview:](self, "addSubview:");
    -[SKUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
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
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  -[SKUIGiftResultView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
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
        -[SKUIGiftResultView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v12 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SKUIGiftResultView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v14 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
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
  void *imageView;
  double v20;
  double v21;
  float v22;
  double v23;
  UIImageView *v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  float v29;
  float v30;
  double v31;
  UIImageView *v32;
  double v33;
  double v34;
  SKUIGiftItemView *itemView;
  double v36;
  SKUIGiftItemView *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UILabel *titleLabel;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  UIButton *giftAgainButton;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[SKUIGiftResultView bounds](self, "bounds");
  v6 = v5;
  v57 = v7;
  v9 = v8;
  v11 = v10;
  v12 = v8 + -30.0;
  -[UIButton frame](self->_giftAgainButton, "frame");
  v14 = v13;
  v16 = v15;
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
  v18 = v17;
  imageView = self->_imageView;
  if (imageView || (imageView = self->_itemView) != 0)
  {
    objc_msgSend(imageView, "bounds");
    v21 = v20 + 15.0;
  }
  else
  {
    v21 = 0.0;
  }
  v56 = v11;
  v22 = (v11 - (v16 + v18 + v21)) * 0.5;
  v23 = floorf(v22);
  v24 = self->_imageView;
  if (v24)
  {
    v54 = v14;
    v55 = v6;
    v53 = v16;
    -[UIImageView frame](v24, "frame");
    v27 = v25;
    v28 = v26;
    v29 = (v9 - v25) * 0.5;
    v30 = floorf(v29);
    v31 = v30;
    v32 = self->_imageView;
    if (v4)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v30, v23, v25, v26, v55, v57, v9, v11);
    }
    else
    {
      v33 = v30;
      v34 = v23;
    }
    -[UIImageView setFrame:](v32, "setFrame:", v33, v34);
    v41 = 15.0;
  }
  else
  {
    itemView = self->_itemView;
    if (!itemView)
      goto LABEL_16;
    v53 = v16;
    v54 = v14;
    -[SKUIGiftItemView frame](itemView, "frame");
    v28 = v36;
    v37 = self->_itemView;
    v55 = v6;
    if (v4)
    {
      v31 = 15.0;
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v36, v6, v57, v9, v11);
    }
    else
    {
      v38 = 15.0;
      v39 = v23;
      v40 = v12;
      v31 = 15.0;
    }
    -[SKUIGiftItemView setFrame:](v37, "setFrame:", v38, v39, v40);
    v41 = 0.0;
    v27 = v12;
  }
  v58.origin.x = v31;
  v58.origin.y = v23;
  v58.size.width = v27;
  v58.size.height = v28;
  v23 = CGRectGetMaxY(v58) + v41;
  v16 = v53;
  v14 = v54;
  v6 = v55;
LABEL_16:
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, v23, v12, v18);
  titleLabel = self->_titleLabel;
  v43 = 15.0;
  v44 = v23;
  v45 = v12;
  v46 = v18;
  if (v4)
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v18, v6, v57, v9, v56);
  -[UILabel setFrame:](titleLabel, "setFrame:", v43, v44, v45, v46);
  v59.origin.x = 15.0;
  v59.origin.y = v23;
  v59.size.width = v12;
  v59.size.height = v18;
  v47 = CGRectGetMaxY(v59) + 16.0;
  v48 = (v9 - v14) * 0.5;
  v49 = floorf(v48);
  giftAgainButton = self->_giftAgainButton;
  if (v4)
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v49, v47, v14, v16, v6, v57, v9, v56);
    v14 = v51;
    v16 = v52;
  }
  -[UIButton setFrame:](giftAgainButton, "setFrame:", v49, v47, v14, v16);
}

- (UIButton)giftAgainButton
{
  return self->_giftAgainButton;
}

- (SKUIGiftItemView)itemView
{
  return self->_itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftResultView initWithFrame:]";
}

@end
