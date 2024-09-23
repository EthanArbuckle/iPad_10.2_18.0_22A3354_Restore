@implementation VUIDownloadShowTableHeaderView

- (VUIDownloadShowTableHeaderView)initWithReuseIdentifier:(id)a3
{
  VUIDownloadShowTableHeaderView *v3;
  VUIDownloadShowTableHeaderView *v4;
  void *v5;
  void *v6;
  VUISeparatorView *v7;
  VUISeparatorView *separatorView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIDownloadShowTableHeaderView;
  v3 = -[VUIDownloadShowTableHeaderView initWithReuseIdentifier:](&v11, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    -[VUIDownloadShowTableHeaderView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = objc_alloc_init(VUISeparatorView);
    separatorView = v4->_separatorView;
    v4->_separatorView = v7;

    -[VUIDownloadShowTableHeaderView contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_separatorView);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableHeaderView;
  -[VUIDownloadShowTableHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[VUIDownloadShowTableHeaderView setHeaderTitle:](self, "setHeaderTitle:", 0);
  -[VUIDownloadShowTableHeaderView setButtonTitle:](self, "setButtonTitle:", 0);
  -[VUIDownloadShowTableHeaderView setTitleLabel:](self, "setTitleLabel:", 0);
  -[VUIDownloadShowTableHeaderView setHeaderButton:](self, "setHeaderButton:", 0);
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v5;
  NSString **p_headerTitle;
  VUITextLayout *v7;
  void *v8;
  const __CFString *v9;
  VUILabel *v10;
  VUILabel *titleLabel;
  void *v12;
  NSString *v13;

  v5 = (NSString *)a3;
  p_headerTitle = &self->_headerTitle;
  if (self->_headerTitle != v5)
  {
    v13 = v5;
    -[VUILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerTitle, a3);
    if (*p_headerTitle)
    {
      v7 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v7, "setTextStyle:", 20);
      -[VUITextLayout setFontWeight:](v7, "setFontWeight:", 0);
      -[VUITextLayout setNumberOfLines:](v7, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v7, "setColor:", v8);

      if (*p_headerTitle)
        v9 = (const __CFString *)*p_headerTitle;
      else
        v9 = &stru_1E9FF3598;
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v9, v7, self->_titleLabel);
      v10 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      titleLabel = self->_titleLabel;
      self->_titleLabel = v10;

      -[VUIDownloadShowTableHeaderView contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_titleLabel);

    }
    -[VUIDownloadShowTableHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (void)setButtonTitle:(id)a3
{
  NSString *v5;
  NSString **p_buttonTitle;
  NSString *v7;
  void *v8;
  UIButton *v9;
  UIButton *headerButton;
  UIButton *v11;
  void *v12;
  NSString *v13;

  v5 = (NSString *)a3;
  p_buttonTitle = &self->_buttonTitle;
  if (self->_buttonTitle != v5)
  {
    v13 = v5;
    -[UIButton removeFromSuperview](self->_headerButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_buttonTitle, a3);
    v7 = *p_buttonTitle;
    if (*p_buttonTitle)
    {
      -[VUIDownloadShowTableHeaderView headerButton](self, "headerButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadShowTableHeaderView _buttonWithString:existingButton:](self, "_buttonWithString:existingButton:", v7, v8);
      v9 = (UIButton *)objc_claimAutoreleasedReturnValue();

      -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", self, sel__selectButtonAction_, 64);
      headerButton = self->_headerButton;
      self->_headerButton = v9;
      v11 = v9;

      -[VUIDownloadShowTableHeaderView contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_headerButton);

    }
    -[VUIDownloadShowTableHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIDownloadShowTableHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadShowTableHeaderView;
  -[VUIDownloadShowTableHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[VUIDownloadShowTableHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[VUIDownloadShowTableHeaderView bounds](self, "bounds");
  -[VUIDownloadShowTableHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VUISeparatorView *separatorView;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  VUISeparatorView *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 25.0);
  v33 = v8;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;
  -[UIButton sizeThatFits:](self->_headerButton, "sizeThatFits:", width, height);
  v14 = v13;
  v16 = v15;
  -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", 10.0);
  v32 = v17;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", width);
  if (!v4)
  {
    v20 = v18;
    v21 = v19;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v18, v33, v10, v12);
    -[VUIDownloadShowTableHeaderView bounds](self, "bounds");
    -[UIButton setFrame:](self->_headerButton, "setFrame:", width - (v14 + v21), CGRectGetMidY(v35) + height * -0.5, v14, v16);
    separatorView = self->_separatorView;
    -[VUIDownloadShowTableHeaderView contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    -[VUIBaseView sizeThatFits:](separatorView, "sizeThatFits:", CGRectGetWidth(v36) - v20, 1.79769313e308);
    v25 = v24;
    v27 = v26;

    v28 = self->_separatorView;
    -[VUIDownloadShowTableHeaderView contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    -[VUISeparatorView setFrame:](v28, "setFrame:", v20, CGRectGetHeight(v37) - v27, v25, v27);

  }
  v30 = v33 + 0.0 + v12 + v32;
  v31 = width;
  result.height = v30;
  result.width = v31;
  return result;
}

- (id)_buttonWithString:(id)a3 existingButton:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleColor:forState:", v9, 0);

    objc_msgSend(v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 0, 0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(v8, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 1);

    objc_msgSend(v8, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v8, "setTitle:forState:", v5, 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_selectButtonAction:(id)a3
{
  void (**selectionHandler)(id, id);

  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)headerButton
{
  return self->_headerButton;
}

- (void)setHeaderButton:(id)a3
{
  objc_storeStrong((id *)&self->_headerButton, a3);
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
