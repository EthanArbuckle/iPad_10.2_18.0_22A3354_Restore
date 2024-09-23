@implementation SKUIEditorialCellLayout

- (void)_initContentInset
{
  *(_OWORD *)&self->_contentInset.top = xmmword_1BBED14F0;
  *(_OWORD *)&self->_contentInset.bottom = xmmword_1BBED14F0;
}

- (SKUIEditorialCellLayout)initWithCollectionViewCell:(id)a3
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
  SKUIEditorialCellLayout *v13;
  SKUIEditorialCellLayout *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialCellLayout initWithCollectionViewCell:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIEditorialCellLayout;
  v13 = -[SKUICellLayout initWithCollectionViewCell:](&v16, sel_initWithCollectionViewCell_, v4);
  v14 = v13;
  if (v13)
    -[SKUIEditorialCellLayout _initContentInset](v13, "_initContentInset");

  return v14;
}

- (SKUIEditorialCellLayout)initWithParentView:(id)a3
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
  SKUIEditorialCellLayout *v13;
  SKUIEditorialCellLayout *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialCellLayout initWithParentView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIEditorialCellLayout;
  v13 = -[SKUICellLayout initWithParentView:](&v16, sel_initWithParentView_, v4);
  v14 = v13;
  if (v13)
    -[SKUIEditorialCellLayout _initContentInset](v13, "_initContentInset");

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIEditorialLinkView setDelegate:](self->_linkView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIEditorialCellLayout;
  -[SKUIEditorialCellLayout dealloc](&v3, sel_dealloc);
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4 expanded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "bodyTextLayoutForOrientation:", a4);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "linkLayoutForOrientation:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleTextLayoutForOrientation:", a4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v9 | v11)
  {
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "editorialComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "editorialStyle");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }

    self->_linkSpacing = *((float *)&v18 + 1);
    -[SKUIEditorialCellLayout _textBoxView](self, "_textBoxView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "titleInsets");
    objc_msgSend(v14, "setTitleInsets:");
    objc_msgSend(v14, "setFixedWidthTextFrame:", objc_msgSend((id)v9, "textFrame"));
    objc_msgSend(v14, "setFixedWidthTitleTextFrame:", objc_msgSend((id)v11, "textFrame"));
    if (v10)
    {
      -[SKUIEditorialCellLayout _linkView](self, "_linkView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHorizontalAlignment:", (_QWORD)v17);
      objc_msgSend(v15, "setLinkLayout:", v10);

    }
    else
    {
      -[SKUIEditorialLinkView setLinkLayout:](self->_linkView, "setLinkLayout:", 0);
    }
    objc_msgSend(v8, "layoutHeightForOrientation:expanded:", a4, v5, v17, v18, 0);
    self->_totalHeight = v16;

  }
  else
  {
    -[SKUIEditorialLinkView setLinkLayout:](self->_linkView, "setLinkLayout:", 0);
    -[SKUITextBoxView reset](self->_textBoxView, "reset");
  }
  -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double totalHeight;
  double left;
  double top;
  void *v11;
  SKUIEditorialLinkView *linkView;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SKUIEditorialCellLayout;
  -[SKUICellLayout layoutSubviews](&v15, sel_layoutSubviews);
  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = v5 - self->_contentInset.left - self->_contentInset.right;
  -[SKUIEditorialCellLayout _textBoxView](self, "_textBoxView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  totalHeight = self->_totalHeight;
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  -[SKUIEditorialLinkView linkLayout](self->_linkView, "linkLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  linkView = self->_linkView;
  if (v11)
  {
    -[SKUIEditorialLinkView sizeThatFits:](linkView, "sizeThatFits:", v6, 1.79769313e308);
    v14 = v13;
    -[SKUIEditorialLinkView setFrame:](self->_linkView, "setFrame:", self->_contentInset.left, self->_contentInset.top + self->_totalHeight - v13, v6, v13);
    -[SKUIEditorialLinkView setHidden:](self->_linkView, "setHidden:", 0);
    totalHeight = totalHeight - (v14 + self->_linkSpacing);
  }
  else
  {
    -[SKUIEditorialLinkView setHidden:](linkView, "setHidden:", 1);
  }
  objc_msgSend(v7, "setFrame:", left, top, v6, totalHeight);

}

- (void)setBackgroundColor:(id)a3
{
  SKUIEditorialLinkView *linkView;
  id v5;
  objc_super v6;

  linkView = self->_linkView;
  v5 = a3;
  -[SKUIEditorialLinkView setBackgroundColor:](linkView, "setBackgroundColor:", v5);
  -[SKUITextBoxView setBackgroundColor:](self->_textBoxView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialCellLayout;
  -[SKUICellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SKUIEditorialCellLayout _linkView](self, "_linkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColoringWithColorScheme:", v4);

  -[SKUIEditorialCellLayout _textBoxView](self, "_textBoxView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorScheme:", v4);

}

- (void)editorialLinkView:(id)a3 didSelectLink:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SKUICellLayout parentCellView](self, "parentCellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SKUICollectionViewForView(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "collectionView:editorialView:didSelectLink:", v6, v5, v8);

}

- (id)_linkView
{
  SKUIEditorialLinkView *linkView;
  void *v4;
  SKUIEditorialLinkView *v5;
  SKUIEditorialLinkView *v6;
  SKUIEditorialLinkView *v7;
  void *v8;
  void *v9;

  linkView = self->_linkView;
  if (!linkView)
  {
    -[SKUICellLayout contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(SKUIEditorialLinkView);
    v6 = self->_linkView;
    self->_linkView = v5;

    v7 = self->_linkView;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditorialLinkView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[SKUIEditorialLinkView setDelegate:](self->_linkView, "setDelegate:", self);
    objc_msgSend(v4, "addSubview:", self->_linkView);

    linkView = self->_linkView;
  }
  return linkView;
}

- (id)_textBoxView
{
  SKUITextBoxView *textBoxView;
  void *v4;
  SKUITextBoxView *v5;
  SKUITextBoxView *v6;
  SKUITextBoxView *v7;
  SKUITextBoxView *v8;
  void *v9;
  void *v10;

  textBoxView = self->_textBoxView;
  if (!textBoxView)
  {
    -[SKUICellLayout contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SKUITextBoxView alloc];
    objc_msgSend(v4, "bounds");
    v6 = -[SKUITextBoxView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_textBoxView;
    self->_textBoxView = v6;

    v8 = self->_textBoxView;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITextBoxView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[SKUITextBoxView setContentInsets:](self->_textBoxView, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[SKUITextBoxView setEnabled:](self->_textBoxView, "setEnabled:", 0);
    objc_msgSend(v4, "addSubview:", self->_textBoxView);

    textBoxView = self->_textBoxView;
  }
  return textBoxView;
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
}

- (void)initWithCollectionViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithParentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
