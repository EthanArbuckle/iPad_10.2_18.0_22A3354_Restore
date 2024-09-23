@implementation SKUICellLayout

- (SKUICellLayout)initWithCollectionViewCell:(id)a3
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
  SKUICellLayout *v13;
  SKUICellLayout *v14;
  void *v15;
  id WeakRetained;
  objc_super v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICellLayout initWithCollectionViewCell:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICellLayout;
  v13 = -[SKUICellLayout init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    objc_msgSend(v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_contentView, v15);

    WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v14;
}

- (SKUICellLayout)initWithParentView:(id)a3
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
  SKUICellLayout *v13;
  SKUICellLayout *v14;
  id WeakRetained;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICellLayout initWithParentView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICellLayout;
  v13 = -[SKUICellLayout init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    objc_storeWeak((id *)&v14->_contentView, v4);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v14;
}

- (SKUICellLayout)initWithTableViewCell:(id)a3
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
  SKUICellLayout *v13;
  SKUICellLayout *v14;
  void *v15;
  id WeakRetained;
  objc_super v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICellLayout initWithTableViewCell:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICellLayout;
  v13 = -[SKUICellLayout init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    objc_msgSend(v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_contentView, v15);

    WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v14;
}

- (void)setNeedsLayout
{
  _BOOL4 parentWantsCellNeedsLayout;
  id WeakRetained;
  id v4;

  parentWantsCellNeedsLayout = self->_parentWantsCellNeedsLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v4 = WeakRetained;
  if (parentWantsCellNeedsLayout)
    objc_msgSend(WeakRetained, "setCellLayoutNeedsLayout");
  else
    objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (UIView)parentCellView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_cell);
}

- (void)initWithCollectionViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithTableViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
