@implementation SimpleResultTitleView

- (SimpleResultTitleView)initWithFrame:(CGRect)a3
{
  SimpleResultTitleView *v3;
  SimpleResultTitleView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MapsThemeLabel *v8;
  MapsThemeLabel *titleLabel;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SimpleResultTitleView;
  v3 = -[SimpleResultTitleView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[SimpleResultTitleView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_alloc_init(MapsThemeLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    -[MapsThemeLabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeLabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeLabel setTextColor:](v4->_titleLabel, "setTextColor:", v11);

    -[SimpleResultTitleView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[SimpleResultTitleView updateContent](v4, "updateContent");
  }
  return v4;
}

- (void)updateTitleNumberOfLines
{
  uint64_t v3;

  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
    v3 = 2;
  else
    v3 = 1;
  -[MapsThemeLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v3);
}

- (void)updateLabelFonts
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultTitleView traitCollection](self, "traitCollection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SimpleResultTitleView effectiveTraitCollectionWithTraitCollection:](self, "effectiveTraitCollectionWithTraitCollection:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultTitleView titlefontWithTraitCollection:](self, "titlefontWithTraitCollection:", v5));
  -[MapsThemeLabel setFont:](self->_titleLabel, "setFont:", v4);

}

- (id)titlefontWithTraitCollection:(id)a3
{
  return +[UIFont system17CompatibleWithTraitCollection:](UIFont, "system17CompatibleWithTraitCollection:", a3);
}

- (void)updateContent
{
  -[SimpleResultTitleView updateLabelFonts](self, "updateLabelFonts");
  -[SimpleResultTitleView updateTitleNumberOfLines](self, "updateTitleNumberOfLines");
  -[SimpleResultTitleView activeLayout](self, "activeLayout");
}

- (void)activeLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](self->_titleLabel, "centerYAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultTitleView centerYAnchor](self, "centerYAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 0.0));
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultTitleView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 15.0));
  v10[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

}

- (id)effectiveTraitCollectionWithTraitCollection:(id)a3
{
  return objc_msgSend(a3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityLarge);
}

- (void)setTitle:(id)a3
{
  -[MapsThemeLabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)title
{
  return (NSString *)-[MapsThemeLabel text](self->_titleLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
