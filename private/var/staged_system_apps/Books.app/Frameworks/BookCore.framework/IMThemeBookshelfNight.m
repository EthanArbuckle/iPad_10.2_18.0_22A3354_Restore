@implementation IMThemeBookshelfNight

- (IMThemeBookshelfNight)init
{
  IMThemeBookshelfNight *v2;
  IMThemeBookshelfNight *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  const __CFArray *v25;
  CGColorSpace *DeviceRGB;
  CGGradient *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat locations[3];

  v53.receiver = self;
  v53.super_class = (Class)IMThemeBookshelfNight;
  v2 = -[IMThemeBookshelf init](&v53, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setCompositingFilter:](v2, "setCompositingFilter:", kCAFilterPlusL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    -[IMTheme setTintColor:](v3, "setTintColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[IMTheme setToolbarTitleColor:](v3, "setToolbarTitleColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0588235296, 0.100000001));
    -[IMThemeBookshelf setScrimColor:](v3, "setScrimColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemeBookshelf scrimColor](v3, "scrimColor"));
    -[IMThemeBookshelf setScrimColorList:](v3, "setScrimColorList:", v7);

    -[IMThemeBookshelf setToolbarStyle:](v3, "setToolbarStyle:", 1);
    -[IMThemeBookshelf setToolbarTintColor:](v3, "setToolbarTintColor:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.1, 1.0));
    -[IMTheme setPopoverBackgroundColor:](v3, "setPopoverBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme toolbarTitleColor](v3, "toolbarTitleColor"));
    -[IMTheme setPopoverTitleColor:](v3, "setPopoverTitleColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254906, 0.937254906, 0.960784316, 0.170000002));
    -[IMThemeBookshelf setSearchBackgroundColor:](v3, "setSearchBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254906, 0.937254906, 0.960784316, 0.170000002));
    -[IMThemeBookshelf setSearchBackgroundColorList:](v3, "setSearchBackgroundColorList:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.899999976));
    -[IMThemeBookshelf setSearchTextColor:](v3, "setSearchTextColor:", v12);

    v13 = 0.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
    -[IMThemeBookshelf setGridListToggleSelectedColor:](v3, "setGridListToggleSelectedColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.600000024));
    -[IMThemeBookshelf setListAuthorAndGenreTextColor:](v3, "setListAuthorAndGenreTextColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMThemeBookshelf setListBookTextColor:](v3, "setListBookTextColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.300000012));
    -[IMThemeBookshelf setListMoveHandleColor:](v3, "setListMoveHandleColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.100000001));
    -[IMThemeBookshelf setSeparatorColor:](v3, "setSeparatorColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
    -[IMThemeBookshelf setSelectedSegmentTextColor:](v3, "setSelectedSegmentTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0588235296, 0.5));
    -[IMThemeBookshelf setBackgroundFixedGradientColor0:](v3, "setBackgroundFixedGradientColor0:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0588235296, 0.0));
    -[IMThemeBookshelf setBackgroundFixedGradientColor1:](v3, "setBackgroundFixedGradientColor1:", v21);

    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0627451017, 0.0627451017, 0.0627451017, 0.0)));
    v23 = objc_msgSend(v22, "CGColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0627451017, 0.0627451017, 0.0627451017, 0.400000006)));
    v25 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, objc_msgSend(v24, "CGColor"), 0));

    *(_OWORD *)locations = xmmword_26A8B0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v27 = CGGradientCreateWithColors(DeviceRGB, v25, locations);
    -[IMThemeBookshelf setRowBottomGradient:](v3, "setRowBottomGradient:", v27);
    CGGradientRelease(v27);
    CGColorSpaceRelease(DeviceRGB);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 1.0));
    -[IMThemeBookshelf setRowSolidFillColor:](v3, "setRowSolidFillColor:", v28);

    -[IMThemeBookshelf setRowSolidFillColorTopmostAlpha:](v3, "setRowSolidFillColorTopmostAlpha:", 0.25);
    -[IMThemeBookshelf setRowSolidFillColorBottommostAlpha:](v3, "setRowSolidFillColorBottommostAlpha:", 0.699999988);
    -[IMThemeBookshelf setHasRowTopGradient:](v3, "setHasRowTopGradient:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0500000007));
    -[IMThemeBookshelf setRowTopGradientColor0:](v3, "setRowTopGradientColor0:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0));
    -[IMThemeBookshelf setRowTopGradientColor1:](v3, "setRowTopGradientColor1:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemeBookshelf rowTopGradientColor0](v3, "rowTopGradientColor0"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemeBookshelf rowSolidFillColor](v3, "rowSolidFillColor"));
    -[IMThemeBookshelf rowSolidFillColorTopmostAlpha](v3, "rowSolidFillColorTopmostAlpha");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "colorWithAlphaComponent:"));
    v60 = 0.0;
    v61 = 0.0;
    v58 = 0.0;
    v59 = 0.0;
    v56 = 0.0;
    v57 = 0.0;
    v54 = 0.0;
    v55 = 0.0;
    objc_msgSend(v31, "getRed:green:blue:alpha:", &v61, &v60, &v59, &v58);
    objc_msgSend(v33, "getRed:green:blue:alpha:", &v57, &v56, &v55, &v54);
    v34 = 1.0 - v58;
    v35 = v58 + v54 * (1.0 - v58);
    v36 = 0.0;
    v37 = 0.0;
    if (v35 > 0.0)
    {
      v13 = (v34 * (v54 * v57) + v61 * v58) / v35;
      v37 = (v34 * (v54 * v55) + v59 * v58) / v35;
      v36 = (v34 * (v54 * v56) + v60 * v58) / v35;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v13, v36, v37));
    -[IMThemeBookshelf setShelfTopColor:](v3, "setShelfTopColor:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[IMTheme setContentTextColor:](v3, "setContentTextColor:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[IMTheme setHeaderTextColor:](v3, "setHeaderTextColor:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.909803922, 1.0));
    -[IMTheme setTableViewCellSelectedColor:](v3, "setTableViewCellSelectedColor:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0901960784, 0.0901960784, 0.109803922, 1.0));
    -[IMTheme setTableViewHeaderViewColor:](v3, "setTableViewHeaderViewColor:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0901960784, 0.0901960784, 0.109803922, 1.0));
    -[IMTheme setTableViewToolbarColor:](v3, "setTableViewToolbarColor:", v43);

    -[IMTheme setTableViewToolbarTranslucent:](v3, "setTableViewToolbarTranslucent:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
    -[IMTheme setTableViewSeparatorColor:](v3, "setTableViewSeparatorColor:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0392156877, 1.0));
    -[IMTheme setTableViewBackgroundColor:](v3, "setTableViewBackgroundColor:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewBackgroundColor](v3, "tableViewBackgroundColor"));
    -[IMTheme setTableViewCellBackgroundColor:](v3, "setTableViewCellBackgroundColor:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.368627451, 1.0));
    -[IMThemeBookshelf setApplicationSnapshotScrimColor:](v3, "setApplicationSnapshotScrimColor:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme headerTextColor](v3, "headerTextColor"));
    -[IMTheme setFooterTextColor:](v3, "setFooterTextColor:", v48);

    -[IMTheme setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1);
    -[IMTheme setContentStatusBarStyle:](v3, "setContentStatusBarStyle:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
    -[IMTheme setButtonTitleColor:](v3, "setButtonTitleColor:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setKeyColor:](v3, "setKeyColor:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0));
    -[IMTheme setSystemGrayColor:](v3, "setSystemGrayColor:", v51);

  }
  return v3;
}

- (BOOL)isNight:(id)a3
{
  return 1;
}

- (id)nowPlayingHeaderColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.2, 1.0);
}

- (id)nowPlayingBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.156862745, 0.156862745, 0.156862745, 1.0);
}

- (id)nowPlayingSeparatorColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
}

- (id)nowPlayingSelectedCellColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.12);
}

@end
