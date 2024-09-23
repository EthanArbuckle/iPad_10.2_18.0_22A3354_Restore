@implementation SKUITomatoRatingView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUITomatoRatingView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITomatoRatingView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITomatoRatingView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(a1, "_attributedStringForRating:context:", v9, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "requestLayoutForViewElement:attributedString:width:", v9, v18, (uint64_t)a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v8 = a5;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITomatoRatingView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(a1, "_tomatoImageForFreshness:", objc_msgSend(v9, "freshness"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v8, "labelLayoutCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "layoutForWidth:viewElement:", (uint64_t)a3, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "boundingSize");
    if (v22 < v26)
      v22 = v26;
    v20 = v20 + v25 + 3.0;
  }

  v27 = v20;
  v28 = v22;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  UIImageView *imageView;
  UIImageView *v19;
  UIImageView *v20;
  UIImageView *v21;
  void *v22;
  void *v23;
  SKUIAttributedStringView *labelView;
  SKUIAttributedStringView *v25;
  SKUIAttributedStringView *v26;
  SKUIAttributedStringView *v27;
  void *v28;
  void *v29;
  void *v30;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUITomatoRatingView reloadWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  imageView = self->_imageView;
  if (!imageView)
  {
    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v20 = self->_imageView;
    self->_imageView = v19;

    v21 = self->_imageView;
    -[SKUITomatoRatingView backgroundColor](self, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUITomatoRatingView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  objc_msgSend((id)objc_opt_class(), "_tomatoImageForFreshness:", objc_msgSend(v8, "freshness"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v23);

  labelView = self->_labelView;
  if (!labelView)
  {
    v25 = objc_alloc_init(SKUIAttributedStringView);
    v26 = self->_labelView;
    self->_labelView = v25;

    v27 = self->_labelView;
    -[SKUITomatoRatingView backgroundColor](self, "backgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIAttributedStringView setBackgroundColor:](v27, "setBackgroundColor:", v28);

    -[SKUIAttributedStringView setUserInteractionEnabled:](self->_labelView, "setUserInteractionEnabled:", 0);
    -[SKUITomatoRatingView addSubview:](self, "addSubview:", self->_labelView);
    labelView = self->_labelView;
  }
  objc_msgSend(v9, "labelLayoutCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIAttributedStringView setLayout:](labelView, "setLayout:", v30);

  -[SKUITomatoRatingView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITomatoRatingView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITomatoRatingView updateWithItemState:context:animated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITomatoRatingView viewForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *imageView;
  id v5;
  objc_super v6;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  -[SKUIAttributedStringView setBackgroundColor:](self->_labelView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUITomatoRatingView;
  -[SKUITomatoRatingView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[SKUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
  v12 = v7 + 3.0 + v11;
  if (v9 >= v10)
    v10 = v9;
  result.height = v10;
  result.width = v12;
  return result;
}

+ (id)_attributedStringForRating:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "ratingText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementFontWithStyle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    SKUIFontForTextStyle(10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "attributedStringWithDefaultFont:foregroundColor:style:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_tomatoImageForFreshness:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 2:
      v4 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesRotten");
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesFresh");
      goto LABEL_7;
    case 0:
      v4 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesCertified");
LABEL_7:
      objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
