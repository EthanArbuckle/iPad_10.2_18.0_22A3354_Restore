@implementation IMThemeBookshelf

- (IMThemeBookshelf)init
{
  IMThemeBookshelf *v2;
  IMThemeBookshelf *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  const __CFArray *v26;
  CGColorSpace *DeviceRGB;
  CGGradient *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;
  CGFloat locations[3];

  v40.receiver = self;
  v40.super_class = (Class)IMThemeBookshelf;
  v2 = -[IMTheme init](&v40, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setCompositingFilter:](v2, "setCompositingFilter:", kCAFilterPlusD);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0));
    -[IMTheme setTintColor:](v3, "setTintColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
    -[IMTheme setToolbarTitleColor:](v3, "setToolbarTitleColor:", v5);

    -[IMThemeBookshelf setToolbarStyle:](v3, "setToolbarStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[IMThemeBookshelf setScrimColor:](v3, "setScrimColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.968627451, 0.968627451, 0.968627451, 0.82));
    -[IMThemeBookshelf setScrimColorList:](v3, "setScrimColorList:", v7);

    -[IMThemeBookshelf setToolbarTintColor:](v3, "setToolbarTintColor:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setPopoverBackgroundColor:](v3, "setPopoverBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMTheme setPopoverTitleColor:](v3, "setPopoverTitleColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0784313725, 0.0784313725, 0.117647059, 0.35));
    -[IMThemeBookshelf setSearchBackgroundColor:](v3, "setSearchBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0784313725, 0.0784313725, 0.117647059, 0.2));
    -[IMThemeBookshelf setSearchBackgroundColorList:](v3, "setSearchBackgroundColorList:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.899999976));
    -[IMThemeBookshelf setSearchTextColor:](v3, "setSearchTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.899999976));
    -[IMThemeBookshelf setSearchPlaceholderTextColor:](v3, "setSearchPlaceholderTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    -[IMThemeBookshelf setGridListToggleSelectedColor:](v3, "setGridListToggleSelectedColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.45));
    -[IMThemeBookshelf setListAuthorAndGenreTextColor:](v3, "setListAuthorAndGenreTextColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.75));
    -[IMThemeBookshelf setListBookTextColor:](v3, "setListBookTextColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.3));
    -[IMThemeBookshelf setListMoveHandleColor:](v3, "setListMoveHandleColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
    -[IMThemeBookshelf setSeparatorColor:](v3, "setSeparatorColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.95));
    -[IMThemeBookshelf setSelectedSegmentTextColor:](v3, "setSelectedSegmentTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.75));
    -[IMThemeBookshelf setBackgroundFixedGradientColor0:](v3, "setBackgroundFixedGradientColor0:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0));
    -[IMThemeBookshelf setBackgroundFixedGradientColor1:](v3, "setBackgroundFixedGradientColor1:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0));
    -[IMThemeBookshelf setShelfTopColor:](v3, "setShelfTopColor:", v22);

    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0627451017, 0.0)));
    v24 = objc_msgSend(v23, "CGColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0627451017, 0.100000001)));
    v26 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, objc_msgSend(v25, "CGColor"), 0));

    *(_OWORD *)locations = xmmword_26A8B0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v28 = CGGradientCreateWithColors(DeviceRGB, v26, locations);
    -[IMThemeBookshelf setRowBottomGradient:](v3, "setRowBottomGradient:", v28);
    CGGradientRelease(v28);
    CGColorSpaceRelease(DeviceRGB);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.941176471, 0.941176471, 0.941176471, 1.0));
    -[IMThemeBookshelf setRowSolidFillColor:](v3, "setRowSolidFillColor:", v29);

    -[IMThemeBookshelf setRowSolidFillColorTopmostAlpha:](v3, "setRowSolidFillColorTopmostAlpha:", 0.0);
    -[IMThemeBookshelf setRowSolidFillColorBottommostAlpha:](v3, "setRowSolidFillColorBottommostAlpha:", 0.720000029);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.97, 0.9));
    -[IMTheme setTableViewHeaderViewColor:](v3, "setTableViewHeaderViewColor:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.97, 0.9));
    -[IMTheme setTableViewToolbarColor:](v3, "setTableViewToolbarColor:", v31);

    -[IMTheme setTableViewToolbarTranslucent:](v3, "setTableViewToolbarTranslucent:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.67));
    -[IMTheme setHeaderTextColor:](v3, "setHeaderTextColor:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[IMTheme setHeaderTextColorDimmed:](v3, "setHeaderTextColorDimmed:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkTextColor](UIColor, "darkTextColor"));
    -[IMTheme setContentTextColor:](v3, "setContentTextColor:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMTheme setButtonTitleColor:](v3, "setButtonTitleColor:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5));
    -[IMTheme setButtonTitleColorDisabled:](v3, "setButtonTitleColorDisabled:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme contentTextColor](v3, "contentTextColor"));
    -[IMTheme setFooterTextColor:](v3, "setFooterTextColor:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0));
    -[IMThemeBookshelf setApplicationSnapshotScrimColor:](v3, "setApplicationSnapshotScrimColor:", v38);

  }
  return v3;
}

- (void)stylizeSegmentedControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tintColor](self, "tintColor"));
  objc_msgSend(v4, "setTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleTextAttributesForState:", 4));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemeBookshelf selectedSegmentTextColor](self, "selectedSegmentTextColor"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, NSForegroundColorAttributeName);

  objc_msgSend(v4, "setTitleTextAttributes:forState:", v8, 4);
}

- (BOOL)isNight:(id)a3
{
  return 0;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return -[IMThemeBookshelf backgroundColorForTraitCollection:](self, "backgroundColorForTraitCollection:", 0);
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return +[UIColor whiteColor](UIColor, "whiteColor", a3);
}

- (UIColor)applicationSnapshotScrimColor
{
  return self->_applicationSnapshotScrimColor;
}

- (void)setApplicationSnapshotScrimColor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationSnapshotScrimColor, a3);
}

- (UIColor)scrimColor
{
  return self->_scrimColor;
}

- (void)setScrimColor:(id)a3
{
  objc_storeStrong((id *)&self->_scrimColor, a3);
}

- (UIColor)scrimColorList
{
  return self->_scrimColorList;
}

- (void)setScrimColorList:(id)a3
{
  objc_storeStrong((id *)&self->_scrimColorList, a3);
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_toolbarStyle = a3;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTintColor, a3);
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (UIColor)searchBackgroundColor
{
  return self->_searchBackgroundColor;
}

- (void)setSearchBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchBackgroundColor, a3);
}

- (UIColor)searchBackgroundColorList
{
  return self->_searchBackgroundColorList;
}

- (void)setSearchBackgroundColorList:(id)a3
{
  objc_storeStrong((id *)&self->_searchBackgroundColorList, a3);
}

- (UIColor)searchTextColor
{
  return self->_searchTextColor;
}

- (void)setSearchTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchTextColor, a3);
}

- (UIColor)searchPlaceholderTextColor
{
  return self->_searchPlaceholderTextColor;
}

- (void)setSearchPlaceholderTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchPlaceholderTextColor, a3);
}

- (UIColor)gridListToggleSelectedColor
{
  return self->_gridListToggleSelectedColor;
}

- (void)setGridListToggleSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_gridListToggleSelectedColor, a3);
}

- (UIColor)listBookTextColor
{
  return self->_listBookTextColor;
}

- (void)setListBookTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_listBookTextColor, a3);
}

- (UIColor)listAuthorAndGenreTextColor
{
  return self->_listAuthorAndGenreTextColor;
}

- (void)setListAuthorAndGenreTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_listAuthorAndGenreTextColor, a3);
}

- (UIColor)listMoveHandleColor
{
  return self->_listMoveHandleColor;
}

- (void)setListMoveHandleColor:(id)a3
{
  objc_storeStrong((id *)&self->_listMoveHandleColor, a3);
}

- (UIColor)selectedSegmentTextColor
{
  return self->_selectedSegmentTextColor;
}

- (void)setSelectedSegmentTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSegmentTextColor, a3);
}

- (UIColor)backgroundFixedGradientColor0
{
  return self->_backgroundFixedGradientColor0;
}

- (void)setBackgroundFixedGradientColor0:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor0, a3);
}

- (UIColor)backgroundFixedGradientColor1
{
  return self->_backgroundFixedGradientColor1;
}

- (void)setBackgroundFixedGradientColor1:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor1, a3);
}

- (UIColor)shelfTopColor
{
  return self->_shelfTopColor;
}

- (void)setShelfTopColor:(id)a3
{
  objc_storeStrong((id *)&self->_shelfTopColor, a3);
}

- (id)rowBottomGradient
{
  return self->_rowBottomGradient;
}

- (void)setRowBottomGradient:(id)a3
{
  objc_storeStrong(&self->_rowBottomGradient, a3);
}

- (UIColor)rowSolidFillColor
{
  return self->_rowSolidFillColor;
}

- (void)setRowSolidFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_rowSolidFillColor, a3);
}

- (double)rowSolidFillColorTopmostAlpha
{
  return self->_rowSolidFillColorTopmostAlpha;
}

- (void)setRowSolidFillColorTopmostAlpha:(double)a3
{
  self->_rowSolidFillColorTopmostAlpha = a3;
}

- (double)rowSolidFillColorBottommostAlpha
{
  return self->_rowSolidFillColorBottommostAlpha;
}

- (void)setRowSolidFillColorBottommostAlpha:(double)a3
{
  self->_rowSolidFillColorBottommostAlpha = a3;
}

- (BOOL)hasRowTopGradient
{
  return self->_hasRowTopGradient;
}

- (void)setHasRowTopGradient:(BOOL)a3
{
  self->_hasRowTopGradient = a3;
}

- (UIColor)rowTopGradientColor0
{
  return self->_rowTopGradientColor0;
}

- (void)setRowTopGradientColor0:(id)a3
{
  objc_storeStrong((id *)&self->_rowTopGradientColor0, a3);
}

- (UIColor)rowTopGradientColor1
{
  return self->_rowTopGradientColor1;
}

- (void)setRowTopGradientColor1:(id)a3
{
  objc_storeStrong((id *)&self->_rowTopGradientColor1, a3);
}

- (BOOL)isNight
{
  return self->_isNight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTopGradientColor1, 0);
  objc_storeStrong((id *)&self->_rowTopGradientColor0, 0);
  objc_storeStrong((id *)&self->_rowSolidFillColor, 0);
  objc_storeStrong(&self->_rowBottomGradient, 0);
  objc_storeStrong((id *)&self->_shelfTopColor, 0);
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor1, 0);
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor0, 0);
  objc_storeStrong((id *)&self->_selectedSegmentTextColor, 0);
  objc_storeStrong((id *)&self->_listMoveHandleColor, 0);
  objc_storeStrong((id *)&self->_listAuthorAndGenreTextColor, 0);
  objc_storeStrong((id *)&self->_listBookTextColor, 0);
  objc_storeStrong((id *)&self->_gridListToggleSelectedColor, 0);
  objc_storeStrong((id *)&self->_searchPlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_searchTextColor, 0);
  objc_storeStrong((id *)&self->_searchBackgroundColorList, 0);
  objc_storeStrong((id *)&self->_searchBackgroundColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_scrimColorList, 0);
  objc_storeStrong((id *)&self->_scrimColor, 0);
  objc_storeStrong((id *)&self->_applicationSnapshotScrimColor, 0);
}

@end
