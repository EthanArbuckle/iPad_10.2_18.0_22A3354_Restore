@implementation SectionHeaderView

+ (NSString)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (double)estimatedHeight
{
  return 54.0;
}

+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v10 = a3;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_effectiveTraitCollectionWithTraitCollection:", a7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleFontWithTraitCollection:", v14));
  objc_msgSend(v14, "_maps_displayScaleOrMainScreenScale");
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v15, 1);
  v17 = v16;
  v18 = objc_msgSend(a1, "shouldStackWithTitle:actionTitle:availableWidth:traitCollection:", v13, v12, v14, a6);

  if (v18)
    v19 = v17 * 2.0 + 8.0;
  else
    v19 = v17;
  objc_msgSend(a1, "_topMarginWhenFirstNonEmptySection:traitCollection:", v10, v14);
  v21 = v19 + v20;
  objc_msgSend((id)objc_opt_class(a1), "_titleBottomMargin");
  v23 = v21 + v22;

  return v23;
}

+ (double)_topMarginWhenFirstNonEmptySection:(BOOL)a3 traitCollection:(id)a4
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3, a4));
    if (sub_1002A8AA0(v4) == 1)
      v5 = 3.0;
    else
      v5 = 1.0;

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3, a4));
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == (id)5)
      return 24.0;
    else
      return 26.0;
  }
  return v5;
}

+ (double)_titleBottomMargin
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 10.0;
  if (v3 == (id)5)
    return 4.0;
  return result;
}

+ (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maximumContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v5));

  return v6;
}

+ (id)_titleFontWithTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system15SemiboldCompatibleWithTraitCollection:](UIFont, "system15SemiboldCompatibleWithTraitCollection:", v3));
  v5 = (void *)v4;

  return v5;
}

+ (id)_actionFontWithTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", v3));
  v5 = (void *)v4;

  return v5;
}

+ (BOOL)shouldStackWithTitle:(id)a3 actionTitle:(id)a4 availableWidth:(double)a5 traitCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  NSAttributedStringKey v24;
  void *v25;
  NSAttributedStringKey v26;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5 > 0.0 && objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_effectiveTraitCollectionWithTraitCollection:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleFontWithTraitCollection:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_actionFontWithTraitCollection:", v13));
    v26 = NSFontAttributeName;
    v27 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    objc_msgSend(v10, "sizeWithAttributes:", v16);
    v18 = v17;

    v24 = NSFontAttributeName;
    v25 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    objc_msgSend(v11, "sizeWithAttributes:", v19);
    v21 = v20;

    v22 = a5 + -32.0 < v18 + 8.0 + v21;
    v12 = (id)v13;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (SectionHeaderView)init
{
  SectionHeaderView *v2;
  void *v3;
  MKVibrantLabel *v4;
  MKVibrantLabel *label;
  void *v6;
  uint64_t v7;
  MapsThemeButton *actionButton;
  double v9;
  double v10;
  void *v11;
  HairlineView *v12;
  HairlineView *bottomHairlineView;
  unsigned int v14;
  UIFocusGuide *v15;
  UIFocusGuide *focusGuide;
  void *v17;
  void *v18;
  objc_super v20;
  MapsThemeButton *v21;

  v20.receiver = self;
  v20.super_class = (Class)SectionHeaderView;
  v2 = -[SectionHeaderView init](&v20, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SectionHeaderView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[SectionHeaderView _mapsui_resetLayoutMarginsWithPreservesSuperview:](v2, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
    v4 = (MKVibrantLabel *)objc_msgSend(objc_alloc((Class)MKVibrantLabel), "initWithStyle:", 1);
    label = v2->_label;
    v2->_label = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKVibrantLabel setBackgroundColor:](v2->_label, "setBackgroundColor:", v6);

    -[MKVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SectionHeaderView addSubview:](v2, "addSubview:", v2->_label);
    v7 = objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    actionButton = v2->_actionButton;
    v2->_actionButton = (MapsThemeButton *)v7;

    LODWORD(v9) = 1144750080;
    -[MapsThemeButton setContentHuggingPriority:forAxis:](v2->_actionButton, "setContentHuggingPriority:forAxis:", 0, v9);
    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v10) = 1144750080;
    -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](v2->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    -[MapsThemeButton setTitleColorProvider:](v2->_actionButton, "setTitleColorProvider:", &stru_1011B7880);
    -[MapsThemeButton _setTouchInsets:](v2->_actionButton, "_setTouchInsets:", -7.0, -7.0, -7.0, -7.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionButton](v2, "actionButton"));
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v2, "_didTapActionButton", 0x2000);

    -[SectionHeaderView addSubview:](v2, "addSubview:", v2->_actionButton);
    -[MapsThemeButton setHidden:](v2->_actionButton, "setHidden:", 1);
    v12 = objc_alloc_init(HairlineView);
    bottomHairlineView = v2->_bottomHairlineView;
    v2->_bottomHairlineView = v12;

    -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v2->_bottomHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SectionHeaderView addSubview:](v2, "addSubview:", v2->_bottomHairlineView);
    v14 = -[SectionHeaderView _defaultShouldShowBottomHairline](v2, "_defaultShouldShowBottomHairline");
    v2->_showsBottomHairline = v14;
    -[HairlineView setHidden:](v2->_bottomHairlineView, "setHidden:", v14 ^ 1);
    v15 = (UIFocusGuide *)objc_alloc_init((Class)UIFocusGuide);
    focusGuide = v2->_focusGuide;
    v2->_focusGuide = v15;

    v21 = v2->_actionButton;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[UIFocusGuide setPreferredFocusEnvironments:](v2->_focusGuide, "setPreferredFocusEnvironments:", v17);

    -[SectionHeaderView addLayoutGuide:](v2, "addLayoutGuide:", v2->_focusGuide);
    -[SectionHeaderView _updateFonts](v2, "_updateFonts");
    -[SectionHeaderView _setConstraintsByStacking:](v2, "_setConstraintsByStacking:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, "_contentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v2;
}

- (void)clearContents
{
  -[SectionHeaderView setTitle:](self, "setTitle:", 0);
  -[SectionHeaderView setActionTitle:](self, "setActionTitle:", 0);
  -[SectionHeaderView setActionHandler:](self, "setActionHandler:", 0);
  -[SectionHeaderView setFirstNonEmptySection:](self, "setFirstNonEmptySection:", 0);
  -[SectionHeaderView setFirstNonEmptySectionTopMargin:](self, "setFirstNonEmptySectionTopMargin:", 0.0);
  -[SectionHeaderView setShowsBottomHairline:](self, "setShowsBottomHairline:", -[SectionHeaderView _defaultShouldShowBottomHairline](self, "_defaultShouldShowBottomHairline"));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SectionHeaderView;
  -[MapsThemeView traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  if (sub_1002A8950(v6, v7))
  {

LABEL_4:
    -[SectionHeaderView _updateFonts](self, "_updateFonts");
    -[SectionHeaderView _updateTopConstraint](self, "_updateTopConstraint");
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
  objc_msgSend(v8, "displayScale");
  v10 = v9;
  objc_msgSend(v4, "displayScale");
  v12 = v11;

  if (v10 != v12)
    goto LABEL_4;
LABEL_5:

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_effectiveTraitCollectionWithTraitCollection:", v4));

  v5 = objc_msgSend((id)objc_opt_class(self), "_titleFontWithTraitCollection:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView label](self, "label"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = objc_msgSend((id)objc_opt_class(self), "_actionFontWithTraitCollection:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionButton](self, "actionButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleLabel"));
  objc_msgSend(v11, "setFont:", v9);

}

- (void)_updateTopConstraint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_effectiveTraitCollectionWithTraitCollection:", v4));

  objc_msgSend((id)objc_opt_class(self), "_topMarginWhenFirstNonEmptySection:traitCollection:", -[SectionHeaderView firstNonEmptySection](self, "firstNonEmptySection"), v8);
  v6 = v5;
  if (self->_firstNonEmptySection)
  {
    -[SectionHeaderView firstNonEmptySectionTopMargin](self, "firstNonEmptySectionTopMargin");
    v6 = v6 + v7;
  }
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", -v6);

}

- (BOOL)_defaultShouldShowBottomHairline
{
  return sub_1002A8AA0(self) != 5;
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Section")));
  -[SectionHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Action")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Title")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView label](self, "label"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", v9);

}

- (void)_setConstraintsByStacking:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *topConstraint;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *constraints;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
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
  uint64_t v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  uint64_t v58;
  NSMutableArray *v59;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[9];

  v3 = a3;
  if (self->_constraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  self->_stacking = v3;
  v80 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView topAnchor](self, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel topAnchor](self->_label, "topAnchor"));
  LODWORD(v7) = 1132068864;
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:priority:", v6, 0.0, v7));
  topConstraint = self->_topConstraint;
  self->_topConstraint = v8;

  -[SectionHeaderView _updateTopConstraint](self, "_updateTopConstraint");
  v84[0] = self->_topConstraint;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel leadingAnchor](self->_label, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v74));
  v84[1] = v72;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](self->_bottomHairlineView, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v66));
  v84[2] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](self->_bottomHairlineView, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView trailingAnchor](self, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v60));
  v84[3] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](self->_bottomHairlineView, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](self, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v84[4] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](self->_focusGuide, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](self->_actionButton, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -1.0));
  v84[5] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](self->_focusGuide, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](self->_actionButton, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v10, 1.0));
  v84[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](self->_focusGuide, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView leadingAnchor](self, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v84[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](self->_focusGuide, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView trailingAnchor](self, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v84[8] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 9));
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v18));
  constraints = self->_constraints;
  self->_constraints = v19;

  if (v80)
  {
    v21 = (void *)objc_opt_class(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_effectiveTraitCollectionWithTraitCollection:", v22));

    v23 = objc_msgSend((id)objc_opt_class(self), "_actionFontWithTraitCollection:", v58);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView traitCollection](self, "traitCollection"));
    objc_msgSend(v25, "displayScale");
    v81 = (void *)v24;
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v24, 1);
    v27 = v26 + 8.0;

    v56 = self->_constraints;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel bottomAnchor](self->_label, "bottomAnchor"));
    v29 = objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](self, "bottomAnchor"));
    objc_msgSend((id)objc_opt_class(self), "_titleBottomMargin");
    v77 = (void *)v29;
    v79 = v28;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -v30 - v27));
    v83[0] = v75;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel trailingAnchor](self->_label, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v73 = v31;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:"));
    v83[1] = v67;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton lastBaselineAnchor](self->_actionButton, "lastBaselineAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel lastBaselineAnchor](self->_label, "lastBaselineAnchor"));
    v65 = v32;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v63, v27));
    v83[2] = v61;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](self->_actionButton, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
    v83[3] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](self->_actionButton, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v39));
    v83[4] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 5));
    -[NSMutableArray addObjectsFromArray:](v56, "addObjectsFromArray:", v41);

    v42 = (void *)v58;
  }
  else
  {
    v59 = self->_constraints;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel bottomAnchor](self->_label, "bottomAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](self, "bottomAnchor"));
    objc_msgSend((id)objc_opt_class(self), "_titleBottomMargin");
    v81 = (void *)v43;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -v44));
    v82[0] = v79;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](self->_actionButton, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel trailingAnchor](self->_label, "trailingAnchor"));
    v77 = v45;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v75, 8.0));
    v82[1] = v73;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](self->_actionButton, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v71 = v46;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:"));
    v82[2] = v65;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton lastBaselineAnchor](self->_actionButton, "lastBaselineAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel lastBaselineAnchor](self->_label, "lastBaselineAnchor"));
    v63 = v47;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v61));
    v82[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](self->_actionButton, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel bottomAnchor](self->_label, "bottomAnchor"));
    LODWORD(v48) = 1132068864;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:priority:", v35, 0.0, v48));
    v82[4] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 5));
    -[NSMutableArray addObjectsFromArray:](v59, "addObjectsFromArray:", v37);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (BOOL)updateConstraintsWithAvailableWidthWithoutMargins:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  _BOOL4 stacking;

  if (a3 > 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView title](self, "title"));
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionTitle](self, "actionTitle"));
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        -[MKVibrantLabel intrinsicContentSize](self->_label, "intrinsicContentSize");
        v9 = v8 + 8.0;
        -[MapsThemeButton intrinsicContentSize](self->_actionButton, "intrinsicContentSize");
        v11 = v9 + v10 > a3;
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  v11 = 0;
LABEL_7:
  stacking = self->_stacking;
  if (stacking != v11)
    -[SectionHeaderView _setConstraintsByStacking:](self, "_setConstraintsByStacking:", v11);
  return stacking != v11;
}

- (void)_contentSizeChanged:(id)a3
{
  -[SectionHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", a3);
  -[SectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  unsigned int v4;
  objc_super v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)SectionHeaderView;
  -[SectionHeaderView layoutSubviews](&v6, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  objc_msgSend(v3, "layoutFrame");
  v4 = -[SectionHeaderView updateConstraintsWithAvailableWidthWithoutMargins:](self, "updateConstraintsWithAvailableWidthWithoutMargins:", CGRectGetWidth(v7));

  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)SectionHeaderView;
    -[SectionHeaderView layoutSubviews](&v5, "layoutSubviews");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *title;
  NSString *v9;
  void *v10;
  NSString *v11;

  v4 = (NSString *)a3;
  v5 = v4;
  v11 = v4;
  if (self->_title != v4 || (v6 = -[NSString isEqualToString:](v4, "isEqualToString:", v4), v5 = v11, (v6 & 1) == 0))
  {
    v7 = (NSString *)-[NSString copy](v5, "copy");
    title = self->_title;
    self->_title = v7;

    v9 = self->_title;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView label](self, "label"));
    objc_msgSend(v10, "setText:", v9);

    v5 = v11;
  }

}

- (void)setActionTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *actionTitle;
  void *v9;
  _BOOL8 v10;
  void *v11;
  NSString *v12;

  v4 = (NSString *)a3;
  v5 = v4;
  v12 = v4;
  if (self->_actionTitle != v4
    || (v6 = -[NSString isEqualToString:](v4, "isEqualToString:", v4), v5 = v12, (v6 & 1) == 0))
  {
    v7 = (NSString *)-[NSString copy](v5, "copy");
    actionTitle = self->_actionTitle;
    self->_actionTitle = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionButton](self, "actionButton"));
    objc_msgSend(v9, "setTitle:forState:", self->_actionTitle, 0);

    v10 = self->_actionTitle == 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionButton](self, "actionButton"));
    objc_msgSend(v11, "setHidden:", v10);

    v5 = v12;
  }

}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  if (self->_firstNonEmptySection != a3)
  {
    self->_firstNonEmptySection = a3;
    -[SectionHeaderView _updateTopConstraint](self, "_updateTopConstraint");
  }
}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  if (self->_firstNonEmptySection != a3)
    self->_firstNonEmptySection = a3;
  if (self->_firstNonEmptySectionTopMargin != a4)
  {
    self->_firstNonEmptySectionTopMargin = a4;
    -[SectionHeaderView _updateTopConstraint](self, "_updateTopConstraint");
  }
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    v3 = !a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomHairlineView](self, "bottomHairlineView"));
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)_didTapActionButton
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionHandler](self, "actionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SectionHeaderView actionHandler](self, "actionHandler"));
    v4[2]();

  }
}

- (SectionHeaderView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SectionHeaderView *v7;
  SectionHeaderView *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SectionHeaderView init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[SectionHeaderView setTitle:](v7, "setTitle:", v6);
    -[SectionHeaderView setFirstNonEmptySection:](v8, "setFirstNonEmptySection:", v4);
  }

  return v8;
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6;

  v6 = a4;
  -[SectionHeaderView setActionTitle:](self, "setActionTitle:", a3);
  -[SectionHeaderView setActionHandler:](self, "setActionHandler:", v6);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)firstNonEmptySection
{
  return self->_firstNonEmptySection;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (MKVibrantLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (MapsThemeButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (HairlineView)bottomHairlineView
{
  return self->_bottomHairlineView;
}

- (void)setBottomHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomHairlineView, a3);
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuide, a3);
}

- (double)firstNonEmptySectionTopMargin
{
  return self->_firstNonEmptySectionTopMargin;
}

- (void)setFirstNonEmptySectionTopMargin:(double)a3
{
  self->_firstNonEmptySectionTopMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end
