@implementation TransitStationLineScheduleSectionHeaderView

- (TransitStationLineScheduleSectionHeaderView)initWithFrame:(CGRect)a3
{
  TransitStationLineScheduleSectionHeaderView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  HairlineView *bottomHairlineView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)TransitStationLineScheduleSectionHeaderView;
  v3 = -[TransitStationLineScheduleSectionHeaderView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);

    v7 = MUPlaceSectionHeaderFont(-[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v8);

    -[TransitStationLineScheduleSectionHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v9 = objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView _maps_addHairlineAtBottomWithMargin:](v3, "_maps_addHairlineAtBottomWithMargin:", 0.0));
    bottomHairlineView = v3->_bottomHairlineView;
    v3->_bottomHairlineView = (HairlineView *)v9;

    -[HairlineView setHidden:](v3->_bottomHairlineView, "setHidden:", 1);
    -[TransitStationLineScheduleSectionHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TransitStationLineScheduleSectionHeaderView"));
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TransitStationLineScheduleSectionHeaderViewTitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView topAnchor](v3, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v26[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView bottomAnchor](v3, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v11));
    v26[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView leadingAnchor](v3, "leadingAnchor"));
    MUPlaceSectionHeaderLeadingSpacingForInitialOffset(0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14));
    v26[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView trailingAnchor](v3, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0));
    v26[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v3;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setSecondaryText:(id)a3
{
  if (self->_button)
    -[MapsThemeButton setTitle:forState:](self->_button, "setTitle:forState:", a3, 0);
  else
    -[TransitStationLineScheduleSectionHeaderView addSecondaryLabelWithText:](self, "addSecondaryLabelWithText:", a3);
}

- (void)removeSecondaryText
{
  void **p_button;
  void *button;
  void *v5;

  p_button = (void **)&self->_button;
  button = self->_button;
  if (button || (p_button = (void **)&self->_secondaryLabel, (button = self->_secondaryLabel) != 0))
  {
    objc_msgSend(button, "removeFromSuperview");
    v5 = *p_button;
    *p_button = 0;

  }
}

- (void)addSecondaryLabelWithText:(id)a3
{
  id v4;
  UILabel *secondaryLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  secondaryLabel = self->_secondaryLabel;
  v11 = v4;
  if (!secondaryLabel)
  {
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    v7 = self->_secondaryLabel;
    self->_secondaryLabel = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v8);

    v9 = MUPlaceSectionHeaderAccessoryButtonFont();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[UILabel setFont:](self->_secondaryLabel, "setFont:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[TransitStationLineScheduleSectionHeaderView _addSecondaryView:](self, "_addSecondaryView:", self->_secondaryLabel);
    -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("TransitStationLineScheduleSectionHeaderViewSecondaryLabel"));
    v4 = v11;
    secondaryLabel = self->_secondaryLabel;
  }
  -[UILabel setText:](secondaryLabel, "setText:", v4);

}

- (void)addButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  UIFocusGuide *v7;
  UIFocusGuide *focusGuide;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapsThemeButton *button;
  MapsThemeButton *v17;
  MapsThemeButton *v18;
  void *v19;
  uint64_t v20;
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
  const char *v31;
  const char *v32;
  _QWORD v33[2];
  MapsThemeButton *v34;
  _QWORD v35[2];

  v6 = a3;
  if (v6 && a4)
  {
    if (!self->_focusGuide)
    {
      v7 = (UIFocusGuide *)objc_alloc_init((Class)UIFocusGuide);
      focusGuide = self->_focusGuide;
      self->_focusGuide = v7;

      -[TransitStationLineScheduleSectionHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_focusGuide);
      v31 = a4;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](self->_focusGuide, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView leadingAnchor](self, "leadingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
      v35[0] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](self->_focusGuide, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView trailingAnchor](self, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v35[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

      a4 = v31;
    }
    button = self->_button;
    if (!button)
    {
      v17 = objc_alloc_init(MapsThemeButton);
      v18 = self->_button;
      self->_button = v17;

      v32 = a4;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_button, "titleLabel"));
      objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);

      v20 = MUPlaceSectionHeaderAccessoryButtonFont();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_button, "titleLabel"));
      objc_msgSend(v22, "setFont:", v21);

      -[MapsThemeButton setTitleColorProvider:](self->_button, "setTitleColorProvider:", &stru_1011BE7C0);
      -[TransitStationLineScheduleSectionHeaderView _addSecondaryView:](self, "_addSecondaryView:", self->_button);
      v34 = self->_button;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
      -[UIFocusGuide setPreferredFocusEnvironments:](self->_focusGuide, "setPreferredFocusEnvironments:", v23);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](self->_focusGuide, "topAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](self->_button, "topAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v24, -1.0));
      v33[0] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](self->_focusGuide, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](self->_button, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 1.0));
      v33[1] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

      a4 = v32;
      -[MapsThemeButton setAccessibilityIdentifier:](self->_button, "setAccessibilityIdentifier:", CFSTR("TransitStationLineScheduleSectionHeaderViewButton"));
      button = self->_button;
    }
    -[MapsThemeButton addTarget:action:forControlEvents:](button, "addTarget:action:forControlEvents:", v6, a4, 64);
  }

}

- (void)addButtonWithText:(id)a3 buttonTarget:(id)a4 buttonAction:(SEL)a5
{
  id v8;

  v8 = a3;
  -[TransitStationLineScheduleSectionHeaderView addButtonWithTarget:action:](self, "addButtonWithTarget:action:", a4, a5);
  -[TransitStationLineScheduleSectionHeaderView setSecondaryText:](self, "setSecondaryText:", v8);

}

- (void)prepareForReuse
{
  UILabel *secondaryLabel;
  UILabel *v4;
  MapsThemeButton *button;
  MapsThemeButton *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitStationLineScheduleSectionHeaderView;
  -[TransitStationLineScheduleSectionHeaderView prepareForReuse](&v7, "prepareForReuse");
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  secondaryLabel = self->_secondaryLabel;
  if (secondaryLabel)
  {
    -[UILabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
    v4 = self->_secondaryLabel;
    self->_secondaryLabel = 0;

  }
  button = self->_button;
  if (button)
  {
    -[MapsThemeButton removeFromSuperview](button, "removeFromSuperview");
    v6 = self->_button;
    self->_button = 0;

  }
  -[HairlineView setHidden:](self->_bottomHairlineView, "setHidden:", 1);
}

- (void)_addSecondaryView:(id)a3
{
  id v4;
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
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TransitStationLineScheduleSectionHeaderView addSubview:](self, "addSubview:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView bottomAnchor](self, "bottomAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v20, 1.0));
    v22[0] = v19;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView trailingAnchor](self, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    v22[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstBaselineAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v22[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitStationLineScheduleSectionHeaderView topAnchor](self, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v22[3] = v15;
    v22[4] = v18;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    LODWORD(v17) = 1132068864;
    objc_msgSend(v18, "setPriority:", v17);

  }
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  -[HairlineView setHidden:](self->_bottomHairlineView, "setHidden:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
