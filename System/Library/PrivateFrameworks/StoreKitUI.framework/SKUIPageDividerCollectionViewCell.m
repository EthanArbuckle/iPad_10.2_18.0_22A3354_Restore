@implementation SKUIPageDividerCollectionViewCell

- (SKUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  SKUIPageDividerCollectionViewCell *v3;
  UIView *v4;
  UIView *topDividerLine;
  UIView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKUIPageDividerCollectionViewCell;
  v3 = -[SKUIPageDividerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topDividerLine = v3->_topDividerLine;
    v3->_topDividerLine = v4;

    v6 = v3->_topDividerLine;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUIPageDividerCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_topDividerLine);

  }
  return v3;
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
        +[SKUIPageDividerCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIPageDividerCollectionViewCell preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v5)
      +[SKUIPageDividerCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    +[SKUIPageDividerCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v7)
      goto LABEL_5;
  }
  else if (v7)
  {
LABEL_5:
    objc_msgSend(v7, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = SKUIViewElementPaddingForStyle(v17, 0);
    v20 = v19;

    goto LABEL_8;
  }
  v18 = *MEMORY[0x1E0DC49E8];
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
LABEL_8:
  objc_msgSend(v8, "displayScale");
  v22 = 1.0 / v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v7;
    if (objc_msgSend(v23, "dividerType") == 2)
    {
      +[SKUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:](SKUIPageTitledDividerCollectionViewCell, "viewElementInsetDividerHeight:", v23);
      v22 = v24 + v22 * 2.0;
    }

  }
  v25 = a3;
  v26 = v20 + v18 + v22;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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

- (void)setColoringWithColorScheme:(id)a3
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
  void *v13;
  UIView *topDividerLine;
  UIView *bottomDividerLine;
  void *v16;
  UIView *v17;
  void *v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageDividerCollectionViewCell setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "primaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  topDividerLine = self->_topDividerLine;
  if (v13)
  {
    -[UIView setBackgroundColor:](self->_topDividerLine, "setBackgroundColor:", v13);
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine)
      -[UIView setBackgroundColor:](bottomDividerLine, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](topDividerLine, "setBackgroundColor:", v16);

    v17 = self->_bottomDividerLine;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    }
  }

}

- (void)setColoringWithStyle:(id)a3
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
  void *v13;
  void *v14;
  UIView *topDividerLine;
  UIView *bottomDividerLine;
  void *v17;
  UIView *v18;
  void *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageDividerCollectionViewCell setColoringWithStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "ikBorderColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  topDividerLine = self->_topDividerLine;
  if (v14)
  {
    -[UIView setBackgroundColor:](self->_topDividerLine, "setBackgroundColor:", v14);
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine)
      -[UIView setBackgroundColor:](bottomDividerLine, "setBackgroundColor:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](topDividerLine, "setBackgroundColor:", v17);

    v18 = self->_bottomDividerLine;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    }
  }

}

- (void)setDividerType:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  UIView *bottomDividerLine;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *insetView;
  UIView *v22;
  UIView *v23;
  void *v24;
  void *v25;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageDividerCollectionViewCell setDividerType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_dividerType != a3)
  {
    self->_dividerType = a3;
    v13 = -[SKUIPageDividerCollectionViewCell dividerType](self, "dividerType");
    bottomDividerLine = self->_bottomDividerLine;
    if (v13 == 2)
    {
      if (!bottomDividerLine)
      {
        v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v16 = self->_bottomDividerLine;
        self->_bottomDividerLine = v15;

        v17 = self->_bottomDividerLine;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

      }
      -[SKUIPageDividerCollectionViewCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_bottomDividerLine);

      if (!self->_insetView)
      {
        v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        insetView = self->_insetView;
        self->_insetView = v20;

        v22 = self->_insetView;
        if (self->_insetColor)
        {
          -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.968627451, 1.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v24);

        }
      }
      -[SKUIPageDividerCollectionViewCell contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", self->_insetView);

    }
    else
    {
      if (bottomDividerLine)
        -[UIView removeFromSuperview](bottomDividerLine, "removeFromSuperview");
      v23 = self->_insetView;
      if (v23)
        -[UIView removeFromSuperview](v23, "removeFromSuperview");
    }
  }
}

- (void)setInsetColor:(id)a3
{
  UIColor *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIColor *v13;
  UIColor *insetColor;
  UIView *insetView;
  void *v16;

  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageDividerCollectionViewCell setInsetColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_insetColor != v4)
  {
    v13 = (UIColor *)-[UIColor copy](v4, "copy");
    insetColor = self->_insetColor;
    self->_insetColor = v13;

    insetView = self->_insetView;
    if (insetView)
    {
      if (self->_insetColor)
      {
        -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.968627451, 1.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](insetView, "setBackgroundColor:", v16);

      }
    }
  }

}

- (void)setLeftEdgeInset:(double)a3
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
        -[SKUIPageDividerCollectionViewCell setLeftEdgeInset:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_leftEdgeInset != a3)
  {
    self->_leftEdgeInset = a3;
    -[SKUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRightEdgeInset:(double)a3
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
        -[SKUIPageDividerCollectionViewCell setRightEdgeInset:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_rightEdgeInset != a3)
  {
    self->_rightEdgeInset = a3;
    -[SKUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVerticalAlignment:(int64_t)a3
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
        -[SKUIPageDividerCollectionViewCell setVerticalAlignment:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[SKUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
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
  void *v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageDividerCollectionViewCell applyLayoutAttributes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPageDividerCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14.receiver = self;
  v14.super_class = (Class)SKUIPageDividerCollectionViewCell;
  -[SKUIPageDividerCollectionViewCell applyLayoutAttributes:](&v14, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (double)dividerHeight
{
  return self->_dividerHeight;
}

- (void)setDividerHeight:(double)a3
{
  self->_dividerHeight = a3;
}

- (int64_t)dividerType
{
  return self->_dividerType;
}

- (double)leftEdgeInset
{
  return self->_leftEdgeInset;
}

- (double)rightEdgeInset
{
  return self->_rightEdgeInset;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetColor, 0);
  objc_storeStrong((id *)&self->_insetView, 0);
  objc_storeStrong((id *)&self->_bottomDividerLine, 0);
  objc_storeStrong((id *)&self->_topDividerLine, 0);
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

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setColoringWithStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setDividerType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setInsetColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setLeftEdgeInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRightEdgeInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setVerticalAlignment:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
