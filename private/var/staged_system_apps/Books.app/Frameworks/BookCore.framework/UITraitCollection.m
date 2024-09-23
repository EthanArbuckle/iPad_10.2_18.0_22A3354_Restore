@implementation UITraitCollection

+ (id)bc_allAPITraits
{
  _QWORD v3[14];

  v3[0] = objc_opt_class(UITraitAccessibilityContrast);
  v3[1] = objc_opt_class(UITraitActiveAppearance);
  v3[2] = objc_opt_class(UITraitDisplayGamut);
  v3[3] = objc_opt_class(UITraitDisplayScale);
  v3[4] = objc_opt_class(UITraitForceTouchCapability);
  v3[5] = objc_opt_class(UITraitHorizontalSizeClass);
  v3[6] = objc_opt_class(UITraitLayoutDirection);
  v3[7] = objc_opt_class(UITraitLegibilityWeight);
  v3[8] = objc_opt_class(UITraitPreferredContentSizeCategory);
  v3[9] = objc_opt_class(UITraitToolbarItemPresentationSize);
  v3[10] = objc_opt_class(UITraitUserInterfaceIdiom);
  v3[11] = objc_opt_class(UITraitUserInterfaceLevel);
  v3[12] = objc_opt_class(UITraitUserInterfaceStyle);
  v3[13] = objc_opt_class(UITraitVerticalSizeClass);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 14));
}

- (BOOL)bc_userInterfaceStyleDark
{
  return (char *)-[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle") == (char *)&dword_0 + 2;
}

- (BOOL)bc_knownPropertiesEqual:(id)a3
{
  UITraitCollection *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;

  v4 = (UITraitCollection *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    v5 = -[UITraitCollection userInterfaceIdiom](self, "userInterfaceIdiom");
    if (v5 == (void *)-[UITraitCollection userInterfaceIdiom](v4, "userInterfaceIdiom")
      && (-[UITraitCollection displayScale](self, "displayScale"),
          v7 = v6,
          -[UITraitCollection displayScale](v4, "displayScale"),
          v7 == v8)
      && (v9 = -[UITraitCollection displayGamut](self, "displayGamut"),
          v9 == (void *)-[UITraitCollection displayGamut](v4, "displayGamut"))
      && (v10 = -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle"),
          v10 == (void *)-[UITraitCollection userInterfaceStyle](v4, "userInterfaceStyle"))
      && (v11 = -[UITraitCollection layoutDirection](self, "layoutDirection"),
          v11 == (void *)-[UITraitCollection layoutDirection](v4, "layoutDirection"))
      && (v12 = -[UITraitCollection forceTouchCapability](self, "forceTouchCapability"),
          v12 == (void *)-[UITraitCollection forceTouchCapability](v4, "forceTouchCapability")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v4, "preferredContentSizeCategory"));
      if (v13 == v14
        && (v15 = -[UITraitCollection accessibilityContrast](self, "accessibilityContrast"),
            v15 == (void *)-[UITraitCollection accessibilityContrast](v4, "accessibilityContrast")))
      {
        v16 = -[UITraitCollection userInterfaceLevel](self, "userInterfaceLevel");
        v17 = v16 == (id)-[UITraitCollection userInterfaceLevel](v4, "userInterfaceLevel");
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)traitCollectionLimitedToSizeCategory:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_BB250;
  v7[3] = &unk_290278;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection traitCollectionByModifyingTraits:](self, "traitCollectionByModifyingTraits:", v7));

  return v5;
}

+ (id)currentTraitCollectionLimitedToSizeCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollectionLimitedToSizeCategory:", v3));

  return v5;
}

+ (id)bk_traitCollectionWithReadingMode:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _traitCollectionWithValue:forTraitNamed:](UITraitCollection, "_traitCollectionWithValue:forTraitNamed:", v3, CFSTR("BKClientTraitReadingModeKey")));

  return v4;
}

@end
