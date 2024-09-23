@implementation SKUIProductPageTableView

- (void)setProductPageHeaderView:(id)a3
{
  UIView *v5;
  UIView **p_productPageHeaderView;
  UIView *productPageHeaderView;

  v5 = (UIView *)a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableView setProductPageHeaderView:].cold.1();
  }
  p_productPageHeaderView = &self->_productPageHeaderView;
  productPageHeaderView = self->_productPageHeaderView;
  if (productPageHeaderView != v5)
  {
    if (-[UIView isDescendantOfView:](productPageHeaderView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_productPageHeaderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_productPageHeaderView, a3);
    if (*p_productPageHeaderView)
      -[SKUIProductPageTableView addSubview:](self, "addSubview:");
  }

}

- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4
{
  _BOOL8 v4;
  UIView *v6;
  UIView *productPageHeaderView;
  BOOL v8;
  objc_super v9;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SKUIProductPageTableView;
  v6 = (UIView *)a3;
  -[SKUIProductPageTableView _addContentSubview:atBack:](&v10, sel__addContentSubview_atBack_, v6, v4);
  productPageHeaderView = self->_productPageHeaderView;

  if (productPageHeaderView)
    v8 = productPageHeaderView == v6;
  else
    v8 = 1;
  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIProductPageTableView;
    -[SKUIProductPageTableView _addContentSubview:atBack:](&v9, sel__addContentSubview_atBack_, productPageHeaderView, 0);
  }
}

- (UIView)productPageHeaderView
{
  return self->_productPageHeaderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productPageHeaderView, 0);
}

- (void)setProductPageHeaderView:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageTableView setProductPageHeaderView:]";
}

@end
