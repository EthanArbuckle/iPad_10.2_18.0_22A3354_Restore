@implementation HomeActionFooterView

- (HomeActionFooterView)initWithReuseIdentifier:(id)a3
{
  HomeActionFooterView *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  HomeActionFooterContentView *v11;
  HomeActionFooterContentView *footerView;
  void *v13;
  id v14;
  HomeActionFooterContentView *v15;
  void *v16;
  id v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HomeActionFooterView;
  v3 = -[HomeActionFooterView initWithReuseIdentifier:](&v19, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[HomeActionFooterView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HomeActionFooterView setBackgroundView:](v3, "setBackgroundView:", v9);

    -[HomeActionFooterView _mapsui_resetLayoutMarginsWithPreservesSuperview:](v3, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterView contentView](v3, "contentView"));
    objc_msgSend(v10, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);

    v11 = -[HomeActionFooterContentView initWithFrame:]([HomeActionFooterContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    footerView = v3->_footerView;
    v3->_footerView = v11;

    -[HomeActionFooterContentView setPreservesSuperviewLayoutMargins:](v3->_footerView, "setPreservesSuperviewLayoutMargins:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterView contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_footerView);

    v14 = objc_alloc((Class)MUEdgeLayout);
    v15 = v3->_footerView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterView contentView](v3, "contentView"));
    v17 = objc_msgSend(v14, "initWithItem:container:", v15, v16);

    objc_msgSend(v17, "activate");
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeActionFooterView;
  -[HomeActionFooterView prepareForReuse](&v3, "prepareForReuse");
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
