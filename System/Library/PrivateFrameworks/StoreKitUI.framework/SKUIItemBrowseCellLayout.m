@implementation SKUIItemBrowseCellLayout

- (SKUIItemBrowseCellLayout)initWithCollectionViewCell:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemBrowseCellLayout *v13;
  SKUIItemBrowseCellLayout *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemBrowseCellLayout initWithCollectionViewCell:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIItemBrowseCellLayout;
  v13 = -[SKUICellLayout initWithCollectionViewCell:](&v16, sel_initWithCollectionViewCell_, v4);
  v14 = v13;
  if (v13)
    -[SKUIItemBrowseCellLayout _initSKUIItemBrowseCellLayout](v13, "_initSKUIItemBrowseCellLayout");

  return v14;
}

- (SKUIItemBrowseCellLayout)initWithParentView:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemBrowseCellLayout *v13;
  SKUIItemBrowseCellLayout *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemBrowseCellLayout initWithParentView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIItemBrowseCellLayout;
  v13 = -[SKUICellLayout initWithParentView:](&v16, sel_initWithParentView_, v4);
  v14 = v13;
  if (v13)
    -[SKUIItemBrowseCellLayout _initSKUIItemBrowseCellLayout](v13, "_initSKUIItemBrowseCellLayout");

  return v14;
}

- (SKUIItemBrowseCellLayout)initWithTableViewCell:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemBrowseCellLayout *v13;
  SKUIItemBrowseCellLayout *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemBrowseCellLayout initWithTableViewCell:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIItemBrowseCellLayout;
  v13 = -[SKUICellLayout initWithTableViewCell:](&v16, sel_initWithTableViewCell_, v4);
  v14 = v13;
  if (v13)
    -[SKUIItemBrowseCellLayout _initSKUIItemBrowseCellLayout](v13, "_initSKUIItemBrowseCellLayout");

  return v14;
}

- (NSString)indexNumberString
{
  void *v2;
  void *v3;

  -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIColor *v19;
  UIColor *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "primaryTextColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  primaryTextColor = self->_primaryTextColor;
  self->_primaryTextColor = v5;

  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

  }
  -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v10, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

  }
  -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v13, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v15);

  }
  -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v16, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v18);

  }
  objc_msgSend(v4, "secondaryTextColor");
  v19 = (UIColor *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  if (!v19)
    v20 = self->_primaryTextColor;
  objc_storeStrong((id *)&self->_secondaryTextColor, v20);

  -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  if (self->_secondaryTextColor)
  {
    objc_msgSend(v21, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextColor:", v22);

  }
}

- (void)setImageBoundingSize:(CGSize)a3
{
  if (self->_imageBoundingSize.width != a3.width || self->_imageBoundingSize.height != a3.height)
  {
    self->_imageBoundingSize = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIndexNumberString:(id)a3
{
  id v4;
  _SKUIItemBrowseCellContentView *cellContentView;
  void *v6;
  _SKUIItemBrowseCellContentView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 largeSpacing;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[SKUIItemBrowseCellLayout indexNumberString](self, "indexNumberString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v22 && (objc_msgSend(v4, "isEqualToString:", v22) & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v22)
    {
      -[_SKUIItemBrowseCellContentView indexNumberLabel](cellContentView, "indexNumberLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = self->_cellContentView;
        v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        -[_SKUIItemBrowseCellContentView setIndexNumberLabel:](v7, "setIndexNumberLabel:", v8);

        -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

        -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v12);

        -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextAlignment:", 1);

        -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (self->_primaryTextColor)
        {
          objc_msgSend(v14, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTextColor:", v16);

        }
        largeSpacing = self->_largeSpacing;
        -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 20.0;
        if (!largeSpacing)
          v19 = 15.0;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFont:", v20);

      }
      -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v22);

    }
    else
    {
      -[_SKUIItemBrowseCellContentView setIndexNumberLabel:](cellContentView, "setIndexNumberLabel:", 0);
    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLargeSpacing:(BOOL)a3
{
  if (self->_largeSpacing != a3)
  {
    self->_largeSpacing = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  void *v5;

  if (self->_numberOfUserRatings != a3
    || (-[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_numberOfUserRatings = a3;
    -[SKUIItemBrowseCellLayout _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (void)setSubtitle:(id)a3
{
  id v4;
  _SKUIItemBrowseCellContentView *cellContentView;
  void *v6;
  _SKUIItemBrowseCellContentView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[SKUIItemBrowseCellLayout subtitle](self, "subtitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v18)
    {
      -[_SKUIItemBrowseCellContentView subtitleLabel](cellContentView, "subtitleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = self->_cellContentView;
        v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        -[_SKUIItemBrowseCellContentView setSubtitleLabel:](v7, "setSubtitleLabel:", v8);

        -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v11);

        -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFont:", v13);

        -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (self->_primaryTextColor)
        {
          objc_msgSend(v14, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTextColor:", v16);

        }
      }
      -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v18);

    }
    else
    {
      -[_SKUIItemBrowseCellContentView setSubtitleLabel:](cellContentView, "setSubtitleLabel:", 0);
    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    -[_SKUIItemBrowseCellContentView setNeedsDisplay](self->_cellContentView, "setNeedsDisplay");
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  _SKUIItemBrowseCellContentView *cellContentView;
  void *v6;
  _SKUIItemBrowseCellContentView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[SKUIItemBrowseCellLayout title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v19 && (objc_msgSend(v4, "isEqualToString:", v19) & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v19)
    {
      -[_SKUIItemBrowseCellContentView titleLabel](cellContentView, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = self->_cellContentView;
        v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        -[_SKUIItemBrowseCellContentView setTitleLabel:](v7, "setTitleLabel:", v8);

        -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNumberOfLines:", 2);

        -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v12);

        -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFont:", v14);

        -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (self->_secondaryTextColor)
        {
          objc_msgSend(v15, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTextColor:", v17);

        }
      }
      -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v19);

    }
    else
    {
      -[_SKUIItemBrowseCellContentView setTitleLabel:](cellContentView, "setTitleLabel:", 0);
    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setUserRating:(double)a3
{
  void *v5;

  if (self->_userRating != a3
    || (-[_SKUIItemBrowseCellContentView userRatingImageView](self->_cellContentView, "userRatingImageView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_userRating = a3;
    -[SKUIItemBrowseCellLayout _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)layoutForItemOfferChange
{
  void *v3;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  float v18;
  CGFloat v19;
  CGFloat v20;
  float v21;
  CGFloat v22;
  CGFloat v23;
  id v24;
  CGRect v25;

  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SKUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  objc_msgSend(v24, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v9 = v8;
  v11 = v10;
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isHidden"))
  {

    v14 = 0;
LABEL_5:
    v17 = v11;
    goto LABEL_6;
  }
  if (!v14)
    goto LABEL_5;
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "sizeThatFits:", v9 + 10.0, 1.79769313e308);
  v12 = v15;
  v13 = v16;
  v17 = v11 + v16 + 3.0;
LABEL_6:
  v18 = (v7 - v17) * 0.5;
  v19 = floorf(v18);
  v20 = v5 + -15.0 - v9;
  v21 = (v9 - v12) * 0.5;
  v22 = v20 + floorf(v21);
  v25.origin.x = v20;
  v25.origin.y = v19;
  v25.size.width = v9;
  v25.size.height = v11;
  v23 = CGRectGetMaxY(v25) + 3.0;
  objc_msgSend(v24, "setFrame:", v20, v19, v9, v11);
  objc_msgSend(v14, "setFrame:", v22, v23, v12, v13);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  CGFloat v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double width;
  double height;
  CGFloat v26;
  double MaxX;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  float v44;
  CGFloat v45;
  float v46;
  CGFloat v47;
  CGFloat MaxY;
  double v49;
  CGFloat v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  float v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  float v74;
  void *v75;
  void *v76;
  float v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  objc_super v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v83.receiver = self;
  v83.super_class = (Class)SKUIItemBrowseCellLayout;
  -[SKUICellLayout layoutSubviews](&v83, sel_layoutSubviews);
  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_SKUIItemBrowseCellContentView setFrame:](self->_cellContentView, "setFrame:", v5, v7, v9, v11);
  -[_SKUIItemBrowseCellContentView setNeedsDisplay](self->_cellContentView, "setNeedsDisplay");
  -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");

    if (self->_largeSpacing)
      v14 = 24.0;
    else
      v14 = 21.0;
    if (self->_largeSpacing)
      v15 = 32.0;
    else
      v15 = 24.0;
    v16 = (v11 - v14) * 0.5;
    v17 = floorf(v16);
    -[_SKUIItemBrowseCellContentView indexNumberLabel](self->_cellContentView, "indexNumberLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", 10.0, v17, v15, v14);

    v84.origin.x = 10.0;
    v84.origin.y = v17;
    v84.size.width = v15;
    v84.size.height = v14;
    v19 = CGRectGetMaxX(v84) + 10.0;
  }
  else
  {
    v19 = 15.0;
  }
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "frame");
    width = self->_imageBoundingSize.width;
    if (width <= 0.00000011920929)
    {
      height = v23;
      width = v22;
    }
    else
    {
      height = self->_imageBoundingSize.height;
    }
    v26 = floor((v11 - height) * 0.5);
    objc_msgSend(v21, "setFrame:", v19, v26, width, height);
    v85.origin.x = v19;
    v85.origin.y = v26;
    v85.size.width = width;
    v85.size.height = height;
    v19 = CGRectGetMaxX(v85) + 10.0;
  }
  v86.origin.x = v5;
  v86.origin.y = v7;
  v86.size.width = v9;
  v86.size.height = v11;
  MaxX = CGRectGetMaxX(v86);
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isHidden"))
  {

    v28 = 0;
  }
  else if (self->_primaryTextColor)
  {
    objc_msgSend(v28, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v29);

  }
  v30 = MaxX + -15.0;
  -[SKUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31 && (objc_msgSend(v31, "isHidden") & 1) == 0)
  {
    objc_msgSend(v32, "frame");
    v34 = v33;
    v36 = v35;
    objc_msgSend(v32, "layoutSizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v81 = v19;
    v82 = v37;
    if (v28)
    {
      objc_msgSend(v28, "sizeThatFits:", v37 + 10.0, 1.79769313e308);
      v39 = v38;
      v80 = v40;
      v41 = v36 + v40 + 3.0;
    }
    else
    {
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v80 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v41 = v36;
    }
    v42 = v30;
    v43 = v30 - v34;
    v44 = (v11 - v41) * 0.5;
    v45 = floorf(v44);
    v46 = (v34 - v39) * 0.5;
    v47 = v43 + floorf(v46);
    v87.origin.x = v43;
    v87.origin.y = v45;
    v87.size.width = v34;
    v87.size.height = v36;
    MaxY = CGRectGetMaxY(v87);
    v49 = v36;
    v50 = MaxY + 3.0;
    objc_msgSend(v32, "setFrame:", v43, v45, v34, v49);
    objc_msgSend(v28, "setFrame:", v47, v50, v39, v80);
    v19 = v81;
    v30 = v42 - v82 + -15.0;
  }
  -[SKUIItemCellLayout removeControlView](self, "removeControlView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    objc_msgSend(v51, "frame");
    v30 = v53 + -15.0;
  }
  v54 = v30 - v19;
  -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "sizeThatFits:", v30 - v19, 1.79769313e308);
  v57 = v56;

  -[_SKUIItemBrowseCellContentView userRatingImageView](self->_cellContentView, "userRatingImageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  v60 = 0.0;
  if (v58 && (objc_msgSend(v58, "isHidden") & 1) == 0)
  {
    objc_msgSend(v59, "frame");
    v60 = v61;
  }
  -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60 >= 16.0)
    v63 = v60;
  else
    v63 = 16.0;
  if (v62)
    v60 = v63;
  v64 = v60 + 1.0;
  if (v60 <= 0.00000011920929)
    v64 = 0.0;
  v65 = (v11 - (v57 + 1.0 + 16.0 + v64)) * 0.5;
  v66 = ceilf(v65);
  -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "frame");

    -[_SKUIItemBrowseCellContentView titleLabel](self->_cellContentView, "titleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setFrame:", v19, v66, v30 - v19, v57);

    v88.origin.x = v19;
    v88.origin.y = v66;
    v88.size.width = v30 - v19;
    v88.size.height = v57;
    v66 = CGRectGetMaxY(v88) + 1.0;
  }
  -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "frame");

    -[_SKUIItemBrowseCellContentView subtitleLabel](self->_cellContentView, "subtitleLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", v19, v66, v30 - v19, 16.0);

    v89.size.height = 16.0;
    v89.origin.x = v19;
    v89.origin.y = v66;
    v89.size.width = v30 - v19;
    v66 = CGRectGetMaxY(v89);
  }
  if (v59 && (objc_msgSend(v59, "isHidden") & 1) == 0)
  {
    objc_msgSend(v59, "frame");
    v74 = (v60 - v73) * 0.5;
    objc_msgSend(v59, "setFrame:", v19, v66 + 1.0 + floorf(v74));
  }
  -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "frame");

    if (v59 && (objc_msgSend(v59, "isHidden") & 1) == 0)
    {
      objc_msgSend(v59, "frame");
      v19 = CGRectGetMaxX(v90) + 3.0;
      v54 = v30 - v19;
    }
    v77 = (v60 + -16.0) * 0.5;
    v78 = v66 + floorf(v77);
    -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", v19, v78, v54, 16.0);

  }
}

- (void)setBackgroundColor:(id)a3
{
  _SKUIItemBrowseCellContentView *cellContentView;
  id v5;
  objc_super v6;

  cellContentView = self->_cellContentView;
  v5 = a3;
  -[_SKUIItemBrowseCellContentView setBackgroundColor:](cellContentView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIItemBrowseCellLayout;
  -[SKUIItemCellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setIconImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIItemBrowseCellLayout;
  -[SKUIItemCellLayout setIconImage:](&v7, sel_setIconImage_, a3);
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 4);

  -[SKUICellLayout contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:aboveSubview:", v6, self->_cellContentView);

}

- (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_sOnce_0 != -1)
    dispatch_once(&_decimalNumberFormatter_sOnce_0, &__block_literal_global_40);
  return (id)_decimalNumberFormatter_sNumberFormatter_0;
}

uint64_t __51__SKUIItemBrowseCellLayout__decimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_decimalNumberFormatter_sNumberFormatter_0;
  _decimalNumberFormatter_sNumberFormatter_0 = (uint64_t)v0;

  return objc_msgSend((id)_decimalNumberFormatter_sNumberFormatter_0, "setNumberStyle:", 1);
}

- (void)_initSKUIItemBrowseCellLayout
{
  void *v3;
  _SKUIItemBrowseCellContentView *v4;
  _SKUIItemBrowseCellContentView *cellContentView;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_largeSpacing = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  v4 = objc_alloc_init(_SKUIItemBrowseCellContentView);
  cellContentView = self->_cellContentView;
  self->_cellContentView = v4;

  -[SKUICellLayout contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_cellContentView);

}

- (void)_reloadUserRatingViews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SKUICellImageView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SKUICellImageView *v19;
  id v20;

  -[SKUICellLayout parentCellView](self, "parentCellView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v20, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v6);

    if (self->_primaryTextColor)
    {
      objc_msgSend(v4, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTextColor:", v7);

    }
    -[_SKUIItemBrowseCellContentView setUserRatingLabel:](self->_cellContentView, "setUserRatingLabel:", v4);

  }
  if (self->_numberOfUserRatings)
  {
    -[SKUIItemBrowseCellLayout _decimalNumberFormatter](self, "_decimalNumberFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfUserRatings);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v13);

    -[_SKUIItemBrowseCellContentView userRatingImageView](self->_cellContentView, "userRatingImageView");
    v14 = (SKUICellImageView *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = objc_alloc_init(SKUICellImageView);
      -[_SKUIItemBrowseCellContentView setUserRatingImageView:](self->_cellContentView, "setUserRatingImageView:", v14);
      objc_msgSend(v20, "backgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICellImageView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    }
    +[SKUIRatingStarsCache cacheWithProperties:](SKUIRatingStarsCache, "cacheWithProperties:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICellImageView setHidden:](v14, "setHidden:", 0);
    objc_msgSend(v16, "ratingStarsImageForRating:", self->_userRating);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICellImageView setImage:](v14, "setImage:", v17);

    -[SKUICellImageView sizeToFit](v14, "sizeToFit");
  }
  else
  {
    -[_SKUIItemBrowseCellContentView userRatingImageView](self->_cellContentView, "userRatingImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    -[_SKUIItemBrowseCellContentView userRatingLabel](self->_cellContentView, "userRatingLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICellLayout clientContext](self, "clientContext");
    v19 = (SKUICellImageView *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v19)
      -[SKUICellImageView localizedStringForKey:](v19, "localizedStringForKey:", CFSTR("NO_RATINGS"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NO_RATINGS"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v16);
  }

  -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)imageBoundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageBoundingSize.width;
  height = self->_imageBoundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isLargeSpacing
{
  return self->_largeSpacing;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (double)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

- (void)initWithCollectionViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithTableViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
