@implementation HomeNotificationStatusView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HomeNotificationStatusView)initWithFrame:(CGRect)a3
{
  HomeNotificationStatusView *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HomeNotificationStatusView;
  v3 = -[HomeNotificationStatusView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(UILabel);
    -[HomeNotificationStatusView setStatusLabel:](v3, "setStatusLabel:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](v3, "statusLabel"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](v3, "statusLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](v3, "statusLabel"));
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](v3, "statusLabel"));
    objc_msgSend(v10, "setTextAlignment:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](v3, "statusLabel"));
    -[HomeNotificationStatusView addSubview:](v3, "addSubview:", v11);

    v12 = objc_alloc_init((Class)UIImageView);
    -[HomeNotificationStatusView setStatusAccessoryImageView:](v3, "setStatusAccessoryImageView:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](v3, "statusAccessoryImageView"));
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](v3, "statusAccessoryImageView"));
    objc_msgSend(v15, "setTintColor:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](v3, "statusAccessoryImageView"));
    -[HomeNotificationStatusView addSubview:](v3, "addSubview:", v16);

  }
  return v3;
}

- (NSString)statusText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setStatusText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (UIImage)accessoryImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](self, "statusAccessoryImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setAccessoryImage:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView accessoryImage](self, "accessoryImage"));
  v6 = v5 == 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](self, "statusAccessoryImageView"));
  objc_msgSend(v8, "setImage:", v7);

  if ((((v4 != 0) ^ v6) & 1) == 0)
    -[HomeNotificationStatusView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  objc_super v35;
  _QWORD v36[3];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstBaselineAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView topAnchor](self, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 19.0));
  v36[0] = v30;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -10.0));
  v36[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v36[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));
  v34 = objc_msgSend(v11, "mutableCopy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView accessoryImage](self, "accessoryImage"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](self, "statusAccessoryImageView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -8.0));
    v18 = v34;
    objc_msgSend(v34, "addObject:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](self, "statusAccessoryImageView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView leadingAnchor](self, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v34, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusAccessoryImageView](self, "statusAccessoryImageView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    objc_msgSend(v34, "addObject:", v27);

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView statusLabel](self, "statusLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView leadingAnchor](self, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v18 = v34;
    objc_msgSend(v34, "addObject:", v26);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView constraints](self, "constraints"));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationStatusView constraints](self, "constraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v29);

  }
  -[HomeNotificationStatusView setConstraints:](self, "setConstraints:", v18);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
  v35.receiver = self;
  v35.super_class = (Class)HomeNotificationStatusView;
  -[HomeNotificationStatusView updateConstraints](&v35, "updateConstraints");

}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UIImageView)statusAccessoryImageView
{
  return self->_statusAccessoryImageView;
}

- (void)setStatusAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusAccessoryImageView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_statusAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
