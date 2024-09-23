@implementation RoutingAppearanceManager

+ (id)customGrayBlurCellBackgroundView
{
  BlurDarkeningBackgroundView *v2;

  v2 = -[BlurDarkeningBackgroundView initWithFrame:]([BlurDarkeningBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BlurDarkeningBackgroundView setAppearance:](v2, "setAppearance:", 4);
  return v2;
}

+ (id)customGrayBlurCellSelectedBackgroundView
{
  BlurDarkeningBackgroundView *v2;

  v2 = -[BlurDarkeningBackgroundView initWithFrame:]([BlurDarkeningBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BlurDarkeningBackgroundView setAppearance:](v2, "setAppearance:", 0);
  return v2;
}

+ (id)routePreviewStackedViewFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0);
}

+ (id)backgroundViewWithLightMaterial:(int64_t)a3 darkColor:(id)a4
{
  id v5;
  RoutingMaterialColorSwitchingView *v6;

  v5 = a4;
  v6 = -[RoutingMaterialColorSwitchingView initWithLightMaterial:darkColor:]([RoutingMaterialColorSwitchingView alloc], "initWithLightMaterial:darkColor:", a3, v5);

  return v6;
}

+ (void)configureBackgroundViewForCell:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = a3;
  if (sub_1002A8AA0(v3) == 5)
  {
    objc_initWeak(&location, v3);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1003BE834;
    v4[3] = &unk_1011AF768;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "_setBackgroundViewConfigurationProvider:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

}

+ (void)configureBackgroundViewForStepCell:(id)a3
{
  id v3;
  id *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  if (sub_1002A8AA0(v3) == 5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003BEAA8;
    v7[3] = &unk_1011AF768;
    v4 = &v8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "_setBackgroundViewConfigurationProvider:", v7);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1003BECA0;
    v5[3] = &unk_1011AF768;
    v4 = &v6;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "_setBackgroundViewConfigurationProvider:", v5);
  }
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);

}

+ (void)configureBackgroundViewsForOptionsTableViewCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  if (sub_1002A8AA0(v4) != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundView"));
    v6 = objc_opt_class(RoutePlanningOptionsCellBackgroundView);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
    {
      v10 = 0;
      v11 = 0;
      objc_msgSend(a1, "_getBackgroundView:selectedBackgroundView:forCell:", &v11, &v10, v4);
      v8 = v11;
      v9 = v10;
      objc_msgSend(v4, "setBackgroundView:", v8);
      objc_msgSend(v4, "setSelectedBackgroundView:", v9);

    }
  }

}

+ (void)configureBackgroundViewsForOptionsCollectionViewCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  if (sub_1002A8AA0(v4) != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundView"));
    v6 = objc_opt_class(RoutePlanningOptionsCellBackgroundView);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
    {
      v10 = 0;
      v11 = 0;
      objc_msgSend(a1, "_getBackgroundView:selectedBackgroundView:forCell:", &v11, &v10, v4);
      v8 = v11;
      v9 = v10;
      objc_msgSend(v4, "setBackgroundView:", v8);
      objc_msgSend(v4, "setSelectedBackgroundView:", v9);

    }
  }

}

+ (void)_getBackgroundView:(id *)a3 selectedBackgroundView:(id *)a4 forCell:(id)a5
{
  RoutePlanningOptionsCellBackgroundView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  RoutePlanningOptionsCellBackgroundView *v17;
  RoutePlanningOptionsCellBackgroundView *v18;
  RoutePlanningOptionsCellBackgroundView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  RoutePlanningOptionsCellBackgroundView *v29;
  RoutePlanningOptionsCellBackgroundView *v30;
  id v31;

  v31 = a5;
  if (a3)
  {
    v7 = [RoutePlanningOptionsCellBackgroundView alloc];
    objc_msgSend(v31, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    v17 = -[RoutePlanningOptionsCellBackgroundView initWithFrame:color:](v7, "initWithFrame:color:", v16, v9, v11, v13, v15);

    -[RoutePlanningOptionsCellBackgroundView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
    v18 = objc_retainAutorelease(v17);
    *a3 = v18;

  }
  if (a4)
  {
    v19 = [RoutePlanningOptionsCellBackgroundView alloc];
    objc_msgSend(v31, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RouteOptionsCellSelectedBackgroundColor")));
    v29 = -[RoutePlanningOptionsCellBackgroundView initWithFrame:color:](v19, "initWithFrame:color:", v28, v21, v23, v25, v27);

    -[RoutePlanningOptionsCellBackgroundView setAutoresizingMask:](v29, "setAutoresizingMask:", 18);
    v30 = objc_retainAutorelease(v29);
    *a4 = v30;

  }
}

@end
