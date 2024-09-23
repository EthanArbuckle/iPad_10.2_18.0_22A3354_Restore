@implementation CarplayLocationTableViewCell

- (CarplayLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayLocationTableViewCell *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *icon;
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
  objc_super v38;
  _QWORD v39[7];

  v38.receiver = self;
  v38.super_class = (Class)CarplayLocationTableViewCell;
  v4 = -[CarplayLocationTableViewCell initWithStyle:reuseIdentifier:](&v38, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    label = v4->_label;
    v4->_label = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UILabel setHighlightedTextColor:](v4->_label, "setHighlightedTextColor:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell _titleFont](v4, "_titleFont"));
    -[UILabel setFont:](v4->_label, "setFont:", v9);

    -[CarplayLocationTableViewCell addSubview:](v4, "addSubview:", v4->_label);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.triangle.turn.up.right.circle.fill")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection"));

    v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v37);
    icon = v4->_icon;
    v4->_icon = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v4->_icon, "setTintColor:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_icon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleCallout, 3));
    -[UIImageView setPreferredSymbolConfiguration:](v4->_icon, "setPreferredSymbolConfiguration:", v14);

    -[CarplayLocationTableViewCell addSubview:](v4, "addSubview:", v4->_icon);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell leadingAnchor](v4, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 12.0));
    v39[0] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_icon, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v32, 12.0));
    v39[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell bottomAnchor](v4, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_label, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v29, 1.0));
    v39[2] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_label, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell topAnchor](v4, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0));
    v39[3] = v25;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell trailingAnchor](v4, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v4->_icon, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 23.0));
    v39[4] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_icon, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell centerYAnchor](v4, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v39[5] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell heightAnchor](v4, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 44.0));
    v39[6] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  }
  return v4;
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

- (void)updateWithEvent:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_event, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
  -[UILabel setText:](self->_label, "setText:", v6);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", +[CarplayUtilities numberOfLinesInString:](CarplayUtilities, "numberOfLinesInString:", v6));

}

- (void)cellWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Location cell was tapped", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:](EKMapsUtilities, "mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:", 0, self->_event, 0));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayLocationTableViewCell window](self, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
    objc_msgSend(v6, "openURL:options:completionHandler:", v4, 0, &stru_1001B5EA8);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarplayLocationTableViewCell;
  -[CarplayLocationTableViewCell setHighlighted:animated:](&v8, "setHighlighted:animated:", a3, a4);
  if (v4)
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7 = (void *)v6;
  -[UIImageView setTintColor:](self->_icon, "setTintColor:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
