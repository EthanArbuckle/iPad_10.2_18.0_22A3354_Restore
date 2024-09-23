@implementation TransitLineDisambiguationSectionHeaderView

- (TransitLineDisambiguationSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  TransitLineDisambiguationSectionHeaderView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];

  v23.receiver = self;
  v23.super_class = (Class)TransitLineDisambiguationSectionHeaderView;
  v3 = -[TransitLineDisambiguationSectionHeaderView initWithReuseIdentifier:](&v23, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationSectionHeaderView contentView](v3, "contentView"));
    objc_msgSend(v7, "addSubview:", v3->_titleLabel);
    v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TransitLineDisambiguationSectionHeaderView setBackgroundView:](v3, "setBackgroundView:", v8);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0));
    v24[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -16.0));
    v24[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0));
    v24[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -8.0));
    v24[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
