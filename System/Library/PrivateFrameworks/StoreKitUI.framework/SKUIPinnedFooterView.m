@implementation SKUIPinnedFooterView

- (SKUIPinnedFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIPinnedFooterView *v8;
  SKUIPinnedFooterView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPinnedFooterView initWithFrame:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIPinnedFooterView;
  v8 = -[SKUIPinnedFooterView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
    -[SKUIPinnedFooterView _initializeTextView](v8, "_initializeTextView");
  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  -[SKUIPinnedFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SKUIPinnedFooterView horizontalPadding](self, "horizontalPadding");
  v8 = v4 + v7 * -2.0;
  -[SKUIPinnedFooterView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  v11 = v10;
  v13 = v12;

  -[SKUIPinnedFooterView horizontalPadding](self, "horizontalPadding");
  v15 = v14;
  -[SKUIPinnedFooterView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v15, v6 + -10.0 - v13, v11, v13);

  v17.receiver = self;
  v17.super_class = (Class)SKUIPinnedFooterView;
  -[SKUIPinnedFooterView layoutSubviews](&v17, sel_layoutSubviews);
}

- (void)setAttributedText:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v6 = (NSAttributedString *)a3;
  if (self->_attributedText != v6)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    -[SKUIPinnedFooterView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v6);

    -[SKUIPinnedFooterView _configureTextViewTextStyling](self, "_configureTextViewTextStyling");
  }

}

- (void)_configureTextViewTextStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SKUIPinnedFooterView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  -[SKUIPinnedFooterView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  -[SKUIPinnedFooterView textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)_initializeTextView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[SKUIPinnedFooterView setTextView:](self, "setTextView:", v3);

  -[SKUIPinnedFooterView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataDetectorTypes:", 2);

  -[SKUIPinnedFooterView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[SKUIPinnedFooterView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditable:", 0);

  -[SKUIPinnedFooterView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  -[SKUIPinnedFooterView _configureTextViewTextStyling](self, "_configureTextViewTextStyling");
  -[SKUIPinnedFooterView contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIPinnedFooterView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPinnedFooterView initWithFrame:]";
}

@end
