@implementation PHSingleLineTableViewCell

- (id)loadRootViewAndContentViews
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHSingleLineTableViewCell;
  v3 = -[PHTableViewCell loadRootViewAndContentViews](&v7, "loadRootViewAndContentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setNumberOfLines:", 0);

  return v4;
}

- (void)updateFontsAndLayoutMetrics
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHSingleLineTableViewCell;
  -[PHTableViewCell updateFontsAndLayoutMetrics](&v10, "updateFontsAndLayoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = NUIContainerViewLengthUseDefault;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setCustomBaselineOffsetFromBottom:", v5);

  -[PHSingleLineTableViewCell effectiveBaselineOffsetFromBottom](self, "effectiveBaselineOffsetFromBottom");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v9, "setCustomBaselineOffsetFromBottom:", v8);

}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  NSDirectionalEdgeInsets result;

  v18.receiver = self;
  v18.super_class = (Class)PHSingleLineTableViewCell;
  -[PHTableViewCell rootViewLayoutMargins](&v18, "rootViewLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[PHSingleLineTableViewCell titleLabelLastBaselineLayoutConstraintConstant](self, "titleLabelLastBaselineLayoutConstraintConstant");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "effectiveBaselineOffsetFromBottom");
  v13 = v10 - v12;

  v14 = v4;
  v15 = v6;
  v16 = v13;
  v17 = v8;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v5));
    objc_msgSend(v6, "scaledValueForValue:", 36.0);
    v8 = v7;

  }
  else
  {
    v8 = 36.0;
  }

  return v8;
}

- (double)titleLabelLastBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v5));
    objc_msgSend(v6, "scaledValueForValue:", 24.0);
    v8 = v7;

  }
  else
  {
    v8 = 24.0;
  }

  return v8;
}

@end
