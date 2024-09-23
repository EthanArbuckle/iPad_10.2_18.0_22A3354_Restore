@implementation MacRAPHeaderView

- (void)setTitle:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_headerViewLabel, "setText:", v5);
  }

}

- (MacRAPHeaderView)init
{
  MacRAPHeaderView *v2;
  UIView *v3;
  UIView *contentView;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *headerViewLabel;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *bottomConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[4];
  _QWORD v39[4];

  v37.receiver = self;
  v37.super_class = (Class)MacRAPHeaderView;
  v2 = -[MacRAPHeaderView init](&v37, "init");
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    contentView = v2->_contentView;
    v2->_contentView = v3;
    v5 = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MacRAPHeaderView addSubview:](v2, "addSubview:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPHeaderView leadingAnchor](v2, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v33));
    v39[0] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPHeaderView trailingAnchor](v2, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v39[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPHeaderView topAnchor](v2, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    v39[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPHeaderView bottomAnchor](v2, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v39[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = (UILabel *)objc_alloc_init((Class)UILabel);
    headerViewLabel = v2->_headerViewLabel;
    v2->_headerViewLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_headerViewLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
    -[UILabel setFont:](v2->_headerViewLabel, "setFont:", v16);

    -[UIView addSubview:](v5, "addSubview:", v2->_headerViewLabel);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v2->_headerViewLabel, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0));
    bottomConstraint = v2->_bottomConstraint;
    v2->_bottomConstraint = (NSLayoutConstraint *)v19;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v2->_headerViewLabel, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v34, 16.0));
    v38[0] = v32;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v2->_headerViewLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -16.0));
    v38[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v2->_headerViewLabel, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 24.0));
    v38[2] = v26;
    v38[3] = v2->_bottomConstraint;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  }
  return v2;
}

- (MacRAPHeaderView)initWithSearchBar:(id)a3
{
  id v4;
  MacRAPHeaderView *v5;
  MacRAPHeaderView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *bottomConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v4 = a3;
  v5 = -[MacRAPHeaderView init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[UIView addSubview:](v5->_contentView, "addSubview:", v4);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NSLayoutConstraint setActive:](v6->_bottomConstraint, "setActive:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v6->_contentView, "bottomAnchor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -10.0));
    bottomConstraint = v6->_bottomConstraint;
    v6->_bottomConstraint = (NSLayoutConstraint *)v9;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v6->_contentView, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 16.0));
    v24[0] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v6->_contentView, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v11, -16.0));
    v24[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v6->_headerViewLabel, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 24.0));
    v24[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 35.0));
    v24[3] = v17;
    v24[4] = v6->_bottomConstraint;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerViewLabel, 0);
}

@end
