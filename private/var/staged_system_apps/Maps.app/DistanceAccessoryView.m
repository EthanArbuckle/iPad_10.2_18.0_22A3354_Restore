@implementation DistanceAccessoryView

- (DistanceAccessoryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DistanceAccessoryView *v7;
  DistanceAccessoryView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  _TtC4Maps31DistanceAccessoryLabelViewModel *v12;
  _TtC4Maps31DistanceAccessoryLabelViewModel *labelViewModel;
  void *v14;
  id WeakRetained;
  id v16;
  UIActivityIndicatorView *v17;
  UIActivityIndicatorView *activityView;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)DistanceAccessoryView;
  v7 = -[DistanceAccessoryView initWithFrame:](&v20, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DistanceAccessoryView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v11);

    v8->_displayState = 0;
    v12 = objc_alloc_init(_TtC4Maps31DistanceAccessoryLabelViewModel);
    labelViewModel = v8->_labelViewModel;
    v8->_labelViewModel = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryLabelViewModel labelView](v8->_labelViewModel, "labelView"));
    objc_storeWeak((id *)&v8->_distanceLabel, v14);

    WeakRetained = objc_loadWeakRetained((id *)&v8->_distanceLabel);
    objc_msgSend(WeakRetained, "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));

    v16 = objc_loadWeakRetained((id *)&v8->_distanceLabel);
    -[DistanceAccessoryView addSubview:](v8, "addSubview:", v16);

    v17 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", x, y, width, height);
    activityView = v8->_activityView;
    v8->_activityView = v17;

    -[UIActivityIndicatorView setAccessibilityIdentifier:](v8->_activityView, "setAccessibilityIdentifier:", CFSTR("ActivityView"));
    -[UIActivityIndicatorView setHidden:](v8->_activityView, "setHidden:", 1);
    -[DistanceAccessoryView addSubview:](v8, "addSubview:", v8->_activityView);
  }
  return v8;
}

- (CGSize)intrinsicContentSize
{
  CGFloat width;
  CGFloat height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = 20.0;
  height = 20.0;
  if ((id)-[DistanceAccessoryView displayState](self, "displayState") != (id)3)
  {
    if ((id)-[DistanceAccessoryView displayState](self, "displayState") == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView distanceLabel](self, "distanceLabel"));
      objc_msgSend(v5, "intrinsicContentSize");
      width = v6;
      height = v7;

    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView distanceLabel](self, "distanceLabel"));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView distanceLabel](self, "distanceLabel"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView activityView](self, "activityView"));
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, 20.0, 20.0);

  -[DistanceAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setDisplayState:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_displayState != a3)
  {
    self->_displayState = a3;
    v5 = a3 != 2;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView distanceLabel](self, "distanceLabel"));
    objc_msgSend(v6, "setHidden:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView activityView](self, "activityView"));
    objc_msgSend(v7, "setHidden:", a3 != 3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView activityView](self, "activityView"));
    v9 = v8;
    if (a3 == 3)
      objc_msgSend(v8, "startAnimating");
    else
      objc_msgSend(v8, "stopAnimating");

    -[DistanceAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[DistanceAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setDistanceToNextManeuver:(double)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD *v24;
  double v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  __CFString *v29;
  __CFString *v30;

  self->_distanceToNextManeuver = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:context:extraDetail:](NSString, "_navigation_localizedStringForDistance:context:extraDetail:", 1, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView previousDistanceString](self, "previousDistanceString"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[DistanceAccessoryView setPreviousDistanceString:](self, "setPreviousDistanceString:", v4);
    if (GEOConfigGetBOOL(MapsConfig_ApertureShouldSuperscriptUnitText, off_1014B49E8))
    {
      v7 = objc_alloc_init((Class)NSMutableAttributedString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4));
      if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
      {
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView customDecimalCharacterSet](self, "customDecimalCharacterSet"));
          v30 = &stru_1011EB268;
          objc_msgSend(v8, "scanCharactersFromSet:intoString:", v9, &v30);
          v10 = v30;

          if (-[__CFString length](v10, "length"))
          {
            v11 = objc_alloc((Class)NSAttributedString);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView digitTextAttributes](self, "digitTextAttributes"));
            v13 = objc_msgSend(v11, "initWithString:attributes:", v10, v12);

            objc_msgSend(v7, "appendAttributedString:", v13);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView customNonDecimalCharacterSet](self, "customNonDecimalCharacterSet"));
          v29 = &stru_1011EB268;
          objc_msgSend(v8, "scanCharactersFromSet:intoString:", v14, &v29);
          v15 = v29;

          if (-[__CFString length](v15, "length"))
          {
            v16 = objc_alloc((Class)NSAttributedString);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v15, "uppercaseString"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView unitTextAttributes](self, "unitTextAttributes"));
            v19 = objc_msgSend(v16, "initWithString:attributes:", v17, v18);

            objc_msgSend(v7, "appendAttributedString:", v19);
          }

        }
        while (!objc_msgSend(v8, "isAtEnd"));
      }
      v20 = objc_msgSend(v7, "copy");

    }
    else
    {
      v21 = objc_alloc((Class)NSAttributedString);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView digitTextAttributes](self, "digitTextAttributes"));
      v20 = objc_msgSend(v21, "initWithString:attributes:", v4, v22);

    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1004DA0BC;
    v27[3] = &unk_1011AC8B0;
    v27[4] = self;
    v28 = v20;
    v23 = v20;
    v24 = objc_retainBlock(v27);
    -[DistanceAccessoryView alpha](self, "alpha");
    if (v25 == 0.0)
    {
      ((void (*)(_QWORD *))v24[2])(v24);
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView systemApertureElementContext](self, "systemApertureElementContext"));
      objc_msgSend(v26, "setElementNeedsUpdateWithCoordinatedAnimations:", v24);

    }
  }

}

- (UIFontDescriptor)roundedFontDescriptor
{
  UIFontDescriptor *roundedFontDescriptor;
  void *v4;
  void *v5;
  UIFontDescriptor *v6;
  UIFontDescriptor *v7;

  roundedFontDescriptor = self->_roundedFontDescriptor;
  if (!roundedFontDescriptor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontDescriptor"));
    v6 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignRounded));
    v7 = self->_roundedFontDescriptor;
    self->_roundedFontDescriptor = v6;

    roundedFontDescriptor = self->_roundedFontDescriptor;
  }
  return roundedFontDescriptor;
}

- (NSDictionary)digitTextAttributes
{
  NSDictionary *digitTextAttributes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  uint64_t v16;
  _QWORD v17[2];
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  UIFontDescriptorTraitKey v23;
  void *v24;

  digitTextAttributes = self->_digitTextAttributes;
  if (!digitTextAttributes)
  {
    v23 = UIFontWeightTrait;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightMedium));
    v24 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

    v21[0] = UIFontFeatureTypeIdentifierKey;
    v21[1] = UIFontFeatureSelectorIdentifierKey;
    v22[0] = &off_10126D948;
    v22[1] = &off_10126D960;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView roundedFontDescriptor](self, "roundedFontDescriptor"));
    v20[0] = v5;
    v19[0] = UIFontDescriptorTraitsAttribute;
    v19[1] = UIFontDescriptorFeatureSettingsAttribute;
    v18 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v20[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v10, 15.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor", NSFontAttributeName, NSForegroundColorAttributeName, v11));
    v17[1] = v12;
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, &v16, 2));
    v14 = self->_digitTextAttributes;
    self->_digitTextAttributes = v13;

    digitTextAttributes = self->_digitTextAttributes;
  }
  return digitTextAttributes;
}

- (NSDictionary)unitTextAttributes
{
  NSDictionary *unitTextAttributes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  _QWORD v14[3];
  _QWORD v15[3];
  UIFontDescriptorAttributeName v16;
  void *v17;
  UIFontDescriptorTraitKey v18;
  void *v19;

  unitTextAttributes = self->_unitTextAttributes;
  if (!unitTextAttributes)
  {
    v18 = UIFontWeightTrait;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightBold));
    v19 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView roundedFontDescriptor](self, "roundedFontDescriptor"));
    v16 = UIFontDescriptorTraitsAttribute;
    v17 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8, 8.0));
    v15[0] = v9;
    v14[0] = NSFontAttributeName;
    v14[1] = NSForegroundColorAttributeName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
    v14[2] = NSBaselineOffsetAttributeName;
    v15[1] = v10;
    v15[2] = &off_10126D978;
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
    v12 = self->_unitTextAttributes;
    self->_unitTextAttributes = v11;

    unitTextAttributes = self->_unitTextAttributes;
  }
  return unitTextAttributes;
}

- (NSCharacterSet)customDecimalCharacterSet
{
  NSCharacterSet *customDecimalCharacterSet;
  void *v4;
  void *v5;
  id v6;
  NSCharacterSet *v7;
  NSCharacterSet *v8;

  customDecimalCharacterSet = self->_customDecimalCharacterSet;
  if (!customDecimalCharacterSet)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView customNonDecimalCharacterSet](self, "customNonDecimalCharacterSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invertedSet"));
    v6 = objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "addCharactersInString:", CFSTR("."));
    v7 = (NSCharacterSet *)objc_msgSend(v6, "copy");
    v8 = self->_customDecimalCharacterSet;
    self->_customDecimalCharacterSet = v7;

    customDecimalCharacterSet = self->_customDecimalCharacterSet;
  }
  return customDecimalCharacterSet;
}

- (NSCharacterSet)customNonDecimalCharacterSet
{
  NSCharacterSet *customNonDecimalCharacterSet;
  void *v4;
  id v5;
  NSCharacterSet *v6;
  NSCharacterSet *v7;

  customNonDecimalCharacterSet = self->_customNonDecimalCharacterSet;
  if (!customNonDecimalCharacterSet)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
    v5 = objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "addCharactersInString:", CFSTR(" "));
    objc_msgSend(v5, "addCharactersInString:", CFSTR("."));
    objc_msgSend(v5, "addCharactersInString:", CFSTR("׳"));
    v6 = (NSCharacterSet *)objc_msgSend(v5, "copy");
    v7 = self->_customNonDecimalCharacterSet;
    self->_customNonDecimalCharacterSet = v6;

    customNonDecimalCharacterSet = self->_customNonDecimalCharacterSet;
  }
  return customNonDecimalCharacterSet;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (double)distanceToNextManeuver
{
  return self->_distanceToNextManeuver;
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (void)setRoundedFontDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_roundedFontDescriptor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void)setDigitTextAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_digitTextAttributes, a3);
}

- (void)setUnitTextAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_unitTextAttributes, a3);
}

- (void)setCustomDecimalCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_customDecimalCharacterSet, a3);
}

- (void)setCustomNonDecimalCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_customNonDecimalCharacterSet, a3);
}

- (_TtC4Maps31DistanceAccessoryLabelViewModel)labelViewModel
{
  return self->_labelViewModel;
}

- (void)setLabelViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_labelViewModel, a3);
}

- (UIView)distanceLabel
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_distanceLabel);
}

- (void)setDistanceLabel:(id)a3
{
  objc_storeWeak((id *)&self->_distanceLabel, a3);
}

- (NSString)previousDistanceString
{
  return self->_previousDistanceString;
}

- (void)setPreviousDistanceString:(id)a3
{
  objc_storeStrong((id *)&self->_previousDistanceString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDistanceString, 0);
  objc_destroyWeak((id *)&self->_distanceLabel);
  objc_storeStrong((id *)&self->_labelViewModel, 0);
  objc_storeStrong((id *)&self->_customNonDecimalCharacterSet, 0);
  objc_storeStrong((id *)&self->_customDecimalCharacterSet, 0);
  objc_storeStrong((id *)&self->_unitTextAttributes, 0);
  objc_storeStrong((id *)&self->_digitTextAttributes, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_roundedFontDescriptor, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
