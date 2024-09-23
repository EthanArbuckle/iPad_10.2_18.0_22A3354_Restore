@implementation IncidentsCell

- (IncidentsCell)initWithFrame:(CGRect)a3
{
  IncidentsCell *v3;
  IncidentsCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IncidentsCell;
  v3 = -[IncidentsCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[IncidentsCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[IncidentsCell _setupSubviews](v4, "_setupSubviews");
  }
  return v4;
}

- (void)_setupSubviews
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  UILabel *v11;
  UILabel *subtitleLabel;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *iconImageView;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IncidentsCell contentView](self, "contentView"));
  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

  objc_msgSend(v3, "addSubview:", self->_titleLabel);
  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v11;

  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v14);

  objc_msgSend(v3, "addSubview:", self->_subtitleLabel);
  v15 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v15;

  -[UIImageView setAccessibilityIdentifier:](self->_iconImageView, "setAccessibilityIdentifier:", CFSTR("IconImageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_iconImageView, "layer"));
  objc_msgSend(v17, "setCornerRadius:", 15.0);

  -[UIImageView setClipsToBounds:](self->_iconImageView, "setClipsToBounds:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_iconImageView);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 52.0));
  v49[0] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 30.0));
  v49[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v49[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 16.0));
  v49[3] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v49[4] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 10.0));
  v49[5] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v49[6] = v29;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor"));
  v19 = v3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  v49[7] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v32 = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -16.0));
  v49[8] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_subtitleLabel, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v49[9] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)setTitle:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_title);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_title, obj);
    -[UILabel setText:](self->_titleLabel, "setText:", obj);
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[UILabel setText:](self->_subtitleLabel, "setText:", v5);
  }

}

- (void)setIcon:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v5);
  }

}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(IncidentsCell);
  return NSStringFromClass(v2);
}

- (NSString)title
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_title);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_destroyWeak((id *)&self->_title);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
