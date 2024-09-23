@implementation MailActionVerticalGroupedCell

+ (id)reusableIdentifier
{
  return CFSTR("MailActionVerticalGroupedCellIdentifier");
}

- (MailActionVerticalGroupedCell)initWithFrame:(CGRect)a3
{
  MailActionVerticalGroupedCell *v3;
  MailActionVerticalGroupedCell *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  __n128 v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MailActionVerticalGroupedCell;
  v3 = -[MailActionCell initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionVerticalGroupedCell contentView](v3, "contentView"));
    v6 = objc_alloc_init((Class)UIView);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[MailActionVerticalGroupedCell setSeparatorView:](v4, "setSeparatorView:", v6);
    objc_msgSend(v5, "addSubview:", v6);
    v8 = objc_opt_new(NSMutableArray);
    v9.n128_u64[0] = 1.0;
    v10 = UIRoundToViewScale(v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v10));
    -[NSMutableArray addObject:](v8, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 8.0));
    -[NSMutableArray addObject:](v8, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, -8.0));
    -[NSMutableArray addObject:](v8, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", v10));
    -[NSMutableArray addObject:](v8, "addObject:", v23);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
    -[MailActionVerticalGroupedCell setVerticalGroupedCellType:](v4, "setVerticalGroupedCellType:", 0);

  }
  return v4;
}

- (void)setVerticalGroupedCellType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  self->_verticalGroupedCellType = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionVerticalGroupedCell contentView](self, "contentView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionVerticalGroupedCell separatorView](self, "separatorView"));
  v6 = v5;
  switch(self->_verticalGroupedCellType)
  {
    case 0uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionVerticalGroupedCell separatorView](self, "separatorView"));
      objc_msgSend(v7, "setAlpha:", 1.0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      objc_msgSend(v8, "setCornerRadius:", 10.0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      objc_msgSend(v9, "setMaskedCorners:", 15);

      objc_msgSend(v6, "setHidden:", 1);
      break;
    case 1uLL:
      objc_msgSend(v5, "setHidden:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      objc_msgSend(v10, "setMaskedCorners:", 3);

      break;
    case 2uLL:
      objc_msgSend(v5, "setHidden:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      v12 = 0.0;
      objc_msgSend(v11, "setMaskedCorners:", 12);
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v5, "setHidden:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      v12 = 1.0;
      objc_msgSend(v11, "setMaskedCorners:", 0);
LABEL_6:

      objc_msgSend(v6, "setAlpha:", v12);
      break;
    default:
      break;
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailActionVerticalGroupedCell;
  -[MailActionCell prepareForReuse](&v3, "prepareForReuse");
  -[MailActionVerticalGroupedCell setVerticalGroupedCellType:](self, "setVerticalGroupedCellType:", 0);
}

- (unint64_t)verticalGroupedCellType
{
  return self->_verticalGroupedCellType;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
