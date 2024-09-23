@implementation SKUIStarRatingViewElementView

- (SKUIStarRatingViewElementView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIStarRatingViewElementView *v16;
  SKUIStarRatingViewElementView *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIStarRatingViewElementView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIStarRatingViewElementView;
  v16 = -[SKUIStarRatingViewElementView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_elementSpacing = 3;
    -[SKUIStarRatingViewElementView setContentMode:](v16, "setContentMode:", 3);
  }
  return v17;
}

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
        +[SKUIStarRatingViewElementView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIStarRatingViewElementView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIStarRatingViewElementView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(a1, "_attributedStringWithViewElement:context:", v9, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "requestLayoutForViewElement:attributedString:width:", v9, v18, (uint64_t)a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  float v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  v7 = a5;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIStarRatingViewElementView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIRatingStarsCache cacheWithProperties:](SKUIRatingStarsCache, "cacheWithProperties:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratingValue");
  objc_msgSend(v17, "ratingStarsImageForRating:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "size");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v7, "labelLayoutCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "sizeForViewElement:width:", v8, a3);
  v26 = v25;
  v28 = v27;

  if (v23 < v28 && v26 > 0.00000011920929)
    v23 = v28;
  v30 = -0.0;
  if (v26 > 0.00000011920929)
    v30 = v26 + 3.0;
  v31 = v21 + v30;

  v32 = v31;
  v33 = v23;
  result.height = v33;
  result.width = v32;
  return result;
}

+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SKUIViewTextProperties *v19;
  void *v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIStarRatingViewElementView textPropertiesForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v8, "labelLayoutCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutForWidth:viewElement:", (uint64_t)a4, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[SKUIViewTextProperties initWithStringLayout:]([SKUIViewTextProperties alloc], "initWithStringLayout:", v18);
    +[SKUIRatingStarsCache cacheWithProperties:](SKUIRatingStarsCache, "cacheWithProperties:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ratingValue");
    objc_msgSend(v20, "ratingStarsImageForRating:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "boundingSize");
    v24 = v23;
    objc_msgSend(v22, "size");
    if (v24 < v25)
    {
      -[SKUIViewTextProperties setBaselineOffsetFromBottom:](v19, "setBaselineOffsetFromBottom:", 0.0);
      -[SKUIViewTextProperties setFirstBaselineOffset:](v19, "setFirstBaselineOffset:", 0.0);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  float v10;
  UIImage *v11;
  void *v12;
  SKUIAttributedStringLayout *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  +[SKUIRatingStarsCache cacheWithProperties:](SKUIRatingStarsCache, "cacheWithProperties:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ratingValue");
  objc_msgSend(v9, "ratingStarsImageForRating:", v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (self->_starRatingImage != v11)
  {
    objc_storeStrong((id *)&self->_starRatingImage, v11);
    -[SKUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }
  objc_msgSend(v8, "labelLayoutCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutForWidth:viewElement:", (uint64_t)a4, v14);
  v13 = (SKUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();

  if (v13 != self->_textLayout)
  {
    objc_storeStrong((id *)&self->_textLayout, v13);
    -[SKUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  int ShouldReverseLayoutDirection;
  UIImage *starRatingImage;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SKUIAttributedStringLayout *textLayout;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGImage *v26;
  UIImage *v27;
  UIImage *v28;
  CGFloat rect;
  double recta;
  id v31;
  CGRect v32;
  CGRect v33;

  -[SKUIStarRatingViewElementView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v8 = (double *)MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  starRatingImage = self->_starRatingImage;
  v14 = v11;
  v15 = v9;
  v16 = v10;
  if (starRatingImage)
  {
    -[UIImage size](starRatingImage, "size", v9);
    v14 = v17;
    *(float *)&v17 = (v7 - v17 + 2.0) * 0.5;
    v16 = floorf(*(float *)&v17);
  }
  rect = v15;
  v18 = *v8;
  textLayout = self->_textLayout;
  if (textLayout
    && (-[SKUIAttributedStringLayout boundingSize](textLayout, "boundingSize"),
        v9 = v20,
        v11 = v21,
        *(float *)&v20 = (v7 - v21) * 0.5,
        v10 = floorf(*(float *)&v20),
        self->_starRatingImage))
  {
    v22 = v18;
    if ((ShouldReverseLayoutDirection & 1) == 0)
    {
      v32.origin.x = v18;
      v32.origin.y = v16;
      v32.size.width = rect;
      v32.size.height = v14;
      v22 = CGRectGetMaxX(v32) + (double)self->_elementSpacing;
    }
    if (v9 >= v5 - v22)
      v9 = v5 - v22;
    if (v14 < v11)
    {
      -[SKUIAttributedStringLayout baselineOffset](self->_textLayout, "baselineOffset");
      *(float *)&v23 = v23 + v10 - v14 + 2.0;
      v16 = ceilf(*(float *)&v23);
    }
  }
  else
  {
    v22 = v18;
  }
  if (ShouldReverseLayoutDirection && self->_starRatingImage)
  {
    v33.origin.x = v22;
    v33.origin.y = v10;
    v33.size.width = v9;
    v33.size.height = v11;
    v18 = CGRectGetMaxX(v33) + (double)self->_elementSpacing;
  }
  -[SKUIAttributedStringLayout attributedString](self->_textLayout, "attributedString", *(_QWORD *)&rect);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[SKUIAttributedStringLayout stringDrawingContext](self->_textLayout, "stringDrawingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "drawWithRect:options:context:", 33, v24, v22, v10, v9, v11);

  }
  if (storeShouldReverseLayoutDirection())
  {
    v25 = (void *)MEMORY[0x1E0DC3870];
    v26 = -[UIImage CGImage](self->_starRatingImage, "CGImage");
    -[UIImage scale](self->_starRatingImage, "scale");
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 4);
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v28 = self->_starRatingImage;
    self->_starRatingImage = v27;

  }
  -[UIImage drawInRect:blendMode:alpha:](self->_starRatingImage, "drawInRect:blendMode:alpha:", 0, v18, v16, recta, v14, 1.0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIImage *starRatingImage;
  double v5;
  double v6;
  double v7;
  double v8;
  SKUIAttributedStringLayout *textLayout;
  double v10;
  double v11;
  CGSize result;

  starRatingImage = self->_starRatingImage;
  if (starRatingImage)
  {
    -[UIImage size](starRatingImage, "size", a3.width, a3.height);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  textLayout = self->_textLayout;
  if (textLayout)
  {
    -[SKUIAttributedStringLayout boundingSize](textLayout, "boundingSize");
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_starRatingImage)
  {
    if (self->_textLayout)
    {
      v10 = v10 + v6 + (double)self->_elementSpacing;
      if (v8 >= v11)
        v11 = v8;
    }
    else
    {
      v10 = v6;
      v11 = v8;
    }
  }
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_msgSend(v6, "containerViewElementType");
    if (v9 == 134 || v9 == 104)
    {
      SKUIFontPreferredFontForTextStyle(21);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SKUIFontForTextStyle(10);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v10;
  }
  objc_msgSend(v6, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(int64_t)a3
{
  self->_elementSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_starRatingImage, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
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

+ (void)textPropertiesForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
