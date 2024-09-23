@implementation SKUIBrowseHeaderCollectionViewCell

- (SKUIBrowseHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIBrowseHeaderCollectionViewCell *v8;
  SKUIBrowseHeaderCollectionViewCell *v9;
  void *v10;
  void *v11;
  SKUIGroupedHeaderView *v12;
  SKUIGroupedHeaderView *headerView;
  SKUIGroupedHeaderView *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseHeaderCollectionViewCell initWithFrame:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIBrowseHeaderCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIBrowseHeaderCollectionViewCell contentView](v8, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.94, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    -[SKUIBrowseHeaderCollectionViewCell setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    v12 = objc_alloc_init(SKUIGroupedHeaderView);
    headerView = v9->_headerView;
    v9->_headerView = v12;

    -[SKUIGroupedHeaderView setAutoresizingMask:](v9->_headerView, "setAutoresizingMask:", 18);
    v14 = v9->_headerView;
    -[SKUIBrowseHeaderCollectionViewCell contentView](v9, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    -[SKUIGroupedHeaderView setFrame:](v14, "setFrame:");

    -[SKUIBrowseHeaderCollectionViewCell contentView](v9, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v9->_headerView);

  }
  return v9;
}

- (NSString)title
{
  return -[SKUIGroupedHeaderView title](self->_headerView, "title");
}

- (void)setTitle:(id)a3
{
  -[SKUIGroupedHeaderView setTitle:](self->_headerView, "setTitle:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrowseHeaderCollectionViewCell initWithFrame:]";
}

@end
