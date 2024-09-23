@implementation SKUIModalSourceViewProvider

- (id)animationView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIModalSourceViewProvider animationView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIModalSourceViewProvider delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "animationViewForModalSourceViewProvider:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)hideOriginalSourceView
{
  OUTLINED_FUNCTION_1();
}

- (void)setOriginalSourceView:(id)a3
{
  UIView *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIModalSourceViewProvider setOriginalSourceView:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_originalSourceView != v5)
  {
    objc_storeStrong((id *)&self->_originalSourceView, a3);
    -[UIView setHidden:](self->_originalSourceView, "setHidden:", self->_hideOriginalSourceView);
  }

}

- (void)showOriginalSourceView
{
  OUTLINED_FUNCTION_1();
}

- (SKUIModalSourceViewProviderDelegate)delegate
{
  return (SKUIModalSourceViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)originalSourceView
{
  return self->_originalSourceView;
}

- (UIBarButtonItem)sourceButtonBarItem
{
  return self->_sourceButtonBarItem;
}

- (void)setSourceButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceButtonBarItem, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sourceButtonBarItem, 0);
  objc_storeStrong((id *)&self->_originalSourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)animationView
{
  OUTLINED_FUNCTION_1();
}

- (void)setOriginalSourceView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
