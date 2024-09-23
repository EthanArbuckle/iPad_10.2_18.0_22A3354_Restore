@implementation PHDoubleLineTableViewCell

- (id)loadRootViewAndContentViews
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHDoubleLineTableViewCell;
  v3 = -[PHTableViewCell loadRootViewAndContentViews](&v12, "loadRootViewAndContentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHDoubleLineTableViewCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setNumberOfLines:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v8, "setNumberOfLines:", 2);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHDoubleLineTableViewCell subtitleLabelTextColor](self, "subtitleLabelTextColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  return v4;
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  NSDirectionalEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)PHDoubleLineTableViewCell;
  -[PHTableViewCell rootViewLayoutMargins](&v16, "rootViewLayoutMargins");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v11 = objc_msgSend(v10, "isPreferredContentSizeCategoryAccessible");

  if (v11)
    v12 = v9;
  else
    v12 = 6.0;
  v13 = v3;
  v14 = v5;
  v15 = v7;
  result.trailing = v12;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (double)subtitleLabelFirstBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 20.0);
    v7 = v6;

  }
  else
  {
    v7 = 20.0;
  }

  return v7;
}

- (double)subtitleLabelLastBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 13.0);
    v7 = v6;

  }
  else
  {
    v7 = 13.0;
  }

  return v7;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 27.0);
    v7 = v6;

  }
  else
  {
    v7 = 27.0;
  }

  return v7;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHDoubleLineTableViewCell;
  -[PHDoubleLineTableViewCell tintColorDidChange](&v3, "tintColorDidChange");
  -[PHDoubleLineTableViewCell _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedText"));

  if (v10)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v10);
    v5 = objc_msgSend(v4, "length");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100023284;
    v11[3] = &unk_100089C80;
    v11[4] = self;
    v12 = v4;
    v6 = v4;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", NSForegroundColorAttributeName, 0, v5, 0, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v7, "setAttributedText:", v6);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHDoubleLineTableViewCell subtitleLabelTextColor](self, "subtitleLabelTextColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHDoubleLineTableViewCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v9, "setTextColor:", v8);

  }
}

- (UIColor)subtitleLabelTextColor
{
  return (UIColor *)+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor");
}

@end
