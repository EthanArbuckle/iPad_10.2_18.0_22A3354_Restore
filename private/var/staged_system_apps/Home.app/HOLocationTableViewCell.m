@implementation HOLocationTableViewCell

- (HOLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HOLocationTableViewCell *v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  v25.super_class = (Class)HOLocationTableViewCell;
  v4 = -[HOLocationTableViewCell initWithStyle:reuseIdentifier:](&v25, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "addSubview:", v4->_titleLabel);

    v4->_disabled = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](v4, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToConstant:", 44.0));

    LODWORD(v13) = 1144750080;
    objc_msgSend(v12, "setPriority:", v13);
    objc_msgSend(v9, "addObject:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_titleLabel, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](v4, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutMarginsGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v17));
    objc_msgSend(v9, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v4->_titleLabel, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](v4, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layoutMarginsGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v22));
    objc_msgSend(v9, "addObject:", v23);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HOLocationTableViewCell;
  -[HOLocationTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[HOLocationTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[HOLocationTableViewCell setShowLocationIcon:](self, "setShowLocationIcon:", 0);
  -[HOLocationTableViewCell setDisabled:](self, "setDisabled:", 0);
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setDisabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_disabled = a3;
  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (id)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTextColor:", v6);

}

- (BOOL)showLocationIcon
{
  return 1;
}

- (void)setShowLocationIcon:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v7 = objc_alloc((Class)UIImageView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage hu_locationArrowTemplate](UIImage, "hu_locationArrowTemplate"));
      v9 = objc_msgSend(v7, "initWithImage:", v8);
      -[HOLocationTableViewCell setLocationIcon:](self, "setLocationIcon:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
      objc_msgSend(v11, "setTintColor:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    objc_msgSend(v13, "addSubview:", v14);

    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 20.0));
    objc_msgSend(v28, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    objc_msgSend(v28, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](self, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    objc_msgSend(v28, "addObject:", v27);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);
    -[HOLocationTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[HOLocationTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell horizontalConstraints](self, "horizontalConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutMarginsGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v9));
  objc_msgSend(v3, "addObject:", v10);

  v11 = objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
  if (v11
    && (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](self, "contentView")),
        v15 = objc_msgSend(v13, "isDescendantOfView:", v14),
        v14,
        v13,
        v12,
        v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 20.0));
    objc_msgSend(v3, "addObject:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell locationIcon](self, "locationIcon"));
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell titleLabel](self, "titleLabel"));
  }
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layoutMarginsGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v26));
  objc_msgSend(v3, "addObject:", v27);

  -[HOLocationTableViewCell setHorizontalConstraints:](self, "setHorizontalConstraints:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationTableViewCell horizontalConstraints](self, "horizontalConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  v29.receiver = self;
  v29.super_class = (Class)HOLocationTableViewCell;
  -[HOLocationTableViewCell updateConstraints](&v29, "updateConstraints");

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)locationIcon
{
  return self->_locationIcon;
}

- (void)setLocationIcon:(id)a3
{
  objc_storeStrong((id *)&self->_locationIcon, a3);
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_locationIcon, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
