@implementation NavCategoryCell

- (NavCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NavCategoryCell *v4;
  NavCategoryCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *leadingImageView;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *titleLabel;
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
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[9];

  v52.receiver = self;
  v52.super_class = (Class)NavCategoryCell;
  v4 = -[NavCategoryCell initWithStyle:reuseIdentifier:](&v52, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavCategoryCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("NavCategoryCellContent"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listCellConfiguration](UIBackgroundConfiguration, "listCellConfiguration"));
    objc_msgSend(v51, "setCornerRadius:", 10.0);
    -[NavCategoryCell setBackgroundConfiguration:](v5, "setBackgroundConfiguration:", v51);
    v10 = objc_opt_new(UIImageView);
    leadingImageView = v5->_leadingImageView;
    v5->_leadingImageView = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_leadingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_leadingImageView, "setContentMode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_leadingImageView, "layer"));
    objc_msgSend(v12, "setCornerRadius:", 27.0);

    -[UIImageView setAccessibilityIdentifier:](v5->_leadingImageView, "setAccessibilityIdentifier:", CFSTR("LeadingImageView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    objc_msgSend(v13, "addSubview:", v5->_leadingImageView);

    v14 = objc_opt_new(UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v16);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    objc_msgSend(v17, "addSubview:", v5->_titleLabel);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_leadingImageView, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 12.0));
    v53[0] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_leadingImageView, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 54.0));
    v53[1] = v45;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_leadingImageView, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerYAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v53[2] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_leadingImageView, "heightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 54.0));
    v53[3] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_leadingImageView, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0));
    v53[4] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -16.0));
    v53[5] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v53[6] = v28;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v20));
    v53[7] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell contentView](v5, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v24));
    v53[8] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavCategoryCell;
  -[NavCategoryCell prepareForReuse](&v3, "prepareForReuse");
  -[NavCategoryCell setCategory:](self, "setCategory:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavCategoryCell;
  -[NavCategoryCell traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  if (v6 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell traitCollection](self, "traitCollection"));
    objc_msgSend(v7, "displayScale");
    v9 = v8;
    objc_msgSend(v4, "displayScale");
    v11 = v10;

    if (v9 == v11)
      goto LABEL_6;
  }
  else
  {

  }
  -[NavCategoryCell _updateContent](self, "_updateContent");
  -[NavCategoryCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
LABEL_6:

}

- (void)setCategory:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_category;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_category, a3);
      -[NavCategoryCell _updateContent](self, "_updateContent");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortDisplayString"));
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell category](self, "category"));
  if (v5)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NavCategoryCell category](self, "category"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "styleAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell traitCollection](self, "traitCollection"));
    objc_msgSend(v7, "displayScale");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell traitCollection](self, "traitCollection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:nightMode:", v6, 5, 1, 0, 0, objc_msgSend(v10, "userInterfaceStyle") == (id)2, v9));
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", v11);

  }
  else
  {
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", 0);
  }
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell backgroundConfiguration](self, "backgroundConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedConfigurationForState:", v10));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryCell traitCollection](self, "traitCollection"));
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

  -[NavCategoryCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);
}

+ (double)heightForCellWithCategory:(id)a3 width:(double)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  NSAttributedStringKey v17;
  void *v18;
  CGRect v19;
  CGRect v20;

  v5 = a3;
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDisplayString"));

  v17 = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v10 = objc_msgSend(v6, "initWithString:attributes:", v7, v9);

  objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, a4 + -76.0 + -16.0, 1.79769313e308);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v15 = 78.0;
  if (ceil(CGRectGetMaxY(v19)) > 78.0)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v15 = ceil(CGRectGetMaxY(v20));
  }

  return v15;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end
