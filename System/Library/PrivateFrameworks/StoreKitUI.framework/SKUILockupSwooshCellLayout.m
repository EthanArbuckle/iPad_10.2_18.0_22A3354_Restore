@implementation SKUILockupSwooshCellLayout

- (SKUILockupSwooshCellLayout)initWithCollectionViewCell:(id)a3
{
  id v4;
  SKUILockupSwooshCellLayout *v5;
  _BYTE v7[16];
  unint64_t v8;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshCellLayout initWithCollectionViewCell:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILockupSwooshCellLayout;
  v5 = -[SKUICellLayout initWithCollectionViewCell:](&v9, sel_initWithCollectionViewCell_, v4);
  if (v5)
  {
    SKUILockupStyleDefault((uint64_t)v7);
    v5->_visibleFields = v8;
  }

  return v5;
}

- (NSString)artistName
{
  return -[UILabel text](self->_artistNameLabel, "text");
}

- (NSString)category
{
  return -[UILabel text](self->_categoryLabel, "text");
}

- (CGSize)cellSizeForImageOfSize:(CGSize)a3
{
  double height;
  unint64_t visibleFields;
  float v6;
  double v7;
  double v8;
  float v9;
  double width;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  BOOL v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  height = a3.height;
  visibleFields = self->_visibleFields;
  v6 = a3.height + 5.0;
  v7 = ceilf(v6);
  if ((visibleFields & 2) != 0)
    v8 = v7;
  else
    v8 = 0.0;
  if ((visibleFields & 0x400) != 0)
  {
    width = self->_videoSize.width;
    v8 = v8 + self->_videoSize.height + 10.0;
  }
  else
  {
    v9 = a3.width;
    width = ceilf(v9);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = 1.0 / v12 + 14.0;

  v14 = self->_visibleFields;
  v15 = 28.0;
  if ((v14 & 0x10) == 0)
    v15 = 0.0;
  v16 = -0.0;
  if ((v14 & 8) != 0)
    v17 = v13;
  else
    v17 = -0.0;
  v18 = v15 + v17;
  if ((v14 & 1) != 0)
    v19 = v13;
  else
    v19 = -0.0;
  v20 = v19 + v18;
  if ((v14 & 0x80) != 0)
    v21 = v13;
  else
    v21 = -0.0;
  v22 = v21 + v20;
  v23 = (v14 & 1)
      + ((v14 & 8) >> 3)
      + ((v14 & 0x10) >> 4)
      + ((unint64_t)(v14 & 0x80) >> 7)
      + ((v14 & 4) >> 2);
  if ((v14 & 4) != 0)
    v24 = v13;
  else
    v24 = -0.0;
  v25 = v24 + v22;
  if (v23)
    v25 = v25 + 6.0;
  v26 = v23 > 1;
  v27 = v23 - 1;
  if (v26)
    v16 = (float)v27;
  v28 = v25 + v16;
  if ((v14 & 0x400) != 0 && (v14 & 2) != 0)
  {
    v26 = v28 <= height;
    v30 = v8 + v28 - height;
    if (v26)
      v29 = v8;
    else
      v29 = v30;
  }
  else
  {
    v29 = v8 + v28;
  }
  v31 = width;
  result.height = v29;
  result.width = v31;
  return result;
}

- (NSString)itemCountString
{
  return -[UILabel text](self->_itemCountLabel, "text");
}

- (NSString)price
{
  return -[UILabel text](self->_priceLabel, "text");
}

- (void)setArtistName:(id)a3
{
  id v4;
  UILabel *artistNameLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_artistNameLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10 && (objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v10)
    {
      if (!artistNameLabel)
      {
        v6 = -[SKUILockupSwooshCellLayout _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        -[SKUICellLayout contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_artistNameLabel);

        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](artistNameLabel, "removeFromSuperview");
      v9 = self->_artistNameLabel;
      self->_artistNameLabel = 0;

    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCategory:(id)a3
{
  id v4;
  UILabel *categoryLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_categoryLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10 && (objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
  {
    categoryLabel = self->_categoryLabel;
    if (v10)
    {
      if (!categoryLabel)
      {
        v6 = -[SKUILockupSwooshCellLayout _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_categoryLabel;
        self->_categoryLabel = v6;

        -[SKUICellLayout contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_categoryLabel);

        categoryLabel = self->_categoryLabel;
      }
      -[UILabel setText:](categoryLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](categoryLabel, "removeFromSuperview");
      v9 = self->_categoryLabel;
      self->_categoryLabel = 0;

    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  UIColor **p_primaryTextColor;
  UILabel *categoryLabel;
  void *v7;
  UILabel *itemCountLabel;
  void *v9;
  UILabel *priceLabel;
  void *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor **p_titleColor;
  UILabel *titleLabel;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "primaryTextColor");
  p_primaryTextColor = &self->_primaryTextColor;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_primaryTextColor, v17);
  categoryLabel = self->_categoryLabel;
  if (self->_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_categoryLabel, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](categoryLabel, "setTextColor:", v7);

  }
  itemCountLabel = self->_itemCountLabel;
  if (*p_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_itemCountLabel, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](itemCountLabel, "setTextColor:", v9);

  }
  priceLabel = self->_priceLabel;
  if (*p_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_priceLabel, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](priceLabel, "setTextColor:", v11);

  }
  objc_msgSend(v4, "secondaryTextColor");
  v12 = (UIColor *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (!v12)
    v13 = *p_primaryTextColor;
  p_titleColor = &self->_titleColor;
  objc_storeStrong((id *)&self->_titleColor, v13);
  titleLabel = self->_titleLabel;
  if (*p_titleColor)
  {
    -[UILabel setTextColor:](titleLabel, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](titleLabel, "setTextColor:", v16);

  }
}

- (void)setItemCountString:(id)a3
{
  id v4;
  UILabel *itemCountLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_itemCountLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10 && (objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
  {
    itemCountLabel = self->_itemCountLabel;
    if (v10)
    {
      if (!itemCountLabel)
      {
        v6 = -[SKUILockupSwooshCellLayout _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_itemCountLabel;
        self->_itemCountLabel = v6;

        -[SKUICellLayout contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_itemCountLabel);

        itemCountLabel = self->_itemCountLabel;
      }
      -[UILabel setText:](itemCountLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](itemCountLabel, "removeFromSuperview");
      v9 = self->_itemCountLabel;
      self->_itemCountLabel = 0;

    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPrice:(id)a3
{
  id v4;
  UILabel *priceLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_priceLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10 && (objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
  {
    priceLabel = self->_priceLabel;
    if (v10)
    {
      if (!priceLabel)
      {
        v6 = -[SKUILockupSwooshCellLayout _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_priceLabel;
        self->_priceLabel = v6;

        -[SKUICellLayout contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_priceLabel);

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](priceLabel, "removeFromSuperview");
      v9 = self->_priceLabel;
      self->_priceLabel = 0;

    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
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
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v17 && (objc_msgSend(v4, "isEqualToString:", v17) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v17)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
        v13 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v15);

        }
        -[SKUICellLayout contentView](self, "contentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", self->_titleLabel);

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
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setVideoThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *videoImageView;
  UIImageView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *videoPlayButtonImageView;
  id v17;

  v17 = a3;
  -[SKUILockupSwooshCellLayout videoThumbnailImage](self, "videoThumbnailImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v17;
  if (v4 != v17)
  {
    if (v17)
    {
      -[SKUICellLayout contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_videoImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        videoImageView = self->_videoImageView;
        self->_videoImageView = v7;

        v9 = self->_videoImageView;
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v11);

        -[UIImageView setContentMode:](self->_videoImageView, "setContentMode:", 6);
        objc_msgSend(v6, "addSubview:", self->_videoImageView);
      }
      if (!self->_videoPlayButtonImageView)
      {
        v12 = (void *)MEMORY[0x1E0DC3870];
        SKUIBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("PlayControl"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
        videoPlayButtonImageView = self->_videoPlayButtonImageView;
        self->_videoPlayButtonImageView = v15;

        -[UIImageView setContentMode:](self->_videoPlayButtonImageView, "setContentMode:", 4);
      }
      -[UIImageView setImage:](self->_videoImageView, "setImage:", v17);
      objc_msgSend(v6, "insertSubview:aboveSubview:", self->_videoPlayButtonImageView, self->_videoImageView);
    }
    else
    {
      -[UIImageView setHidden:](self->_videoPlayButtonImageView, "setHidden:", 1);
      -[UIImageView removeFromSuperview](self->_videoImageView, "removeFromSuperview");
      v6 = self->_videoImageView;
      self->_videoImageView = 0;
    }

    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    v5 = v17;
  }

}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (UIImage)videoThumbnailImage
{
  return -[UIImageView image](self->_videoImageView, "image");
}

- (void)layoutSubviews
{
  unint64_t visibleFields;
  double v4;
  double width;
  double height;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  double v14;
  UIImageView *iconHighlightImageView;
  void *v16;
  UIImageView *videoHighlightImageView;
  id v18;
  CGRect v19;

  visibleFields = self->_visibleFields;
  if ((visibleFields & 0x400) != 0)
  {
    width = self->_videoSize.width;
    height = self->_videoSize.height;
    -[UIImageView setFrame:](self->_videoImageView, "setFrame:", 0.0, 5.0, width, height);
    -[UIImageView setHidden:](self->_videoImageView, "setHidden:", 0);
    -[UIImageView image](self->_videoImageView, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "size");
      v10 = v9;
      v19.origin.x = 0.0;
      v19.origin.y = 5.0;
      v19.size.width = width;
      v19.size.height = height;
      v11 = CGRectGetMaxY(v19) - v10;
      height = v10;
    }
    else
    {
      v11 = 5.0;
    }
    -[UIImageView setFrame:](self->_videoPlayButtonImageView, "setFrame:", 0.0, v11, width, height);
    -[UIImageView setHidden:](self->_videoPlayButtonImageView, "setHidden:", 0);
    v4 = self->_videoSize.height + 10.0 + 5.0;

  }
  else
  {
    -[UIImageView setHidden:](self->_videoImageView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_videoPlayButtonImageView, "setHidden:", 1);
    v4 = 5.0;
  }
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  if ((self->_visibleFields & 2) != 0)
  {
    objc_msgSend(v12, "frame");
    objc_msgSend(v18, "setFrame:", 0.0, v4 + self->_maxImageSize.height - v14);
    v13 = -[SKUIItemCellLayout isIconImageHidden](self, "isIconImageHidden");
    v12 = v18;
  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(v12, "setHidden:", v13);
  if ((visibleFields & 0x400) != 0)
    -[SKUILockupSwooshCellLayout _layoutFieldsHorizontal](self, "_layoutFieldsHorizontal");
  else
    -[SKUILockupSwooshCellLayout _layoutFieldsVertical](self, "_layoutFieldsVertical");
  iconHighlightImageView = self->_iconHighlightImageView;
  if (iconHighlightImageView)
  {
    -[SKUIItemCellLayout iconImageView](self, "iconImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    -[UIImageView setFrame:](iconHighlightImageView, "setFrame:");

  }
  videoHighlightImageView = self->_videoHighlightImageView;
  if (videoHighlightImageView)
  {
    -[UIImageView frame](self->_videoImageView, "frame");
    -[UIImageView setFrame:](videoHighlightImageView, "setFrame:");
  }

}

- (void)setBackgroundColor:(id)a3
{
  UILabel *artistNameLabel;
  id v5;
  objc_super v6;

  artistNameLabel = self->_artistNameLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](artistNameLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_categoryLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_itemCountLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_priceLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_videoImageView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUILockupSwooshCellLayout;
  -[SKUIItemCellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setItemOffer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  -[SKUIItemCellLayout setItemOffer:](&v4, sel_setItemOffer_, a3);
  -[SKUILockupSwooshCellLayout _reloadPriceLabel](self, "_reloadPriceLabel");
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshCellLayout;
  -[SKUIItemCellLayout setItemState:animated:](&v5, sel_setItemState_animated_, a3, a4);
  -[SKUILockupSwooshCellLayout _reloadPriceLabel](self, "_reloadPriceLabel");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  -[SKUIItemCellLayout setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUILockupSwooshCellLayout _reloadHighlight](self, "_reloadHighlight");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  -[SKUIItemCellLayout setSelected:](&v4, sel_setSelected_, a3);
  -[SKUILockupSwooshCellLayout _reloadHighlight](self, "_reloadHighlight");
}

- (void)_layoutFieldsHorizontal
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  UILabel *titleLabel;
  UILabel *categoryLabel;
  UILabel *artistNameLabel;
  UILabel *itemCountLabel;
  UILabel *priceLabel;
  double v16;
  UILabel *v17;
  UILabel *v18;
  double *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  float v26;
  uint64_t i;
  double *v28;
  id v29;
  double v30;
  double v31;
  unint64_t visibleFields;
  id v33;
  _QWORD v34[2];
  __int128 v35;
  uint64_t v36;
  UILabel *v37;
  __int128 v38;
  uint64_t v39;
  UILabel *v40;
  __int128 v41;
  uint64_t v42;
  UILabel *v43;
  __int128 v44;
  uint64_t v45;
  UILabel *v46;
  __int128 v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  v8 = 0.0;
  visibleFields = self->_visibleFields;
  v33 = v6;
  if ((visibleFields & 2) != 0)
  {
    objc_msgSend(v6, "frame");
    v8 = CGRectGetMaxX(v49) + 9.0;
  }
  v9 = 0;
  v10 = 0;
  titleLabel = self->_titleLabel;
  v34[0] = 16;
  v34[1] = titleLabel;
  v35 = *MEMORY[0x1E0C9D820];
  categoryLabel = self->_categoryLabel;
  v36 = 8;
  v37 = categoryLabel;
  v38 = v35;
  artistNameLabel = self->_artistNameLabel;
  v39 = 1;
  v40 = artistNameLabel;
  v41 = v35;
  itemCountLabel = self->_itemCountLabel;
  v42 = 128;
  v43 = itemCountLabel;
  priceLabel = self->_priceLabel;
  v45 = 4;
  v46 = priceLabel;
  v16 = v5 - v8;
  v44 = v35;
  v47 = v35;
  do
  {
    v17 = (UILabel *)(id)v34[v9 + 1];
    v18 = v17;
    if ((v34[v9] & self->_visibleFields) != 0)
    {
      if (v17)
      {
        v19 = (double *)&v34[v9];
        if (v17 == self->_titleLabel)
        {
          -[UILabel sizeThatFits:](v17, "sizeThatFits:", v16, 1.79769313e308);
          v22 = v23;
          *((_QWORD *)v19 + 2) = v24;
          v19[3] = v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "scale");
          v22 = 1.0 / v21 + 14.0;
          v19[2] = v16;
          v19[3] = v22;

        }
        -[UILabel setHidden:](v18, "setHidden:", 0, visibleFields);
        v7 = v7 + v22;
        ++v10;
      }
    }
    else
    {
      -[UILabel setHidden:](v17, "setHidden:", 1);
    }

    v9 += 4;
  }
  while (v9 != 20);
  if (v10 > 0)
  {
    v25 = self->_videoSize.height + 5.0 + 10.0;
    if ((visibleFields & 2) != 0)
    {
      v26 = (self->_maxImageSize.height - (v7 + (float)(v10 - 1))) * 0.5;
      v25 = v25 + floorf(v26);
    }
    for (i = 0; i != 20; i += 4)
    {
      v28 = (double *)&v34[i];
      v29 = (id)v34[i + 1];
      if ((objc_msgSend(v29, "isHidden") & 1) == 0)
      {
        objc_msgSend(v29, "frame");
        v30 = v28[2];
        v31 = v28[3];
        objc_msgSend(v29, "setFrame:", v8, v25, v30, v31);
        v50.origin.x = v8;
        v50.origin.y = v25;
        v50.size.width = v30;
        v50.size.height = v31;
        v25 = CGRectGetMaxY(v50) + 1.0;
      }

    }
  }

}

- (void)_layoutFieldsVertical
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unint64_t visibleFields;
  double v8;
  UILabel *titleLabel;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UILabel *categoryLabel;
  void *v15;
  double v16;
  CGFloat v17;
  UILabel *artistNameLabel;
  void *v19;
  double v20;
  CGFloat v21;
  UILabel *itemCountLabel;
  void *v23;
  double v24;
  CGFloat v25;
  UILabel *priceLabel;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  visibleFields = self->_visibleFields;
  v31 = v6;
  if ((visibleFields & 2) != 0)
  {
    objc_msgSend(v6, "frame");
    v8 = CGRectGetMaxY(v32) + 6.0;
    visibleFields = self->_visibleFields;
  }
  else
  {
    v8 = 6.0;
  }
  titleLabel = self->_titleLabel;
  if ((visibleFields & 0x10) != 0)
  {
    if (titleLabel)
    {
      -[UILabel frame](titleLabel, "frame");
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
      v11 = v10;
      v13 = v12;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v8, v10, v12);
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
      v33.origin.x = 0.0;
      v33.origin.y = v8;
      v33.size.width = v11;
      v33.size.height = v13;
      v8 = CGRectGetMaxY(v33) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
  }
  categoryLabel = self->_categoryLabel;
  if ((self->_visibleFields & 8) != 0)
  {
    if (categoryLabel)
    {
      -[UILabel frame](categoryLabel, "frame");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = 1.0 / v16 + 14.0;

      -[UILabel setFrame:](self->_categoryLabel, "setFrame:", 0.0, v8, v5, v17);
      -[UILabel setHidden:](self->_categoryLabel, "setHidden:", 0);
      v34.origin.x = 0.0;
      v34.origin.y = v8;
      v34.size.width = v5;
      v34.size.height = v17;
      v8 = CGRectGetMaxY(v34) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](categoryLabel, "setHidden:", 1);
  }
  artistNameLabel = self->_artistNameLabel;
  if ((self->_visibleFields & 1) != 0)
  {
    if (artistNameLabel)
    {
      -[UILabel frame](artistNameLabel, "frame");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");
      v21 = 1.0 / v20 + 14.0;

      -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", 0.0, v8, v5, v21);
      -[UILabel setHidden:](self->_artistNameLabel, "setHidden:", 0);
      v35.origin.x = 0.0;
      v35.origin.y = v8;
      v35.size.width = v5;
      v35.size.height = v21;
      v8 = CGRectGetMaxY(v35) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](artistNameLabel, "setHidden:", 1);
  }
  itemCountLabel = self->_itemCountLabel;
  if ((self->_visibleFields & 0x80) != 0)
  {
    if (itemCountLabel)
    {
      -[UILabel frame](itemCountLabel, "frame");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scale");
      v25 = 1.0 / v24 + 14.0;

      -[UILabel setFrame:](self->_itemCountLabel, "setFrame:", 0.0, v8, v5, v25);
      -[UILabel setHidden:](self->_itemCountLabel, "setHidden:", 0);
      v36.origin.x = 0.0;
      v36.origin.y = v8;
      v36.size.width = v5;
      v36.size.height = v25;
      v8 = CGRectGetMaxY(v36) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](itemCountLabel, "setHidden:", 1);
  }
  priceLabel = self->_priceLabel;
  if ((self->_visibleFields & 4) == 0)
  {
    v27 = 1;
LABEL_24:
    -[UILabel setHidden:](priceLabel, "setHidden:", v27);
    goto LABEL_25;
  }
  if (priceLabel)
  {
    -[UILabel frame](priceLabel, "frame");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scale");
    v30 = 1.0 / v29 + 14.0;

    -[UILabel setFrame:](self->_priceLabel, "setFrame:", 0.0, v8, v5, v30);
    priceLabel = self->_priceLabel;
    v27 = 0;
    goto LABEL_24;
  }
LABEL_25:

}

- (id)_newDefaultLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[SKUICellLayout parentCellView](self, "parentCellView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  if (self->_primaryTextColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v7);

  }
  return v3;
}

- (void)_reloadPriceLabel
{
  void *v3;
  char v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SKUIItemCellLayout itemState](self, "itemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if ((v4 & 3) != 0)
  {
    -[SKUICellLayout clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = CFSTR("ITEM_OFFER_BUTTON_INSTALLING");
LABEL_14:
      objc_msgSend(v5, "localizedStringForKey:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v7 = CFSTR("ITEM_OFFER_BUTTON_INSTALLING");
  }
  else if ((v4 & 4) != 0)
  {
    -[SKUICellLayout clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = CFSTR("ITEM_OFFER_BUTTON_INSTALLED");
      goto LABEL_14;
    }
    v7 = CFSTR("ITEM_OFFER_BUTTON_INSTALLED");
  }
  else if ((v4 & 8) != 0)
  {
    -[SKUICellLayout clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = CFSTR("ITEM_OFFER_BUTTON_INSTALL");
      goto LABEL_14;
    }
    v7 = CFSTR("ITEM_OFFER_BUTTON_INSTALL");
  }
  else
  {
    if ((v4 & 0x10) == 0)
    {
LABEL_21:
      -[SKUIItemCellLayout itemOffer](self, "itemOffer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "buttonText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUILockupSwooshCellLayout setPrice:](self, "setPrice:", v9);

      goto LABEL_22;
    }
    -[SKUICellLayout clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = CFSTR("ITEM_OFFER_BUTTON_GRATIS");
      goto LABEL_14;
    }
    v7 = CFSTR("ITEM_OFFER_BUTTON_GRATIS");
  }
  +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v10 = (id)v8;

  if (!v10)
    goto LABEL_21;
  -[SKUILockupSwooshCellLayout setPrice:](self, "setPrice:", v10);
LABEL_22:

}

- (void)_reloadHighlight
{
  UIImageView *iconHighlightImageView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *videoImageView;
  UIImageView *videoHighlightImageView;
  UIImageView *v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  if (-[SKUIItemCellLayout isHighlighted](self, "isHighlighted")
    || -[SKUIItemCellLayout isSelected](self, "isSelected"))
  {
    iconHighlightImageView = self->_iconHighlightImageView;
    if (!iconHighlightImageView)
    {
      v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v5 = self->_iconHighlightImageView;
      self->_iconHighlightImageView = v4;

      v6 = self->_iconHighlightImageView;
      -[SKUICellLayout parentCellView](self, "parentCellView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v8);

      -[SKUICellLayout contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_iconHighlightImageView);

      -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
      iconHighlightImageView = self->_iconHighlightImageView;
    }
    -[SKUIItemCellLayout iconImage](self, "iconImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_flatImageWithColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](iconHighlightImageView, "setImage:", v12);

    -[UIImageView setAlpha:](self->_iconHighlightImageView, "setAlpha:", 0.3);
    videoImageView = self->_videoImageView;
    if (videoImageView && (-[UIImageView isHidden](videoImageView, "isHidden") & 1) == 0)
    {
      videoHighlightImageView = self->_videoHighlightImageView;
      if (!videoHighlightImageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v16 = self->_videoHighlightImageView;
        self->_videoHighlightImageView = v15;

        v17 = self->_videoHighlightImageView;
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "backgroundColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v17, "setBackgroundColor:", v19);

        -[UIImageView setContentMode:](self->_videoHighlightImageView, "setContentMode:", 6);
        -[SKUICellLayout contentView](self, "contentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "insertSubview:aboveSubview:", self->_videoHighlightImageView, self->_videoImageView);

        -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
        videoHighlightImageView = self->_videoHighlightImageView;
      }
      -[UIImageView image](self->_videoImageView, "image");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_flatImageWithColor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](videoHighlightImageView, "setImage:", v23);

      -[UIImageView setAlpha:](self->_videoHighlightImageView, "setAlpha:", 0.3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __46__SKUILockupSwooshCellLayout__reloadHighlight__block_invoke;
    v24[3] = &unk_1E739FD38;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v24);
    -[UIImageView setAlpha:](self->_iconHighlightImageView, "setAlpha:", 0.0);
    -[UIImageView setAlpha:](self->_videoHighlightImageView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

uint64_t __46__SKUILockupSwooshCellLayout__reloadHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeHighlightViews");
}

- (void)_removeHighlightViews
{
  double v3;
  UIImageView *iconHighlightImageView;
  double v5;
  UIImageView *videoHighlightImageView;

  -[UIImageView alpha](self->_iconHighlightImageView, "alpha");
  if (v3 == 0.0)
  {
    -[UIImageView removeFromSuperview](self->_iconHighlightImageView, "removeFromSuperview");
    iconHighlightImageView = self->_iconHighlightImageView;
    self->_iconHighlightImageView = 0;

  }
  -[UIImageView alpha](self->_videoHighlightImageView, "alpha");
  if (v5 == 0.0)
  {
    -[UIImageView removeFromSuperview](self->_videoHighlightImageView, "removeFromSuperview");
    videoHighlightImageView = self->_videoHighlightImageView;
    self->_videoHighlightImageView = 0;

  }
}

- (CGSize)maxImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxImageSize.width;
  height = self->_maxImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxImageSize:(CGSize)a3
{
  self->_maxImageSize = a3;
}

- (CGSize)videoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoSize.width;
  height = self->_videoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVideoSize:(CGSize)a3
{
  self->_videoSize = a3;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayButtonImageView, 0);
  objc_storeStrong((id *)&self->_videoImageView, 0);
  objc_storeStrong((id *)&self->_videoHighlightImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_itemCountLabel, 0);
  objc_storeStrong((id *)&self->_iconHighlightImageView, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

- (void)initWithCollectionViewCell:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILockupSwooshCellLayout initWithCollectionViewCell:]";
}

@end
