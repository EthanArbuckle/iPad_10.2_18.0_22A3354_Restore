@implementation NavSignCollectionViewCell

- (NavSignCollectionViewCell)initWithFrame:(CGRect)a3
{
  NavSignCollectionViewCell *v3;
  NavSignCollectionViewCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NavManeuverSignView *v9;
  NavManeuverSignView *navSignView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NavSignCollectionViewCell;
  v3 = -[NavSignCollectionViewCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSignCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("NavSignCollectionViewCellContent"));

    v9 = -[NavSignView initWithFrame:]([NavManeuverSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    navSignView = v4->_navSignView;
    v4->_navSignView = v9;

    -[NavManeuverSignView setTranslatesAutoresizingMaskIntoConstraints:](v4->_navSignView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v11, "addSubview:", v4->_navSignView);

    -[NavSignCollectionViewCell _configureConstraints](v4, "_configureConstraints");
  }
  return v4;
}

- (void)_configureConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v20[4];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView leadingAnchor](self->_navSignView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v20[0] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView trailingAnchor](self->_navSignView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView topAnchor](self->_navSignView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView bottomAnchor](self->_navSignView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignCollectionViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v10));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavSignCollectionViewCell;
  -[NavSignCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[NavManeuverSignView clearContent](self->_navSignView, "clearContent");
}

- (NavManeuverSignView)navSignView
{
  return self->_navSignView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navSignView, 0);
}

@end
