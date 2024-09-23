@implementation SKUITableViewSection

- (id)footerViewForTableView:(id)a3
{
  return 0;
}

- (id)headerViewForTableView:(id)a3
{
  return 0;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 0.0;
}

- (int64_t)numberOfRowsInSection
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITableViewSection numberOfRowsInSection].cold.1();
  }
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (SKUITableViewSectionDelegate)delegate
{
  return (SKUITableViewSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hidesHeaderView
{
  return self->_hidesHeaderView;
}

- (void)setHidesHeaderView:(BOOL)a3
{
  self->_hidesHeaderView = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)numberOfRowsInSection
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITableViewSection numberOfRowsInSection]";
}

@end
