@implementation NavTrayActionCell

- (NavTrayActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NavTrayActionCell *v4;
  NavTrayActionCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;
  UIView *leadingImageBackgroundView;
  void *v13;
  UIImageView *v14;
  UIImageView *leadingImageView;
  UILabel *v16;
  UILabel *titleLabel;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  UIView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v76;
  _QWORD v77[16];

  v76.receiver = self;
  v76.super_class = (Class)NavTrayActionCell;
  v4 = -[NavTrayActionCell initWithStyle:reuseIdentifier:](&v76, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavTrayActionCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listCellConfiguration](UIBackgroundConfiguration, "listCellConfiguration"));
    objc_msgSend(v75, "setCornerRadius:", 10.0);
    -[NavTrayActionCell setBackgroundConfiguration:](v5, "setBackgroundConfiguration:", v75);
    v9 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("ImageViewContainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v9);

    v11 = objc_opt_new(UIView);
    leadingImageBackgroundView = v5->_leadingImageBackgroundView;
    v5->_leadingImageBackgroundView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_leadingImageBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v5->_leadingImageBackgroundView, "setAccessibilityIdentifier:", CFSTR("LeadingImageBackground"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_leadingImageBackgroundView, "layer"));
    objc_msgSend(v13, "setCornerRadius:", 22.5);

    -[UIView addSubview:](v9, "addSubview:", v5->_leadingImageBackgroundView);
    v14 = objc_opt_new(UIImageView);
    leadingImageView = v5->_leadingImageView;
    v5->_leadingImageView = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_leadingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_leadingImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v5->_leadingImageView, "setAccessibilityIdentifier:", CFSTR("LeadingImageView"));
    -[UIView addSubview:](v9, "addSubview:", v5->_leadingImageView);
    v16 = objc_opt_new(UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v18);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    objc_msgSend(v19, "addSubview:", v5->_titleLabel);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v9, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v77[0] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v9, "widthAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:", 76.0));
    v77[1] = v69;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v9, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v77[2] = v65;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v9, "bottomAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v77[3] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v5->_leadingImageBackgroundView, "centerXAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v9, "centerXAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
    v77[4] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5->_leadingImageBackgroundView, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v9, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
    v77[5] = v55;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_leadingImageBackgroundView, "heightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 45.0));
    v77[6] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_leadingImageBackgroundView, "widthAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", 45.0));
    v77[7] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_leadingImageView, "centerXAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v9, "centerXAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v77[8] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_leadingImageView, "centerYAnchor"));
    v54 = v9;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v9, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v77[9] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_leadingImageView, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_leadingImageBackgroundView, "heightAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:multiplier:", v42, 0.600000024));
    v77[10] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v9, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
    v77[11] = v38;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -16.0));
    v77[12] = v34;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
    v77[13] = v30;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v22));
    v77[14] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell contentView](v5, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26));
    v77[15] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 16));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v5;
}

+ (double)heightForCellWithText:(id)a3 width:(double)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  NSAttributedStringKey v16;
  void *v17;
  CGRect v18;
  CGRect v19;

  v5 = a3;
  v6 = objc_alloc((Class)NSAttributedString);
  v16 = NSFontAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v17 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v9 = objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, a4 + -76.0 + -16.0, 1.79769313e308);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v14 = 78.0;
  if (ceil(CGRectGetMaxY(v18)) > 78.0)
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v14 = ceil(CGRectGetMaxY(v19));
  }

  return v14;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavTrayActionCell;
  v4 = a3;
  -[NavTrayActionCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[NavTrayActionCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell backgroundConfiguration](self, "backgroundConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedConfigurationForState:", v10));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayActionCell traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if ((objc_msgSend(v10, "isHighlighted") & 1) != 0 || objc_msgSend(v10, "isSelected"))
  {
    if (v7 == (id)2)
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemLightMidGrayColor](UIColor, "systemLightMidGrayColor"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  }
  v9 = (void *)v8;
  objc_msgSend(v5, "setBackgroundColor:", v8);

  -[NavTrayActionCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);
}

- (UIImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (UIView)leadingImageBackgroundView
{
  return self->_leadingImageBackgroundView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageBackgroundView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end
