@implementation PKDashboardMessageActionCell

- (PKDashboardMessageActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKDashboardMessageActionCell *v4;
  PKDashboardMessageActionCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardMessageActionCell;
  v4 = -[PKDashboardMessageActionCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[PKDashboardMessageActionCell _commonInit](v4, "_commonInit");
  return v5;
}

- (PKDashboardMessageActionCell)initWithReuseIdentifier:(id)a3
{
  return -[PKDashboardMessageActionCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, a3);
}

- (PKDashboardMessageActionCell)initWithSize:(CGSize)a3
{
  return -[PKDashboardMessageActionCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (void)_commonInit
{
  PKDashboardMessageActionView *v3;
  void *v4;
  PKDashboardMessageActionView *v5;
  PKDashboardMessageActionView *actionView;
  id v7;

  v3 = [PKDashboardMessageActionView alloc];
  -[PKDashboardMessageActionCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[PKDashboardMessageActionView initWithFrame:](v3, "initWithFrame:");
  actionView = self->_actionView;
  self->_actionView = v5;

  -[PKDashboardMessageActionCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_actionView);

}

- (void)layoutSubviews
{
  PKDashboardMessageActionView *actionView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardMessageActionCell;
  -[PKDashboardMessageActionCell layoutSubviews](&v5, sel_layoutSubviews);
  actionView = self->_actionView;
  -[PKDashboardMessageActionCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKDashboardMessageActionView setFrame:](actionView, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardMessageActionView sizeThatFits:](self->_actionView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageActionCell;
  -[PKDashboardMessageActionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKDashboardMessageActionView prepareForReuse](self->_actionView, "prepareForReuse");
}

- (PKDashboardMessageActionView)actionView
{
  return self->_actionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionView, 0);
}

@end
