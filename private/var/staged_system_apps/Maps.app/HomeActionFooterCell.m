@implementation HomeActionFooterCell

- (HomeActionFooterCell)initWithFrame:(CGRect)a3
{
  HomeActionFooterCell *v3;
  HomeActionFooterCell *v4;
  void *v5;
  HomeActionFooterContentView *v6;
  HomeActionFooterContentView *footerView;
  void *v8;
  id v9;
  HomeActionFooterContentView *v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HomeActionFooterCell;
  v3 = -[HomeActionFooterCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HomeActionFooterCell _mapsui_resetLayoutMargins](v3, "_mapsui_resetLayoutMargins");
    -[HomeActionFooterCell setEdgesPreservingSuperviewLayoutMargins:](v4, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterCell contentView](v4, "contentView"));
    objc_msgSend(v5, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);

    v6 = -[HomeActionFooterContentView initWithFrame:]([HomeActionFooterContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    footerView = v4->_footerView;
    v4->_footerView = v6;

    -[HomeActionFooterContentView setPreservesSuperviewLayoutMargins:](v4->_footerView, "setPreservesSuperviewLayoutMargins:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterCell contentView](v4, "contentView"));
    objc_msgSend(v8, "addSubview:", v4->_footerView);

    v9 = objc_alloc((Class)MUEdgeLayout);
    v10 = v4->_footerView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterCell contentView](v4, "contentView"));
    v12 = objc_msgSend(v9, "initWithItem:container:", v10, v11);

    objc_msgSend(v12, "activate");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeActionFooterCell;
  -[HomeActionFooterCell prepareForReuse](&v3, "prepareForReuse");
  -[HomeActionFooterContentView rebuildContentIfNeeded](self->_footerView, "rebuildContentIfNeeded");
}

- (HomeActionFooterViewModel)viewModel
{
  return -[HomeActionFooterContentView viewModel](self->_footerView, "viewModel");
}

- (void)setViewModel:(id)a3
{
  -[HomeActionFooterContentView setViewModel:](self->_footerView, "setViewModel:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
