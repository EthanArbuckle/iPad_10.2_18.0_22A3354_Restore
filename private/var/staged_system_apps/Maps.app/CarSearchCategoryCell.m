@implementation CarSearchCategoryCell

- (CarSearchCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarSearchCategoryCell *v4;
  id v5;
  double y;
  double width;
  double height;
  UIImageView *v9;
  UIImageView *iconImageView;
  double v11;
  double v12;
  void *v13;
  UILabel *v14;
  UILabel *categoryLabel;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CarSearchCategoryCell;
  v4 = -[CarSearchCategoryCell initWithStyle:reuseIdentifier:](&v22, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v9;

    -[UIImageView setAccessibilityIdentifier:](v4->_iconImageView, "setAccessibilityIdentifier:", CFSTR("CarSearchCategoryIcon"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    -[UIImageView setContentMode:](v4->_iconImageView, "setContentMode:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell contentView](v4, "contentView"));
    objc_msgSend(v13, "addSubview:", v4->_iconImageView);

    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    categoryLabel = v4->_categoryLabel;
    v4->_categoryLabel = v14;

    -[UILabel setAccessibilityIdentifier:](v4->_categoryLabel, "setAccessibilityIdentifier:", CFSTR("CarSearchCategoryLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_categoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_categoryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    LODWORD(v17) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_categoryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_categoryLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v4->_categoryLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setMinimumScaleFactor:](v4->_categoryLabel, "setMinimumScaleFactor:", 0.800000012);
    -[UILabel setNumberOfLines:](v4->_categoryLabel, "setNumberOfLines:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell traitCollection](v4, "traitCollection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v18));
    -[UILabel setFont:](v4->_categoryLabel, "setFont:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_categoryLabel);

    -[CarSearchCategoryCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupConstraints
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
  _QWORD v26[8];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 29.0));
  v26[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 29.0));
  v26[1] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell leadingAnchor](self, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 6.0));
  v26[2] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell centerYAnchor](self, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v26[3] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_categoryLabel, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 6.0));
  v26[4] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_categoryLabel, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell topAnchor](self, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 6.0));
  v26[5] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_categoryLabel, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell bottomAnchor](self, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -6.0));
  v26[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_categoryLabel, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoryCell trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -6.0));
  v26[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setupWithBrowseCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  CarSearchCategoryCell *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[CarSearchCategoryCell setUpdateIdentifier:](self, "setUpdateIdentifier:", v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100C1B474;
  v13[3] = &unk_1011BB6C8;
  v6 = v5;
  v14 = v6;
  v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C1B4F8;
  v11[3] = &unk_1011ACBF8;
  v7 = objc_retainBlock(v13);
  v12 = v7;
  objc_msgSend(v4, "imageWithScale:isCarplay:resultHandler:", 1, v11, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternativeName"));
  if (objc_msgSend(v8, "length"))
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternativeName"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v10 = (void *)v9;

  -[UILabel setText:](self->_categoryLabel, "setText:", v10);
}

- (void)setupWithSavedPlaces
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:pointSize:](UIImage, "_mapsCar_systemImageNamed:pointSize:", CFSTR("rectangle.stack.fill"), 22.0));
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_Guides_List_Title"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_categoryLabel, "setText:", v4);

}

- (void)setupWithIncidentLayoutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayImage"));
  if (v5)
  {
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:pointSize:](UIImage, "_mapsCar_systemImageNamed:pointSize:", CFSTR("exclamationmark.bubble.fill"), 22.0));
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayText"));

  -[UILabel setText:](self->_categoryLabel, "setText:", v7);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarSearchCategoryCell;
  -[CarSearchCategoryCell prepareForReuse](&v3, "prepareForReuse");
  -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
  -[UILabel setText:](self->_categoryLabel, "setText:", 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarSearchCategoryCell;
  -[CarSearchCategoryCell setHighlighted:animated:](&v10, "setHighlighted:animated:", a3, a4);
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v6);

    v7 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v8);

    v7 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v9 = (void *)v7;
  -[UILabel setTextColor:](self->_categoryLabel, "setTextColor:", v7);

}

- (id)accessibilityIdentifier
{
  return CFSTR("CarSearchCategoryCell");
}

+ (id)reuseIdentifier
{
  return CFSTR("CarSearchCategoryCellReuseIdentifier");
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
