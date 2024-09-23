@implementation CarplayConferenceTableViewCell

- (CarplayConferenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayConferenceTableViewCell *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *subLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *icon;
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
  objc_super v49;
  _QWORD v50[9];

  v49.receiver = self;
  v49.super_class = (Class)CarplayConferenceTableViewCell;
  v4 = -[CarplayConferenceTableViewCell initWithStyle:reuseIdentifier:](&v49, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    label = v4->_label;
    v4->_label = v5;

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UILabel setHighlightedTextColor:](v4->_label, "setHighlightedTextColor:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell traitCollection](v4, "traitCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v9));
    -[UILabel setFont:](v4->_label, "setFont:", v10);

    -[CarplayConferenceTableViewCell addSubview:](v4, "addSubview:", v4->_label);
    v11 = objc_opt_new(UILabel);
    subLabel = v4->_subLabel;
    v4->_subLabel = v11;

    -[UILabel setNumberOfLines:](v4->_subLabel, "setNumberOfLines:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v4->_subLabel, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor"));
    -[UILabel setHighlightedTextColor:](v4->_subLabel, "setHighlightedTextColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell traitCollection](v4, "traitCollection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCaption1, v15));
    -[UILabel setFont:](v4->_subLabel, "setFont:", v16);

    -[CarplayConferenceTableViewCell addSubview:](v4, "addSubview:", v4->_subLabel);
    v17 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    icon = v4->_icon;
    v4->_icon = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v4->_icon, "setTintColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleCallout, 3));
    -[UIImageView setPreferredSymbolConfiguration:](v4->_icon, "setPreferredSymbolConfiguration:", v20);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_icon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarplayConferenceTableViewCell addSubview:](v4, "addSubview:", v4->_icon);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell leadingAnchor](v4, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 12.0));
    v50[0] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_subLabel, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell leadingAnchor](v4, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 12.0));
    v50[1] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_icon, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_subLabel, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 12.0));
    v50[2] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_icon, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 12.0));
    v50[3] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell topAnchor](v4, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 20.0));
    v50[4] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_subLabel, "firstBaselineAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v4->_label, "lastBaselineAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 16.0));
    v50[5] = v31;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell trailingAnchor](v4, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v4->_icon, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 23.0));
    v50[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_icon, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell centerYAnchor](v4, "centerYAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v50[7] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell heightAnchor](v4, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:", 44.0));
    v50[8] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  }
  return v4;
}

- (void)updateWithEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  CarplayConferenceTableViewCell *v22;

  v5 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent virtualConference](self->_event, "virtualConference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "joinMethods"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(-[EKEvent conferenceURLForDisplay](self->_event, "conferenceURLForDisplay"));
  v12 = v11;

  v13 = objc_msgSend(v12, "cal_hasSchemeTel");
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
    v17 = CFSTR("Call In");
  else
    v17 = CFSTR("Join");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1001B67C0, 0));
  -[UILabel setText:](self->_label, "setText:", v18);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100069FA8;
  v20[3] = &unk_1001B34C0;
  v21 = v5;
  v22 = self;
  v19 = v5;
  +[CUIKConferenceUtils displayDetailsForURL:completionHandler:](CUIKConferenceUtils, "displayDetailsForURL:completionHandler:", v12, v20);

}

- (void)cellWasTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent virtualConference](self->_event, "virtualConference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "joinMethods"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[EKEvent conferenceURLForDisplay](self->_event, "conferenceURLForDisplay"));
  v9 = v8;

  v10 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v13 = 138477827;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Conference cell was tapped, url: [%{private}@]", (uint8_t *)&v13, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayConferenceTableViewCell window](self, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  objc_msgSend(v12, "openURL:options:completionHandler:", v9, 0, &stru_1001B34E0);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarplayConferenceTableViewCell;
  -[CarplayConferenceTableViewCell setHighlighted:animated:](&v8, "setHighlighted:animated:", a3, a4);
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
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
