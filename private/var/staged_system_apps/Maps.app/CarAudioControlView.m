@implementation CarAudioControlView

- (id)createBackgroundView
{
  return -[CarDynamicBlurView initWithBlurViewContext:delegate:]([CarDynamicBlurView alloc], "initWithBlurViewContext:delegate:", 0, 0);
}

- (id)createButton
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton button](CarFocusableButton, "button"));
  objc_msgSend(v2, "setModifiesBackgroundColor:", 1);
  return v2;
}

- (id)preferredSymbolConfigurationForImage
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 10.0);
}

- (double)collapsedDimension
{
  return 28.0;
}

- (double)fullHeight
{
  return 88.0;
}

- (double)highlightWidth
{
  double v2;

  -[CarAudioControlView collapsedDimension](self, "collapsedDimension");
  return v2 + -3.0;
}

- (double)expandedHeight
{
  void *v3;
  id v4;
  double result;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)3)
  {
    -[CarAudioControlView fullHeight](self, "fullHeight");
  }
  else if (v4 == (id)2)
  {
    -[CarAudioControlView collapsedDimension](self, "collapsedDimension");
    return v6 * 2.0 + 2.0;
  }
  else if (v4 == (id)1)
  {
    -[CarAudioControlView collapsedDimension](self, "collapsedDimension");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  double result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  result = 0.0;
  if (v6 == (id)1)
    result = -30.0;
  if (v6 == (id)2)
    return -60.0;
  return result;
}

- (double)highlightTopPosition
{
  void *v3;
  void *v4;
  id v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavAudioControlView currentAudioType](self, "currentAudioType")));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  result = 31.5;
  if (v5 != (id)1)
    result = 1.5;
  if (v5 == (id)2)
    return 60.0;
  return result;
}

- (int)analyticsTarget
{
  return 1001;
}

- (NSArray)focusOrderSubItems
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[NavAudioControlView isExpanded](self, "isExpanded"))
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NavAudioControlView buttons](self, "buttons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavAudioControlView currentAudioType](self, "currentAudioType")));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView buttons](self, "buttons"));
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    return (NSArray *)&__NSArray0__struct;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView buttons](self, "buttons"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v6));
  v12 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v11;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavAudioControlView currentAudioType](self, "currentAudioType")));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView buttons](self, "buttons"));
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
    return (NSArray *)&__NSArray0__struct;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView buttons](self, "buttons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));
  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v10;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CarPlay_Audio"), CFSTR("localized string not found"), 0));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_Speaker"), CFSTR("localized string not found"), 0));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

@end
