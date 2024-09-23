@implementation SKUIImageCollectionViewCell

- (void)reloadWithCarouselItem:(id)a3 size:(CGSize)a4 context:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SKUIImageCollectionViewCell *v24;
  CGFloat v25;
  CGFloat v26;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIImageCollectionViewCell reloadWithCarouselItem:size:context:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__SKUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke;
  v21[3] = &unk_1E73A0090;
  v25 = width;
  v26 = height;
  v22 = v9;
  v23 = v10;
  v24 = self;
  v19 = v10;
  v20 = v9;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v21);

}

void __67__SKUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SKUIStyledImageDataConsumer *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(a2, "addReusableViewWithReuseIdentifier:", 0x1E73B6CF0);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityLabel:", v3);

  objc_msgSend(v25, "setEnabled:", 0);
  objc_msgSend(v25, "setImageSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = objc_alloc_init(SKUIStyledImageDataConsumer);
  v5 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStyledImageDataConsumer setBorderColor:](v4, "setBorderColor:", v6);

  objc_msgSend(*(id *)(a1 + 40), "aggregateValueForKey:", CFSTR("SKUICIBWK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v5 = v12;
  }
  else
  {
    v10 = 1.0;
    v9 = 0.0;
    v11 = 0.0;
  }
  -[SKUIStyledImageDataConsumer setBorderWidths:](v4, "setBorderWidths:", v5, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "artworkForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForArtwork:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(v15 + 832);
  *(_QWORD *)(v15 + 832) = v14;

  objc_msgSend(*(id *)(a1 + 40), "requestIdentifierForArtwork:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 40);
  if (v17)
  {
    objc_msgSend(v18, "resourceLoader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachedResourceForRequestIdentifier:", objc_msgSend(v17, "unsignedIntegerValue"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "loadImageForArtwork:dataConsumer:reason:", v13, v4, 1);

  }
  else
  {
    objc_msgSend(v18, "loadImageForArtwork:dataConsumer:reason:", v13, v4, 1);
  }
  v22 = -[SKUIStyledImageDataConsumer isImagePlaceholderAvailable](v4, "isImagePlaceholderAvailable");
  v23 = *(void **)(a1 + 40);
  if (v22)
  {
    objc_msgSend(v23, "placeholderColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStyledImageDataConsumer imagePlaceholderForColor:](v4, "imagePlaceholderForColor:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "placeholderImageForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  objc_msgSend(v25, "setContents:", v21);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
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
  id v18;
  uint64_t v19;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIImageCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v8, "requestIdentifierForViewElement:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = v7;
    if (objc_msgSend(v18, "elementType") == 152)
    {
      objc_msgSend(v18, "thumbnailImage");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v19;
    }
    objc_msgSend(v8, "loadImageForImageElement:reason:", v18, a4);

  }
  return v17 == 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIImageCollectionViewCell preferredSizeForViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v6, "sizeForViewElement:width:", v5, 1.79769313e308);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
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

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIImageCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIAdornedImageView requestLayoutForViewElement:width:context:](SKUIAdornedImageView, "requestLayoutForViewElement:width:context:", v7, v8, a4);

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
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIImageCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v8, "sizeForViewElement:width:", v7, a3);
  v19 = v18;
  if (v17 > 0.00000011920929)
  {
    v20 = v18 * (a3 / v17);
    v19 = floorf(v20);
  }

  v21 = a3;
  v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id imageRequestCacheKey;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SKUIImageCollectionViewCell *v16;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "imageResourceCacheKeyForViewElement:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  imageRequestCacheKey = self->_imageRequestCacheKey;
  self->_imageRequestCacheKey = v9;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__SKUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v13[3] = &unk_1E73A00B8;
  v14 = v7;
  v15 = v8;
  v16 = self;
  v11 = v8;
  v12 = v7;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v13);

}

void __67__SKUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "elementType");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v3 == 152)
  {
    v6 = (id)objc_msgSend(v10, "addImageViewWithVideoElement:context:", v4, v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 840))
      v7 = (id)objc_msgSend(v10, "addImageViewWithVideoElement:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = (id)objc_msgSend(v10, "addImageViewWithElement:context:", v4, v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 840))
      v9 = (id)objc_msgSend(v10, "addImageViewWithElement:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "requestIdentifierForResourceCacheKey:", self->_imageRequestCacheKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v10, "unsignedIntegerValue"), v12 == objc_msgSend(v9, "requestIdentifier")))
  {
    -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setImage:", v8);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
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
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  CGAffineTransform v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SKUIImageCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  -[SKUIImageCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
    if (self->_showsReflectionImage)
    {
      v18 = v11 * 0.5;
      v14 = v14 + floorf(v18);
    }
    objc_msgSend(v13, "setFrame:", v5 + v15, v7 + v14, v9 - (v15 + v17), v11 - (v16 + v14));
  }
  if (objc_msgSend(v12, "count") == 2)
  {
    objc_msgSend(v12, "objectAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (self->_showsReflectionImage)
    {
      objc_msgSend(v13, "frame");
      objc_msgSend(v20, "setFrame:");
      objc_msgSend(v20, "setHidden:", 0);
      CGAffineTransformMakeScale(&v21, -1.0, -1.0);
      objc_msgSend(v20, "setTransform:", &v21);
    }
    else
    {
      objc_msgSend(v19, "setHidden:", 1);
    }

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIImageCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUIImageCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIImageCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SKUIImageCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  void *v3;
  SKUIImageView *v4;
  SKUIImageView *v5;
  SKUIImageView *v6;
  SKUIImageView *v7;
  SKUIImageView *v8;
  void *v9;
  SKUIImageView *v10;
  SKUIImageView *v11;
  void *v12;
  void *v13;
  void *v14;
  SKUIImageView *v15;
  void *v16;
  SKUIImageView *highlightImageView;
  SKUIImageView *v18;
  SKUIImageView *v19;
  void *v20;
  _QWORD v21[4];
  SKUIImageView *v22;
  char v23[48];

  if ((-[SKUIImageCollectionViewCell isHighlighted](self, "isHighlighted") & 1) == 0
    && !-[SKUIImageCollectionViewCell isSelected](self, "isSelected"))
  {
    highlightImageView = self->_highlightImageView;
    if (!highlightImageView)
      return;
    v18 = highlightImageView;
    v19 = self->_highlightImageView;
    self->_highlightImageView = 0;

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v20 = (void *)MEMORY[0x1E0CD28B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__SKUIImageCollectionViewCell__reloadHighlightImageView__block_invoke;
    v21[3] = &unk_1E739FD38;
    v22 = v18;
    v4 = v18;
    objc_msgSend(v20, "setCompletionBlock:", v21);
    -[SKUIImageView setAlpha:](v4, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v16 = v22;
    goto LABEL_9;
  }
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (SKUIImageView *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = self->_highlightImageView;
    if (!v5)
    {
      v6 = objc_alloc_init(SKUIImageView);
      v7 = self->_highlightImageView;
      self->_highlightImageView = v6;

      -[SKUIImageView setAlpha:](self->_highlightImageView, "setAlpha:", 0.300000012);
      v8 = self->_highlightImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v5 = self->_highlightImageView;
    }
    -[SKUIImageView bounds](v4, "bounds");
    -[SKUIImageView setBounds:](v5, "setBounds:");
    v10 = self->_highlightImageView;
    -[SKUIImageView center](v4, "center");
    -[SKUIImageView setCenter:](v10, "setCenter:");
    v11 = self->_highlightImageView;
    -[SKUIImageView image](v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIImageView setImage:](v11, "setImage:", v14);

    v15 = self->_highlightImageView;
    -[SKUIImageView transform](v4, "transform");
    -[SKUIImageView setTransform:](v15, "setTransform:", v23);
    -[SKUIImageCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:aboveSubview:", self->_highlightImageView, v4);
LABEL_9:

  }
}

uint64_t __56__SKUIImageCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)showsReflectionImage
{
  return self->_showsReflectionImage;
}

- (void)setShowsReflectionImage:(BOOL)a3
{
  self->_showsReflectionImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageRequestCacheKey, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

- (void)reloadWithCarouselItem:(uint64_t)a3 size:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

@end
