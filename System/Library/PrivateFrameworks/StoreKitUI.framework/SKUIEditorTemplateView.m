@implementation SKUIEditorTemplateView

- (SKUIEditorTemplateView)initWithFrame:(CGRect)a3
{
  SKUIEditorTemplateView *v3;
  SKUIEditorTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorTemplateView;
  v3 = -[SKUIViewReuseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SKUIEditorTemplateView _reloadSubviews](v3, "_reloadSubviews");
  return v4;
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
        +[SKUIEditorTemplateView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIEditorTemplateView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
      +[SKUIEditorTemplateView requestLayoutForViewElement:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIEditorTemplateView sizeThatFitsWidth:viewElement:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UITextView *textView;
  void *v16;
  void *v17;
  void *v18;
  UITextView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIEditorTemplateView reloadWithViewElement:width:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  textView = self->_textView;
  -[SKUIEditorTemplateView _textFromViewElement:](self, "_textFromViewElement:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](textView, "setText:", v16);

  objc_msgSend(v6, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_textView;
  if (v18)
  {
    -[UITextView setFont:](self->_textView, "setFont:", v18);
  }
  else
  {
    SKUIFontPreferredFontForTextStyle(1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v19, "setFont:", v20);

  }
  objc_msgSend(v17, "ikColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "color");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_textColor, v23);
  if (!v22)

  -[UITextView setTextColor:](self->_textView, "setTextColor:", self->_textColor);
  v36 = 0;
  objc_msgSend(v6, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = SKUIViewElementPaddingForStyle(v24, &v36);
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = 15.0;
  v33 = 18.0;
  if (v36)
    v34 = v25;
  else
    v34 = 18.0;
  if (v36)
    v35 = v27;
  else
    v35 = 15.0;
  if (v36)
  {
    v33 = v29;
    v32 = v31;
  }
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v34, v35, v33, v32);
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

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
        -[SKUIEditorTemplateView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        -[SKUIEditorTemplateView updateWithItemState:context:animated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        -[SKUIEditorTemplateView viewForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)textViewDidChange:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  char v13;
  id v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIEditorTemplateView textViewDidChange:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "didChangeTextInEditorTemplateView:", self);

  }
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBottomInset:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorTemplateView setBottomInset:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UITextView contentInset](self->_textView, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UITextView setContentInset:](self->_textView, "setContentInset:");
  -[UITextView setScrollIndicatorInsets:](self->_textView, "setScrollIndicatorInsets:", v14, v16, a3, v18);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[SKUIEditorTemplateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)text
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
        -[SKUIEditorTemplateView text].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UITextView text](self->_textView, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_reloadSubviews
{
  id v3;
  UITextView *v4;
  UITextView *textView;
  void *v6;

  if (!self->_textView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = self->_textView;
    self->_textView = v4;

    -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
    -[UITextView setKeyboardDismissMode:](self->_textView, "setKeyboardDismissMode:", 2);
    -[UITextView setAlwaysBounceVertical:](self->_textView, "setAlwaysBounceVertical:", 1);
    -[UITextView layoutManager](self->_textView, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsNonContiguousLayout:", 0);

    -[SKUIEditorTemplateView addSubview:](self, "addSubview:", self->_textView);
  }
}

- (id)_textFromViewElement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIEditorTemplateView__textFromViewElement___block_invoke;
  v9[3] = &unk_1E73A12A8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__SKUIEditorTemplateView__textFromViewElement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (SKUIEditorTemplateViewDelegate)delegate
{
  return (SKUIEditorTemplateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
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

- (void)textViewDidChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBottomInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)text
{
  OUTLINED_FUNCTION_1();
}

@end
