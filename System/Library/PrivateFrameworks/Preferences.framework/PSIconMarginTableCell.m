@implementation PSIconMarginTableCell

- (double)iconMargin
{
  return 58.0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PSIconMarginTableCell;
  -[PSTableCell layoutSubviews](&v18, sel_layoutSubviews);
  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSTableCell titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    if ((-[PSIconMarginTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      -[PSIconMarginTableCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12 - v8;
      -[PSIconMarginTableCell iconMargin](self, "iconMargin");
      v15 = v13 - v14;

    }
    else
    {
      -[PSIconMarginTableCell iconMargin](self, "iconMargin");
      v15 = v16;
    }
    -[PSTableCell titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v15, v6, v8, v10);

  }
}

@end
