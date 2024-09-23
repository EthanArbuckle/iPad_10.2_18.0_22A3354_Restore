@implementation SKUIDownloadsTableViewCell

- (SKUIDownloadsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIDownloadsTableViewCell *v7;
  SKUIDownloadsCellView *v8;
  SKUIDownloadsCellView *cellView;
  void *v10;
  objc_super v12;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDownloadsTableViewCell;
  v7 = -[SKUIDownloadsTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc_init(SKUIDownloadsCellView);
    cellView = v7->_cellView;
    v7->_cellView = v8;

    -[SKUIDownloadsTableViewCell contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_cellView);

  }
  return v7;
}

- (void)layoutSubviews
{
  SKUIDownloadsCellView *cellView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIDownloadsTableViewCell;
  -[SKUIDownloadsTableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  cellView = self->_cellView;
  -[SKUIDownloadsTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIDownloadsCellView setFrame:](cellView, "setFrame:");

}

- (SKUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDownloadsTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
