@implementation PKActivityTableCell

- (PKActivityTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKActivityTableCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *activityIndicator;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKActivityTableCell;
  v4 = -[PKActivityTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView sizeToFit](v4->_activityIndicator, "sizeToFit");
    -[PKActivityTableCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_activityIndicator);

  }
  return v4;
}

- (void)layoutSubviews
{
  char v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)PKActivityTableCell;
  -[PKActivityTableCell layoutSubviews](&v13, sel_layoutSubviews);
  v3 = -[PKActivityTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIActivityIndicatorView frame](self->_activityIndicator, "frame");
  -[PKActivityTableCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  UIRectCenteredYInRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;

  if (-[PKActivityTableCell accessoryType](self, "accessoryType"))
    v11 = 0.0;
  else
    v11 = 15.0;
  if ((v3 & 1) == 0)
  {
    -[PKActivityTableCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v11 = CGRectGetMaxX(v14) - v8 - v11;

  }
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v11, v6, v8, v10);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

- (id)pk_childrenForAppearance
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKActivityTableCell;
  -[UITableViewCell pk_childrenForAppearance](&v7, sel_pk_childrenForAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKActivityTableCell activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
