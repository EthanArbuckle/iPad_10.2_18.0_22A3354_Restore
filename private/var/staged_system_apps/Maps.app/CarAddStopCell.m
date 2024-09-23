@implementation CarAddStopCell

- (CarAddStopCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarAddStopCell *v4;
  CarAddStopCell *v5;
  id v6;
  double y;
  double width;
  double height;
  UIImageView *v10;
  UIImageView *iconImageView;
  double v12;
  double v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *addStopLabel;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CarAddStopCell;
  v4 = -[CarAddStopCell initWithStyle:reuseIdentifier:](&v26, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarAddStopCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CarAddStopCell"));
    v6 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v10;

    -[UIImageView setAccessibilityIdentifier:](v5->_iconImageView, "setAccessibilityIdentifier:", CFSTR("IconImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    -[UIImageView setContentMode:](v5->_iconImageView, "setContentMode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("plus.circle.fill"), UIFontTextStyleTitle3));
    -[UIImageView setImage:](v5->_iconImageView, "setImage:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell contentView](v5, "contentView"));
    objc_msgSend(v15, "addSubview:", v5->_iconImageView);

    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    addStopLabel = v5->_addStopLabel;
    v5->_addStopLabel = v16;

    -[UILabel setAccessibilityIdentifier:](v5->_addStopLabel, "setAccessibilityIdentifier:", CFSTR("AddStopLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_addStopLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_addStopLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    LODWORD(v19) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_addStopLabel, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_addStopLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v5->_addStopLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setMinimumScaleFactor:](v5->_addStopLabel, "setMinimumScaleFactor:", 0.800000012);
    -[UILabel setNumberOfLines:](v5->_addStopLabel, "setNumberOfLines:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell traitCollection](v5, "traitCollection"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v20));
    -[UILabel setFont:](v5->_addStopLabel, "setFont:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CarPlay_AddStop"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v5->_addStopLabel, "setText:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell contentView](v5, "contentView"));
    objc_msgSend(v24, "addSubview:", v5->_addStopLabel);

    -[CarAddStopCell _setupConstraints](v5, "_setupConstraints");
    -[CarAddStopCell _updateAppearanceWithFocus:](v5, "_updateAppearanceWithFocus:", 0);
  }
  return v5;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[9];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 6.0));
  v31[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell centerYAnchor](self, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v31[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_iconImageView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell topAnchor](self, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v23));
  v31[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_iconImageView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell bottomAnchor](self, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v20));
  v31[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_addStopLabel, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 6.0));
  v31[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_addStopLabel, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell centerYAnchor](self, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v31[5] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_addStopLabel, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, -6.0));
  v31[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_addStopLabel, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7));
  v31[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_addStopLabel, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddStopCell bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10));
  v31[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_updateAppearanceWithFocus:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v6);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v7 = (id)v5;
  -[UILabel setTextColor:](self->_addStopLabel, "setTextColor:", v5);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarAddStopCell;
  -[CarAddStopCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  -[CarAddStopCell _updateAppearanceWithFocus:](self, "_updateAppearanceWithFocus:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addStopLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
