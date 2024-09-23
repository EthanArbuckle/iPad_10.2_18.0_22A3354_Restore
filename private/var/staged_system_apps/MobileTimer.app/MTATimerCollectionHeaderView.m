@implementation MTATimerCollectionHeaderView

- (MTATimerCollectionHeaderView)initWithFrame:(CGRect)a3
{
  MTATimerCollectionHeaderView *v3;
  MTATimerCollectionHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerCollectionHeaderView;
  v3 = -[MTATimerCollectionHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTATimerCollectionHeaderView setupHeaderTitle](v3, "setupHeaderTitle");
    -[MTATimerCollectionHeaderView setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupHeaderTitle
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_opt_new(UILabel);
  -[MTATimerCollectionHeaderView setHeaderTitle:](self, "setHeaderTitle:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 18.0, UIFontWeightMedium));
  objc_msgSend(v4, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v6, "setTextColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  -[MTATimerCollectionHeaderView addSubview:](self, "addSubview:", v9);

}

- (void)setupConstraints
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
  NSMutableArray *v15;

  v15 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0));
  -[NSMutableArray addObject:](v15, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -16.0));
  -[NSMutableArray addObject:](v15, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView headerTitle](self, "headerTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionHeaderView bottomAnchor](self, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -16.0));
  -[NSMutableArray addObject:](v15, "addObject:", v14);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);
}

- (UILabel)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
