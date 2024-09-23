@implementation SKUIReviewListTitleView

- (SKUIReviewListTitleView)initWithFrame:(CGRect)a3
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
  SKUIReviewListTitleView *v16;
  SKUIReviewListTitleView *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIReviewListTitleView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIReviewListTitleView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
    -[SKUIReviewListTitleView setContentMode:](v16, "setContentMode:", 3);
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
        +[SKUIReviewListTitleView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIReviewListTitleView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUIReviewListTitleView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(a1, "_dateLabelForViewElement:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(a1, "_attributedStringForDateLabel:context:", v18, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requestLayoutForLabel:attributedString:width:", v18, v19, (uint64_t)a4);

    if (objc_msgSend(v19, "length"))
    {
      objc_msgSend(v19, "boundingRectWithSize:options:context:", 1, 0, a4, 1.79769313e308);
      a4 = a4 - v21;
    }

  }
  objc_msgSend(a1, "_textLabelForViewElement:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(a1, "_attributedStringForTitleLabel:context:", v22, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requestLayoutForLabel:attributedString:width:", v22, v23, (uint64_t)a4);

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
  void *v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIReviewListTitleView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "firstChildForElementType:", 138);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v8, "sizeForViewElement:width:", v17, a3);
  v20 = v18 + v19;
  objc_msgSend(v8, "textPropertiesForViewElement:width:", v17, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "baselineOffsetFromBottom");
  v22 = a3;
  v23 = v20;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SKUIReviewListTitleView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A1230;
  v15 = a4;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __63__SKUIReviewListTitleView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = *(double *)(a1 + 56);
  objc_msgSend((id)objc_opt_class(), "_dateLabelForViewElement:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v15, "addLabelViewWithElement:width:context:", v4, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDateView:", v5);

    objc_msgSend(*(id *)(a1 + 48), "textPropertiesForViewElement:width:", v4, *(double *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextProperties:forView:", v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "dateView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
    v10 = v9;

    v3 = v3 - v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDateView:", 0);
  }
  objc_msgSend((id)objc_opt_class(), "_textLabelForViewElement:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v15, "addLabelViewWithElement:width:context:", v11, *(_QWORD *)(a1 + 48), v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitleView:", v12);

    objc_msgSend(*(id *)(a1 + 48), "textPropertiesForViewElement:width:", v11, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "titleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextProperties:forView:", v13, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setTitleView:", 0);
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
    -[SKUIReviewListTitleView setNeedsDisplay](self, "setNeedsDisplay");
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

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Width;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  CGFloat rect;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v47.receiver = self;
  v47.super_class = (Class)SKUIReviewListTitleView;
  -[SKUIReviewListTitleView layoutSubviews](&v47, sel_layoutSubviews);
  -[SKUIReviewListTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  rect = v9;
  -[SKUIReviewListTitleView contentInset](self, "contentInset");
  v11 = v10;
  v45 = v12;
  v14 = v13;
  -[SKUIReviewListTitleView titleView](self, "titleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewListTitleView dateView](self, "dateView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundingSize");
  v19 = v18;
  v21 = v20;

  objc_msgSend(v15, "layout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "baselineOffset");
  v24 = v23;
  objc_msgSend(v16, "layout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "baselineOffset");
  v27 = v24 - v26;

  v46 = v11;
  v28 = v11 + v27;
  v29 = v14;
  v30 = round(v28);
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = rect;
  Width = CGRectGetWidth(v48);
  v49.origin.x = 0.0;
  v49.origin.y = v30;
  v49.size.width = v19;
  v49.size.height = v21;
  v32 = Width - CGRectGetWidth(v49) - v29;
  v50.origin.x = v32;
  v50.origin.y = v30;
  v50.size.width = v19;
  v50.size.height = v21;
  v51 = CGRectIntegral(v50);
  objc_msgSend(v16, "setFrame:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  v52.origin.x = v32;
  v52.origin.y = v30;
  v52.size.width = v19;
  v52.size.height = v21;
  if (CGRectGetWidth(v52) <= 2.22044605e-16)
  {
    v33 = v45;
    v34 = v8 - v45 - v29;
  }
  else
  {
    v53.origin.x = v32;
    v53.origin.y = v30;
    v53.size.width = v19;
    v53.size.height = v21;
    v33 = v45;
    v34 = CGRectGetMinX(v53) - v45 + -10.0;
  }
  objc_msgSend(v15, "layout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "boundingSize");
  v37 = v36;
  v39 = v38;

  if (v37 >= v34)
    v40 = v34;
  else
    v40 = v37;
  v41 = v33;
  v42 = v46;
  v43 = v39;
  v54 = CGRectIntegral(*(CGRect *)(&v40 - 2));
  objc_msgSend(v15, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  -[SKUIReviewListTitleView contentInset](self, "contentInset", a3.width, a3.height);
  v6 = v5;
  -[SKUIReviewListTitleView titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
  v9 = v8;

  v10 = v6 + v9;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (id)_dateLabelForViewElement:(id)a3
{
  return (id)objc_msgSend(a3, "firstChildForElementName:", CFSTR("subtitle"));
}

+ (id)_textLabelForViewElement:(id)a3
{
  return (id)objc_msgSend(a3, "firstChildForElementName:", CFSTR("text"));
}

+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SKUIFontPreferredFontForTextStyle(1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SKUIFontPreferredFontForTextStyle(21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SKUIAttributedStringView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (SKUIAttributedStringView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
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

@end
