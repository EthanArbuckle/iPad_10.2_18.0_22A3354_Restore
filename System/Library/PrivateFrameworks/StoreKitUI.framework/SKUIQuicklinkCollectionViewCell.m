@implementation SKUIQuicklinkCollectionViewCell

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_linkButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIQuicklinkCollectionViewCell;
  -[SKUIQuicklinkCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (void)configureForLink:(id)a3
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
  void *v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIQuicklinkCollectionViewCell configureForLink:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    -[SKUIQuicklinkCollectionViewCell _linkButton](self, "_linkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 0);
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v15, 0);

    -[SKUIQuicklinkCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIButton setHidden:](self->_linkButton, "setHidden:", 1);
  }

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
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIQuicklinkCollectionViewCell setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "secondaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v4, "primaryTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SKUIQuicklinkCollectionViewCell _linkButton](self, "_linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v13);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  UIButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIQuicklinkCollectionViewCell;
  -[SKUIQuicklinkCollectionViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    v6 = self->_linkButton;

    v5 = v6;
  }
  return v5;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_linkButtonAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  SKUICollectionViewForView(self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "indexPathForCell:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didSelectItemAtIndexPath:", v6, v5);

  }
}

- (id)_linkButton
{
  UIButton *linkButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;

  linkButton = self->_linkButton;
  if (!linkButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_linkButton;
    self->_linkButton = v4;

    -[UIButton addTarget:action:forControlEvents:](self->_linkButton, "addTarget:action:forControlEvents:", self, sel__linkButtonAction_, 64);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[SKUIQuicklinkCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_linkButton);

    linkButton = self->_linkButton;
  }
  return linkButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
}

- (void)configureForLink:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
