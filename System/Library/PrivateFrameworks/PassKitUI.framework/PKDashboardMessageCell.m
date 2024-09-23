@implementation PKDashboardMessageCell

- (PKDashboardMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKDashboardMessageCell *v4;
  PKDashboardMessageView *v5;
  void *v6;
  uint64_t v7;
  PKDashboardMessageView *dashboardMessageView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKDashboardMessageCell;
  v4 = -[PKDashboardMessageCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [PKDashboardMessageView alloc];
    -[PKDashboardMessageCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[PKDashboardMessageView initWithFrame:](v5, "initWithFrame:");
    dashboardMessageView = v4->_dashboardMessageView;
    v4->_dashboardMessageView = (PKDashboardMessageView *)v7;

    -[PKDashboardMessageCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_dashboardMessageView);

    -[PKDashboardMessageCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 14.0, 0.0, 0.0);
  }
  return v4;
}

- (void)layoutSubviews
{
  PKDashboardMessageView *dashboardMessageView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardMessageCell;
  -[PKDashboardMessageCell layoutSubviews](&v5, sel_layoutSubviews);
  dashboardMessageView = self->_dashboardMessageView;
  -[PKDashboardMessageCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKDashboardMessageView setFrame:](dashboardMessageView, "setFrame:");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageCell;
  -[PKDashboardMessageCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKDashboardMessageView prepareForReuse](self->_dashboardMessageView, "prepareForReuse");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardMessageView sizeThatFits:](self->_dashboardMessageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKDashboardMessageView)dashboardMessageView
{
  return self->_dashboardMessageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardMessageView, 0);
}

@end
