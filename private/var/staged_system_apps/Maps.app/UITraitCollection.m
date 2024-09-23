@implementation UITraitCollection

- (double)_maps_displayScaleOrMainScreenScale
{
  double result;
  void *v3;
  double v4;
  double v5;

  -[UITraitCollection displayScale](self, "displayScale");
  if (result == 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "scale");
    v5 = v4;

    return v5;
  }
  return result;
}

- (id)_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  UITraitCollection *v13;
  _QWORD v15[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));
  v9 = sub_1002A8844(v8, v7, v6);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);

  if (v8
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, UIContentSizeCategoryUnspecified)
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, v10))
  {
    v15[0] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v10));
    v15[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v13 = (UITraitCollection *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v12));

  }
  else
  {
    v13 = self;
  }

  return v13;
}

- (id)_maps_traitCollectionWithMaximumContentSizeCategory:(id)a3
{
  return -[UITraitCollection _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:](self, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", UIContentSizeCategoryExtraSmall, a3);
}

- (BOOL)isLuminanceReduced
{
  return -[UITraitCollection _backlightLuminance](self, "_backlightLuminance") == (id)1;
}

- (int64_t)_car_userInterfaceStyle
{
  if (GEOConfigGetBOOL(MapsConfig_CarPlayMapAppearanceShouldFollowUserInterfaceStyle, off_1014B4768))
    return -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle");
  else
    return (int64_t)-[UITraitCollection crsui_mapStyle](self, "crsui_mapStyle");
}

@end
