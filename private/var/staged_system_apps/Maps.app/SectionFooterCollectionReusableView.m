@implementation SectionFooterCollectionReusableView

- (SectionFooterCollectionReusableView)initWithFrame:(CGRect)a3
{
  SectionFooterCollectionReusableView *v3;
  void *v4;
  uint64_t v5;
  MapsThemeButton *actionButton;
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
  void *v18;
  objc_super v19;
  _QWORD v20[3];

  v19.receiver = self;
  v19.super_class = (Class)SectionFooterCollectionReusableView;
  v3 = -[SectionFooterCollectionReusableView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SectionFooterCollectionReusableView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    actionButton = v3->_actionButton;
    v3->_actionButton = (MapsThemeButton *)v5;

    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeButton setTitleColorProvider:](v3->_actionButton, "setTitleColorProvider:", &stru_1011AF850);
    -[SectionFooterCollectionReusableView _updateFonts](v3, "_updateFonts");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionButton](v3, "actionButton"));
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v3, "_didTapActionButton", 64);

    -[SectionFooterCollectionReusableView addSubview:](v3, "addSubview:", v3->_actionButton);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](v3->_actionButton, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView leadingAnchor](v3, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v8, 16.0));
    v20[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](v3->_actionButton, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView topAnchor](v3, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v20[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](v3->_actionButton, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView bottomAnchor](v3, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v20[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SectionFooterCollectionReusableView;
  -[SectionFooterCollectionReusableView prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionButton](self, "actionButton"));
  objc_msgSend(v3, "setTitle:forState:", &stru_1011EB268, 0);

}

- (void)_didTapActionButton
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionHandler](self, "actionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionHandler](self, "actionHandler"));
    v4[2]();

  }
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView traitCollection](self, "traitCollection"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_effectiveTraitCollectionWithTraitCollection:", v4));

  v5 = objc_msgSend((id)objc_opt_class(self), "_fontWithTraitCollection:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionButton](self, "actionButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v8, "setFont:", v6);

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

+ (id)_fontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", a3);
}

+ (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Section")));
  -[SectionFooterCollectionReusableView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Action")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionButton](self, "actionButton"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionFooterCollectionReusableView actionButton](self, "actionButton"));
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

  -[SectionFooterCollectionReusableView setActionHandler:](self, "setActionHandler:", v8);
}

+ (double)heightForFooterViewWithTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityLarge));
  v5 = objc_msgSend((id)objc_opt_class(a1), "_fontWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "_maps_displayScaleOrMainScreenScale");
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v6, 1);
  v8 = v7 + 16.0;

  return v8;
}

- (MapsThemeButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
