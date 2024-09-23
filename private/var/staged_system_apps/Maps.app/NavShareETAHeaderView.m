@implementation NavShareETAHeaderView

- (NavShareETAHeaderView)initWithFrame:(CGRect)a3
{
  NavShareETAHeaderView *v3;
  NavShareETAHeaderView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  UILabel *v11;
  UILabel *subtitleLabel;
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
  objc_super v37;
  _QWORD v38[7];

  v37.receiver = self;
  v37.super_class = (Class)NavShareETAHeaderView;
  v3 = -[NavShareETAHeaderView initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavShareETAHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[NavShareETAHeaderView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v8 = objc_opt_new(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v10);

    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setMinimumScaleFactor:](v4->_titleLabel, "setMinimumScaleFactor:", 0.75);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[NavShareETAHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v11 = objc_opt_new(UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v13);

    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[NavShareETAHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView leadingAnchor](v4, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 16.0));
    v38[0] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView trailingAnchor](v4, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v38[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView topAnchor](v4, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 17.0));
    v38[2] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView leadingAnchor](v4, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 16.0));
    v38[3] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView trailingAnchor](v4, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v14));
    v38[4] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_subtitleLabel, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v38[5] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView bottomAnchor](v4, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_subtitleLabel, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 17.0));
    v38[6] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    -[NavShareETAHeaderView _updateFonts](v4, "_updateFonts");
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavShareETAHeaderView;
  v4 = a3;
  -[NavShareETAHeaderView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[NavShareETAHeaderView _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28BoldCompatibleWithTraitCollection:](UIFont, "system28BoldCompatibleWithTraitCollection:", v5));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v5));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryExtraExtraExtraLarge;
}

- (id)_effectiveTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView _maximumContentSizeCategory](self, "_maximumContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v4));

  return v5;
}

- (void)setActiveContacts:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_activeContacts;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_activeContacts, a3);
      -[NavShareETAHeaderView _updateText](self, "_updateText");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)_updateText
{
  id v3;
  void *v4;
  char *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = objc_alloc((Class)NSOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView activeContacts](self, "activeContacts"));
  v21 = objc_msgSend(v3, "initWithArray:", v4);

  v5 = (char *)objc_msgSend(v21, "count");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contact"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v8, 1000));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
    v14 = v11;

    v15 = v6 - 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Sharing ETA [Card Title, Sharing]"), CFSTR("localized string not found"), 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v15, v14));
    -[UILabel setText:](self->_titleLabel, "setText:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Sharing ETA subtitle"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v20);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Share ETA [Card Title, Not Sharing]"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_titleLabel, "setText:", v13);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Share ETA [Card Subtitle]"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v14);
  }

}

- (NSArray)activeContacts
{
  return self->_activeContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeContacts, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
