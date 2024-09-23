@implementation SKUIActivityIndicatorView

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
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        +[SKUIActivityIndicatorView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIActivityIndicatorView preferredSizeForViewElement:context:].cold.1();
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
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
  void *v20;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIActivityIndicatorView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(a1, "_attributedStringWithLabel:context:", v18, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requestLayoutForLabel:attributedString:width:", v18, v19, (uint64_t)a4);

  }
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
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v8 = a5;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIActivityIndicatorView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(a1, "_activityIndicatorSize");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v9, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v8, "sizeForViewElement:width:", v22, a3);
    v21 = v21 + v24;
    if (v19 < v23)
      v19 = v23;
  }

  v25 = v19;
  v26 = v21;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SKUIActivityIndicatorView *v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SKUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A1230;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);
  -[SKUIActivityIndicatorView _updateSpinnerAnimation](self, "_updateSpinnerAnimation");

}

void __65__SKUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v22, "addImageViewWithElement:context:", v6, *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 480);
    *(_QWORD *)(v8 + 480) = v7;

    if (v5)
      v10 = v5;
    else
      v10 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "setTintColor:", v10);
    objc_msgSend(*(id *)(a1 + 32), "period");
    if (v15 <= 0.0)
      v15 = 1.0;
    *(double *)(*(_QWORD *)(a1 + 40) + 504) = v15;
  }
  else
  {
    objc_msgSend(v22, "addReusableViewWithReuseIdentifier:", 0x1E73B6B30);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 488);
    *(_QWORD *)(v12 + 488) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 488), "setActivityIndicatorViewStyle:", 100);
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 488);
    if (v5)
    {
      objc_msgSend(v14, "setColor:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setColor:", v21);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v22, "addLabelViewWithElement:width:context:", v16, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 496);
    *(_QWORD *)(v18 + 496) = v17;

  }
  objc_msgSend(*(id *)(a1 + 32), "style");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432) = SKUIViewElementAlignmentForStyle(v20);

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIActivityIndicatorView setNeedsLayout](self, "setNeedsLayout");
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

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIActivityIndicatorView;
  -[SKUIActivityIndicatorView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SKUIActivityIndicatorView _updateSpinnerAnimation](self, "_updateSpinnerAnimation");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIActivityIndicatorView;
  -[SKUIActivityIndicatorView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SKUIActivityIndicatorView _updateSpinnerAnimation](self, "_updateSpinnerAnimation");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double top;
  void *imageView;
  id v19;
  double v20;
  float v21;
  SKUIAttributedStringView *stringView;
  double v23;
  float v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SKUIActivityIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "sizeThatFits:", v4, v6);
        objc_msgSend(v14, "setFrame:", v11, v12, v15, v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  top = self->_contentInset.top;
  imageView = self->_imageView;
  if (imageView || (imageView = self->_indicatorView) != 0)
  {
    v19 = imageView;
    objc_msgSend(v19, "frame");
    v21 = (v4 - v20) * 0.5;
    objc_msgSend(v19, "setFrame:", floorf(v21), top);
  }
  else
  {
    v19 = 0;
  }
  stringView = self->_stringView;
  if (stringView)
  {
    -[SKUIAttributedStringView frame](stringView, "frame");
    v24 = (v4 - v23) * 0.5;
    -[SKUIAttributedStringView setFrame:](self->_stringView, "setFrame:", floorf(v24), v6 - v25);
  }

}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIActivityIndicatorView;
  -[SKUIActivityIndicatorView setHidden:](&v4, sel_setHidden_, a3);
  -[SKUIActivityIndicatorView _updateSpinnerAnimation](self, "_updateSpinnerAnimation");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *imageView;
  double v9;
  double v10;
  SKUIAttributedStringView *stringView;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  imageView = self->_imageView;
  if (imageView || (imageView = self->_indicatorView) != 0)
  {
    objc_msgSend(imageView, "sizeThatFits:", a3.width, a3.height);
    v7 = v7 + v10;
    if (v9 >= v6)
      v6 = v9;
  }
  stringView = self->_stringView;
  if (stringView)
  {
    -[SKUIAttributedStringView sizeThatFits:](stringView, "sizeThatFits:", width, height);
    v7 = v7 + 18.0;
    if (v12 >= v6)
      v6 = v12;
  }
  v13 = v7 + self->_contentInset.bottom + self->_contentInset.top;
  v14 = v6 + self->_contentInset.left + self->_contentInset.right;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (CGSize)_activityIndicatorSize
{
  double v2;
  double v3;
  CGSize result;

  if (_activityIndicatorSize_sOnce != -1)
    dispatch_once(&_activityIndicatorSize_sOnce, &__block_literal_global_59);
  v2 = *(double *)&_activityIndicatorSize_sIndicatorSize_0;
  v3 = *(double *)&_activityIndicatorSize_sIndicatorSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __51__SKUIActivityIndicatorView__activityIndicatorSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 1);
  objc_msgSend(v2, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  _activityIndicatorSize_sIndicatorSize_0 = v0;
  _activityIndicatorSize_sIndicatorSize_1 = v1;

}

+ (id)_attributedStringWithLabel:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SKUIFontPreferredFontForTextStyle(8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontWithSize:", 11.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "ikColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedStringWithDefaultFont:foregroundColor:style:", v6, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_isAnimating
{
  if (self->_indicatorView)
    return -[UIActivityIndicatorView isAnimating](self->_indicatorView, "isAnimating");
  else
    return self->_animating;
}

- (void)_startAnimating
{
  UIActivityIndicatorView *indicatorView;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[SKUIActivityIndicatorView _isAnimating](self, "_isAnimating"))
  {
    indicatorView = self->_indicatorView;
    if (indicatorView)
    {
      -[UIActivityIndicatorView startAnimating](indicatorView, "startAnimating");
    }
    else
    {
      self->_animating = 1;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDuration:", self->_period);
      LODWORD(v4) = 2139095040;
      objc_msgSend(v8, "setRepeatCount:", v4);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 0.0);
      objc_msgSend(v8, "setFromValue:", v5);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 6.28318531);
      objc_msgSend(v8, "setToValue:", v6);
      -[UIImageView layer](self->_imageView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("transform"));

    }
  }
}

- (void)_stopAnimating
{
  UIActivityIndicatorView *indicatorView;
  id v4;

  if (-[SKUIActivityIndicatorView _isAnimating](self, "_isAnimating"))
  {
    indicatorView = self->_indicatorView;
    if (indicatorView)
    {
      -[UIActivityIndicatorView stopAnimating](indicatorView, "stopAnimating");
    }
    else
    {
      self->_animating = 0;
      -[UIImageView layer](self->_imageView, "layer");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAnimationForKey:", CFSTR("transform"));

    }
  }
}

- (void)_updateSpinnerAnimation
{
  uint64_t v3;
  void *v4;
  char v5;

  -[SKUIActivityIndicatorView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3, v5 = -[SKUIActivityIndicatorView isHidden](self, "isHidden"), v4, (v5 & 1) == 0))
  {
    -[SKUIActivityIndicatorView _startAnimating](self, "_startAnimating");
  }
  else
  {
    -[SKUIActivityIndicatorView _stopAnimating](self, "_stopAnimating");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIActivityIndicatorView preferredSizeForViewElement:context:]";
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
