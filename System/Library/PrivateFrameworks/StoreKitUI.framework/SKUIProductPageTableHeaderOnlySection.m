@implementation SKUIProductPageTableHeaderOnlySection

- (id)headerViewForTableView:(id)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableHeaderOnlySection headerViewForTableView:].cold.1();
  }
  -[SKUIProductPageTableHeaderOnlySection headerView](self, "headerView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)headerViewForTableView:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageTableHeaderOnlySection headerViewForTableView:]";
}

@end
